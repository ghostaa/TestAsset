package com.ibm.btt.application.op;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;

/**
 * Class Generated by BTT Tool Created since: 2013/03/27 15:50:24
 */
public class G028_InitAccountPaginationOp extends BTTServerOperation {
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 */
	private Random rand = new Random();

	public void execute() throws Exception {
		KeyedCollection k = this.getContext().getKeyedCollection();
		IndexedCollection accounts = (IndexedCollection) k
				.getElementAt("accounts");
		Map<Integer, String> businessNameMap = new HashMap<Integer, String>();
		businessNameMap.put(0, "savings");
		businessNameMap.put(1, "credit");
		businessNameMap.put(2, "mortgage");
		for (int i = 0; i < accounts.size(); i++) {
			accounts.setValueAt(i + ".idx", "http://www.baidu.com");
			accounts.setValueAt(i + ".acctNum", "123456789" + i);
			accounts.setValueAt(i + ".name",
					businessNameMap.get(rand.nextInt(3)));
			accounts.setValueAt(i + ".balance", rand.nextFloat() * 900000);
		}
		fireExitEvent("ok");
	}
}