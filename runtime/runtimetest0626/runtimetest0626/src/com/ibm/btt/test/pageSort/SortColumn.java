package com.ibm.btt.test.pageSort;
public class SortColumn {
	String name;
	boolean ascend;

	public boolean isAscend() {
		return ascend;
	}

	public void setAscend(boolean value) {
		ascend = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String columnName) {
		name = columnName;
	}

	public String toString() {
		return "{name:" + name + "," + " ascend:" + ascend + "}";
	}

}