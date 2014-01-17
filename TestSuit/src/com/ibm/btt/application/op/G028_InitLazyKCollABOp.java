package com.ibm.btt.application.op;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;

/**
 * Class Generated by BTT Tool Created since: 2013/03/20 10:40:45
 */
public class G028_InitLazyKCollABOp extends BTTServerOperation {
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 */
	private Random rand = new Random();

	public void execute() throws Exception {

		KeyedCollection k = this.getContext().getKeyedCollection();
		IndexedCollection accounts = (IndexedCollection) k
				.getElementAt("lazyKColl_AB_Accounts");
		Map<Integer, String> businessNameMap = new HashMap<Integer, String>();
		businessNameMap.put(0, "savings");
		businessNameMap.put(1, "credit");
		businessNameMap.put(2, "mortgage");
		for (int i = 0; i < 10; i++) {
			accounts.setValueAt(i + ".idx", i);
			accounts.setValueAt(i + ".acctNum", "123456789" + i);
			accounts.setValueAt(i + ".name",
					businessNameMap.get(rand.nextInt(3)));
			accounts.setValueAt(i + ".balance", rand.nextFloat() * 900000);
			accounts.setValueAt(i + ".A.F", 0);
			accounts.setValueAt(i + ".A.B.A.F", 1.1);
			accounts.setValueAt(i + ".A.B.A.B.A.F", 2.2);
			accounts.setValueAt(i + ".A.B.A.B.A.B.A.F", 3.3);
		}
		fireExitEvent("ok");
	}
}