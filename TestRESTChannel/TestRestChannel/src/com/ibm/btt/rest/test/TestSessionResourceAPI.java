package com.ibm.btt.rest.test;

import org.apache.wink.client.ClientResponse;
import org.apache.wink.client.Resource;
import org.apache.wink.json4j.JSONObject;
import org.junit.Test;


public class TestSessionResourceAPI extends TestResourceBase{
	
	private String sessionUrl = "/session";
	//http://localhost:8080/TestRestChannel/rest/session
	private String commonUrl = baseUrl + sessionUrl;
	private String dirUrl;
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
	
	
	
}	
