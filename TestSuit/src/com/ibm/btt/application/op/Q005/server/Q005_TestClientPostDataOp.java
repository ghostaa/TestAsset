package com.ibm.btt.application.op.Q005.server;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/08/22 09:50:19
 */
public class Q005_TestClientPostDataOp extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  
	  
	  Context c = this.getContext();
	  KeyedCollection krecord = c.getKeyedCollection();
	  KeyedCollection kc = (KeyedCollection) krecord.getElementAt("testRecord");
	  IndexedCollection ic = (IndexedCollection) krecord.getElementAt("testList");
	  System.out.println("kc------------------" + kc);
	  System.out.println("ic" + ic);
	  
  }
}
