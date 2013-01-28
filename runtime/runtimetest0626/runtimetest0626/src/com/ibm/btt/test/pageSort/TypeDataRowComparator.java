/**
 * 
 */
package com.ibm.btt.test.pageSort;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

/**
 * @author stlv
 * 
 */
public class TypeDataRowComparator implements
		Comparator<HashMap<String, Comparable<?>>> {
	public final static String INDEX = "index";
	public final static String CURRENCY = "currencyField";
	public final static String DATE = "dateField";
	public final static String NUMBER = "numberField";
	public final static String STRING = "stringField";
	public final static String PLAIN = "plainField";

	private List<SortColumn> sortColumns;

	/**
	 * Compare the two objects to determine the relative ordering.
	 * 
	 * @return an int < 0 if object1 is less than object2, 0 if they are equal,
	 *         and > 0 if object1 is greater
	 */
	@Override
	public int compare(HashMap<String, Comparable<?>> row1,
			HashMap<String, Comparable<?>> row2) {
		// sort column is null or no elements
		if (null == sortColumns || sortColumns.isEmpty())
			return 0;
		else {
			return this.compareRow(0, row1, row2);
		}
	}

	private int compareRow(int columnIndex, HashMap<String, Comparable<?>> row1,
			HashMap<String, Comparable<?>> row2) {
		int rst = 0;
		SortColumn col = sortColumns.get(columnIndex);
		Comparable o1 = row1.get(col.getName());
		Comparable o2 = row2.get(col.getName());
		rst = o1.compareTo(o2);
		if (0 == rst) {
			columnIndex++;
			if (columnIndex == sortColumns.size())
				return 0;
			else
				rst = compareRow(columnIndex, row1, row2);
		}
		
		if (!col.isAscend())
			rst = -1 * rst;
		return rst;
	}

	public List<SortColumn> getSortColumns() {
		return sortColumns;
	}

	public void setSortColumns(List<SortColumn> sortColumns) {
		this.sortColumns = sortColumns;
	}

}
