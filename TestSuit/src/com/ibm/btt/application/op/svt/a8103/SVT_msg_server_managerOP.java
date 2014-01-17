package com.ibm.btt.application.op.svt.a8103;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.services.webmsg.WebMsgService;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/08/30 19:31:58
 */
public class SVT_msg_server_managerOP extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  
	  	Context context = this.getContext();
	  	String msg_type = (String)context.getValueAt("msg_type");
	  	String message = (String)context.getValueAt("message");
	  	
	    WebMsgService wms = (WebMsgService)this.getService("webMsgService");
	    KeyedCollection kcMsg = (KeyedCollection)this.getElementAt("kcMsg");
	    if("1".equals(msg_type)){
	    	
	    	if(null==message || "".equals(message)){
	    		wms.broadcastMsg("{'msg':'server send broad cast message\n'}");
	    	}else{
	    		kcMsg.setValueAt("msg", "broad:"+message+"\n");
	    		wms.broadcastMsg(kcMsg);
	    	}
	    }else if("2".equals(msg_type)){
	    	if(null==message || "".equals(message)){
	    		wms.sendPrivateMsg("user", "{'msg':'server send user\n'}");
	    	}else{
	    		kcMsg.setValueAt("msg", "user:"+message+"\n");
	    		wms.sendPrivateMsg("user",kcMsg);
	    	}
	    	
	    }else if("3".equals(msg_type)){
	    	if(null==message || "".equals(message)){
	    		wms.publishMsg("/fund", "{'msg':'server send fund\n'}");
	    	}else{
	    		kcMsg.setValueAt("msg", "fund:"+message+"\n");
	    		wms.publishMsg("/fund",kcMsg);
	    	}
	    	
	    }else if("4".equals(msg_type)){
	    	wms.publishMsg("/stock", "{'msg':'server send stock\n'}");
	    }
		wms.release(); 
	  
  }
}
