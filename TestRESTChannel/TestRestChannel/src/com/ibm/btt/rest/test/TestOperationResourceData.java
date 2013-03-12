package com.ibm.btt.rest.test;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.math.BigDecimal;
import java.math.BigInteger;

import javax.xml.datatype.XMLGregorianCalendar;

import org.apache.wink.client.ClientResponse;
import org.apache.wink.client.Resource;
import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;
import org.junit.Test;

import com.ibm.btt.base.types.impl.Currency;

public class TestOperationResourceData extends TestResourceBase {
	
	private String operationUrl = "/operations";
	// http://localhost:8080/TestRestChannel/rest/operations
	private String operationName = "/restChannelsOp";
	private String commonUrl = baseUrl + operationUrl + operationName;
	private String dirUrl;
	
	JSONObject jsonObjectOriginal = TestUtil.getJSONObjectForOperation();

	public Resource getResource(String dirUrl,String contentType) {
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType(contentType + ";charset=UTF-8");
		return resource;
	}

	
	@Test
	public void testOperationExecuteString() throws JSONException {
		JSONObject json = new JSONObject();
		json.put("stringDataOp", "ssssss");
		jsonObjectOriginal.put("stringDataOp", "ssssss");
//		operationExecute(json, jsonObjectOriginal);
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
//		operationExecuteType(key, value);
	}

	@Test
	public void testOperationExecuteXMLGregorianCalendar() throws JSONException {
		String key = "XMLGregorianCalendarDataOp";
		XMLGregorianCalendar value = DataValue.convertToXMLGregorianCalendar();
//		operationExecuteType(key, value);
	}
	
	
	public void operationExecuteType(String key, Object value) throws JSONException {
		JSONObject json = new JSONObject();
		json.put(key, value.toString());
		jsonObjectOriginal.put(key, value.toString());
		operationExecute(json, key, value);
//		operationExecute(json, jsonObjectOriginal);
	}
	
	public void operationExecute(JSONObject json, String key, Object jsonObjectOriginal) throws JSONException {
		dirUrl = commonUrl;
		String contentType = "application/json";
		Resource resource = getResource(dirUrl, contentType);
//		System.out.println(json);
		ClientResponse response = resource.post(json);
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			TestUtil.removeDSEData(res.keys());
//			System.out.println(res.toString());
//			System.out.println(jsonObjectOriginal.toString());
			assertTrue(res.getString(key).equals(jsonObjectOriginal.toString()));
//			assertTrue(res.equals(jsonObjectOriginal));
			log(res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
}
