package com.ibm.btt.application.op;

import java.math.BigDecimal;
import java.util.Random;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;

/**
 * Class Generated by BTT Tool Created since: 2013/03/12 15:36:02
 */
public class X061_InitNumericDataOp extends BTTServerOperation {
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 */
	Random rand = new Random();

	public void execute() throws Exception {
		KeyedCollection k = this.getContext().getKeyedCollection();
		IndexedCollection tableList = (IndexedCollection) k
				.getElementAt("X061_TableList");
		for (int i = 0; i < tableList.size(); i++) {
			tableList.setValueAt(i + ".num_1",
					BigDecimal.valueOf(rand.nextDouble()));
			tableList.setValueAt(i + ".num_2",
					BigDecimal.valueOf(rand.nextFloat()));
			tableList.setValueAt(i + ".float_2", rand.nextFloat());
			tableList.setValueAt(i + ".float_3", rand.nextFloat());
		}
		fireExitEvent("opEvt");
	}

}
