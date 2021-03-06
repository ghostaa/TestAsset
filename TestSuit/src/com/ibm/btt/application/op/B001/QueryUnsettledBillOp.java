package com.ibm.btt.application.op.B001;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.test.util.BillDB;
import com.ibm.btt.test.util.PaginationUtilForTest;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/09/11 14:58:48
 */
public class QueryUnsettledBillOp extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  
	  KeyedCollection k = getContext().getKeyedCollection();
	  KeyedCollection paginationData = (KeyedCollection) k.getElementAt("paginationData");
	  IndexedCollection unsettledBillList = (IndexedCollection) k.getElementAt("UnsettledBillList");
	  Context flowContext = getContext().getParent();
	  // get the selected acctno
	  String selectedAcctNo = (String) flowContext.getKeyedCollection().getValueAt("Bill.AcctNo");
	  // get all the unsettled bill from db
	  IndexedCollection allUnsettledBill = BillDB.getInstance().getAllBill();
	  // get the search condition from flow
	  KeyedCollection searchCondition = (KeyedCollection) flowContext.getKeyedCollection().getElementAt("SearchCondition");
	  String condition_curType = (String) searchCondition.getValueAt("CurType");
	  IndexedCollection temp = new IndexedCollection();
	  temp.removeAll();
	  for (int i = 0; i < allUnsettledBill.size(); i++){
			KeyedCollection bill = (KeyedCollection) allUnsettledBill.getElementAt(i + "");
			if (selectedAcctNo != null && !bill.getValueAt("AcctNo").toString().equals(selectedAcctNo)){
				continue;
			}
			if(condition_curType != null && !bill.getValueAt("CurType").toString().contains(condition_curType)){
				continue;
			}
			
			temp.addElement(bill);
		}
	  unsettledBillList = PaginationUtilForTest.paginateTheIColl(paginationData, temp, unsettledBillList);
	  fireExitEvent("opEvt");
  }
  
}
