/*_
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 1998,2012
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */
package com.ibm.btt.cs.rest;

import javax.servlet.http.HttpServletResponse;

import com.ibm.btt.clientserver.ChannelContext;
import com.ibm.btt.http.HttpChannelResponse;

public class RestChannelResponse extends HttpChannelResponse {
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

	public RestChannelResponse(HttpServletResponse response) {
		super(response);
	}

	@Override
	public void handleServerException(ChannelContext channelContext, Exception e)
			throws Exception {
		super.handleServerException(channelContext, e);
	}

}
