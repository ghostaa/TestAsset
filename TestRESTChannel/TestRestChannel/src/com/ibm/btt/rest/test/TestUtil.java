package com.ibm.btt.rest.test;

import java.util.Iterator;

import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;

public class TestUtil {

	public static JSONObject getJSONObjectForFlow() throws JSONException {

		JSONObject jsonObject = new JSONObject();
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
