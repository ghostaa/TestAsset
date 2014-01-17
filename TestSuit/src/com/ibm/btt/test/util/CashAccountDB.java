package com.ibm.btt.test.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;

public class CashAccountDB {
	private static CashAccountDB cashAcctDB = null;
	private static Random ran = new Random();
	private IndexedCollection cashAcctInDB;

	private CashAccountDB() {
	}

	public static synchronized CashAccountDB getInstance() throws Exception {
		if (cashAcctDB == null) {
			cashAcctDB = new CashAccountDB();
			cashAcctDB.initCashAcctDB();
		}
		return cashAcctDB;
	}

	private void initCashAcctDB() throws Exception {
		cashAcctInDB = new IndexedCollection();
		List<String> surnameList = new ArrayList<String>();
		surnameList.add(0, "Smith");
		surnameList.add(1, "Carter");
		surnameList.add(2, "Cook");
		surnameList.add(3, "Wilson");
		surnameList.add(4, "Washington");
		surnameList.add(5, "Hill");
		surnameList.add(6, "Black");
		surnameList.add(7, "Brown");
		surnameList.add(8, "Tomson");
		surnameList.add(9, "Johnson");
		List<String> nameList = new ArrayList<String>();
		nameList.add(0, "Jack");
		nameList.add(1, "John");
		nameList.add(2, "Jim");
		nameList.add(3, "Peter");
		nameList.add(4, "Tom");
		nameList.add(5, "Lucy");
		nameList.add(6, "Lily");
		nameList.add(7, "Kate");
		nameList.add(8, "Jone");
		nameList.add(9, "Ann");
		nameList.add(10, "Allen");
		nameList.add(11, "Linda");
		for (int i = 0; i < 48; i++) {
			KeyedCollection cashAcct = new KeyedCollection();
			cashAcct.setDynamic(true);
			cashAcct.setName("cashAcct");
			cashAcct.setValueAt("name", nameList.get(ran.nextInt(12)));
			cashAcct.setValueAt("surname", surnameList.get(ran.nextInt(10)));
			cashAcct.setValueAt("balance", ran.nextDouble()*100000);
			cashAcct.setValueAt("branch_id", "branch id " + i);
			cashAcct.setValueAt("branch_location", "branch_location_" + ran.nextInt(10));
			cashAcctInDB.addElement(cashAcct);
		}
	}

	public IndexedCollection getAllCashAcct() throws Exception{
		return getInstance().cashAcctInDB;
	}
	
}
