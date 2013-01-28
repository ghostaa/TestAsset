package com.ibm.btt.sample.operation.eca;

import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;
import com.ibm.btt.base.BTTServerOperation;

public class Eca3Op extends BTTServerOperation {
	private static final BTTLog log = BTTLogFactory.getLog(Eca3Op.class
			.getName());

	@Override
	public void execute() throws Exception {
		setValueAt("dse_replyPage", "eca/eca3.jsp");
		String userDefSignature = String.valueOf(this.getValueAt("userDefSignature"));
		if ("".equals(userDefSignature) || "null".equals(userDefSignature)) {
			userDefSignature = "NO_VALUE_SUBMITTED!";
		}
		this.setValueAt("value4Display", userDefSignature);
		System.out.println("### ### Values passed from client side:"
				+ getValueAt("userDefSignature"));
		if (log.doDebug())
			log.debug(this.getKeyedCollection().toString());
		System.out.println("### ### Values to display on screen is:"
				+ getValueAt("value4Display"));
		super.execute();
	}
}
