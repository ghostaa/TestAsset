package com.ibm.btt.application.op;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/05/17 16:41:01
 */
public class TableDataAppendOp extends BTTServerOperation {
	
  static int count=0;
  public void execute() throws Exception {
	  System.out.println("########## TableDataAppendOp start ");
	  
	  IndexedCollection operationTableList= (IndexedCollection) this.getContext().tryGetElementAt("TableList");
	  // set the appended data for table list
	  for (int i=0; i< operationTableList.size(); i++){
		  this.setValueAt("TableList."+i+".A", "A_Append_"+count);
		  this.setValueAt("TableList."+i+".B", "B_Append_"+count);
		  count++;
	  }
  
	  //Merge the appended data to flow context's table list 
	  IndexedCollection flowCtxTableList= (IndexedCollection) this.getContext().getParent().tryGetElementAt("TableList");
	  for (int index=0; index< operationTableList.size(); index++){
		  KeyedCollection appendRecord= (KeyedCollection) operationTableList.getElementAt(index);
		  flowCtxTableList.addElement(appendRecord);
	  }
	 
  }
}
