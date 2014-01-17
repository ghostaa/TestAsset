package com.ibm.btt.application.op;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.test.sunxl.utils.DateUtil;

public class X061_SimpleOp extends BTTServerOperation {

	public void execute() throws Exception {
		KeyedCollection k = this.getContext().getKeyedCollection();
		IndexedCollection tableList = (IndexedCollection) k.getElementAt("TableList");
		for (int i = 0; i < 10 ; i++) {
			tableList.setValueAt(i + ".Date01", DateUtil.getDate());
			tableList.setValueAt(i + ".Calendar_bar", DateUtil.getXGC());
			tableList.setValueAt(i + ".Calendar_slash", DateUtil.getXGC());
		}
		fireExitEvent("opEvt");
	}

	

}
