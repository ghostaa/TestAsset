package com.ibm.btt.application.op;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;

/**
 * Class Generated by BTT Tool Created since: 2013/03/01 14:35:29
 */
public class G017_SelectListDataOp extends BTTServerOperation {
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 */

	public void execute() throws Exception {
		// TODO Auto-generated method stub
		KeyedCollection opData = this.getContext().getKeyedCollection();
		IndexedCollection accountInfoList = (IndexedCollection) opData
				.getElementAt("AccountInfoList");
		for (int i = 0; i < accountInfoList.size(); i++) {
			accountInfoList.setValueAt(i + ".AccountNo", i);
			accountInfoList.setValueAt(i + ".AccountName", "Account" + i);
		}
		fireExitEvent("opEvt");
	}
}
