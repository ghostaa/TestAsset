/**
 * 
 */
package com.ibm.btt.test.pageSort;

import java.util.HashMap;
import java.util.List;

import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;

/**
 * @author JiaWeiWu
 * 
 */
public class PageRetriever extends com.ibm.btt.cs.html.PageRetrieverOperation {

	public int getPageData(int start, int count, List<SortColumn> sortColumnList)
			throws Exception {
		IndexedCollection tableData = (IndexedCollection) this.getContext()
				.getKeyedCollection().getElementAt("items");
		tableData.removeAll();

		// fetch data from back end service
		int totalSize = PageDataResource.SP01DATA.size();
		List<HashMap<String, Comparable<?>>> subList = PageDataResource.SP01DATA
				.subList(start, (start + count) > totalSize ? totalSize
						: (start + count));

		// set to context and pass to front
		for (int i = 0; (i < subList.size()); i++) {
			HashMap<String, Comparable<?>> hm = (HashMap<String, Comparable<?>>) subList
					.get(i);
			KeyedCollection kcoll = (KeyedCollection) tableData
					.createElement(false);
			kcoll.setValueAt("index", hm.get(TypeDataRowComparator.INDEX));
			kcoll.setValueAt("currencyField",
					hm.get(TypeDataRowComparator.CURRENCY));
			kcoll.setValueAt("dateField", hm.get(TypeDataRowComparator.DATE));
			kcoll.setValueAt("numberField",
					hm.get(TypeDataRowComparator.NUMBER));
			kcoll.setValueAt("stringField",
					hm.get(TypeDataRowComparator.STRING));
			kcoll.setValueAt("plainField", hm.get(TypeDataRowComparator.PLAIN));
			tableData.addElement(kcoll);
		}
		return totalSize;
	}

}
