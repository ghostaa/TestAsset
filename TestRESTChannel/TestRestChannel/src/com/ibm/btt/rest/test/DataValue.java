package com.ibm.btt.rest.test;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

import com.ibm.btt.base.types.impl.Currency;

public class DataValue {
	Locale locale=Locale.CHINA;
	java.util.Currency curr = java.util.Currency.getInstance(locale);
	private String stringValue = "abc";
	private Number numberValue = 88.8;
	private Date dateValue = new Date(0);
	private boolean booleanValue = false;
	private byte byteValue = 1;
//	private Duration durationValue;
//	private XMLGregorianCalendar xmlValue;
	//btt don't support byteArray
//	private byte[] byteArrayValue = {1, 2, 3};
	private short shortValue = 2;
	private int intValue= 3;
	private long longValue = 5;
	private float floatValue = 2.22f;
	private double doubleValue = 3.33d;
	private BigInteger bigIngeterValu = new BigInteger("123456789");
	private BigDecimal bigDecimal = new BigDecimal(bigIngeterValu);	
	private Currency currencyValue = new Currency("CN", bigDecimal);

	public static XMLGregorianCalendar convertToXMLGregorianCalendar() {

		Date date = new Date(0);
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(date);
        XMLGregorianCalendar gc = null;
        try {
            gc = DatatypeFactory.newInstance().newXMLGregorianCalendar(cal);
        } catch (Exception e) {

             e.printStackTrace();
        }
        return gc;
    }
	
	public String getStringValue() {
		return stringValue;
	}
	public void setStringValue(String stringValue) {
		this.stringValue = stringValue;
	}
	public Currency getCurrencyValue() {
		return currencyValue;
	}
	public void setCurrencyValue(Currency currencyValue) {
		this.currencyValue = currencyValue;
	}
	public Number getNumberValue() {
		return numberValue;
	}
	public void setNumberValue(Number numberValue) {
		this.numberValue = numberValue;
	}
	public Date getDateValue() {
		return dateValue;
	}
	public void setDateValue(Date dateValue) {
		this.dateValue = dateValue;
	}
	public boolean getBooleanValue() {
		return booleanValue;
	}
	public void setBooleanValue(boolean booleanValue) {
		this.booleanValue = booleanValue;
	}
	public byte getByteValue() {
		return byteValue;
	}
	public void setByteValue(byte byteValue) {
		this.byteValue = byteValue;
	}
	//btt don't support byteArray
//	public byte[] getByteArrayValue() {
//		return byteArrayValue;
//	}
//	public void setByteArrayValue(byte[] byteArrayValue) {
//		this.byteArrayValue = byteArrayValue;
//	}
	public short getShortValue() {
		return shortValue;
	}
	public void setShortValue(short shortValue) {
		this.shortValue = shortValue;
	}
	public int getIntValue() {
		return intValue;
	}
	public void setIntValue(int intValue) {
		this.intValue = intValue;
	}
	public long getLongValue() {
		return longValue;
	}
	public void setLongValue(long longValue) {
		this.longValue = longValue;
	}
	public float getFloatValue() {
		return floatValue;
	}
	public void setFloatValue(float floatValue) {
		this.floatValue = floatValue;
	}
	public double getDoubleValue() {
		return doubleValue;
	}
	public void setDoubleValue(double doubleValue) {
		this.doubleValue = doubleValue;
	}

	public BigInteger getBigIngeterValu() {
		return bigIngeterValu;
	}

	public void setBigIngeterValu(BigInteger bigIngeterValu) {
		this.bigIngeterValu = bigIngeterValu;
	}

	public BigDecimal getBigDecimal() {
		return bigDecimal;
	}

	public void setBigDecimal(BigDecimal bigDecimal) {
		this.bigDecimal = bigDecimal;
	}
	
	
	
}
