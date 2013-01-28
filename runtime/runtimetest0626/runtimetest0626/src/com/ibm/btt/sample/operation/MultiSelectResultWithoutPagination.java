package com.ibm.btt.sample.operation;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Random;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.impl.Currency;
import com.ibm.btt.cs.html.HtmlConstants;

public class MultiSelectResultWithoutPagination extends BTTServerOperation {
	
	public void execute() throws Exception {
		
		setValueAt(HtmlConstants.REPLYPAGE, "multiSelectResultWithoutPagination.jsp");
	}
}
