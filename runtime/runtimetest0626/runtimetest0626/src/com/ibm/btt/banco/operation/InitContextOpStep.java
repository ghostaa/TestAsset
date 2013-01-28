package com.ibm.btt.banco.operation;

import com.ibm.btt.base.OperationStep;

public class InitContextOpStep extends OperationStep {

	@Override
	public int execute() throws Exception {
		// init the combo's value
		System.out.println("Enter initOp");
		getContext().setValueAt("basic.raceoption.0.label", "Asian");
		getContext().setValueAt("basic.raceoption.1.label", "Spanish");
		getContext().setValueAt("basic.raceoption.2.label", "Other");
		
		getContext().setValueAt("combodata.0.label", "Please select an account");
		getContext().setValueAt("combodata.1.label", "600013245876439");
		getContext().setValueAt("combodata.2.label", "600008964445555");
		
		System.out.println("initOp is done");
		return RC_OK;
	}

}
