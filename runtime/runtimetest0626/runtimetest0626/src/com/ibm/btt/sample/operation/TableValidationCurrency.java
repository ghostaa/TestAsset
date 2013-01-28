package com.ibm.btt.sample.operation;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Random;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.impl.Currency;
import com.ibm.btt.cs.html.HtmlConstants;

public class TableValidationCurrency extends BTTServerOperation {
	
	public void execute() throws Exception {
		  KeyedCollection tableKColl = this.getContext().getKeyedCollection();
		  String st = String.valueOf(getValueAt("st"));
		  Random rand = new Random();
		  double[] ds = {2.01,10.10,-3.99,-11.01};
		  int[] ia = {2,-4,-10};
		  
		for (int i = 0; i < 4; i++) {

			
			//currenty
			if(null != st && st.equals("currencyInit")) {
				tableKColl.setValueAt("CurrencyTableData."+i+".basicCurrencyofCurrencyField",new Currency("USD",new BigDecimal(ds[i])));
				tableKColl.setValueAt("CurrencyTableData."+i+".CNYCurrencyofCurrencyField",new Currency("USD",new BigDecimal(11.00)));
				tableKColl.setValueAt("CurrencyTableData."+i+".FRFCurrencyofCurrencyField",new Currency("",new BigDecimal(-11.00)));
				tableKColl.setValueAt("CurrencyTableData."+i+".IntegerofCurrencyField",new Currency("",new Integer(1)));
				tableKColl.setValueAt("CurrencyTableData."+i+".DecimalofCurrencyField",new Currency("",new BigDecimal(-11.0001)));
				tableKColl.setValueAt("CurrencyTableData."+i+".ByteofCurrencyField",new Currency("",new Byte("123")));
				tableKColl.setValueAt("CurrencyTableData."+i+".ShortofCurrencyField",new Currency("",new Short("12")));
				tableKColl.setValueAt("CurrencyTableData."+i+".LongCurrencyField",new Currency("",new Long(11)));
				tableKColl.setValueAt("CurrencyTableData."+i+".DoubleCurrencyField",new Currency("",new Double(11.111)));
				tableKColl.setValueAt("CurrencyTableData."+i+".FloatCurrencyField",new Currency("",new Float(11.1)));
				tableKColl.setValueAt("CurrencyTableData."+i+".decimalPlacesAndLimit",new Currency("",new BigDecimal(11.1111)));
				tableKColl.setValueAt("CurrencyTableData."+i+".maxMinIntegerofCurrencyField",new Currency("",new Integer(11)));
				tableKColl.setValueAt("CurrencyTableData."+i+".maxMinDecimalofCurrencyField",new Currency("",new BigDecimal(11)));
				tableKColl.setValueAt("CurrencyTableData."+i+".formatWithDecimalPlacesofCurrencyField1",new Currency("",new BigDecimal(11.1111)));
				tableKColl.setValueAt("CurrencyTableData."+i+".formatWithDecimalPlacesofCurrencyField2",new Currency("",new BigDecimal(11.1111)));
			}

		}
		setValueAt(HtmlConstants.REPLYPAGE, "TableValidation.jsp");
	}
}
