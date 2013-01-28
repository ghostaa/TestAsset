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
import com.ibm.btt.base.DataField;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.cs.html.HtmlConstants;

@SuppressWarnings("serial")
public class TreeAjaxOperation extends BTTServerOperation {
	/***************************************************************************
	 * Constant representing the name of the field where is stored the page
	 * wanted to be displayed. The parameter must be sent from the HTML page
	 * using this string as the parameter name
	 **************************************************************************/
	protected final String PAGENAME = "pageName";

	/**
	 * Constructs a DisplayPageOperation.
	 */
	public TreeAjaxOperation() {
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
	public TreeAjaxOperation(String anOperationName) throws java.io.IOException {
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
	public TreeAjaxOperation(String anOperationName, String aParentContext)
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
	public TreeAjaxOperation(String anOperationName, Context aParentContext)
			throws java.io.IOException, DSEInvalidRequestException {
		super(anOperationName, aParentContext);
	}

	/**
	 * Gets the page name wanted to be displayed and places it in the right
	 * field to make the Composer understand that this page must be shown.
	 */
	public void execute() throws Exception {
		System.out.println("Tree ajax Operation");
		
		KeyedCollection treeData = (KeyedCollection)(this.getContext().getParent().getElementAt("treeData"));
		if(treeData.tryGetElementAt("newKColl")!=null)
			treeData.removeElementAt("newKColl");
		this.getContext().getKeyedCollection().addElement(treeData);
		System.out.println(this.getContext().getKeyedCollection());
		
		System.out.println(this.getContext().getParent().getKeyedCollection());
//		setValueAt(HtmlConstants.REPLYPAGE, "treeBasic.jsp");
	}
}