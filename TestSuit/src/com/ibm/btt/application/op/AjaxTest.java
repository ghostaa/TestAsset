package com.ibm.btt.application.op;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.KeyedCollection;

public class AjaxTest extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  KeyedCollection opData = this.getContext().getKeyedCollection();
//	  System.out.println(this.getContext().getParent().getKeyedCollection().getValueAt("AjaxTimeOut"));
	  System.out.println(System.currentTimeMillis());

	  Thread.sleep(1500);
	  for(int i=1;i<=100;i++){
	  System.out.println(System.currentTimeMillis());}

	  opData.setValueAt("name", "Liyuanjun");
	  opData.setValueAt("password","IBM");

  }
}
