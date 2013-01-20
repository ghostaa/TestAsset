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

import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;
import com.ibm.btt.clientserver.ChannelContext;
import com.ibm.btt.cs.rest.exception.ForbiddenException;
import com.ibm.btt.cs.rest.exception.UnauthorizedException;

public class BTTSecurityAdvice implements SecurityAdvice {
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

	private static BTTLog log = BTTLogFactory.getLog(BTTSecurityAdvice.class
			.getName());

	public BTTSecurityAdvice() {

	}

	public void checkAuthorization(HttpServletRequest req)
			throws ForbiddenException, UnauthorizedException {
		/*
		 * Here is typical security control implementation Principal pid =
		 * req.getUserPrincipal(); if (pid.getName() == null) { throw new
		 * ForbiddenException(); } if (!req.isUserInRole("users")) { throw new
		 * UnauthorizedException(); }
		 */
	}

	public void checkAuthorization(HttpServletRequest req, String operationName)
			throws ForbiddenException, UnauthorizedException {
		/*
		 * Here is typical security control implementation Principal pid =
		 * req.getUserPrincipal(); if (pid.getName() == null) { throw new
		 * ForbiddenException(); } if (!req.isUserInRole("users")) { throw new
		 * UnauthorizedException(); }
		 */
	}

	public void checkAuthorization(HttpServletRequest req,
			String processorName, String procId) throws ForbiddenException,
			UnauthorizedException {
		/*
		 * Here is typical security control implementation Principal pid =
		 * req.getUserPrincipal(); if (pid.getName() == null) { throw new
		 * ForbiddenException(); } if (!req.isUserInRole("users")) { throw new
		 * UnauthorizedException(); }
		 */
	}

	public void checkAuthorization(HttpServletRequest req,
			String processorName, String procId, String nextEvent)
			throws ForbiddenException, UnauthorizedException {
		/*
		 * Here is typical security control implementation Principal pid =
		 * req.getUserPrincipal(); if (pid.getName() == null) { throw new
		 * ForbiddenException(); } if (!req.isUserInRole("users")) { throw new
		 * UnauthorizedException(); }
		 */
	}

	public void filterRequest(HttpServletRequest req, ChannelContext cc,
			com.ibm.btt.base.Context ctx, Object requestData) {
		if (log.doDebug())
			log.debug("Security Filter : doing work");
	}

	public void filterResponse(HttpServletRequest req, ChannelContext cc,
			com.ibm.btt.base.Context ctx, Object responseData) {
		if (log.doDebug())
			log.debug("Security Filter : doing work");
	}
}
