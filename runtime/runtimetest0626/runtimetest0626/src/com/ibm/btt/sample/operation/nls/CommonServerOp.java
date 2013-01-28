/**
 * 
 */
package com.ibm.btt.sample.operation.nls;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Constants;
import com.ibm.btt.base.DataField;

/**
 * @author stlv
 * 
 */
public class CommonServerOp extends BTTServerOperation {

	@Override
	public void execute() throws Exception {
		super.execute();
		DataField replyPage = new DataField();
		replyPage.setName(Constants.REPLYPAGE);
		DataField errorPage = new DataField();
		errorPage.setName(Constants.ERRORPAGE);
		errorPage.setValue("errorPage.jsp");
		addElement(replyPage);
		addElement(errorPage);
	}

}
