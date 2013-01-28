/**
 * 
 */
package com.ibm.btt.test.pageSort;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.OperationRepliedEvent;
import com.ibm.btt.cs.html.HtmlConstants;

/**
 * @author stlv
 * 
 */
public class PageFormSelectSubmit extends BTTServerOperation {

	@Override
	public void execute() throws Exception {
		KeyedCollection tableKColl = this.getContext().getKeyedCollection();
		System.out.println(tableKColl.getElementAt("selectTableDate"));
		setValueAt(HtmlConstants.REPLYPAGE, "pageSort/paginationWithSingleOp.jsp");
	}
}