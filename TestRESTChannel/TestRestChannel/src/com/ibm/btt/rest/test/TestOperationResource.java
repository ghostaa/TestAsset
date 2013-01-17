package com.ibm.btt.rest.test;

import static org.junit.Assert.*;

import java.util.List;

import javax.ws.rs.core.MultivaluedMap;

import junit.framework.TestCase;

import org.apache.wink.client.ClientConfig;
import org.apache.wink.client.ClientResponse;
import org.apache.wink.client.Resource;
import org.apache.wink.client.RestClient;
import org.apache.wink.json4j.JSONObject;
import org.junit.Test;

public class TestOperationResource extends TestCase {

	private RestClient client;
	private String cookieString;

	private static final String baseUrl = "http://localhost:8080/rest1/rest";
	private static final String establishSessionUrl = "/session/establish";
	private static final String worklightTestOpUrl = "/operations/worklightTestOp";
	
	@Test
	public void test001WorklightTestOp() {
		Resource resource = client.resource(baseUrl + worklightTestOpUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType(" application/json;charset=UTF-8");
		JSONObject json = new JSONObject();
		ClientResponse response = resource.post(json.toString());
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}

	@Override
	protected void setUp() throws Exception {
		super.setUp();
		ClientConfig config = new ClientConfig();
		config.connectTimeout(60000); // 1 minute
		config.readTimeout(600000); // 10 minutes
		client = new RestClient(config);

		Resource resource = client.resource(baseUrl + establishSessionUrl);
		resource.contentType("application/json");
		resource.accept("application/json");
		JSONObject json = new JSONObject();
		ClientResponse response = resource.post(json);

		// Combine cookie parameters from the response header.
		// Make a cookie string for use in subsequent requests.
		MultivaluedMap<String, String> headers = response.getHeaders();
		List<String> cookieParams = headers.get("Set-Cookie");
		cookieString = StringUtils.join(cookieParams, "; ");
		log(cookieString);
	}

	private void log(Object msg) {
		System.out.println(msg.toString());
	}
}
