package com.ibm.btt.application.op.Q006;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.services.webmsg.WebMsgService;

/**
 * 
 * Class Generated by BTT Tool Created since: 2013/08/21 16:03:01
 */
public class WebMsgOperation extends BTTServerOperation {

	public void execute() throws Exception{
		WebMsgService wms = (WebMsgService)this.getService("webMsgService");
		
		KeyedCollection kcMsg = (KeyedCollection)this.getElementAt("kcMsg");
		
		kcMsg.setValueAt("type", "broadCast");
		wms.broadcastMsg(kcMsg);

		kcMsg.setValueAt("type", "sendPrivateMsg");
		wms.sendPrivateMsg((String)this.getValueAt("userID"), kcMsg);
		
		kcMsg.setValueAt("type", "publishMsg");
		wms.publishMsg("/btt/topic/test2", kcMsg);
		
		wms.release();
	}
}