package com.ibm.btt.sample.operation.eca;

import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;
import com.ibm.btt.base.BTTServerOperation;

public class Eca2Op extends BTTServerOperation {
	private static final BTTLog log = BTTLogFactory.getLog(Eca2Op.class
			.getName());

	@Override
	public void execute() throws Exception {
		setValueAt("dse_replyPage", "eca/eca2.jsp");
		String userComments = String.valueOf(this.getValueAt("userComments"));
		if ("".equals(userComments) || "null".equals(userComments)) {
			userComments = "NO_VALUE_SUBMITTED!";
		}
		this.setValueAt("value4Display", userComments);
		System.out.println("### ### Values passed from client side:"
				+ getValueAt("userComments"));
		if (log.doDebug())
			log.debug(this.getKeyedCollection().toString());
		System.out.println("### ### Values to display on screen is:"
				+ getValueAt("value4Display"));
		super.execute();
	}
}
