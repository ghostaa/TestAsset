package com.ibm.btt.rest.test;

import java.util.Iterator;

import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;

public class TestUtil {

	public static JSONObject getJSONObjectForFlow() throws JSONException {

		JSONObject jsonObject = new JSONObject("{\"FloatDataFL\":null,\"byteDataFL\":\"1\",\"restKcollFL\":{\"shortDataFL\":null,\"FloatDataFL\":null,\"currencyDataFL\":null,\"durationDataFL\":null,\"byteDataFL\":\"1\",\"booleanDataFL\":null,\"XMLGregorianCalendarDataFL\":null,\"dateDataFL\":null,\"bigDecimalDataFL\":null,\"stringDataFL\":\"aaaa\",\"bigIntegerDataFL\":null,\"byteArrayDataFL\":null,\"integerDataFL\":null,\"doubleDataFL\":null,\"numberDataFL\":null,\"longDataFL\":null},\"XMLGregorianCalendarDataFL\":null,\"integerDataFL\":null,\"doubleDataFL\":null,\"shortDataFL\":null,\"durationDataFL\":null,\"currencyDataFL\":null,\"booleanDataFL\":null,\"dateDataFL\":null,\"bigDecimalDataFL\":null,\"listFL\":[{\"shortDataFL\":null,\"FloatDataFL\":null,\"currencyDataFL\":null,\"durationDataFL\":null,\"byteDataFL\":\"1\",\"booleanDataFL\":null,\"XMLGregorianCalendarDataFL\":null,\"dateDataFL\":null,\"bigDecimalDataFL\":null,\"stringDataFL\":\"aaaa\",\"bigIntegerDataFL\":null,\"byteArrayDataFL\":null,\"integerDataFL\":null,\"doubleDataFL\":null,\"numberDataFL\":null,\"longDataFL\":null},{\"shortDataFL\":null,\"FloatDataFL\":null,\"currencyDataFL\":null,\"durationDataFL\":null,\"byteDataFL\":\"1\",\"booleanDataFL\":null,\"XMLGregorianCalendarDataFL\":null,\"dateDataFL\":null,\"bigDecimalDataFL\":null,\"stringDataFL\":\"aaaa\",\"bigIntegerDataFL\":null,\"byteArrayDataFL\":null,\"integerDataFL\":null,\"doubleDataFL\":null,\"numberDataFL\":null,\"longDataFL\":null}],\"stringDataFL\":\"aaaa\",\"bigIntegerDataFL\":null,\"byteArrayDataFL\":null,\"numberDataFL\":null,\"longDataFL\":null}");
		// jsonObject.put(\"stringDataFL\", \"aaaa\");
		return jsonObject;
	}

	public static JSONObject getJSONObjectForOperation() throws JSONException {

		JSONObject jsonObject = new JSONObject();
		return jsonObject;
	}

	public static JSONObject getJSONObjectForSession() throws JSONException {

		JSONObject jsonObject = new JSONObject();
		return jsonObject;
	}

	public static void removeDSEData(Iterator it) {
		while (it.hasNext()) {
			Object name = it.next();
			if (name.toString().contains("dse")) {
				it.remove();
			}

		}
	}

}
