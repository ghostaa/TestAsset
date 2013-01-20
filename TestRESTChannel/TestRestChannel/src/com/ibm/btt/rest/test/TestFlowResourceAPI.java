package com.ibm.btt.rest.test;

import static org.junit.Assert.*;

import org.apache.wink.client.ClientResponse;
import org.apache.wink.client.Resource;
import org.apache.wink.json4j.JSONObject;
import org.junit.Test;

public class TestFlowResourceAPI  extends TestFlowResourceBase{
	private String flowUrl = "/flows";
	private String flowName="/sampleFlow";
	//http://localhost:8080/TestRestChannel/rest/flows
	private String commonUrl = baseUrl + flowUrl+flowName;
	private String dirUrl;
	
	@Test
	public void testPost() {
		/*dirUrl=commonUrl+"/sampleFlow";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		JSONObject inputJsonObject=new JSONObject();
		ClientResponse response = resource.post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}*/
	}
	/**
	 * test post method that has some params
	 */
	@Test
	public void testPostParams() {
		/*dirUrl=commonUrl+"/sampleFlow";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		JSONObject inputJsonObject=new JSONObject();
		ClientResponse response = resource.post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}*/
	}
	
	@Test
	public void testGet(){
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
	@Test
	public void testGetCallBack(){
		dirUrl=commonUrl+"/"+procId+"?callback=abc";
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
	@Test
	public void testGetParams(){
		dirUrl=commonUrl+"/"+procId+"/sampleData";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			String res = response.getEntity(String.class);
			log(res.toString());
			assertEquals("finished!", res);
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	@Test
	public void testGetParamsCallBack(){
		dirUrl=commonUrl+"/"+procId+"/sampleData?callback=abc";
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
	
	@Test
	public void testPut(){
		
	}
	@Test
	public void testPutParams(){
		
	}
	@Test
	public void testRemove(){
		dirUrl=commonUrl+"/"+procId+"/sampleData";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.delete();
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
	@Test
	public void testRemoveParams(){
		dirUrl=commonUrl+"/"+procId;
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.delete();
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
