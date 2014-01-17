package com.ibm.btt.application.op.B002;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.KeyedCollection;

public class B002_SampleOp extends BTTServerOperation {

	public void execute() throws Exception {
		String errorFlag = (String) getValueAt("errorFlag");
		KeyedCollection k = this.getContext().getKeyedCollection();
		k.setValueAt("B002_SampleField", "hello world, this is sample field in operation");
		
		if("error".equals(errorFlag)) {
			setValueAt("errorCode", "123");
			setValueAt("errorMsg", "Error Occurs!");
			
			fireExitEvent("errorHandling");
		} else if("help".equals(errorFlag)){
			fireExitEvent("help");
			System.out.println("trigger help");
		}else {
			setValueAt("errorCode", "");
			setValueAt("errorMsg", "");
			
			fireExitEvent("ok");
		}
		
		
	}
}
