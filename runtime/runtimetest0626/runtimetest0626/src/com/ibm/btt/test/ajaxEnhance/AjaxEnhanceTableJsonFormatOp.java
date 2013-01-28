package com.ibm.btt.test.ajaxEnhance;

import java.math.BigDecimal;
import java.util.Date;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.impl.Currency;

public class AjaxEnhanceTableJsonFormatOp extends BTTServerOperation {
	public void execute() throws Exception {
		KeyedCollection resp = (KeyedCollection) getElementAt("respData");
		resp.setValueAt("payResult", "SUCCESS");
		IndexedCollection tableRows = (IndexedCollection) resp
				.getElementAt("payHistRecs");
		tableRows.removeAll();
		for (int i = 0; i < 5; i++) {
			KeyedCollection row = (KeyedCollection) tableRows.createElement(false);
			row.setValueAt("index", (i + 1));
			row.setValueAt("rmtAcct", "BC0001123459703458" + i);
			row.setValueAt("payAmount", new Currency("CNY", new BigDecimal(
					100 + i * 55 + 0.56)));
			row.setValueAt("payOccurTime", new Date());
			row.setValueAt("comments", "Pay money to remittee 00" + i);
			tableRows.addElement(row);
		}
		KeyedCollection row = (KeyedCollection) tableRows.createElement(false);
		row.setValueAt("index", 6);
		row.setValueAt("rmtAcct", getValueAt("destAcctNo") );
		row.setValueAt("payAmount", getValueAt("payAmount"));
		row.setValueAt("payOccurTime", new Date());
		row.setValueAt("comments", getValueAt("comments"));
		tableRows.addElement(row);
	}
}
