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

import com.ibm.btt.clientserver.ChannelContext;
import com.ibm.btt.cs.rest.exception.ForbiddenException;
import com.ibm.btt.cs.rest.exception.UnauthorizedException;

public interface SecurityAdvice {
	/**
	 * 
	 * @param req
	 * @throws ForbiddenException
	 * @throws UnauthorizedException
	 */
	public void checkAuthorization(HttpServletRequest req)
			throws ForbiddenException, UnauthorizedException;

	/**
	 * 
	 * @param req
	 * @param operationName
	 * @throws ForbiddenException
	 * @throws UnauthorizedException
	 */
	public void checkAuthorization(HttpServletRequest req, String operationName)
			throws ForbiddenException, UnauthorizedException;

	/**
	 * 
	 * @param req
	 * @param processorName
	 * @param procId
	 * @throws ForbiddenException
	 * @throws UnauthorizedException
	 */
	public void checkAuthorization(HttpServletRequest req,
			String processorName, String procId) throws ForbiddenException,
			UnauthorizedException;

	/**
	 * 
	 * @param req
	 * @param processorName
	 * @param procId
	 * @param nextEvent
	 * @throws ForbiddenException
	 * @throws UnauthorizedException
	 */
	public void checkAuthorization(HttpServletRequest req,
			String processorName, String procId, String nextEvent)
			throws ForbiddenException, UnauthorizedException;

	/**
	 * 
	 * @param req
	 * @param cc
	 * @param ctx
	 * @param requestData
	 */
	public void filterRequest(HttpServletRequest req, ChannelContext cc,
			com.ibm.btt.base.Context ctx, Object requestData);

	/**
	 * 
	 * @param req
	 * @param cc
	 * @param ctx
	 * @param responseData
	 */
	public void filterResponse(HttpServletRequest req, ChannelContext cc,
			com.ibm.btt.base.Context ctx, Object responseData);

}
