package com.ibm.btt.sample.operation;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Random;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Constants;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.impl.Currency;
import com.ibm.btt.cs.html.HtmlConstants;
/** 
 * Class Generated by BTT Tool
 * Created since: 2010/11/30 14:37:40
 */
public class TableAbnormalIColl extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  KeyedCollection tableKColl = this.getContext().getKeyedCollection();
	  String rad = (String)getValueAt("rad");
	  Random rand = new Random();
	  //String img = "img/040518flashlee01.jpg";
	  
		for (int i = 0; i <3; i++) {
			//tableKColl.setValueAt("tableData."+i+".tString", "SSN" + String.valueOf(rand.nextInt(99)));
			tableKColl.setValueAt("tableData."+i+".tCurrency", new Currency("USD",
					new BigDecimal(rand.nextInt(10486))));
			tableKColl.setValueAt("tableData."+i+".dateField",new Date());
			//tableKColl.setValueAt("tableData."+i+".tNumber", new BigDecimal(rand.nextInt()));
			tableKColl.setValueAt("tableData."+i+".tev", "test");
			//tableKColl.setValueAt("tableData."+i+".ImageField", "img/040518flashlee01.jpg");It make Operation occur mistake.
			if(i ==1 && rad != null && rad.equals("2.5"))  {
				tableKColl.setValueAt("tableData."+(i+1)+".tString", "SSN" + String.valueOf(rand.nextInt(99)));
			}
			if(i == 2) {
				tableKColl.setValueAt("tableData."+i+".tString", null);
				tableKColl.setValueAt("tableData."+i+".tCurrency", null);
				tableKColl.setValueAt("tableData."+i+".dateField",null);
				tableKColl.setValueAt("tableData."+i+".tNumber", null);
				tableKColl.setValueAt("tableData."+i+".tev", null);
				//tableKColl.setValueAt("tableData."+i+".ImageField", img);
			}
		}
		//setValueAt(HtmlConstants.REPLYPAGE, "TableAbnormalIColl.jsp");
		//setValueAt(Constants.REPLYPAGE,"TableAbnormalIColl.jsp");
		fireExitEvent("init");
  }
}
