package com.ibm.btt.banco.operation;
import com.ibm.btt.automaton.ext.DSEOperationState;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Hashtable;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.OperationRepliedEvent;
/** 
 * Class Generated by BTT Tool
 * Created since: 2011/03/09 11:45:58
 */
public class DispatchOp extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  
	  System.out.println("DispatchOp " + "execute");
	  
	  OperationRepliedEvent event = new OperationRepliedEvent(this);
	  Hashtable ht = new Hashtable();
	  event.setParameters(ht);
	  
	  KeyedCollection keyedCollection =  (KeyedCollection) this.getElementAt("listCity." + this.getValueAt("cityValue"));
	  
	  IndexedCollection listBranch = (IndexedCollection) keyedCollection.getElementAt("listBranch");
	  
	  this.setValueAt("branchSize", listBranch.size() );
	  
	  IndexedCollection listCity = (IndexedCollection) this.getElementAt("listCity");
	  listCity.removeAll();
	  listCity.addElement(keyedCollection);
	 
	  ht.put(DSEOperationState.EXIT_EVENT_NAME, "ok");
	  
	  System.out.println(this.getContext().getParent().getKeyedCollection());
	  
	  this.fireHandleOperationRepliedEvent(event);
	  
  }
}