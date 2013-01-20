package com.ibm.btt.rest.test;

import static org.junit.Assert.fail;

import org.apache.wink.client.ClientResponse;
import org.apache.wink.client.Resource;
import org.apache.wink.json4j.JSONObject;
import org.junit.Test;

public class TestFlowResourceData extends TestFlowResourceBase{
	private String flowUrl = "/flows";
	private String flowName="/sampleFlow";
	//http://localhost:8080/TestRestChannel/rest/flows
	private String commonUrl = baseUrl + flowUrl+flowName;
	private String dirUrl;
	@Test
	public void testGetString(){
		dirUrl=commonUrl+"/"+procId;
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			String res = response.getEntity(String.class);
			log(res.toString());
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
}
