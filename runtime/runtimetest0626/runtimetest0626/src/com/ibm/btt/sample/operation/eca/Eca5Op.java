package com.ibm.btt.sample.operation.eca;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Constants;
import com.ibm.btt.base.types.impl.Currency;

public class Eca5Op extends BTTServerOperation {
	private final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

	public void execute() throws Exception {
		super.execute();
		System.out.println("\n\n" + this.getKeyedCollection() + "\n\n");
		String submitFlag = (String) getValueAt("submitFlag");
		if ("0".equals(submitFlag)) {
			setValueAt(Constants.REPLYPAGE, "eca/eca5.jsp");
		} else if ("1".equals(submitFlag)) {
			setAjaxReqValues();
		}else{
			//keep values as they are
		}
	}


	public void setAjaxReqValues() throws Exception {
		// set values for currency typed data fields
		setValueAt("CurrencyKColl.currency1", new Currency("EUR", new BigDecimal(1024.51)));
		setValueAt("CurrencyKColl.currency2", new Currency("USD",
				new BigDecimal(100)));
		setValueAt("CurrencyKColl.currency3", new Currency("CNY",
				new BigDecimal(1048576.00)));

		// set values for date typed data fields
		setValueAt("DateKColl.date1", sdf.parseObject("2012-12-12"));
		setValueAt("DateKColl.date2", sdf.parseObject("2010-11-12"));
		setValueAt("DateKColl.date3", sdf.parseObject("2212-10-15"));

		// set values for number typed data fields
		setValueAt("NumberKColl.number1", new BigDecimal("1234.5678"));
		setValueAt("NumberKColl.number2", new BigDecimal(1048576));
		setValueAt("NumberKColl.number3", new BigDecimal(121));
		setValueAt("NumberKColl.number4", new BigDecimal(655));
		setValueAt("NumberKColl.number5", new BigDecimal(10000));
		//TODO dojo allow min value in number textbox is -9*10^15 > Long.MIN_VALUE
		setValueAt("NumberKColl.number6", new BigDecimal(11023244));
		setValueAt("NumberKColl.number7", Double.MIN_NORMAL);
		//TODO dojo allow max value in number textbox is 9*10^15 < Float.MAX_VALUE
		setValueAt("NumberKColl.number8", 512.23f);

		// set values for string typed data fields
		setValueAt("StringKColl.string1", "ABDFEKLJUM");
		setValueAt("StringKColl.string2", "ab09*7$,.?<");
		setValueAt("StringKColl.string3", "OPPEODJSAAA_+");
	}
}
