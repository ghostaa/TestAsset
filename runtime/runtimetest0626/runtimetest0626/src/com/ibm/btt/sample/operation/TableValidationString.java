package com.ibm.btt.sample.operation;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Random;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.impl.Currency;
import com.ibm.btt.cs.html.HtmlConstants;

public class TableValidationString extends BTTServerOperation {
	
	public void execute() throws Exception {
		  KeyedCollection tableKColl = this.getContext().getKeyedCollection();
		  String st = String.valueOf(getValueAt("st"));
		  Random rand = new Random();
		 System.out.println(tableKColl.getElementAt("selectTableDate"));
		 System.out.println(tableKColl.getElementAt("StringTableData"));
		  //System.out.println(tableKColl);
		  double[] ia = {2.00,-4.00,-10.00,10.00,10.00};
		  float[] bs = {2,10,4,3,6};
		  for (int i = 0; i < 3; i++) {
			  tableKColl.setValueAt("selList."+i+".label", "l"+i);
			  tableKColl.setValueAt("selList."+i+".value", "v"+i);
			  tableKColl.setValueAt("comboList."+i+".label", "C"+i);
		  }
		  
		  
		  
		for (int i = 0; i < tableKColl.size(); i++) {
			//String
			
			if(null != st && st.equals("stringInit")) {
				tableKColl.setValueAt("StringTableData."+i+".requiredBasicField", "SSN" + String.valueOf(rand.nextInt(99)));
				tableKColl.setValueAt("StringTableData."+i+".lengthofStringTestField","TT"+i);
				tableKColl.setValueAt("StringTableData."+i+".regExpr","\\\"'");
				tableKColl.setValueAt("StringTableData."+i+".DateInString",new Date());
				tableKColl.setValueAt("StringTableData."+i+".NumberInString",bs[i]);
				tableKColl.setValueAt("StringTableData."+i+".CurrencyInString",new Currency("USD",new BigDecimal(ia[i])));
				
				//for hidden column
				tableKColl.setValueAt("StringTableData."+i+".hiddenCurrency",new Currency("USD",new BigDecimal(ia[i])));
				tableKColl.setValueAt("StringTableData."+i+".hiddenString","SSN" + String.valueOf(rand.nextInt(99)));
				tableKColl.setValueAt("StringTableData."+i+".hiddenDate",new Date());
				tableKColl.setValueAt("StringTableData."+i+".hiddenNumber",bs[i]);
				/*if(i==1){
					tableKColl.setValueAt("StringTableData."+i+".requiredBasicField", null);
					tableKColl.setValueAt("StringTableData."+i+".lengthofStringTestField",null);
					tableKColl.setValueAt("StringTableData."+i+".regExpr",null);
					tableKColl.setValueAt("StringTableData."+i+".DateInString",null);
					tableKColl.setValueAt("StringTableData."+i+".NumberInString",null);
					tableKColl.setValueAt("StringTableData."+i+".CurrencyInString",null);
				}*/
			}

		}
		setValueAt(HtmlConstants.REPLYPAGE, "TableValidation.jsp");
	}
}
