/*_
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 1998,2012
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */
package com.ibm.btt.cs.rest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.clientserver.ChannelContext;
import com.ibm.btt.clientserver.ChannelSession;
import com.ibm.btt.clientserver.DSECSSessionNotEstablishedException;
import com.ibm.btt.cs.ajax.AjaxUtils;
import com.ibm.btt.http.HttpChannelRequest;
import com.ibm.btt.sm.HttpSessionInfoHolder;
import com.ibm.json.java.JSONObject;

public class RestChannelRequest extends HttpChannelRequest {
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
	private static BTTLog log = BTTLogFactory.getLog(RestChannelRequest.class
			.getName());

	public RestChannelRequest(HttpServletRequest request) {
		super(request);
	}

	@Override
	public void preProcessRequest(final ChannelContext channelContext)
			throws DSECSSessionNotEstablishedException {
		if (log.doDebug()) {
			log.entry();
		}

		final HttpServletRequest req = request;
		if (runInSession(channelContext)) {
			HttpSession session = req.getSession(false);
			if (session != null && !session.isNew()) {
				if (log.doDebug()) {
					log.debug("The session id is :" + session.getId()
							+ ", already existing.");
				}
			} else {
				session = req.getSession(true);
			}

			HttpSessionInfoHolder.setHttpSession(session);

			final ChannelSession cs = new RestChannelSession(session);
			channelContext.setChannelSession(cs);
		}

		if (log.doDebug()) {
			log.exit();
		}
	}

	@Override
	public void parseRequestData(final ChannelContext channelContext)
			throws Exception {
		if (log.doDebug()) {
			log.entry();
		}

		Object params = request.getAttribute(RestConstants.DATAKEY);
		if (log.doDebug()) {
			log.debug(new StringBuilder().append("The rest request data is :[")
					.append(params).append("]").toString());
		}

		if (params != null) {
			JSONObject json = JSONObject.parse(params.toString());
			// use utility to convert the JSON string to channel context
			// request Data
			KeyedCollection requestData = AjaxUtils
					.convertToFlatKeyedCollection(json);
			requestData.setName(RestConstants.DATAKEY);

			// For the JSON request comes from the client side,
			channelContext.getRequestData().removeElementAt(
					RestConstants.DATAKEY);
			channelContext.getRequestData().addElement(requestData);
		}

		if (log.doDebug()) {
			log.exit();
		}
	}
}
