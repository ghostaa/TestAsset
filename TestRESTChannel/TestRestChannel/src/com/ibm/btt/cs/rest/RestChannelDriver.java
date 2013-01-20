/*_
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 1998,2012
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */
package com.ibm.btt.cs.rest;

import java.text.MessageFormat;
import java.util.Enumeration;

import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.channel.BTTChannelDriver;
import com.ibm.btt.channel.ChannelConstant;
import com.ibm.btt.channel.ChannelContextContainer;
import com.ibm.btt.channel.ChannelInitializer;
import com.ibm.btt.channel.ChannelPolicyException;
import com.ibm.btt.channel.ChannelPolicyHandler;
import com.ibm.btt.channel.ChannelRequest;
import com.ibm.btt.channel.ChannelResponse;
import com.ibm.btt.channel.HandlerUtils;
import com.ibm.btt.channel.Message;
import com.ibm.btt.channel.MessageConstants;
import com.ibm.btt.channel.PolicyResult;
import com.ibm.btt.channel.SmartCollectorHandler;
import com.ibm.btt.clientserver.ChannelContext;
import com.ibm.btt.clientserver.ChannelHandler;
import com.ibm.btt.clientserver.HandlerRegistry;
import com.ibm.btt.clientserver.RequestHandler;
import com.ibm.btt.config.BTTInitException;
import com.ibm.btt.config.InitManager;
import com.ibm.btt.config.InitManager.Status;

public class RestChannelDriver extends BTTChannelDriver {

	@SuppressWarnings("unused")
	private static final String COPYRIGHT = "Licensed Materials - Property of IBM " + //$NON-NLS-1$
			"Restricted Materials of IBM "
			+ //$NON-NLS-1$
			"5724-H82 "
			+ //$NON-NLS-1$
			"(C) Copyright IBM Corp. 2012 All Rights Reserved. "
			+ //$NON-NLS-1$
			"US Government Users Restricted Rights - Use, duplication or disclosure "
			+ //$NON-NLS-1$
			"restricted by GSA ADP Schedule Contract with IBM Corp ";//$NON-NLS-1$
	private static final long serialVersionUID = -5742101165906807934L;
	private static final BTTLog log = BTTLogFactory
			.getLog(BTTChannelDriver.class.getName());

	@Override
	public void service(ChannelContext channelContext) {
		if (log.doDebug()) {
			log.entry();
		}
		ChannelRequest request = channelContext.getChannelRequest();
		ChannelResponse response = channelContext.getChannelResponse();

		try {
			// check and make sure the btt environment is started successfully
			String initMsg = getBTTInitializedMsg();
			if (initMsg != null) {
				BTTInitException ie = new BTTInitException(initMsg);
				// TODO use Exception Mapping Provider to deal with exceptions
				// instead of dealing with them with response directly.
				throw ie;
			}

			init(channelContext);
			String deviceType = channelContext.getDeviceType();

			String encoding = (String) HandlerUtils.findRegistryValue(
					deviceType, ChannelConstant.ENCODING);

			if (encoding != null) {
				if (log.doDebug()) {
					log.debug(MessageFormat
							.format("Change the encoding of request and response to [{0}]",
									encoding));
				}
				request.setCharacterEncoding(encoding);
				response.setCharacterEncoding(encoding);
			}

			parseRequestHeader(channelContext);
			parseRequestData(channelContext);
			preProcessRequest(channelContext);

			// Check the policy defined in the btt.xml
			Object policy = HandlerUtils.findRegistryValue(deviceType,
					ChannelConstant.CHANNELPOLICYHANDLER);

			if (policy != null) {
				if (policy instanceof ChannelPolicyHandler) {
					PolicyResult data = ((ChannelPolicyHandler) policy)
							.doCheck(channelContext);
					if (!data.isAccept()) {
						throw new ChannelPolicyException(data.getMessages());
					}
				} else {
					String message = Message.getMessage(
							MessageConstants.CHANNEL004, new String[] { policy
									.getClass().getCanonicalName() });
					throw new IllegalArgumentException(message);
				}
			}

			// smart channel data collector handler
			Object smartDataCollector = HandlerUtils.findRegistryValue(
					deviceType, ChannelConstant.SMARTCOLLECTORHANDLER);

			if (smartDataCollector != null) {
				if (smartDataCollector instanceof SmartCollectorHandler) {
					((SmartCollectorHandler) smartDataCollector)
							.collectData(channelContext);
				} else {
					String message = Message.getMessage(
							MessageConstants.CHANNEL004, new String[] { policy
									.getClass().getCanonicalName() });
					throw new IllegalArgumentException(message);
				}
			}
			if (log.doDebug()) {
				log.debug("Processing request from device type : " + deviceType);
			}
			RequestHandler requestHandler = HandlerUtils
					.getRequestHandler(deviceType);
			boolean createSession = HandlerUtils
					.getCreateSessionValue(channelContext);
			if (createSession) {
				if (log.doDebug()) {
					log.debug("Creating new session");
				}
				requestHandler.processSessionRequest(channelContext);
			} else {
				requestHandler.processRequest(channelContext);
			}

		} catch (Exception e) {
			handleException(e);
		} catch (Throwable error) {
		} finally {
			ChannelContextContainer.cleanUp();
		}

		if (log.doDebug()) {
			log.exit();
		}
	}

	@Override
	public void init(ChannelContext aChannelCtxt) throws Exception {
		aChannelCtxt.setDeviceType(RestConstants.REST_CHANNEL_KEY);
		createChannelHandler(aChannelCtxt);
	}

	public void createChannelHandler(ChannelContext channelContext)
			throws Exception {
		if (log.doDebug()) {
			log.entry();
		}
		String device = channelContext.getDeviceType();
		HandlerRegistry registry = HandlerRegistry.getInstance();

		ChannelHandler aChannelHandler = registry.getChannelHandler(device);
		if (aChannelHandler == null) {
			aChannelHandler = new ChannelHandler();

			KeyedCollection settings = ChannelInitializer.getSettings();
			KeyedCollection kc = (KeyedCollection) settings
					.getElementAt(device);
			Enumeration enumeration = kc.getElements().keys();
			while (enumeration.hasMoreElements()) {
				String key = (String) enumeration.nextElement();
				Object value = kc.getValueAt(key);
				updateChannelHandler(aChannelHandler, key, value);
			}

			registry.setChannelHandler(device, aChannelHandler);
		}
		if (log.doDebug()) {
			log.exit();
		}
	}

	/**
	 * If BTT environment started successfully, return EMPTY string, or return
	 * an error msg.
	 * 
	 * @return
	 */
	private String getBTTInitializedMsg() {
		InitManager.Status initStatus = InitManager.getInitializedStatus();
		String initMsg = null;
		if (initStatus == Status.UNINITIALIZED) {
			initMsg = "BTT environment does not initialized, please check and make sure you have started the btt environment first. ";
		}
		if (initStatus == Status.INITIALIZED_WITH_ERROR) {
			initMsg = "BTT environment initialization with errors, please check the backend console logs for details.";
		}
		return initMsg;
	}

}
