package com.ibm.btt.rest.test;

import static org.junit.Assert.*;
import org.apache.wink.client.ClientResponse;
import org.apache.wink.client.Resource;
import org.apache.wink.json4j.JSONObject;
import org.junit.BeforeClass;

public class TestFlowResourceBase extends TestResourceBase{
	private static String flowUrl = "/flows";
	//http://localhost:8080/TestRestChannel/rest/flows
	private static String commonUrl = baseUrl + flowUrl;
	private static String dirUrl;
	protected static  String procId;
	/**
	 * get procId
	 * @throws Exception 
	 * test execute method
	 */
	@BeforeClass
	public static void getProcId() throws Exception {
		//super.setUp();
		dirUrl=commonUrl+"/sampleFlow";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		JSONObject inputJsonObject=new JSONObject();
		ClientResponse response = resource.post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			procId=res.get("dse_processorId").toString();
			log(procId);
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
}
