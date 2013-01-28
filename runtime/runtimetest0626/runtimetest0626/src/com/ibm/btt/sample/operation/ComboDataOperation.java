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
import com.ibm.btt.sample.util.AjaxChannelEnhanceUtil;

@SuppressWarnings("serial")
public class ComboDataOperation extends BTTServerOperation {
	/***************************************************************************
	 * Constant representing the name of the field where is stored the page
	 * wanted to be displayed. The parameter must be sent from the HTML page
	 * using this string as the parameter name
	 **************************************************************************/
	protected final String PAGENAME = "pageName";

	/**
	 * Constructs a DisplayPageOperation.
	 */
	public ComboDataOperation() {
		super();
	}

	/**
	 * Constructs a DisplayPageOperation.
	 * 
	 * @param anOperationName
	 *            java.lang.String
	 * @exception java.io.IOException
	 *                The exception description.
	 */
	public ComboDataOperation(String anOperationName) throws java.io.IOException {
		super(anOperationName);
	}

	/**
	 * Constructs a DisplayPageOperation.
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
	public ComboDataOperation(String anOperationName, String aParentContext)
			throws java.io.IOException, DSEObjectNotFoundException, DSEInvalidRequestException {
		super(anOperationName, aParentContext);
	}

	/**
	 * Constructs a DisplayPageOperation.
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
	public ComboDataOperation(String anOperationName, Context aParentContext)
			throws java.io.IOException, DSEInvalidRequestException {
		super(anOperationName, aParentContext);
	}

	/**
	 * Gets the page name wanted to be displayed and places it in the right
	 * field to make the Composer understand that this page must be shown.
	 */
	public void execute() throws Exception {
		System.out.println("ComboDataOperation");
		// init the combo's value
		//KeyedCollection textBoxKColl = this.getContext().getKeyedCollection();
		getContext().setValueAt("selectDataList.0.labelselect", "Asian");
		getContext().setValueAt("selectDataList.1.labelselect", "Spanish");
		getContext().setValueAt("selectDataList.2.labelselect", "Other");
		getContext().setValueAt("selectDataList.0.valueselect", "Asian");
		getContext().setValueAt("selectDataList.1.valueselect", "Spanish");
		getContext().setValueAt("selectDataList.2.valueselect", "Other");
		System.out.println("ComboDataOperation is done");
		setValueAt(HtmlConstants.REPLYPAGE, getValueAt(PAGENAME));
		System.out.println("ComboDataOperation is done yet");
		fireExitEvent("ok");
	}
}