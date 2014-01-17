package com.ibm.btt.sample.operation;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.DSEInvalidRequestException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.cs.html.HtmlConstants;
//import com.ibm.btt.sample.util.AjaxChannelEnhanceUtil;

@SuppressWarnings("serial")
public class LaunchOperation extends BTTServerOperation {

	protected final String PAGENAME = "pageName";
	public void execute() throws Exception {
//		setValueAt(HtmlConstants.REPLYPAGE, getValueAt(PAGENAME));
		fireExitEvent("opEvt");
		

	}
}