package com.ibm.btt.sample.operation;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Random;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.impl.Currency;
import com.ibm.btt.cs.html.HtmlConstants;

public class TableValidationNumber extends BTTServerOperation {
	
	public void execute() throws Exception {
		  KeyedCollection tableKColl = this.getContext().getKeyedCollection();
		  String st = String.valueOf(getValueAt("st"));
		  Random rand = new Random();
		  int[] ia = {2,-4,10,-9};
		  double[] ds = {2.01,10.10,-3.99,-11.01};
	
		for (int i = 0; i < 4; i++) {

			//Number
			if(null != st && st.equals("numberInit")) {
				tableKColl.setValueAt("NumberTableData."+i+".DefaultNumberTypeofNumberField",new BigDecimal(11.00));
				tableKColl.setValueAt("NumberTableData."+i+".ByteofNumberField",new Byte("123"));
				tableKColl.setValueAt("NumberTableData."+i+".ShortofNumberField",new Short("12"));
				tableKColl.setValueAt("NumberTableData."+i+".IntegerofNumberField",new Integer("11"));
				tableKColl.setValueAt("NumberTableData."+i+".LongNumberField",new Long(ia[i]));
				tableKColl.setValueAt("NumberTableData."+i+".DoubleNumberField",new Double(11.11));
				tableKColl.setValueAt("NumberTableData."+i+".FloatNumberField",new Float(1.1));
				tableKColl.setValueAt("NumberTableData."+i+".DecimalofNumberField",new BigDecimal(ds[i]));
				tableKColl.setValueAt("NumberTableData."+i+".maxMinIntegerofNumberField",new Long("11"));
				tableKColl.setValueAt("NumberTableData."+i+".maxMinDecimalofNumberField",new Float("11.111"));
				tableKColl.setValueAt("NumberTableData."+i+".formatWithLocaleofNumberField",new BigDecimal("2.0001"));
				tableKColl.setValueAt("NumberTableData."+i+".formatWithPatternofNumberField1",new BigDecimal("11.1111"));
				tableKColl.setValueAt("NumberTableData."+i+".formatWithPatternofNumberField2",new BigDecimal(ia[i]));
				tableKColl.setValueAt("NumberTableData."+i+".formatWithPatternofNumberField3",new BigDecimal(ia[i]));
				tableKColl.setValueAt("NumberTableData."+i+".formatWithDecimalPlacesofNumberField1",new Double("11.1111"));
				tableKColl.setValueAt("NumberTableData."+i+".formatWithDecimalPlacesofNumberField2",new BigDecimal("11.111"));
				
				tableKColl.setValueAt("NumberTableData."+i+".DoubleFiledForSorting",new Double(ds[i]));
				
			}

		}
		  System.out.println(tableKColl.toString());
		setValueAt(HtmlConstants.REPLYPAGE, "TableValidation.jsp");
	}
}
