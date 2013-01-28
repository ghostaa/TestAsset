package com.ibm.btt.sample.operation;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.DSEInvalidRequestException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.cs.html.HtmlConstants;

@SuppressWarnings("serial")
public class Select extends BTTServerOperation {
	public Select() {
		super();
	}
	public Select(String anOperationName) throws java.io.IOException {
		super(anOperationName);
	}
	public Select(String anOperationName, String aParentContext)
			throws java.io.IOException, DSEObjectNotFoundException, DSEInvalidRequestException {
		super(anOperationName, aParentContext);
	}
	public Select(String anOperationName, Context aParentContext)
			throws java.io.IOException, DSEInvalidRequestException {
		super(anOperationName, aParentContext);
	}
	public void execute() throws Exception {
		getContext().getKeyedCollection().setDynamic(true);
		getContext().setValueAt("SelectList.0.Lable", "");
		getContext().setValueAt("SelectList.1.Lable", "Apple");
		getContext().setValueAt("SelectList.2.Lable", "Pear");
		getContext().setValueAt("SelectList.3.Lable", "Orange");
		getContext().setValueAt("SelectList.0.Value", "Black exist value");
		getContext().setValueAt("SelectList.1.Value", "Dog");
		getContext().setValueAt("SelectList.2.Value", "Cat");
		getContext().setValueAt("SelectList.3.Value", "Fish");
		fireExitEvent("event0");
	}
}