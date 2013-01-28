package com.ibm.btt.test.pagirefact;

import javax.xml.datatype.XMLGregorianCalendar;

public class CustomerInfoParams {
	private int id = -1;
	private String name = null;
	private Boolean gender = null;
	private XMLGregorianCalendar birthDayBigin = null;
	private XMLGregorianCalendar birthDayEnd = null;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public XMLGregorianCalendar getBirthDayBigin() {
		return birthDayBigin;
	}

	public void setBirthDayBigin(XMLGregorianCalendar birthDayBigin) {
		birthDayBigin.setTime(0, 0, 0);
		this.birthDayBigin = birthDayBigin;
	}

	public XMLGregorianCalendar getBirthDayEnd() {
		return birthDayEnd;
	}

	public void setBirthDayEnd(XMLGregorianCalendar birthDayEnd) {
		birthDayEnd.setTime(23, 59, 59);
		this.birthDayEnd = birthDayEnd;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

}
