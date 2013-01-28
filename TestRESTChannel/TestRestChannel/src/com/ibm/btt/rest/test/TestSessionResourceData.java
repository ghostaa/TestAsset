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

public class TestSessionResourceData extends TestResourceBase{
	

	private String sessionUrl = "/session";
	// http://localhost:8080/TestRestChannel/rest/session
	private String commonUrl = baseUrl + sessionUrl;
	private String dirUrl;
	JSONObject jsonAssert = TestUtil.putValueForJSONObject("Op");
	public Resource getResource(String dirUrl) {
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");

		return resource;

	}
	
	@Test
	public void testPostStringData() throws JSONException {
		String dataName = "stringDataSe";
		String result = "ccc"; 
		postDataValue(dataName, result);
	}
	
	@Test
	public void testPostDateData() throws JSONException {
		String dataName = "dateDataSe";
		Date result = new Date(0); 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostCurrencyData() throws JSONException {
		String dataName = "currencyDataSe";
		Currency result = new Currency("$", 99); ; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostNumberData() throws JSONException {
		String dataName = "numberDataSe";
		Number result = 67.0; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostBooleanData() throws JSONException {
		String dataName = "booleanDataSe";
		boolean result = true; 
		postDataValue(dataName, result);
	}
/*
	@Test
	public void testPostByteArrayData() throws JSONException {
		String dataName = "byteArrayDataSe";
		Byte[] result = null; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostDurationData() throws JSONException {
		String dataName = "durationDataSe";
		Duration result = null; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostXMLGregorianCalendarData() throws JSONException {
		String dataName = "XMLGregorianCalendarDataSe";
		XMLGregorianCalendar result = null; 
		postDataValue(dataName, result);
	}
*/
	@Test
	public void testPostByteData() throws JSONException {
		String dataName = "byteDataSe";
		Byte result = 9; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostShortData() throws JSONException {
		String dataName = "shortDataSe";
		short result = 7; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostIntegerData() throws JSONException {
		String dataName = "integerDataSe";
		Integer result = 267; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostLongData() throws JSONException {
		String dataName = "longDataSe";
		long result = 987; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostFloatData() throws JSONException {
		String dataName = "FloatDataSe";
		Float result = 69.99f; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostDoubleData() throws JSONException {
		String dataName = "doubleDataSe";
		double result = 20.02; 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostBigIntegerData() throws JSONException {
		String dataName = "bigIntegerDataSe";
		BigInteger result = new BigInteger("987654321"); 
		postDataValue(dataName, result);
	}

	@Test
	public void testPostBigDecimalData() throws JSONException {
		String dataName = "bigDecimalDataSe";
		BigDecimal result = new BigDecimal("123.89"); 
		postDataValue(dataName, result);
	}

/*	
	public void postDataValue(String dataName, Object asserString) throws JSONException {
		Resource resource = getResource(dirUrl);
		JSONObject inputJsonObject=new JSONObject();
		inputJsonObject.put(dataName, asserString);
		ClientResponse response = resource.post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			ClientResponse responseGet = resource.get();
			JSONObject res = responseGet.getEntity(JSONObject.class);
			JSONObject res = responseGet.getEntity(JSONObject.class);
			assertEquals(asserString, res.get("stringDataSe"));
			System.out.println(res.toString());
//			System.out.println(iniJsonObject.toString());
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
	
	public void testSessionPost(String dirUrl) throws JSONException {
		String asserString = "aaaaaaaaaaa";
		JSONObject inputJsonObject = new JSONObject();
		inputJsonObject.put("stringDataSe", asserString);
		Resource resource = getResource(dirUrl);
		ClientResponse response = resource.post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			ClientResponse responseGet = resource.get();
			if (responseGet.getStatusCode()==200) {
				JSONObject res = responseGet.getEntity(JSONObject.class);
				assertEquals(asserString, res.get("stringDataSe"));
			}else {
				fail("Response Status Code : " + response.getStatusCode());
			}
//			JSONObject res = response.getEntity(JSONObject.class);
			 String res = response.getEntity(String.class);
			log(res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
*/	
	@Test
	public void testSessionGetParams() {
		String elementName = "stringDataSe";
		String assertValue = "abc";
		getDataValue(elementName, assertValue);
	}

	@Test
	public void testGetStringData() {
		String dataName = "stringDataSe";
		String result = "abc"; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetDateData() {
		String dataName = "dateDataSe";
		String result = "2012-12-29"; 
		getDataValue(dataName, result);
	}
/*
	@Test
	public void testGetCurrencyData() {
		String dataName = "currencyDataSe";
		Currency result = new Currency("$", 99); 
		getDataValue(dataName, result);
	}
*/
	@Test
	public void testGetNumberData() {
		String dataName = "numberDataSe";
		Number result = 88.0; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetBooleanData() {
		String dataName = "booleanDataSe";
		boolean result = false; 
		getDataValue(dataName, result);
	}
/*
	@Test
	public void testGetByteArrayData() {
		String dataName = "byteArrayDataSe";
		Byte[] result = null; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetDurationData() {
		String dataName = "durationDataSe";
		Duration result = null; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetXMLGregorianCalendarData() {
		String dataName = "XMLGregorianCalendarDataSe";
		XMLGregorianCalendar result = null; 
		getDataValue(dataName, result);
	}
*/
	@Test
	public void testGetByteData() {
		String dataName = "byteDataSe";
		Byte result = 1; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetShortData() {
		String dataName = "shortDataSe";
		short result = 2; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetIntegerData() {
		String dataName = "integerDataSe";
		Integer result = 3; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetLongData() {
		String dataName = "longDataSe";
		long result = 5; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetFloatData() {
		String dataName = "FloatDataSe";
		Float result = 2.22f; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetDoubleData() {
		String dataName = "doubleDataSe";
		double result = 3.33; 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetBigIntegerData() {
		String dataName = "bigIntegerDataSe";
		BigInteger result = new BigInteger("1234567890"); 
		getDataValue(dataName, result);
	}

	@Test
	public void testGetBigDecimalData() {
		String dataName = "bigDecimalDataSe";
		BigDecimal result = new BigDecimal("89.123"); 
		getDataValue(dataName, result);
	}
	
	public void getDataValue(String elementName, Object assertValue) {
		dirUrl = commonUrl + "/" + elementName;
		Resource resource = getResource(dirUrl);
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			// JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals(assertValue.toString(), res.toString());
			log(res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
	public void postDataValue(String dataName, Object asserString) throws JSONException {
		dirUrl = commonUrl;
		Resource resource = getResource(dirUrl);
		JSONObject inputJsonObject=new JSONObject();
		inputJsonObject.put(dataName, asserString);
		ClientResponse response = resource.post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			ClientResponse responseGet = resource.get();
			JSONObject res = responseGet.getEntity(JSONObject.class);
			assertEquals(asserString.toString(), res.get(dataName));
			System.out.println(res.toString());
//			System.out.println(iniJsonObject.toString());
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
}
