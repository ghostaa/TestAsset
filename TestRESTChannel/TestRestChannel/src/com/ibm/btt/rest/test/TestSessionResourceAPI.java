package com.ibm.btt.rest.test;


import static org.junit.Assert.fail;

import org.apache.wink.client.ClientResponse;
import org.apache.wink.client.Resource;
import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;
import org.junit.Test;


public class TestSessionResourceAPI extends TestResourceBase{
	
	private String sessionUrl = "/session";
	//http://localhost:8080/TestRestChannel/rest/session
	private String commonUrl = baseUrl + sessionUrl;
	private String dirUrl;
	
	public Resource getResource(String dirUrl) {
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		
		return resource;
		
	}
	
	/**
	 * @GET
	   @Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	 */
	@Test
	public void testSessionGet() {
		dirUrl=commonUrl;
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
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
	/**
	 *  @Path("{params:.*}")
		@GET
	    @Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	 */
	@Test
	public void testSessionGetParams() {
		dirUrl=commonUrl+"/stringDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			log(res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
	/**
		@POST
	    @Produces({ MediaType.APPLICATION_JSON})
	    @Consumes({ MediaType.APPLICATION_JSON })
	 */
	@Test
	public void testSessionPost() {
		dirUrl=commonUrl;
		String s = "{\"stringDataSe\":\"aaaaaaaaaaa\"}";
		ClientResponse response = getResource(dirUrl).post(s);
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			System.out.println(response.getStatusType());
//			String res = response.getEntity(String.class);
			log(res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	

	/**
	 *  @Path("{params:.*}")
		@POST
	    @Produces({ MediaType.APPLICATION_JSON})
	    @Consumes({ MediaType.APPLICATION_JSON })
	 */
	@Test
	public void testSessionPostParams() {
		dirUrl=commonUrl+"/restKcollSe";
		String s = "{\"stringDataSe\":\"aaaaaaaaaaa\"}";
		ClientResponse response = getResource(dirUrl).post(s);
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
//			String res = response.getEntity(String.class);
			log(res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}

	/**
	 * @throws JSONException 
	 * @PUT
	 * @Produces({ MediaType.APPLICATION_JSON})
	 * @Consumes({ MediaType.APPLICATION_JSON })
	 */
	@Test
	public void testSessionPut() throws JSONException {
		dirUrl = commonUrl;
		String s = "{\"stringDataSe\":\"aaaaaaaaaaa\"}";
		JSONObject json = new JSONObject();
		json.put("stringDataSe", "aaaaaaa");
		ClientResponse response = getResource(dirUrl).put(json);
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			System.out.println(response.getStatusType());
			// String res = response.getEntity(String.class);
			log(res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}

	/**
	 * @Path("{params:.*}")
	 * @throws JSONException 
	 * @PUT
	 * @Produces({ MediaType.APPLICATION_JSON})
	 * @Consumes({ MediaType.APPLICATION_JSON })
	 */
	@Test
	public void testSessionPutParams() throws JSONException{
		dirUrl = commonUrl + "/restKcollSe";
		String s = "{\"stringDataSe\":\"aaaaaaaaaaa\"}";
		JSONObject json = new JSONObject();
		json.put("stringDataSe", "aaaaaaa");
		ClientResponse response = getResource(dirUrl).put(json);
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			// String res = response.getEntity(String.class);
			log(res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
	/**
	 *  @Path("{params:.*}")
		@DELETE
	    @Produces({ MediaType.APPLICATION_JSON})
	 */
	@Test
	public void testSessionDeleteParams() {
		dirUrl=commonUrl+"/stringDataSe";
//		Resource resource = client.resource(dirUrl);
//		resource.header("Cookie", cookieString);
//		resource.accept("application/json");
//		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = getResource(dirUrl).delete();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			log(res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
	
	/**
		@POST
	    @Produces({ MediaType.APPLICATION_JSON})
	 */
	@Test
	public void testSessionEstablish() {
		dirUrl=commonUrl + "/establish";
		JSONObject json = new JSONObject();
		ClientResponse response = getResource(dirUrl).post(json);
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
//			System.out.println(response.getStatusType());
//			String res = response.getEntity(String.class);
			log(res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
}	
