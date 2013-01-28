package com.ibm.btt.test.pagirefact;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.xml.datatype.XMLGregorianCalendar;

import com.ibm.btt.automaton.ext.DSEOperationState;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.Hashtable;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.OperationRepliedEvent;

public class PaginationFetchPagedDataOp extends BTTServerOperation {
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

			setValueAt("return.paginationCtrlData.havePrevious",
					resultPerPage.getHavePreviousPage());
			setValueAt("return.paginationCtrlData.haveNext",
					resultPerPage.getHaveNextPage());
			setValueAt("return.paginationCtrlData.pageHook",
					(double) resultPerPage.getHook());
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
			fireExitEvent("ok");
		}
	}

	private CustomerInfoParams applyFilters(CustomerInfoParams params)
			throws DSEObjectNotFoundException {
		Integer id = (Integer) getValueAt("params.cid");
		if (null != id)
			params.setId(id);

		if (null != getValueAt("params.cname"))
			params.setName(getValueAt("params.cname").toString());

		if (null != getValueAt("params.cgender"))
			params.setGender(Boolean.valueOf(getValueAt("params.cgender")
					.toString()));

		if (null != getValueAt("params.cbirthdayBegin")) {
			XMLGregorianCalendar xgc = (XMLGregorianCalendar) getValueAt("params.cbirthdayBegin");
			params.setBirthDayBigin(xgc);
		}

		if (null != getValueAt("params.cbirthdayEnd")) {
			XMLGregorianCalendar xgc = (XMLGregorianCalendar) getValueAt("params.cbirthdayBegin");
			params.setBirthDayEnd(xgc);
		}
		return params;
	}
}
