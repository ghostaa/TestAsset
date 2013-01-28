package com.ibm.btt.sample.operation;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.DSEInvalidRequestException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.cs.html.HtmlConstants;
import com.ibm.btt.sample.util.AjaxChannelEnhanceUtil;

@SuppressWarnings("serial")
public class FireExitEvent extends BTTServerOperation {
	
	public void execute() throws Exception {
		getContext().setValueAt("TestValue", "ABCD");
		fireExitEvent("return");

	}
}