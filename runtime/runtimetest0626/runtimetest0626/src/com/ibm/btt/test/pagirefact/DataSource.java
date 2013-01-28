/**
 * 
 */
package com.ibm.btt.test.pagirefact;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.Duration;
import javax.xml.datatype.XMLGregorianCalendar;

import com.ibm.btt.base.types.impl.Currency;

/**
 * @author Lvst
 */
public final class DataSource {
	private final static List<HashMap<String, Object>> CUSTOMERINFOLIST = initCustomerInfoList();

	private static List<HashMap<String, Object>> initCustomerInfoList() {
		LinkedList<HashMap<String, Object>> infoList = new LinkedList<HashMap<String, Object>>();
		Random rand = new Random();
		Calendar utilCal = Calendar.getInstance();
		Date today = utilCal.getTime();
		utilCal.add(Calendar.DATE, -1);
		Date yesterDay = utilCal.getTime();
		for (int i = 0; i < 512; i++) {
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("id", i + 1);
			String name = (rand.nextInt(10) % 3 == 0) ? "LST"
					: ((i % 2 == 0) ? "LVST" : "IVAN");
			hm.put("name", name + rand.nextInt(100));
			hm.put("gender", rand.nextBoolean());
			XMLGregorianCalendar xgc = null;
			GregorianCalendar cal = new GregorianCalendar();
			if (i % 2 == 0)
				cal.setTime(today);
			else
				cal.setTime(yesterDay);
			try {
				xgc = DatatypeFactory.newInstance()
						.newXMLGregorianCalendar(cal);
			} catch (DatatypeConfigurationException e) {
				e.printStackTrace();
				throw new RuntimeException("Unexpected exception ", e);
			}
			hm.put("birthDay", xgc);
			Currency currency = new Currency("EUR", new BigDecimal(
					rand.nextDouble() * 10240).setScale(2,
					BigDecimal.ROUND_HALF_UP));
			hm.put("salary", currency);
			hm.put("accountCount", (byte) rand.nextInt(Byte.MAX_VALUE));
			hm.put("age", (short) rand.nextInt(Short.MAX_VALUE));
			hm.put("lastAccessTime", System.currentTimeMillis());
			Duration duration;
			try {
				duration = DatatypeFactory.newInstance().newDuration(
						rand.nextLong());
			} catch (DatatypeConfigurationException e) {
				e.printStackTrace();
				throw new RuntimeException("Unexpected exception ", e);
			}
			hm.put("totalStayTime", duration);
			byte[] buf = new byte[512];
			rand.nextBytes(buf);
			hm.put("photoData", buf);
			hm.put("floatField", rand.nextFloat() * 100);
			hm.put("doubleField", rand.nextDouble() * 100);
			hm.put("bigIntegerField",
					new BigInteger(String.valueOf(rand.nextInt())));
			hm.put("bigDecimalField", new BigDecimal(rand.nextDouble() * 10240));
			hm.put("plainField", "ABC^&%^&" + i);
			infoList.add(hm);
		}
		return infoList;
	}

	public static ResultPerPage getCustomerInfoByHook(double hook,
			int rowsPerPage, CustomerInfoParams params) {

		ResultPerPage pageResult = new ResultPerPage();
		boolean minusFlag = hook < 0;
		hook = Math.abs(hook);
		if (minusFlag) {
			hook = hook - 1;
		} else {
			hook = hook + 1;
		}
		pageResult = getCustomerInfoByIntPageNumber((int) hook, rowsPerPage,
				params);
		return pageResult;
	}

	public static ResultPerPage getCustomerInfoByPageNumber(long pageNumber,
			int rowsPerPage, CustomerInfoParams params) {
		return getCustomerInfoByIntPageNumber((int) pageNumber, rowsPerPage,
				params);
	}

	private static ResultPerPage getCustomerInfoByIntPageNumber(int pageNumber,
			int rowsPerPage, CustomerInfoParams params) {
		ResultPerPage pageResult = new ResultPerPage();
		// find all records met the query conditions
		LinkedList<HashMap<String, Object>> infoListResult = (LinkedList<HashMap<String, Object>>) getCustomerInfoByConditions(params);
		List<HashMap<String, Object>> infoList = null;
		if (infoListResult.size() != 0) {
			infoList = infoListResult
					.subList(
							(pageNumber - 1) * rowsPerPage,
							pageNumber * rowsPerPage > infoListResult.size() ? (infoListResult
									.size() - 1) : pageNumber * rowsPerPage);
		}
		pageResult.setResultList(infoList);
		pageResult.setPageNumber(pageNumber);
		pageResult.setTotalRowNumber(infoListResult.size());
		pageResult
				.setHaveNextPage(Boolean.valueOf(infoListResult.size() > pageNumber
						* rowsPerPage));
		pageResult.setHavePreviousPage(Boolean.valueOf(pageNumber > 1));
		pageResult.setHook(pageNumber);
		return pageResult;
	}

	private static List<HashMap<String, Object>> getCustomerInfoByConditions(
			CustomerInfoParams params) {
		LinkedList<HashMap<String, Object>> infoListResult = new LinkedList<HashMap<String, Object>>();
		for (HashMap<String, Object> hm : CUSTOMERINFOLIST) {
			if (applyFilters(hm, params))
				infoListResult.add(hm);
		}
		return infoListResult;
	}

	private static boolean applyFilters(HashMap<String, Object> hm,
			CustomerInfoParams params) {
		boolean f = true;
		// filter id
		if (params.getId() != -1)
			f = hm.get("id").equals(params.getId());
		if (!f)
			return f;
		// filter name
		if (null != params.getName())
			f = f && ((String) hm.get("name")).startsWith(params.getName());
		if (!f)
			return f;

		// filter gender
		if (null != params.getGender())
			f = f
					&& (Boolean.valueOf(hm.get("gender").equals(
							params.getGender())));
		if (!f)
			return f;
		// filter birthday
		if (null != params.getBirthDayBigin()) {
			XMLGregorianCalendar xgc = (XMLGregorianCalendar) hm
					.get("birthDay");
			f = f && xgc.compare(params.getBirthDayBigin()) >= 0;
		}
		if (!f)
			return f;
		if (null != params.getBirthDayEnd()) {
			XMLGregorianCalendar xgc = (XMLGregorianCalendar) hm
					.get("birthDay");
			f = f && xgc.compare(params.getBirthDayEnd()) <= 0;
		}
		if (!f)
			return f;
		return f;
	}
	
	public static void main(String[] args) {
		try {
			ResultPerPage rst = getCustomerInfoByPageNumber(1L,23,new CustomerInfoParams());
			System.out.println(rst.getResultList());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
