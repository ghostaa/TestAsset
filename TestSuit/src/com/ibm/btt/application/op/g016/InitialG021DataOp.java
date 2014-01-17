package com.ibm.btt.application.op.g016;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/06/18 13:54:03
 */
public class InitialG021DataOp extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  Context context= this.getContext();
	  for(int i=0;i<3;i++){
		  if(i!=2){
			  context.setValueAt("accounts."+i+".balance", 600d);
		  }else{
			  context.setValueAt("accounts."+i+".balance", 400d);
			  
		  }
			 
	  }
	  this.fireExitEvent("opEvt");
  }
}
