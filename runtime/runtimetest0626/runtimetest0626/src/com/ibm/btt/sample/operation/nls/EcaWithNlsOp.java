/**
 * 
 */
package com.ibm.btt.sample.operation.nls;

import java.math.BigDecimal;
import java.util.Calendar;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.types.impl.Currency;

/**
 * @author stlv
 */
public class EcaWithNlsOp extends BTTServerOperation {

	@Override
	public void execute() throws Exception {
		super.execute();
		setValueAt("CurrencyTextBoxValueField", new Currency("USD",
				new BigDecimal("1024.678")));
		setValueAt("DateTextBoxValueField", Calendar.getInstance().getTime());
		setValueAt("NumberTextBoxValueField", new BigDecimal(1234567890L));
		setValueAt("StringTextBoxValueField", "AbCdEfGhIjKlMn");
	}
}
