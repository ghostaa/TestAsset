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
import com.ibm.btt.base.Constants;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.DSEInvalidRequestException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.cs.html.HtmlConstants;
import com.ibm.btt.sample.util.AjaxChannelEnhanceUtil;

@SuppressWarnings("serial")
public class EnglishEventConditionActionNLSPage extends BTTServerOperation {
	/***************************************************************************
	 * Constant representing the name of the field where is stored the page
	 * wanted to be displayed. The parameter must be sent from the HTML page
	 * using this string as the parameter name
	 **************************************************************************/
	//protected final String PAGENAME = "pageName";

	/**
	 * Constructs a EnglishEventConditionActionNLSPage.
	 */
	public EnglishEventConditionActionNLSPage() {
		super();
	}

	/**
	 * Constructs a EnglishEventConditionActionNLSPage.
	 * 
	 * @param anOperationName
	 *            java.lang.String
	 * @exception java.io.IOException
	 *                The exception description.
	 */
	public EnglishEventConditionActionNLSPage(String anOperationName) throws java.io.IOException {
		super(anOperationName);
	}

	/**
	 * Constructs a EnglishEventConditionActionNLSPage.
	 * 
	 * @param anOperationName
	 *            java.lang.String
	 * @param aParentContext
	 *            java.lang.String
	 * @exception java.io.IOException
	 *                The exception description.
	 * @exception com.ibm.dse.base.DSEObjectNotFoundException
	 *                The exception description.
	 * @exception com.ibm.dse.base.DSEInvalidRequestException
	 *                The exception description.
	 */
	public EnglishEventConditionActionNLSPage(String anOperationName, String aParentContext)
			throws java.io.IOException, DSEObjectNotFoundException, DSEInvalidRequestException {
		super(anOperationName, aParentContext);
	}

	/**
	 * Constructs a EnglishEventConditionActionNLSPage.
	 * 
	 * @param anOperationName
	 *            java.lang.String
	 * @param aParentContext
	 *            com.ibm.dse.base.Context
	 * @exception java.io.IOException
	 *                The exception description.
	 * @exception com.ibm.dse.base.DSEInvalidRequestException
	 *                The exception description.
	 */
	public EnglishEventConditionActionNLSPage(String anOperationName, Context aParentContext)
			throws java.io.IOException, DSEInvalidRequestException {
		super(anOperationName, aParentContext);
	}

	/**
	 * Gets the page name wanted to be displayed and places it in the right
	 * field to make the Composer understand that this page must be shown.
	 */
	public void execute() throws Exception {
		//setValueAt(HtmlConstants.REPLYPAGE, getValueAt(PAGENAME));
		//setValueAt(HtmlConstants.REPLYPAGE,"nls/EcaWithNls.jsp");
		setValueAt(Constants.REPLYPAGE, "nls/EcaWithNls.jsp");
//		System.out.println(this.getKeyedCollection());
//		System.out.println(this.getParent().getKeyedCollection());
		
		// added by lvst: update session's ajaxChnlEnhanceData
		//AjaxChannelEnhanceUtil.updateAjaxChannelTestData();
	}
}