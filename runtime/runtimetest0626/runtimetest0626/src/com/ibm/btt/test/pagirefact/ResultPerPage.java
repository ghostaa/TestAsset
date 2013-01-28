/**
 * 
 */
package com.ibm.btt.test.pagirefact;

import java.util.HashMap;
import java.util.List;

/**
 * @author stlv
 */
public class ResultPerPage {
	private Boolean haveNextPage = Boolean.FALSE;
	private Boolean havePreviousPage = Boolean.FALSE;
	private double hook = 0.0d;
	private List<HashMap<String, Object>> resultList = null;

	private int pageNumber = 0;
	private int totalRowNumber = 0;

	public Boolean getHaveNextPage() {
		return haveNextPage;
	}

	public void setHaveNextPage(Boolean haveNextPage) {
		this.haveNextPage = haveNextPage;
	}

	public Boolean getHavePreviousPage() {
		return havePreviousPage;
	}

	public void setHavePreviousPage(Boolean havePreviousPage) {
		this.havePreviousPage = havePreviousPage;
	}

	public double getHook() {
		return hook;
	}

	public void setHook(double hook) {
		this.hook = hook;
	}

	public List<HashMap<String, Object>> getResultList() {
		return resultList;
	}

	public void setResultList(List<HashMap<String, Object>> resultList) {
		this.resultList = resultList;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getTotalRowNumber() {
		return totalRowNumber;
	}

	public void setTotalRowNumber(int totalRowNumber) {
		this.totalRowNumber = totalRowNumber;
	}
}
