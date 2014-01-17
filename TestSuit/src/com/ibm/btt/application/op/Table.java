package com.ibm.btt.application.op;


import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Random;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.impl.Currency;

public class Table extends BTTServerOperation {
	public void execute() throws Exception {
	String img[] = {"img/Bomb1.jpg","img/Bomb12.jpg","img/Bomb2.jpg","img/Bomb17.jpg"};
	Random random = new Random(); 
	KeyedCollection tableKColl = this.getContext().getKeyedCollection();
	  
	IndexedCollection tableData = (IndexedCollection)tableKColl.getElementAt("aList");
//	IndexedCollection Select = (IndexedCollection)tableKColl.getElementAt("aSelect");
	for (int i = 0; i < tableData.size(); i++) {
		tableData.setValueAt(i+".index", i);
		tableData.setValueAt(i+".cardNo", System.currentTimeMillis()+i);
		tableData.setValueAt(i+".amount", random.nextInt(20000));
		tableData.setValueAt(i+".ImageField", img[random.nextInt(4)]);	
		tableData.setValueAt(i+".Size", random.nextInt(20000));
		tableData.setValueAt(i+".Name", random.nextInt(20000));
		tableData.setValueAt(i+".Age", random.nextInt(20000));
		tableData.setValueAt(i+".Date", random.nextInt(20000));
	  }
//	for (int i = 0; i < 4; i++) {
//		switch (i) {
//		case 0:
//			Select.setValueAt(i+".labelField","Pen");
//			Select.setValueAt(i+".valueField","Book");
//			break;
//		case 1:
//			Select.setValueAt(i+".labelField","Car");
//			Select.setValueAt(i+".valueField","Plane");
//			break;
//		case 2:
//			Select.setValueAt(i+".labelField","Dog");
//			Select.setValueAt(i+".valueField","Cat");
//			break;
//		case 3:
//			Select.setValueAt(i+".labelField","Apple");
//			Select.setValueAt(i+".valueField","Pear");
//			break;
//
//		default:
//			break;
//		}
//	}


	fireExitEvent("ok");
  }
}
