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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;
import com.ibm.btt.base.Settings;
import com.ibm.btt.channel.HandlerUtils;
import com.ibm.btt.clientserver.ChannelContext;
import com.ibm.btt.clientserver.ChannelSession;
import com.ibm.btt.clientserver.DSECSSessionNotEstablishedException;
import com.ibm.btt.http.HttpChannelSession;
import com.ibm.btt.http.JavaEstablishSessionRequest;
import com.ibm.btt.sm.HttpSessionInfoHolder;

public class RestEstablishSessionRequest extends JavaEstablishSessionRequest {

	@SuppressWarnings("unused")
	private static final java.lang.String COPYRIGHT = "Licensed Materials - Property of IBM "//$NON-NLS-1$
			+ "Restricted Materials of IBM "//$NON-NLS-1$
			+ "5724-H82 "//$NON-NLS-1$
			+ "(C) Copyright IBM Corp. 2007, 2010 All Rights Reserved. "//$NON-NLS-1$
			+ "US Government Users Restricted Rights - Use, duplication or disclosure "//$NON-NLS-1$
			+ "restricted by GSA ADP Schedule Contract with IBM Corp ";//$NON-NLS-1$

	private static final BTTLog log = BTTLogFactory
			.getLog(RestEstablishSessionRequest.class.getName());

	/**
	 * Construct the JavaEstablishSessionRequest object
	 * 
	 * @param request
	 *            the HttpServletRequest object
	 */
	public RestEstablishSessionRequest(final HttpServletRequest request) {
		super(request);
	}

	/**
	 * Performs the session managment required to support HTTP and custom
	 * session management. This method updates the <I>ChannelContext</I> with
	 * the session and must provide support for using cookies and hidden form
	 * field to manage the session.
	 * <OL>
	 * <LI>Create the session if the request is for a new session. The session
	 * is new if the header or the data contains a newsession tag with the
	 * value=true</li>
	 * <LI>Create an <I>HttpSession</I> if using cookies or create a
	 * <I>DSEChannelSession</I> if not</li>
	 * <LI>Create an entry in the sessions table for a new session</li>
	 * </OL>
	 * 
	 * @param channelContext
	 *            com.ibm.btt.clientserver.ChannelContext
	 */
	@Override
	public void preProcessRequest(final ChannelContext channelContext)
			throws DSECSSessionNotEstablishedException {
		if (log.doDebug()) {
			log.entry();
		}
		final boolean newSession = HandlerUtils
				.getCreateSessionValue(channelContext);

		if (!newSession) {
			HandlerUtils.setCreateSessionValue(channelContext);
		}

		final HttpServletRequest req = request;
		if (runInSession(channelContext)) {
			HttpSession session = req.getSession(false);
			if (session != null && !session.isNew()) {
				if (log.doDebug()) {
					log.debug("The session id is :" + session.getId()
							+ ",isNew:" + session.isNew()
							+ ", so invalidate this session and get a new one.");
				}
				session.invalidate();
			}
			session = req.getSession(true);

			HttpSessionInfoHolder.setHttpSession(session);

			final ChannelSession cs = new HttpChannelSession(session);
			channelContext.setChannelSession(cs);
			if (log.doDebug()) {
				final String aMessage;
				final String aTID;
				aMessage = javaClientTrace.getString("JAVACLIENTINFO0010I");
				final MessageFormat msgFormat = new MessageFormat(aMessage);
				final Object[] args = new Object[1];
				args[0] = Settings.getTID();
				aTID = Settings.getTID();
				log.debug(new StringBuilder().append("TID:").append(aTID)
						.append(" MSG:").append(msgFormat.format(args))
						.toString());
			}
		}

		if (log.doDebug()) {
			log.exit();
		}
	}

}
