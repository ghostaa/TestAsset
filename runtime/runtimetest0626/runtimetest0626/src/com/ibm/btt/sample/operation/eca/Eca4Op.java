package com.ibm.btt.sample.operation.eca;

import java.math.BigDecimal;
import java.util.Date;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.DSEInvalidArgumentException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.types.DSETypeException;
import com.ibm.btt.base.types.impl.Currency;
import com.ibm.xtq.bcel.generic.NEW;

public class Eca4Op extends BTTServerOperation {
	public void execute() throws Exception {
		this.setValueAt("dse_replyPage", "eca/eca4.jsp");
		super.execute();

		// backend & action
		int rci = -1;
		if (null != getValueAt("BAKColl.RandomConditionId")
				&& !"".equals(getValueAt("BAKColl.RandomConditionId"))) {
			rci = Integer.valueOf((String) this
					.getValueAt("BAKColl.RandomConditionId"));
		}
		this.setBADataValues();
		switch (rci) {
		case -1: {
			this.setValueAt("BAKColl.RandomConditionName", "FOCUS");
			this.setValueAt("BAKColl.RandomConditionId", "0");
			break;
		}
		case 0: {
			this.setValueAt("BAKColl.RandomConditionName", "DISABLED");
			this.setValueAt("BAKColl.RandomConditionId", "1");
			break;
		}
		case 1: {
			this.setValueAt("BAKColl.RandomConditionName", "READONLY");
			this.setValueAt("BAKColl.RandomConditionId", "2");
			break;
		}
		case 2: {
			this.setValueAt("BAKColl.RandomConditionName", "DISPLAYMESSAGE");
			this.setValueAt("BAKColl.RandomConditionId", "3");
			break;
		}
		case 3: {
			this.setValueAt("BAKColl.RandomConditionName", "VISIBILITY:HIDDEN");
			this.setValueAt("BAKColl.RandomConditionId", "4");
			break;
		}
		case 4: {
			this.setValueAt("BAKColl.RandomConditionName", "VISIBILITY:GONE");
			this.setValueAt("BAKColl.RandomConditionId", "5");
			break;
		}
		case 5: {
			this.setValueAt("BAKColl.RandomConditionName", "VISIBILITY:VISIBLE");
			this.setValueAt("BAKColl.RandomConditionId", "6");
			break;
		}
		case 6: {
			this.setValueAt("BAKColl.RandomConditionName", "FOCUS");
			this.setValueAt("BAKColl.RandomConditionId", "0");
			break;
		}
		default: {
			this.setValueAt("BAKColl.RandomConditionName", "FOCUS");
			this.setValueAt("BAKColl.RandomConditionId", "0");
		}
		}
		System.out.println("\n" + this.getKeyedCollection());
	}

	private void setBADataValues() throws DSEObjectNotFoundException,
			DSEInvalidArgumentException, DSETypeException {
		// Following will cause error
		this.setValueAt("BAKColl.BADate", new Date());
		this.setValueAt("BAKColl.BACurrency", new Currency("EUR",
				new BigDecimal("1024.51")));
		this.setValueAt("BAKColl.BANumber", getValueAt("BAKColl.BANumber"));

		this.setValueAt("BAKColl.BAString", "STLV@CN.IBM.COM");
	}
}
