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

/**
 * @author stlv
 * 
 */
public class MyTestPaginationSortingCustomizedOp extends BTTServerOperation {

	@Override
	public void execute() throws Exception {
		try {
			int start = Integer.parseInt((String) this.getContext().getValueAt("start"));
			int count = Integer.parseInt((String) this.getContext().getValueAt("count"));
			String sort = (String) this.getContext().getValueAt("sort");
			System.out.println("Sort Columns: " + sort);

			List<SortColumn> sortColumnList = new ArrayList<SortColumn>();

			if (sort != null) {
				String[] sortColumns = sort.split(",");

				for (int i = 0; i < sortColumns.length; i++) {
					String value = sortColumns[i];
					SortColumn sortColumn = new SortColumn();

					if (value.startsWith("-")) {
						sortColumn.setAscend(false);
						sortColumn.setName(value.substring(1));

					} else {
						sortColumn.setAscend(true);
						sortColumn.setName(value);
					}
					sortColumnList.add(sortColumn);

				}
			}

			int totalCount = getPageData(start, count, sortColumnList);
			this.getContext().setValueAt("numRows", totalCount);
			signalReplyEvent("dse_exitEventName", "back");
			fireExitEvent("back");
		} catch (Exception e) {
			signalReplyEvent("dse_exitEventName", "error");
			throw e;
		}
	}

	public int getPageData(int start, int count, List<SortColumn> sortColumnList) throws Exception {
		IndexedCollection tableData = (IndexedCollection) this.getContext().getKeyedCollection().getElementAt("items");
		tableData.removeAll();

		// fetch data from back end service
		int totalSize = PageDataResource.SP02DATA.size();
		List<HashMap<String, Comparable<?>>> subList = PageDataResource.SP02DATA.subList(start,
				(start + count) > totalSize ? totalSize : (start + count));

		// sort by columns if needed
		if (null != sortColumnList && sortColumnList.size() > 0) {
			TypeDataRowComparator tdrc = new TypeDataRowComparator();
			tdrc.setSortColumns(sortColumnList);
			Collections.sort(subList, tdrc);
		}

		// set to context and pass to front
		for (int i = 0; (i < subList.size()); i++) {
			HashMap<String, Comparable<?>> hm = (HashMap<String, Comparable<?>>) subList.get(i);
			KeyedCollection kcoll = (KeyedCollection) tableData.createElement(false);
			kcoll.setValueAt("index", hm.get(TypeDataRowComparator.INDEX));
			kcoll.setValueAt("currencyField", hm.get(TypeDataRowComparator.CURRENCY));
			kcoll.setValueAt("dateField", hm.get(TypeDataRowComparator.DATE));
			kcoll.setValueAt("numberField", hm.get(TypeDataRowComparator.NUMBER));
			kcoll.setValueAt("stringField", hm.get(TypeDataRowComparator.STRING));
			kcoll.setValueAt("plainField", hm.get(TypeDataRowComparator.PLAIN));
			tableData.addElement(kcoll);
		}
		return totalSize;
	}

	private void signalReplyEvent(String name, String value) {
		OperationRepliedEvent ore = new OperationRepliedEvent(this);
		com.ibm.btt.base.Hashtable ht = new com.ibm.btt.base.Hashtable();
		ht.put(name, value);
		ore.setParameters(ht);
		fireHandleOperationRepliedEvent(ore);
	}
}