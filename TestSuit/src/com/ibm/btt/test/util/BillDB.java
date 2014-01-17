package com.ibm.btt.test.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;

public class BillDB {
	private static BillDB billDB = null;
	private static Random ran = new Random();
	private IndexedCollection billInDB;

	private BillDB() {
	}

	public static synchronized BillDB getInstance() throws Exception {
		if (billDB == null) {
			billDB = new BillDB();
			billDB.initBillDB();
		}
		return billDB;
	}

	private void initBillDB() throws Exception {
		billInDB = new IndexedCollection();
		List<String> acctNoList = new ArrayList<String>();
		acctNoList.add(0, "4367 4800 0679 1738");
		acctNoList.add(1, "4367 4800 2395 1414");
		acctNoList.add(2, "4367 4812 3498 7656");
		
		List<String> tradeTypeList = new ArrayList<String>();
		tradeTypeList.add(0, "Online Payment");
		tradeTypeList.add(1, "Credit Payment");
		tradeTypeList.add(2, "Shopping");
		
		List<String> curTypeList = new ArrayList<String>();
		curTypeList.add(0, "USD");
		curTypeList.add(1, "CNY");
		curTypeList.add(2, "EUR");
		
		for (int i = 0; i < 48; i++) {
			KeyedCollection bill = new KeyedCollection();
			bill.setDynamic(true);
			bill.setName("bill");
			int tt = ran.nextInt(3);
			String acctNo = acctNoList.get(tt);
			bill.setValueAt("AcctNo", acctNo);
			bill.setValueAt("ShortAcctNo", acctNo.substring(15));
			Date tDate = DateUtilForTest.getDate();
			bill.setValueAt("TradeDate", tDate);
			bill.setValueAt("BookDate", tDate);
			bill.setValueAt("TradeType", tradeTypeList.get(ran.nextInt(3)));
			bill.setValueAt("CurType", curTypeList.get(ran.nextInt(3)));
			bill.setValueAt("Amount", ran.nextDouble() * 8000);
			bill.setValueAt("Comments", "All kinds of payment");
			billInDB.addElement(bill);
		}
	}

	public IndexedCollection getAllBill() throws Exception{
		return getInstance().billInDB;
	}
	
}
