package com.ibm.btt.application.op;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.cs.html.HtmlConstants;

/**
 * Class Generated by BTT Tool Created since: 2013/02/25 16:12:54
 */
public class MyPageOp extends BTTServerOperation {
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 */
	public void execute() throws Exception {
		setValueAt(HtmlConstants.REPLYPAGE, "MyPages.jsp");
	}
}
