package com.ibm.btt.banco.operation;

import com.ibm.btt.base.OperationStep;

public class GenderOpStep extends OperationStep {

	@Override
	public int execute() throws Exception {
		// Judge the gender to set Mr title
		if("Male".equals(getContext().getValueAt("basic.gender"))) { 
			getContext().setValueAt("basic.mr", "Mr");
		}
		else{
			getContext().setValueAt("basic.mr", "Mrs");
		}
		System.out.println("genderOp is done");
		
		System.out.println(this.getContext().getParent().getKeyedCollection());
		System.out.println(this.getContext().getKeyedCollection());
		
		return RC_OK;
	}

}
