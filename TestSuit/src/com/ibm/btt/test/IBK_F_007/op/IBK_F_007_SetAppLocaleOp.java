package com.ibm.btt.test.IBK_F_007.op;

import java.util.Locale;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.ContextFactory;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.cs.html.HtmlConstants;
import com.ibm.btt.http.HttpChannelRequest;

public class IBK_F_007_SetAppLocaleOp extends BTTServerOperation {
	
	public void execute() throws Exception {
		System.out.println("***IBK_F_007_SetAppLocaleOp_China****");
		//setValueAt("dse_locale", Locale.CHINA);
		setValueAt("dse_locale", Locale.CHINA);
		setValueAt(HtmlConstants.REPLYPAGE, "index.jsp");
		fireExitEvent("ok");
		System.out.println("***IBK_F_007_SetAppLocaleOp_China****"+getValueAt("dse_locale"));
		
	}
	
}
