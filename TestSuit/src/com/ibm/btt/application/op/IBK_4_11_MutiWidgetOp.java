package com.ibm.btt.application.op;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/04/01 14:01:42
 */
public class IBK_4_11_MutiWidgetOp extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  
	  
	  Context context=this.getContext();
	  for (int i = 0; i < 10; i++) {
		  context.setValueAt("TestMutiWidgetList."+i+".Field1", "field"+i);
		  context.setValueAt("TestMutiWidgetList."+i+".Field2", "account"+i);
		  context.setValueAt("TestMutiWidgetList."+i+".Field3", "data"+i);
		  context.setValueAt("TestMutiWidgetList."+i+".flag", i);
	}
	  fireExitEvent("opEvt");
  }
}
