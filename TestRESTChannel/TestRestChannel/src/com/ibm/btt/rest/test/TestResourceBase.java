package com.ibm.btt.rest.test;

import java.util.List;
import java.util.logging.Logger;

import javax.ws.rs.core.MultivaluedMap;

import junit.framework.TestCase;

import org.apache.wink.client.ClientConfig;
import org.apache.wink.client.ClientResponse;
import org.apache.wink.client.Resource;
import org.apache.wink.client.RestClient;
import org.apache.wink.json4j.JSONObject;
import org.junit.BeforeClass;

public class TestResourceBase extends TestCase{
	protected RestClient client;
	protected String cookieString;

	protected static final String baseUrl = "http://localhost:8080/TestRestChannel/rest";
	protected static final String establishSessionUrl = "/session/establish";
	
	
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
	protected void log(Object msg) {
		System.out.println(msg.toString());
	}
}
