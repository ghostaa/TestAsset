package com.ibm.btt.rest.test;

import java.math.BigDecimal;
import java.math.BigInteger;

import javax.xml.datatype.XMLGregorianCalendar;

import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;
import org.junit.Test;

import com.ibm.btt.base.types.impl.Currency;

public class TestOperationResourceData extends TestOperationResourceAPI {

	@Test
	public void testOperationExecuteString() throws JSONException {
		JSONObject json = new JSONObject();
		json.put("stringDataOp", "ssssss");
		jsonObjectOriginal.put("stringDataOp", "ssssss");
		operationExecute(json, jsonObjectOriginal);
	}
	
	@Test
	public void testOperationExecuteDate() throws JSONException {
		String key = "dateDataOp";
		String value = "2013-12-29";
		operationExecuteType(key, value);
	}
	
	@Test
	public void testOperationExecuteInteger() throws JSONException {
		String key = "integerDataOp";
		Integer value = 9;
		operationExecuteType(key, value);
	}
	
	@Test
	public void testOperationExecuteShort() throws JSONException {
		String key = "shortDataOp";
		short value = 7;
		operationExecuteType(key, value);
	}
	
	@Test
	public void testOperationExecuteLong() throws JSONException {
		String key = "longDataOp";
		long value = 66;
		operationExecuteType(key, value);
	}
	
	@Test
	public void testOperationExecuteDouble() throws JSONException {
		String key = "doubleDataOp";
		double value =99.55;
		operationExecuteType(key, value);
	}
	
	@Test
	public void testOperationExecuteFloat() throws JSONException {
		String key = "FloatDataOp";
		float value = (float) 88.22d;
		operationExecuteType(key, value);
	}
	
	@Test
	public void testOperationExecuteNumber() throws JSONException {
		String key = "numberDataOp";
		BigDecimal value = new BigDecimal("55.55");
		operationExecuteType(key, value);
	}

	@Test
	public void testOperationExecuteBoolean() throws JSONException {
		String key = "booleanDataOp";
		boolean value = true;
		operationExecuteType(key, value);
	}

	@Test
	public void testOperationExecuteByte() throws JSONException {
		String key = "byteDataOp";
		byte value = 9;
		operationExecuteType(key, value);
	}

	@Test
	public void testOperationExecuteBigInteger() throws JSONException {
		String key = "bigIntegerDataOp";
		BigInteger value = new BigInteger("999999999");
		operationExecuteType(key, value);
	}

	@Test
	public void testOperationExecuteBigDecimal() throws JSONException {
		String key = "bigDecimalDataOp";
		BigDecimal value = new BigDecimal("88.99");
		operationExecuteType(key, value);
	}

	@Test
	public void testOperationExecuteCurrency() throws JSONException {
		String key = "currencyDataOp";
		Currency value = new Currency("CN", new BigDecimal("99"));
		operationExecuteType(key, value);
	}

	@Test
	public void testOperationExecuteXMLGregorianCalendar() throws JSONException {
		String key = "XMLGregorianCalendarDataOp";
		XMLGregorianCalendar value = DataValue.convertToXMLGregorianCalendar();
		operationExecuteType(key, value);
	}
	
	
	public void operationExecuteType(String key, Object value) throws JSONException {
		JSONObject json = new JSONObject();
		json.put(key, value);
		jsonObjectOriginal.put(key, value);
		operationExecute(json, jsonObjectOriginal);
	}
}
