package com.ibm.btt.rest.test;

import static org.junit.Assert.*;


import org.apache.wink.client.ClientResponse;
import org.apache.wink.client.Resource;
import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;
import org.junit.Test;

public class TestOperationResourceAPI extends TestResourceBase {

	private String operationUrl = "/operations";
	// http://localhost:8080/TestRestChannel/rest/operations
	private String operationName = "/restChannelsOp";
	private String commonUrl = baseUrl + operationUrl + operationName;
	private String dirUrl;

	public Resource getResource(String dirUrl) {
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		return resource;
	}

	/**
	 * @POST
	 * @Produces({ MediaType.APPLICATION_JSON})
	 * @Consumes({ MediaType.APPLICATION_JSON})
	 */
	@Test
	public void testOperationExecute() {
		dirUrl = commonUrl;
		JSONObject json = new JSONObject();
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.post(json);
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
	 * @POST
	 * @Produces({ MediaType.APPLICATION_JSON})
	 */
	@Test
	public void testOperationExecuteALL() {
		dirUrl = commonUrl;
		JSONObject json = new JSONObject();
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("text/plain;charset=UTF-8");
		ClientResponse response = resource.post(json.toString());
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
	 * @GET
	 * @Produces({ MediaType.APPLICATION_JSON})
	 */
	@Test
	public void testOperationGet() {
		testOperationExecute();
		dirUrl = commonUrl;
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
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
	 * @GET
	 * @Produces({ MediaType.APPLICATION_JSON})
	 */
	@Test
	public void testOperationGetParams() {
		testOperationExecute();
		dirUrl = commonUrl + "/stringDataOp";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
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
	 * @POST
	 * @Produces({ MediaType.APPLICATION_JSON})
	 * @Consumes({ MediaType.TEXT_PLAIN })
	 */
	@Test
	public void testOperationPostParamsText() {
		testOperationExecute();
		dirUrl = commonUrl + "/stringDataOp";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("text/plain;charset=UTF-8");
		ClientResponse response = resource.post("lllllllllll");
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
	 * @POST
	 * @Produces({ MediaType.APPLICATION_JSON})
	 * @Consumes({ MediaType.APPLICATION_JSON })
	 */
	@Test
	public void testOperationPostParamsJson() throws JSONException {
		testOperationExecute();
		dirUrl = commonUrl;
		JSONObject json = new JSONObject();
		json.put("stringDataOp", "uuuuuuuuuuuuuuuuuu");
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.post(json);
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
	 * @PUT
	 * @Produces({ MediaType.APPLICATION_JSON})
	 * @Consumes({ MediaType.TEXT_PLAIN })
	 */
	@Test
	public void testOperationPutParamsText() {
		testOperationExecute();
		dirUrl = commonUrl + "/stringDataOp";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("text/plain;charset=UTF-8");
		ClientResponse response = resource.put("lllllllllll");
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
	public void testOperationPutParamsJson() throws JSONException {
		testOperationExecute();
		dirUrl = commonUrl;
		JSONObject json = new JSONObject();
		json.put("stringDataOp", "uuuuuuuuuuuuuuuuuu");
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.put(json);
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
	 * @DELETE
	 * @Produces({ MediaType.APPLICATION_JSON})
	 */
	@Test
	public void testOperationDelete() {
		testOperationExecute();
		dirUrl = commonUrl;
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.delete();
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
	 * @DELETE
	 * @Produces({ MediaType.APPLICATION_JSON})
	 */
	@Test
	public void testOperationDeleteParams() {
		testOperationExecute();
		dirUrl = commonUrl + "/stringDataOp";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.delete();
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
}
