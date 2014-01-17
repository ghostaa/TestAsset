package com.ibm.btt.test.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;

public class CreditPointDB {
	private static CreditPointDB creditPointDB = null;
	private IndexedCollection creditPointInDB;
	private static Random ran = new Random();

	private CreditPointDB() {
	}

	public static synchronized CreditPointDB getInstance() throws Exception {
		if (creditPointDB == null) {
			creditPointDB = new CreditPointDB();
			creditPointDB.initCreditPointDB();
		}
		return creditPointDB;
	}

	private void initCreditPointDB() throws Exception {
		creditPointInDB = new IndexedCollection();
		List<String> acctNoList = new ArrayList<String>();
		acctNoList.add(0, "4367 4800 0679 1738");
		acctNoList.add(1, "4367 4800 2395 1414");
		acctNoList.add(2, "4367 4812 3498 7656");
		for (int i = 0; i < 9; i++) {
			KeyedCollection creditPoint = new KeyedCollection();
			creditPoint.setDynamic(true);
			creditPoint.setName("creditPoint");
			creditPoint.setValueAt("AcctNo", acctNoList.get(ran.nextInt(3)));
			creditPoint.setValueAt("AcctType", "Credit Card");
			int consumptionPoints = ran.nextInt(12000);
			int rewardPoints = ran.nextInt(800);
			int balancePoints = consumptionPoints + rewardPoints;
			creditPoint.setValueAt("BalancePoints", balancePoints + "points");
			creditPoint.setValueAt("ConsumptionPoints", consumptionPoints + "points");
			creditPoint.setValueAt("RewardPoints", rewardPoints + "points");
			creditPointInDB.addElement(creditPoint);
		}
	}

	public IndexedCollection getAllCreditPoint() throws Exception{
		return getInstance().creditPointInDB;
	}
	
}
