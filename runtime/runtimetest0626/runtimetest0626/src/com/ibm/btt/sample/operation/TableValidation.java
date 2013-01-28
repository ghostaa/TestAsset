package com.ibm.btt.sample.operation;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Random;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.impl.Currency;
import com.ibm.btt.cs.html.HtmlConstants;

public class TableValidation extends BTTServerOperation {
	
	public void execute() throws Exception {
		
		  KeyedCollection tableKColl = this.getContext().getKeyedCollection();
		  //String st = String.valueOf(getValueAt("st"));
		  Random rand = new Random();
		  int[] ia = {2,-4,-10};
		  
		  for (int i = 0; i < 3; i++) {
			
				tableKColl.setValueAt("StringTableData."+i+".requiredBasicField", "SSN" + String.valueOf(rand.nextInt(99)));
				tableKColl.setValueAt("StringTableData."+i+".lengthofStringTestField","aeae");
				tableKColl.setValueAt("StringTableData."+i+".CurrencyInString",new Currency("USD",new BigDecimal(11.00)));
				tableKColl.setValueAt("StringTableData."+i+".NumberInString",new BigDecimal(1));
				tableKColl.setValueAt("StringTableData."+i+".DateInString","2012-08-20");
				tableKColl.setValueAt("StringTableData."+i+".chk","false");
				tableKColl.setValueAt("StringTableData."+i+".sId","select");
				tableKColl.setValueAt("StringTableData."+i+".cId","combo");
				
			//Number
				tableKColl.setValueAt("NumberTableData."+i+".DefaultNumberTypeofNumberField",new BigDecimal(11.00));
				tableKColl.setValueAt("NumberTableData."+i+".ByteofNumberField",new BigDecimal("123"));
				tableKColl.setValueAt("NumberTableData."+i+".ShortofNumberField",new BigDecimal("12"));
				tableKColl.setValueAt("NumberTableData."+i+".IntegerofNumberField",new BigDecimal("11"));
				tableKColl.setValueAt("NumberTableData."+i+".LongNumberField",new BigDecimal(1));
				tableKColl.setValueAt("NumberTableData."+i+".FloatNumberField",new Float(1.1));
				tableKColl.setValueAt("NumberTableData."+i+".DecimalofNumberField",new BigDecimal(11.1111));
				tableKColl.setValueAt("NumberTableData."+i+".maxMinIntegerofNumberField",new BigDecimal("11"));
				tableKColl.setValueAt("NumberTableData."+i+".maxMinDecimalofNumberField",new Float("11.111"));
				tableKColl.setValueAt("NumberTableData."+i+".formatWithLocaleofNumberField",new BigDecimal("2.0001"));
				tableKColl.setValueAt("NumberTableData."+i+".formatWithPatternofNumberField1",new BigDecimal("11.1111"));
				tableKColl.setValueAt("NumberTableData."+i+".formatWithPatternofNumberField2",new BigDecimal(ia[i]));
				tableKColl.setValueAt("NumberTableData."+i+".formatWithPatternofNumberField3",new BigDecimal(ia[i]));
				tableKColl.setValueAt("NumberTableData."+i+".formatWithDecimalPlacesofNumberField1",new Double("11.1111"));
				tableKColl.setValueAt("NumberTableData."+i+".formatWithDecimalPlacesofNumberField2",new BigDecimal("11.111"));
			//}
			
			//currenty
				tableKColl.setValueAt("CurrencyTableData."+i+".basicCurrencyofCurrencyField",new Currency("USD",new BigDecimal(11.00)));
				tableKColl.setValueAt("CurrencyTableData."+i+".CNYCurrencyofCurrencyField",new Currency("USD",new BigDecimal(11.00)));
				tableKColl.setValueAt("CurrencyTableData."+i+".FRFCurrencyofCurrencyField",new Currency("",new BigDecimal(-11.00)));
				tableKColl.setValueAt("CurrencyTableData."+i+".IntegerofCurrencyField",new Currency("",new BigDecimal(1)));
				tableKColl.setValueAt("CurrencyTableData."+i+".DecimalofCurrencyField",new Currency("",new BigDecimal(-11.0001)));
				tableKColl.setValueAt("CurrencyTableData."+i+".ByteofCurrencyField",new Currency("",new BigDecimal("123")));
				tableKColl.setValueAt("CurrencyTableData."+i+".ShortofCurrencyField",new Currency("",new BigDecimal("12")));
				tableKColl.setValueAt("CurrencyTableData."+i+".LongCurrencyField",new Currency("",new BigDecimal(11)));
				tableKColl.setValueAt("CurrencyTableData."+i+".DoubleCurrencyField",new Currency("",new Double(11.111)));
				tableKColl.setValueAt("CurrencyTableData."+i+".FloatCurrencyField",new Currency("",new Float(11.1)));
				tableKColl.setValueAt("CurrencyTableData."+i+".decimalPlacesAndLimit",new Currency("",new BigDecimal(11.1111)));
				tableKColl.setValueAt("CurrencyTableData."+i+".maxMinIntegerofCurrencyField",new Currency("",new BigDecimal(11)));
				tableKColl.setValueAt("CurrencyTableData."+i+".maxMinDecimalofCurrencyField",new Currency("",new BigDecimal(11)));
				tableKColl.setValueAt("CurrencyTableData."+i+".formatWithDecimalPlacesofCurrencyField1",new Currency("",new BigDecimal(11.1111)));
				tableKColl.setValueAt("CurrencyTableData."+i+".formatWithDecimalPlacesofCurrencyField2",new Currency("",new BigDecimal(11.1111)));
			
			
			//date	
				tableKColl.setValueAt("DateTableData."+i+".maxMinofDateTestField1", "2012-08-20");
				tableKColl.setValueAt("DateTableData."+i+".maxMinofDateTestField2","08-20-2012");
				tableKColl.setValueAt("DateTableData."+i+".maxMinofDateTestField3","10-12-1979");
				tableKColl.setValueAt("DateTableData."+i+".maxMinofDateTestField4","12-11-2011");
				tableKColl.setValueAt("DateTableData."+i+".nullPatternofDateTestField",(new java.util.Date()));
				tableKColl.setValueAt("DateTableData."+i+".basicfDateTestField","12-11-2010");

		}
		//setValueAt(HtmlConstants.REPLYPAGE, "TableValidation.jsp");
		fireExitEvent("init");
	}
}
