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
import java.math.BigDecimal;
import java.util.Random;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.DSEInvalidRequestException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.impl.Currency;

@SuppressWarnings("serial")
public class TableAjaxOperation extends BTTServerOperation {
	private static Random RANDOM= new Random();
	/***************************************************************************
	 * Constant representing the name of the field where is stored the page
	 * wanted to be displayed. The parameter must be sent from the HTML page
	 * using this string as the parameter name
	 **************************************************************************/
	protected final String PAGENAME = "pageName";
	static Currency salary = null;

	/**
	 * Constructs a DisplayPageOperation.
	 */
	public TableAjaxOperation() {
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
	public TableAjaxOperation(String anOperationName) throws java.io.IOException {
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
	public TableAjaxOperation(String anOperationName, String aParentContext)
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
	public TableAjaxOperation(String anOperationName, Context aParentContext)
			throws java.io.IOException, DSEInvalidRequestException {
		super(anOperationName, aParentContext);
	}

	/**
	 * Gets the page name wanted to be displayed and places it in the right
	 * field to make the Composer understand that this page must be shown.
	 */
	public void execute() throws Exception {
	 /* KeyedCollection tableKColl = this.getContext().getKeyedCollection();
		  
		  IndexedCollection tableData = (IndexedCollection)tableKColl.getElementAt("tableData");
		  salary = new Currency("USD",new BigDecimal(11));
		  int i = 0;
		  
			  tableKColl.setValueAt("tableData."+i+".index", true);
			  tableKColl.setValueAt("tableData."+i+".name", "change");
			  tableKColl.setValueAt("tableData."+i+".gender", "male");
			  tableKColl.setValueAt("tableData."+i+".Num", i);
			  tableKColl.setValueAt("tableData."+i+".salary", salary);
			  tableKColl.setValueAt("tableData."+i+".position", "SE");
			  tableKColl.setValueAt("tableData."+i+".birth", (new java.util.Date()));
			  tableKColl.setValueAt("tableData."+i+".imageField", RANDOM.nextBoolean()?"img/cry.jpg":"img/location.gif");*/
	}
}