package com.ibm.btt.application.op;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
 
public class TableDataAppendInput extends BTTServerOperation {
 
  public void execute() throws Exception {
	  // Validate input append data  and add input record into flow context's table list
	  System.out.println("######### Operation Context data: "+this.getKeyedCollection());
	  IndexedCollection tableList = (IndexedCollection) this.getParent().getElementAt("TableList");
	  KeyedCollection newRecord= (KeyedCollection) tableList.createElement(true);
	  newRecord.setValueAt("name", getValueAt("selectedRecord.name"));
	  newRecord.setValueAt("age", getValueAt("selectedRecord.age"));
	  newRecord.setValueAt("account", getValueAt("selectedRecord.account"));
	  tableList.addElement(newRecord);
	  System.out.println("\n############ Table List after TableDataAppendInput "+ this.getElementAt("TableList"));
	  
	  
	  
  }
}
