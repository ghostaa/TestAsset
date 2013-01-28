package com.ibm.btt.sample.util;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import com.ibm.btt.base.Constants;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.Vector;
import com.ibm.btt.sm.CSSessionHandler;
import com.ibm.btt.sm.HttpSessionInfoHolder;
import com.ibm.btt.sm.SessionEntry;

public class AjaxChannelEnhanceUtil {
	public synchronized static void updateAjaxChannelTestData() throws Exception {
		try {
			HttpSession session = HttpSessionInfoHolder.getHttpSession();
			SessionEntry se = CSSessionHandler.getSession(session);
			Context sessionCtxt = (Context) se.getCurrentContext();
			KeyedCollection ajaxChnlEnhanceData = (KeyedCollection) sessionCtxt.getElementAt("ajaxChnlEnhanceData");
			ajaxChnlEnhanceData.setValueAt("seid", se.getSessionId());
			ajaxChnlEnhanceData.setValueAt("setime", se.getTimeStamp());

			IndexedCollection subCtxtNameList = (IndexedCollection) ajaxChnlEnhanceData.getElementAt("subCtxtNameList");
			subCtxtNameList.removeAll();
			Vector children = sessionCtxt.getChildren();
			for (int i = 0; i < children.size(); i++) {
				Context subCtxt = (Context) children.get(i);
				KeyedCollection kcoll = (KeyedCollection) subCtxtNameList.createElement(true);
				kcoll.setValueAt("index", (i + 1));
				kcoll.setValueAt("ctxtName", subCtxt.getName());
				subCtxtNameList.addElement(kcoll);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public synchronized static Locale getCurrentLocale() throws Exception {
		HttpSession session = HttpSessionInfoHolder.getHttpSession();
		SessionEntry se = CSSessionHandler.getSession(session);
		Context sessionCtxt = (Context) se.getCurrentContext();
		return (Locale) sessionCtxt.getValueAt(Constants.LOCALE);
	}
}
