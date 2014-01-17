package com.ibm.btt.application.op;
import java.util.Date;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/04/09 15:47:16
 */
public class G003_initial_Op extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  
	  	Context context = this.getContext();
	  	for (int i = 0; i < 10; i++) {
			
	  		context.setValueAt("G003_test_List."+i+".task name", "task "+i);
	  		context.setValueAt("G003_test_List."+i+".due date", new Date());
	  		context.setValueAt("G003_test_List."+i+".completed",true);
//	  		context.setValueAt("G003_test_List."+i+".working",true);
	  		if (i==2||i==4) {
				
	  			context.setValueAt("G003_test_List."+i+".working",true);
			}else {
				context.setValueAt("G003_test_List."+i+".working",false);
				
			}
		}
	  	fireExitEvent("ok");
  }
}