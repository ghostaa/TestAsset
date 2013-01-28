package com.ibm.btt.test.ajaxEnhance;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.sample.util.AjaxChannelEnhanceUtil;

public class AjaxEnhanceOpInvokedBeforeOp extends BTTServerOperation {

	@Override
	public void execute() throws Exception {
		Context sessionCtx = null;
		sessionCtx = getParent();
		setValueAt("dse_replyPage", "ajaxChnlEnhance/ajaxChnl1.jsp");
		AjaxChannelEnhanceUtil.updateAjaxChannelTestData();
		StringBuilder sb = new StringBuilder();
		// update session context's ajax test data
		sb.append("Current session: ");
		sb.append(sessionCtx.getValueAt("ajaxChnlEnhanceData.seid"));
		sb.append(", session expire time: ");
		sb.append(sessionCtx.getValueAt("ajaxChnlEnhanceData.setime"));
		setValueAt("CommonInvokedOpField1", sb.toString());
		super.execute();
	}

}
