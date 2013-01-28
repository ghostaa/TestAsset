package com.ibm.btt.test.pagirefact;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.ibm.btt.automaton.ext.DSEOperationState;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.Hashtable;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.OperationRepliedEvent;

public class PaginationWithoutProcBizOp extends BTTServerOperation {
	public void execute() throws Exception {
		OperationRepliedEvent event = new OperationRepliedEvent(this);
		Hashtable ht = new Hashtable();
		try {
			double pageHook = (Double) getValueAt("pageHook");
			byte rowsPerPage = (Byte) getValueAt("rowsPerPage");
			CustomerInfoParams params = new CustomerInfoParams();
			params = applyFilters(params);

			ResultPerPage resultPerPage = DataSource.getCustomerInfoByHook(
					pageHook, rowsPerPage, params);
			IndexedCollection icoll = (IndexedCollection) getElementAt("return.returnList");
			icoll.removeAll();
			List<HashMap<String, Object>> resultList = resultPerPage
					.getResultList();
			Set<String> set = new HashSet<String>();
			set.add("id");
			set.add("name");
			set.add("gender");
			set.add("birthDay");
			set.add("salary");

			if (null != resultList && resultList.size() > 0)
				for (HashMap<String, Object> hm : resultList) {
					KeyedCollection kcoll = (KeyedCollection) icoll
							.createElement(false);
					for (Iterator<String> iter = hm.keySet().iterator(); iter
							.hasNext();) {
						String key = iter.next();
						if (set.contains(key))
							kcoll.setValueAt(key, hm.get(key));
					}
					icoll.addElement(kcoll);
				}

			setValueAt("return.havePrevious",
					resultPerPage.getHavePreviousPage());
			setValueAt("return.haveNext", resultPerPage.getHaveNextPage());
			setValueAt("return.pageHook", (double) resultPerPage.getHook());
			ht.put(DSEOperationState.EXIT_EVENT_NAME, "ok");
		} catch (Exception e) {
			e.printStackTrace();
			String errInfo = "Exception encountered while fetching pagination table data, detailed messages are: "
					+ e.getMessage();
			setValueAt("return.errorInfo", errInfo);
			event.setName("error");
			ht.put(DSEOperationState.EXIT_EVENT_NAME, "error");
		} finally {
			event.setParameters(ht);
			fireHandleOperationRepliedEvent(event);
			// do clean work if needed
		}
	}

	private CustomerInfoParams applyFilters(CustomerInfoParams params)
			throws DSEObjectNotFoundException {
		if (null != getValueAt("params.name"))
			params.setName(getValueAt("params.name").toString());
		return params;
	}
}
