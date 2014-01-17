package com.ibm.btt.application.op.X072;
import java.util.Date;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.KeyedCollection;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/07/24 10:37:08
 */
public class X072_UC1Op extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  KeyedCollection k = getContext().getKeyedCollection();
	  String Op_fstr = (String)k.getValueAt("Op_fstr");
	  Date Op_date = (Date)k.getValueAt("Op_date");
	  k.setValueAt("Op_fstr", "hello world from Op!");
	  System.out.println("----------------------------------------------------------------");
	  System.out.println("Op_fstr" + Op_fstr);
	  System.out.println(Op_date);
	  fireExitEvent("opEvt");
  }
}