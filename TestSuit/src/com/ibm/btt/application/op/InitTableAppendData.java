package com.ibm.btt.application.op;
import com.ibm.btt.base.BTTServerOperation;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/05/17 16:28:14
 */
public class InitTableAppendData extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  System.out.println("############ InitTableAppendData ");
	  
	  for (int i=0; i<10; i++){
		  this.setValueAt("TableList."+i+".A", "A"+i);
		  this.setValueAt("TableList."+i+".B", "B"+i);
	  }
	  
	  this.fireExitEvent("OK");  
  }
}