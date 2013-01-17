package com.ibm.btt.rest.test;

import org.apache.wink.client.ClientResponse;
import org.apache.wink.client.Resource;
import org.apache.wink.json4j.JSONObject;
import org.junit.Test;

public class TestSessionResource extends TestResourceBase{
	
	private String sessionUrl = "/session";
	
	@Test
	public void testSessionGet() {
		Resource resource = client.resource(baseUrl + sessionUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
//		JSONObject json = new JSONObject();
		ClientResponse response = resource.get();
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
}	
