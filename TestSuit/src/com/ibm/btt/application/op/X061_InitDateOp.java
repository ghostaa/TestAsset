package com.ibm.btt.application.op;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.test.sunxl.utils.DateUtil;

public class X061_InitDateOp extends BTTServerOperation {

	public void execute() throws Exception {
		KeyedCollection k = this.getContext().getKeyedCollection();
		IndexedCollection tableList = (IndexedCollection) k.getElementAt("X061_TableList");
		for (int i = 0; i < tableList.size() ; i++) {
			tableList.setValueAt(i + ".date_bar", DateUtil.getDateTime());
			tableList.setValueAt(i + ".date_slash", DateUtil.getDateTime());
			tableList.setValueAt(i + ".calendar_bar", DateUtil.getXGCTime());
			tableList.setValueAt(i + ".calendar_slash", DateUtil.getXGCTime());
		}
		fireExitEvent("opEvt");
	}

	

}
