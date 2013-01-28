package com.ibm.btt.sample.operation;

/*
* Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 2008, 2008 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 * 
 * DISCLAIMER:
 * The following [enclosed] code is sample code created by IBM
 * Corporation. This sample code is not part of any standard IBM product
 * and is provided to you solely for the purpose of assisting you in the
 * development of your applications. The code is provided 'AS IS',
 * without warranty of any kind. IBM shall not be liable for any damages
 * arising out of your use of the sample code, even if they have been
 * advised of the possibility of such damages.
 */
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.DSEInvalidRequestException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.cs.html.HtmlConstants;

@SuppressWarnings("serial")
public class ImageOp extends BTTServerOperation {
	public void execute() throws Exception {
		System.out.println("ImageOperation");
		setValueAt(HtmlConstants.REPLYPAGE, "image.jsp");	
	}
}