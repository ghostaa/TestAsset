package com.ibm.btt.application.op;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.cs.html.HtmlConstants;

/**
 * Class Generated by BTT Tool Created since: 2013/02/27 13:59:16
 */
public class TestImageActionLaunchOperationOp extends BTTServerOperation {
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 */
	protected final String PAGENAME = "pageName";
	public void execute() throws Exception {
		setValueAt(HtmlConstants.REPLYPAGE, getValueAt(PAGENAME));

	}
}
