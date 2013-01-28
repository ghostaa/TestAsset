package com.ibm.btt.sample.operation;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Random;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.impl.Currency;
import com.ibm.btt.cs.html.HtmlConstants;

public class TableValidationDate extends BTTServerOperation {
	
	public void execute() throws Exception {
		  KeyedCollection tableKColl = this.getContext().getKeyedCollection();
		  String st = String.valueOf(getValueAt("st"));
		  Random rand = new Random();
		  String[] ss = {"2012-08-21","2012-08-20","2012-08-20"};
		  String[] ss1 = {"2011-12-02","2010-12-11","2010-12-15"};
		  String[] ss2 = {"10-13-1979","10-15-1979","10-21-1979"};
		  for (int i = 0; i < 3; i++) {
			//date
			if(null != st && st.equals("dateInit")) {
				tableKColl.setValueAt("DateTableData."+i+".maxMinofDateTestField1", ss[i]);
				tableKColl.setValueAt("DateTableData."+i+".maxMinofDateTestField2",new Date());
				tableKColl.setValueAt("DateTableData."+i+".maxMinofDateTestField3",ss2[i]);
				tableKColl.setValueAt("DateTableData."+i+".maxMinofDateTestField4","12-11-2012");
				tableKColl.setValueAt("DateTableData."+i+".nullPatternofDateTestField",ss1[i]);
				tableKColl.setValueAt("DateTableData."+i+".basicfDateTestField",ss2[i]);
			}
		  }
		  setValueAt(HtmlConstants.REPLYPAGE, "TableValidation.jsp");
	}
}
