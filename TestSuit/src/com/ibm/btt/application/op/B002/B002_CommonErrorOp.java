package com.ibm.btt.application.op.B002;
import com.ibm.btt.base.BTTServerOperation;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/11/18 11:00:11
 */
public class B002_CommonErrorOp extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  System.out.println("This is B002 Dynamic Error Handling Op");
	  System.out.println("-------------------------" + this.getContext().getKeyedCollection().getValueAt("opHandleError"));
	  fireExitEvent("exit");
  }
}
