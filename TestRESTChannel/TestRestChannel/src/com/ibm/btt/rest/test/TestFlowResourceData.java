package com.ibm.btt.rest.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

import javax.xml.datatype.Duration;
import javax.xml.datatype.XMLGregorianCalendar;

import org.apache.wink.client.ClientResponse;
import org.apache.wink.client.Resource;
import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;
import org.junit.Test;

import com.ibm.btt.base.types.impl.Currency;

public class TestFlowResourceData extends TestFlowResourceBase {
	private String flowUrl = "/flows";
	private String flowName = "/restChannelFlow";
	// http://localhost:8080/TestRestChannel/rest/flows
	private String commonUrl = baseUrl + flowUrl + flowName;
	private String dirUrl;

	@Test
	public void testGetString() {
		dirUrl = commonUrl + "/" + procId;
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
//			String res = response.getEntity(String.class);
			JSONObject res = response.getEntity(JSONObject.class);
			TestUtil.removeDSEData(res.keys());
			log(res.toString());
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
	@Test
	public void testGetStringData() {
		String dataName = "stringDataFL";
		String result = "abc"; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetDateData() {
		String dataName = "dateDataFL";
		String result = "2012-12-29"; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetCurrencyData() {
		String dataName = "currencyDataFL";
		Currency result = new Currency("$", 99); 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetNumberData() {
		String dataName = "numberDataFL";
		Number result = 88.0; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetBooleanData() {
		String dataName = "booleanDataFL";
		boolean result = false; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetByteArrayData() {
		String dataName = "byteArrayDataFL";
		Byte[] result = null; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetDurationData() {
		String dataName = "durationDataFL";
		Duration result = null; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetXMLGregorianCalendarData() {
		String dataName = "XMLGregorianCalendarDataFL";
		XMLGregorianCalendar result = null; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetByteData() {
		String dataName = "byteDataFL";
		Byte result = 1; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetShortData() {
		String dataName = "shortDataFL";
		short result = 2; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetIntegerData() {
		String dataName = "integerDataFL";
		Integer result = 3; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetLongData() {
		String dataName = "longDataFL";
		long result = 5; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetFloatData() {
		String dataName = "FloatDataFL";
		Float result = 2.22f; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetDoubleData() {
		String dataName = "doubleDataFL";
		double result = 3.33; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetBigIntegerData() {
		String dataName = "bigIntegerDataFL";
		BigInteger result = new BigInteger("1234567890"); 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetBigDecimalData() {
		String dataName = "bigDecimalDataFL";
		BigDecimal result = new BigDecimal("89.123"); 
		getDataValue(dataName, result);
	}

	public void getDataValue(String dataElement, Object o) {
		dirUrl = commonUrl + "/" + procId + "/" +dataElement;
		Resource resource = getResource(null, null, dirUrl);
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			String res = response.getEntity(String.class);
			assertEquals(o.toString(), res);
			log(res.toString());
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
	@Test
	public void testPostStringData() throws JSONException {
		String dataName = "stringDataFL";
		String result = "ccc"; 
		postDataValue(dataName, result);
	}


	@Test
	public void testPostDateData() throws JSONException {
		String dataName = "dateDataFL";
		Date result = new Date(0); 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostCurrencyData() throws JSONException {
		String dataName = "currencyDataFL";
		Currency result = new Currency("$", 99); ; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostNumberData() throws JSONException {
		String dataName = "numberDataFL";
		Number result = 88.0; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostBooleanData() throws JSONException {
		String dataName = "booleanDataFL";
		boolean result = true; 
		postDataValue(dataName, result);
	}
/*
	@Test
	public void testPostByteArrayData() throws JSONException {
		String dataName = "byteArrayDataFL";
		Byte[] result = null; 
		postDataValue(dataName, result);
	}
*/
	@Test
	public void testPostDurationData() throws JSONException {
		String dataName = "durationDataFL";
		Duration result = null; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostXMLGregorianCalendarData() throws JSONException {
		String dataName = "XMLGregorianCalendarDataFL";
		XMLGregorianCalendar result = null; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostByteData() throws JSONException {
		String dataName = "byteDataFL";
		Byte result = 1; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostShortData() throws JSONException {
		String dataName = "shortDataFL";
		short result = 2; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostIntegerData() throws JSONException {
		String dataName = "integerDataFL";
		Integer result = 3; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostLongData() throws JSONException {
		String dataName = "longDataFL";
		long result = 5; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostFloatData() throws JSONException {
		String dataName = "FloatDataFL";
		Float result = 2.22f; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostDoubleData() throws JSONException {
		String dataName = "doubleDataFL";
		double result = 3.33; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostBigIntegerData() throws JSONException {
		String dataName = "bigIntegerDataFL";
		BigInteger result = new BigInteger("1234567890"); 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostBigDecimalData() throws JSONException {
		String dataName = "bigDecimalDataFL";
		BigDecimal result = new BigDecimal("89.123"); 
		postDataValue(dataName, result);
	}

	public void postDataValue(String dataName, Object asserString) throws JSONException {
		dirUrl = commonUrl + "/" + procId;
		Resource resource = getResource(null, null, dirUrl);
		JSONObject inputJsonObject=new JSONObject();
		inputJsonObject.put(dataName, asserString);
		ClientResponse response = resource.post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			ClientResponse responseGet = resource.get();
			JSONObject res = responseGet.getEntity(JSONObject.class);
			TestUtil.removeDSEData(res.keys());
			JSONObject iniJsonObject=TestUtil.getJSONObjectForFlow().put(dataName,asserString);
//			System.out.println(res.toString());
//			System.out.println(iniJsonObject.toString());
			assertTrue(res.equals(iniJsonObject));
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
	@Test
	public void testPostMoreDataValue() throws JSONException {
		String dataName = "stringDataFL";
		String value = "abccccccc";
		String dataName1 = "dateDataFL";
		String value1 = "2020-02-20";
		JSONObject inputJsonObject=new JSONObject();
		inputJsonObject.put(dataName, value);
		inputJsonObject.put(dataName1, value1);
		JSONObject iniJsonObject=TestUtil.getJSONObjectForFlow();
		iniJsonObject.put(dataName,value);
		iniJsonObject.put(dataName1,value1);
		postDataValue(inputJsonObject, iniJsonObject);
	}

	
	public void postDataValue(JSONObject inputJsonObject, JSONObject iniJsonObject) throws JSONException {
		dirUrl = commonUrl + "/" + procId;
		Resource resource = getResource(null, null, dirUrl);
		ClientResponse response = resource.post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			ClientResponse responseGet = resource.get();
			JSONObject res = responseGet.getEntity(JSONObject.class);
			TestUtil.removeDSEData(res.keys());
//			System.out.println(res.toString());
//			System.out.println(iniJsonObject.toString());
			assertTrue(res.equals(iniJsonObject));
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
	public Resource getResource(String acceptContentType, String returnContentType, String dirUrl) {
		if(acceptContentType == null) {
			acceptContentType = "application/json";
		}
		if(returnContentType == null) {
			returnContentType = "application/json;charset=UTF-8";
		}
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept(acceptContentType);
		resource.contentType(returnContentType);
		return resource;
	}
}
