package com.ibm.btt.test.sunxl.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

public class DateUtil {

	public static Date getDateTime() {
		int month = (int) (Math.random() * 11 + 1);
		int day = (int) (Math.random() * 27 + 1);
		int hour = (int) (Math.random() * 23 + 1);
		int min = (int) (Math.random() * 59 + 1);
		int second = (int) (Math.random() * 59 + 1);
		String dateString = "2012-" + month + "-" + day + " " + hour + ":"
				+ min + ":" + second;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return sdf.parse(dateString);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static Date getDate() {
		int month = (int) (Math.random() * 11 + 1);
		int day = (int) (Math.random() * 27 + 1);
		String dateString = "2012-" + month + "-" + day;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return sdf.parse(dateString);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static XMLGregorianCalendar getXGC() throws Exception {
		DatatypeFactory dtf = DatatypeFactory.newInstance();
		Calendar calendar = Calendar.getInstance();
		Date dTime = getDate();
		calendar.setTime(dTime);
		XMLGregorianCalendar xCalendar = dtf.newXMLGregorianCalendar(
				calendar.get(Calendar.YEAR), 
				calendar.get(Calendar.MONTH) + 1,
				calendar.get(Calendar.DAY_OF_MONTH),
				calendar.get(Calendar.HOUR), calendar.get(Calendar.MINUTE),
				calendar.get(Calendar.SECOND),
				calendar.get(Calendar.MILLISECOND),
				calendar.get(Calendar.ZONE_OFFSET) / (1000 * 60));
		return xCalendar;
	}
	
	public static XMLGregorianCalendar getXGCTime() throws Exception {
		DatatypeFactory dtf = DatatypeFactory.newInstance();
		Calendar calendar = Calendar.getInstance();
		Date dTime = getDate();
		calendar.setTime(dTime);
		XMLGregorianCalendar xCalendar = dtf.newXMLGregorianCalendar(
				calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH) + 1,
				calendar.get(Calendar.DAY_OF_MONTH),
				calendar.get(Calendar.HOUR), calendar.get(Calendar.MINUTE),
				calendar.get(Calendar.SECOND),
				calendar.get(Calendar.MILLISECOND),
				calendar.get(Calendar.ZONE_OFFSET) / (1000 * 60));
		return xCalendar;
	}
}
