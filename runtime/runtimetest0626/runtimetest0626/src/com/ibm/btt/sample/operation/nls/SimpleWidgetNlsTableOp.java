package com.ibm.btt.sample.operation.nls;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Random;

import com.ibm.btt.base.Constants;
import com.ibm.btt.base.DSEInvalidArgumentException;
import com.ibm.btt.base.DSEInvalidRequestException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.DSETypeException;
import com.ibm.btt.base.types.impl.Currency;

public class SimpleWidgetNlsTableOp extends CommonServerOp {
	private Random rand = new Random();

	public void execute() throws Exception {
		super.execute();
		setValueAt(Constants.REPLYPAGE, "nls/SimpleWidgetNlsTable.jsp");
		setTypedTableValues();
		System.out.println(getKeyedCollection());
	}

	private void setTypedTableValues() throws DSEObjectNotFoundException,
			DSEInvalidArgumentException, DSEInvalidRequestException,
			DSETypeException {
		IndexedCollection table1DataList = (IndexedCollection) getElementAt("TableDataKColl.TypedTableDataList");
		table1DataList.removeAll();
		for (int i = 0; i < 12; i++) {
			KeyedCollection kcoll = (KeyedCollection) table1DataList
					.createElement(false);
			kcoll.setName("TypedTable");
			kcoll.setValueAt("index", (i+1));
			kcoll.setValueAt("currencyField", new Currency("EUR",
					new BigDecimal(rand.nextInt(1048576))));
			kcoll.setValueAt("dateField", new Date());
			kcoll.setValueAt("numberField", new BigDecimal(rand.nextInt()));
			kcoll.setValueAt("stringField",
					"SSN" + String.valueOf(rand.nextInt(99)));
			table1DataList.addElement(kcoll);
		}
	}
}
