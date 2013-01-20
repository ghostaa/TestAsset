/*_
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 1998,2012
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */
package com.ibm.btt.cs.rest.exception;

import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;

import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;

@Provider
public class BttExceptionMapper implements ExceptionMapper<Exception> {
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
	private static BTTLog log = BTTLogFactory.getLog(BttExceptionMapper.class
			.getName());

	@Produces({ MediaType.APPLICATION_JSON })
	@Override
	public Response toResponse(Exception e) {
		JSONObject json = new JSONObject();
		if (log.doError())
			log.error("Exception caught : " + e.getMessage());
		Throwable cause = e.getCause();
		if (cause != null) {
			if (log.doError())
				log.error("Caused by : " + cause.getMessage());
			if (cause instanceof UnauthorizedException) {
				return Response.status(Status.UNAUTHORIZED)
						.type(MediaType.APPLICATION_JSON).build();
			} else if (cause instanceof Exception) {
				return Response.status(Status.INTERNAL_SERVER_ERROR)
						.type(MediaType.APPLICATION_JSON).build();
			} else if (cause instanceof WebApplicationException) {
				System.out.println("WebApplicationException caught.");
				return Response.status(Status.UNSUPPORTED_MEDIA_TYPE)
						.type(MediaType.APPLICATION_JSON).build();
			} else {
				System.out
						.println("Returning internal server error for general exceptions.");
				return Response.status(Status.INTERNAL_SERVER_ERROR)
						.type(MediaType.APPLICATION_JSON).build();
			}
		} else {
			if (e instanceof UnauthorizedException) {
				return Response.status(Status.UNAUTHORIZED)
						.type(MediaType.APPLICATION_JSON).build();
			} else if (e instanceof WebApplicationException) {
				if (log.doError())
					log.error("This is a WebApplicationException.");
				try {
					json.put("error", "Internal server error.");
				} catch (JSONException e1) {
					e1.printStackTrace();
				}
				WebApplicationException wae = (WebApplicationException) e;
				return Response.status(Status.INTERNAL_SERVER_ERROR)
						.entity(json).type(MediaType.APPLICATION_JSON).build();
			} else {
				if (log.doDebug())
					log.debug("This is not a WebApplicationException.");
				if (log.doError()) {
					log.error("Caught exception", e);
				}
				return Response.status(Status.INTERNAL_SERVER_ERROR)
						.type(MediaType.APPLICATION_JSON).build();
			}
		}
	}
}
