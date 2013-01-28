package com.ibm.btt.rest.test;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Iterator;

import org.apache.wink.json4j.JSONArray;
import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;

public class TestUtil {
	public static void main(String[] args) {
		JSONObject jsonObject = getJSONObjectForOperation();
		System.out.println(jsonObject);
	}

	public static JSONObject getJSONObjectForFlow() throws JSONException {

		// JSONObject jsonObject = new JSONObject(
		// "{\"FloatDataFL\":null,\"byteDataFL\":\"1\",\"restKcollFL\":{\"shortDataFL\":null,\"FloatDataFL\":null,\"currencyDataFL\":null,\"durationDataFL\":null,\"byteDataFL\":\"1\",\"booleanDataFL\":null,\"XMLGregorianCalendarDataFL\":null,\"dateDataFL\":null,\"bigDecimalDataFL\":null,\"stringDataFL\":\"aaaa\",\"bigIntegerDataFL\":null,\"byteArrayDataFL\":null,\"integerDataFL\":null,\"doubleDataFL\":null,\"numberDataFL\":null,\"longDataFL\":null},\"XMLGregorianCalendarDataFL\":null,\"integerDataFL\":null,\"doubleDataFL\":null,\"shortDataFL\":null,\"durationDataFL\":null,\"currencyDataFL\":null,\"booleanDataFL\":null,\"dateDataFL\":null,\"bigDecimalDataFL\":null,\"listFL\":[{\"shortDataFL\":null,\"FloatDataFL\":null,\"currencyDataFL\":null,\"durationDataFL\":null,\"byteDataFL\":\"1\",\"booleanDataFL\":null,\"XMLGregorianCalendarDataFL\":null,\"dateDataFL\":null,\"bigDecimalDataFL\":null,\"stringDataFL\":\"aaaa\",\"bigIntegerDataFL\":null,\"byteArrayDataFL\":null,\"integerDataFL\":null,\"doubleDataFL\":null,\"numberDataFL\":null,\"longDataFL\":null},{\"shortDataFL\":null,\"FloatDataFL\":null,\"currencyDataFL\":null,\"durationDataFL\":null,\"byteDataFL\":\"1\",\"booleanDataFL\":null,\"XMLGregorianCalendarDataFL\":null,\"dateDataFL\":null,\"bigDecimalDataFL\":null,\"stringDataFL\":\"aaaa\",\"bigIntegerDataFL\":null,\"byteArrayDataFL\":null,\"integerDataFL\":null,\"doubleDataFL\":null,\"numberDataFL\":null,\"longDataFL\":null}],\"stringDataFL\":\"aaaa\",\"bigIntegerDataFL\":null,\"byteArrayDataFL\":null,\"numberDataFL\":null,\"longDataFL\":null}");
		// jsonObject.put(\"stringDataFL\", \"aaaa\");
		JSONObject jsonObject = null;
		try {
			jsonObject = getInstance("FL");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonObject;
	}

	public static JSONObject getJSONObjectForOperation() {

		JSONObject jsonObject = null;
		try {
			jsonObject = getInstance("Op");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonObject;
	}

	public static JSONObject getJSONObjectForSession() throws JSONException {

		JSONObject jsonObject = null;
		try {
			jsonObject = getInstance("Se");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonObject;
	}

	public static void removeDSEData(Iterator it) {
		while (it.hasNext()) {
			Object name = it.next();
			if (name.toString().contains("dse") || name.toString().contains("btt")) {
				it.remove();
			}

		}
	}

	public static JSONObject getInstance(String s) throws JSONException {
		JSONObject jsonObject = putValueForJSONObject(s);
		JSONObject jsonObjectKcoll = putValueForJSONObject(s);
		JSONArray jsonArrayIcoll = new JSONArray();
		jsonArrayIcoll.put(jsonObjectKcoll);
		jsonArrayIcoll.put(jsonObjectKcoll);
		jsonObject.put("restKcoll" + s, jsonObjectKcoll);
		jsonObject.put("list" + s, jsonArrayIcoll);
		return jsonObject;
	}

	public static JSONObject putValueForJSONObject(String s) {
		Object o=new Object();
		o=null;
		JSONObject jsonObject = new JSONObject();
		try {
			jsonObject.put("numberData" + s, 88.0f);
			jsonObject.put("stringData" + s, "abc");
			jsonObject.put("dateData" + s, "2012-12-29");
			jsonObject.put("durationData" + s, o);
			jsonObject.put("currencyData" + s, o);
			jsonObject.put("booleanData" + s, false);
			jsonObject.put("byteArrayData" + s, o);
			jsonObject.put("byteData" + s, "1");
			jsonObject.put("shortData" + s, 2);
			jsonObject.put("integerData" + s, 3);
			jsonObject.put("longData" + s, 5);
			jsonObject.put("FloatData" + s, 2.22);
			jsonObject.put("doubleData" + s, 3.33);
			jsonObject.put("XMLGregorianCalendarData" + s, o);
			jsonObject.put("bigIntegerData" + s, 1234567890);
			jsonObject.put("bigDecimalData" + s, 89.123);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		 * DataValue dv = new DataValue(); JSONObject jsonObject = new
		 * JSONObject(); jsonObject.put("numberData" + s, dv.getNumberValue());
		 * jsonObject.put("stringData" + s, dv.getStringValue());
		 * jsonObject.put("dateData" + s, dv.getDateValue());
		 * jsonObject.put("currencyData" + s, dv.getCurrencyValue());
		 * jsonObject.put("booleanData" + s, dv.getBooleanValue()); //
		 * jsonObject.put("byteArrayData" + s, dv.getByteArrayValue() );
		 * jsonObject.put("byteData" + s, dv.getByteValue());
		 * jsonObject.put("shortData" + s, dv.getShortValue());
		 * jsonObject.put("integerData" + s, dv.getIntValue());
		 * jsonObject.put("longData" + s, dv.getLongValue());
		 * jsonObject.put("FloatData" + s, dv.getFloatValue());
		 * jsonObject.put("doubleData" + s, dv.getDoubleValue());
		 * jsonObject.put("XMLGregorianCalendarData" + s, "null");
		 * jsonObject.put("bigIntegerData" + s, "null");
		 * jsonObject.put("bigDecimalData" + s, "null");
		 */
		return jsonObject;
	}

}
