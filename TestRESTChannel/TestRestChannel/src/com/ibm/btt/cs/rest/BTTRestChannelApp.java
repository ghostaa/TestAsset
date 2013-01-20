/*_
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 1998,2012
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */
package com.ibm.btt.cs.rest;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.core.Application;

import com.ibm.btt.cs.rest.exception.BttExceptionMapper;
import com.ibm.btt.cs.rest.resource.BaseResource;
import com.ibm.btt.cs.rest.resource.FlowResource;
import com.ibm.btt.cs.rest.resource.OperationResource;
import com.ibm.btt.cs.rest.resource.SessionResource;

public class BTTRestChannelApp extends Application {
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

	@Override
	public Set<Class<?>> getClasses() {
		Set<Class<?>> classes = new HashSet<Class<?>>();
		classes.add(BaseResource.class);
		classes.add(SessionResource.class);
		classes.add(OperationResource.class);
		classes.add(FlowResource.class);
		classes.add(BttExceptionMapper.class);
		return classes;
	}
}
