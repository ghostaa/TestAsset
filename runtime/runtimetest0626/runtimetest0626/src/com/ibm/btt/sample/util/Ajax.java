package com.ibm.btt.sample.util;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.DSEInvalidRequestException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.cs.html.HtmlConstants;

@SuppressWarnings("serial")
public class Ajax extends BTTServerOperation {

	public void execute() throws Exception {
		getContext().getKeyedCollection().setDynamic(true);
		getContext().setValueAt("text", "Reveal D");
		fireExitEvent("event0");
	}
}