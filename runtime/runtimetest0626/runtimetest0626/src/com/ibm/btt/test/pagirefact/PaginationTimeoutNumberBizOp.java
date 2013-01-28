package com.ibm.btt.test.pagirefact;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.ibm.btt.automaton.ext.DSEOperationState;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Hashtable;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.OperationRepliedEvent;

public class PaginationTimeoutNumberBizOp extends BTTServerOperation {
	public void execute() throws Exception {
		long timeToSleep = (Long) getValueAt("bizOpSleepTime");
		Thread.sleep(timeToSleep);
		OperationRepliedEvent event = new OperationRepliedEvent(this);
		Hashtable ht = new Hashtable();
		try {
			long pageNumber = (Long) getValueAt("pageNumber");
			byte rowsPerPage = (Byte) getValueAt("rowsPerPage");
			CustomerInfoParams params = new CustomerInfoParams();
			ResultPerPage resultPerPage = DataSource
					.getCustomerInfoByPageNumber(pageNumber, rowsPerPage,
							params);
			IndexedCollection icoll = (IndexedCollection) getElementAt("return.tableResultList");
			icoll.removeAll();
			List<HashMap<String, Object>> resultList = resultPerPage
					.getResultList();
			if (null != resultList && resultList.size() > 0)
				for (HashMap<String, Object> hm : resultList) {
					KeyedCollection kcoll = (KeyedCollection) icoll
							.createElement(false);
					for (Iterator<String> iter = hm.keySet().iterator(); iter
							.hasNext();) {
						String key = iter.next();
						kcoll.setValueAt("c" + key, hm.get(key));
					}
					icoll.addElement(kcoll);
				}

			setValueAt("return.paginationCtrlData.pageNumber",
					(long) resultPerPage.getPageNumber());
			setValueAt("return.paginationCtrlData.totalRowNumber",
					resultPerPage.getTotalRowNumber());

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
}
