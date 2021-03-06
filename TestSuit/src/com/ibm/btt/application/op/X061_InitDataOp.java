package com.ibm.btt.application.op;

import java.math.BigDecimal;
import java.util.Random;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.impl.Currency;
import com.ibm.btt.test.sunxl.utils.DateUtil;

/**
 * Class Generated by BTT Tool Created since: 2013/03/13 11:23:52
 */
public class X061_InitDataOp extends BTTServerOperation {
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 */
	Random rand = new Random();

	public void execute() throws Exception {
		KeyedCollection k = this.getContext().getKeyedCollection();
		IndexedCollection tableList = (IndexedCollection) k
				.getElementAt("X061_TableList");
		for (int i = 0; i < tableList.size(); i++) {
			tableList.setValueAt(i + ".date_bar", DateUtil.getDate());
			tableList.setValueAt(i + ".date_slash", DateUtil.getDate());
			tableList.setValueAt(i + ".calendar_bar", DateUtil.getXGC());
			tableList.setValueAt(i + ".calendar_slash", DateUtil.getXGC());
			tableList.setValueAt(i + ".num_1",
					BigDecimal.valueOf(rand.nextDouble()));
			tableList.setValueAt(i + ".num_2",
					BigDecimal.valueOf(rand.nextFloat()));

			tableList.setValueAt(i + ".float_2", rand.nextFloat());
			tableList.setValueAt(i + ".float_3", rand.nextFloat());
			tableList.setValueAt(i + ".currency_cny", new Currency("CNY", new BigDecimal(rand.nextInt(99999999))));
			tableList.setValueAt(i + ".currency_usd", new Currency("USD", new BigDecimal(rand.nextInt(99999999))));
		}
		fireExitEvent("opEvt");
	}
}
