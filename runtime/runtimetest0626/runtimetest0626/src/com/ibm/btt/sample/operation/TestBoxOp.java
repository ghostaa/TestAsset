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
public class TestBoxOp extends BTTServerOperation {
	/***************************************************************************
	 * Constant representing the name of the field where is stored the page
	 * wanted to be displayed. The parameter must be sent from the HTML page
	 * using this string as the parameter name
	 **************************************************************************/
	//protected final String PAGENAME = "pageName";

	/**
	 * Constructs a DisplayPageOperation.
	 */
	public TestBoxOp() {
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
	public TestBoxOp(String anOperationName) throws java.io.IOException {
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
	public TestBoxOp(String anOperationName, String aParentContext)
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
	public TestBoxOp(String anOperationName, Context aParentContext)
			throws java.io.IOException, DSEInvalidRequestException {
		super(anOperationName, aParentContext);
	}

	/**
	 * Gets the page name wanted to be displayed and places it in the right
	 * field to make the Composer understand that this page must be shown.
	 */
	public void execute() throws Exception {
		System.out.println("TextBoxOperation");
		
//		java.util.Date date = new java.util.Date();
//		date.setMonth(11);
//		setValueAt("maxMinofDateTestField1", date);
		//System.out.println(this.getContext().getKeyedCollection());
		//System.out.println(getValueAt("BasicField"));
//		KeyedCollection textBoxKColl = this.getContext().getKeyedCollection();
		setValueAt(HtmlConstants.REPLYPAGE, "textBox.jsp");
		/*textBoxKColl.setValueAt("BasicField_1",getValueAt("BasicField"));
		textBoxKColl.setValueAt("Fieldwithpassword_1",getValueAt("Fieldwithpassword"));
		
		if(getValueAt("Currencywithrequiredwithhint")!= null)
		textBoxKColl.setValueAt("Currencywithrequiredwithhint_1",getValueAt("Currencywithrequiredwithhint"));
		
		textBoxKColl.setValueAt("CurrencyBoxwithdecimalplacewithrequired=4_1",getValueAt("CurrencyBoxwithdecimalplacewithrequired=4"));
		textBoxKColl.setValueAt("CurrencyBoxwithdecimalplacewithrequired=1_1",getValueAt("CurrencyBoxwithdecimalplacewithrequired=1"));
		
		textBoxKColl.setValueAt("CurrencyBoxwithrequiredwithCNY_1",getValueAt("CurrencyBoxwithrequiredwithCNY"));
		textBoxKColl.setValueAt("CurrencyBoxwithrequiredwithFRF_1",getValueAt("CurrencyBoxwithrequiredwithFRF"));
		
		textBoxKColl.setValueAt("CurrencyBoxwithformatwithlocale_1",getValueAt("CurrencyBoxwithformatwithlocale"));
		
		textBoxKColl.setValueAt("CurrencyBoxwithmaxminInt_1",getValueAt("CurrencyBoxwithmaxminInt"));
		textBoxKColl.setValueAt("CurrencyBoxwithmaxminDecimal_1",getValueAt("CurrencyBoxwithmaxminDecimal"));
		
		textBoxKColl.setValueAt("CurrencyBoxwithByted_1",getValueAt("CurrencyBoxwithByte"));
		textBoxKColl.setValueAt("CurrencyBoxwithShort_1",getValueAt("CurrencyBoxwithShort"));
		textBoxKColl.setValueAt("CurrencyBoxwithInteger_1",getValueAt("CurrencyBoxwithInteger"));
		textBoxKColl.setValueAt("CurrencyBoxwithLong_1",getValueAt("CurrencyBoxwithLong"));
		textBoxKColl.setValueAt("CurrencyBoxwithDouble_1",getValueAt("CurrencyBoxwithDouble"));
		textBoxKColl.setValueAt("CurrencyBoxwithFloat_1",getValueAt("CurrencyBoxwithFloat"));
		textBoxKColl.setValueAt("CurrencyBoxwithBigdecimal_1",getValueAt("CurrencyBoxwithBigdecimal"));
		textBoxKColl.setValueAt("CurrencyBoxwithDefault_1",getValueAt("CurrencyBoxwithDefault"));
		
		textBoxKColl.setValueAt("DateBasic_1",getValueAt("DateBasic"));
		
		textBoxKColl.setValueAt("DateBoxWithmaxmin(default)_1",getValueAt("DateBoxWithmaxmin(default)"));
		textBoxKColl.setValueAt("DateBoxWithmaxmin(MMddYYYY)_1",getValueAt("DateBoxWithmaxmin(MMddYYYY)"));
		
		textBoxKColl.setValueAt("DateWithPatternNull_1",getValueAt("DateWithPatternNull"));
		
		textBoxKColl.setValueAt("DateWithRequiredminmax_1",getValueAt("DateWithRequiredminmax"));
		textBoxKColl.setValueAt("DateWithRequiredminmax(today)_1",getValueAt("DateWithRequiredminmax(today)"));
		
		textBoxKColl.setValueAt("Integerwithrequiredwithhint_1",getValueAt("Integerwithrequiredwithhint"));
		
		textBoxKColl.setValueAt("Html:decimalPlaces_1",getValueAt("Html:decimalPlaces"));
		textBoxKColl.setValueAt("Html:bigDecimalwithpatternwithhtml:decimalPlaces_1",getValueAt("Html:bigDecimalwithpatternwithhtml:decimalPlaces"));
		textBoxKColl.setValueAt("Html:bigDecimalwithpatternwithdefault:decimalPlaces_1",getValueAt("Html:bigDecimalwithpatternwithdefault:decimalPlaces"));
		textBoxKColl.setValueAt("Default:bigDecimalwithpatternwithhtml:decimalPlaces_1",getValueAt("Default:bigDecimalwithpatternwithhtml:decimalPlaces"));
		textBoxKColl.setValueAt("Default:bigDecimalwithpatternwithdefault:decimalPlaces_1",getValueAt("Default:bigDecimalwithpatternwithdefault:decimalPlaces"));
		textBoxKColl.setValueAt("Doublewithhtml:pattern=#withdefault:decimalPlaceswithvalue_1",getValueAt("Doublewithhtml:pattern=#withdefault:decimalPlaceswithvalue"));
		textBoxKColl.setValueAt("Doublewithhtml:pattern=0withdefault:decimalPlaceswithvalue_1",getValueAt("Doublewithhtml:pattern=0withdefault:decimalPlaceswithvalue"));
		textBoxKColl.setValueAt("Doublewithhtml:pattern=#withdefault:decimalPlaces_1",getValueAt("Doublewithhtml:pattern=#withdefault:decimalPlaces"));
		textBoxKColl.setValueAt("Doublewithhtml:pattern=0withdefault:decimalPlaces_1",getValueAt("Doublewithhtml:pattern=0withdefault:decimalPlaces"));
		textBoxKColl.setValueAt("Doublewithhtml:pattern=#withhtml:decimalPlaces_1",getValueAt("Doublewithhtml:pattern=#withhtml:decimalPlaces"));
		textBoxKColl.setValueAt("Doublewithhtml:pattern=0withhtml:decimalPlaces",getValueAt("Doublewithhtml:pattern=0withhtml:decimalPlaces"));
		textBoxKColl.setValueAt("Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=#_1",getValueAt("Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=#"));
		textBoxKColl.setValueAt("Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=0_1",getValueAt("Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=0"));
		textBoxKColl.setValueAt("Default: bigDecimalwithdefault:decimalPlacesewithhtml:pattern=#_1",getValueAt("Default: bigDecimalwithdefault:decimalPlacesewithhtml:pattern=#"));
		textBoxKColl.setValueAt("Default: bigDecimalwithdefault:decimalPlacesewithhtml:pattern=0_1",getValueAt("Default: bigDecimalwithdefault:decimalPlacesewithhtml:pattern=0"));
		textBoxKColl.setValueAt("Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=#withvalue_1",getValueAt("Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=#withvalue"));
		textBoxKColl.setValueAt("Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=0withvalue_1",getValueAt("Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=0withvalue"));
		textBoxKColl.setValueAt("Default: bigDecimalwithdefault:decimalPlaceswithhtml:pattern=#_1",getValueAt("Default: bigDecimalwithdefault:decimalPlaceswithhtml:pattern=#"));
		textBoxKColl.setValueAt("Default: bigDecimalwithdefault:decimalPlaceswithhtml:pattern=0_1",getValueAt("Default: bigDecimalwithdefault:decimalPlaceswithhtml:pattern=0"));
		
		textBoxKColl.setValueAt("NumberRequiredwithhtml:bigDecimalwithhtml:decimalplaces_1",getValueAt("NumberRequiredwithhtml:bigDecimalwithhtml:decimalplaces"));
		textBoxKColl.setValueAt("NumeberRequiredwithhtml:bigDecimalwithdefault:decimalplaces_1",getValueAt("NumeberRequiredwithhtml:bigDecimalwithdefault:decimalplaces"));
		textBoxKColl.setValueAt("NumberRequiredwithdefault:bigDecimalwithhtml:decimalplaces_1",getValueAt("NumberRequiredwithdefault:bigDecimalwithhtml:decimalplaces"));
		textBoxKColl.setValueAt("NumberRequireddefault:bigDecimalwithdefault:decimalplaces_1",getValueAt("NumberRequireddefault:bigDecimalwithdefault:decimalplaces"));
		
		textBoxKColl.setValueAt("Html: floatwithhtml:decimalplacewithmaxmin_1",getValueAt("Html: floatwithhtml:decimalplacewithmaxmin"));
		textBoxKColl.setValueAt("Html: floatwithdefault:decimalplaceswithmaxmin_1",getValueAt("Html: floatwithdefault:decimalplaceswithmaxmin"));
		textBoxKColl.setValueAt("Default: floatwithHtml:decimalplaceswithmaxmin_1",getValueAt("Default: floatwithHtml:decimalplaceswithmaxmin"));
		textBoxKColl.setValueAt("Default: floatwithdefault:decimalplaceswithmaxmin_1",getValueAt("Default: floatwithdefault:decimalplaceswithmaxmin"));
		
		textBoxKColl.setValueAt("Html:bigDecimal,html:pattern=#_1",getValueAt("Html:bigDecimal,html:pattern=#"));
		textBoxKColl.setValueAt("Default:bigDecimal,html:pattern=#_1",getValueAt("Default:bigDecimal,html:pattern=#"));
		textBoxKColl.setValueAt("Html:bigDecimal,html:pattern=0_1",getValueAt("Html:bigDecimal,html:pattern=0"));
		textBoxKColl.setValueAt("Defaultl:bigDecimal,html:pattern=0_1",getValueAt("Defaultl:bigDecimal,html:pattern=0"));
		
		textBoxKColl.setValueAt("Html:floatwithhtml:decimalplaces_1",getValueAt("Html:floatwithhtml:decimalplaces"));
		textBoxKColl.setValueAt("Html:bigdecimalwithhtml:decimalplaces_1",getValueAt("Html:bigdecimalwithhtml:decimalplaces"));
		textBoxKColl.setValueAt("Html:defaultwithhtml:decimalplaces_1",getValueAt("Html:defaultwithhtml:decimalplaces"));
		textBoxKColl.setValueAt("Default:floatwithdefault:decimalplaces _1",getValueAt("Default:floatwithdefault:decimalplaces "));
		textBoxKColl.setValueAt("Default:bigdecimalwithdefault:decimalplaces_1",getValueAt("Default:bigdecimalwithdefault:decimalplaces"));
		textBoxKColl.setValueAt("Default:defaultwithdefault:decimalplaces_1",getValueAt("Default:defaultwithdefault:decimalplaces"));
		
		textBoxKColl.setValueAt("StringwithRequired_1",getValueAt("StringwithRequired"));
		
		textBoxKColl.setValueAt("LengthTestField_1",getValueAt("LengthTestField"));
		
		textBoxKColl.setValueAt("mailaddress_1",getValueAt("mailaddress"));*/
	}
}