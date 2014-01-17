package com.ibm.btt.application.op;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.impl.Currency;
import com.ibm.btt.test.sunxl.utils.DateUtil;

public class TransferHistoryDB {
	private static TransferHistoryDB transferHistoryDB = null;
	private static Random ran = new Random();
	private IndexedCollection historyInDB;

	private TransferHistoryDB() {
	}

	public static synchronized TransferHistoryDB getInstance() throws Exception {
		if (transferHistoryDB == null) {
			transferHistoryDB = new TransferHistoryDB();
			transferHistoryDB.initTransferHistoryDB();
		}
		return transferHistoryDB;
	}

	private void initTransferHistoryDB() throws Exception {
		historyInDB = new IndexedCollection();
		List<String> toAccList = new ArrayList<String>();
		toAccList.add(0, "6000220020399401390");
		toAccList.add(1, "6000220020399401445");
		toAccList.add(2, "6000220000000000044");
		List<String> commentsList = new ArrayList<String>();
		commentsList.add(0, "Lunch fee");
		commentsList.add(1, "Shopping cost");
		commentsList.add(2, "other payment");
		for (int i = 0; i < 48; i++) {
			KeyedCollection history = new KeyedCollection();
			history.setDynamic(true);
			history.setName("history");
			history.setValueAt("historyID", i + 1);
			history.setValueAt("toAccount", toAccList.get(ran.nextInt(3)));
			history.setValueAt("transfer_date", DateUtil.getDateTime());
			history.setValueAt("amount", new Currency("CNY", new BigDecimal(ran.nextInt(2000))));
			history.setValueAt("comments", commentsList.get(ran.nextInt(3)));
			historyInDB.addElement(history);
		}
	}

	public IndexedCollection getAllHistory() throws Exception{
		return getInstance().historyInDB;
	}
	
	public IndexedCollection getAppointedHistory(Integer fromRow, Integer toRow, IndexedCollection historyList) throws Exception{
		for(int i = fromRow; i < toRow; i++){
			KeyedCollection history = (KeyedCollection) historyInDB.getElementAt(i + "");
			historyList.addElement(history);
		}
		return historyList;
	}
}
