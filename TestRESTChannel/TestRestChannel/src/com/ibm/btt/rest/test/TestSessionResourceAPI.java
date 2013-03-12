package com.ibm.btt.rest.test;

import static org.junit.Assert.*;

import org.apache.wink.client.ClientResponse;
import org.apache.wink.client.Resource;
import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;
import org.junit.Test;

public class TestSessionResourceAPI extends TestResourceBase {

	private String sessionUrl = "/session";
	// http://localhost:8080/TestRestChannel/rest/session
	private String commonUrl = baseUrl + sessionUrl;
	private String dirUrl;
	JSONObject jsonAssert = TestUtil.putValueForJSONObject("Op");
	public Resource getResource(String dirUrl) {
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");

		return resource;

	}

	/**
	 * @throws JSONException
	 * @GET
	 * @Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	 */
	@Test
	public void testSessionGet() throws JSONException {
		dirUrl = commonUrl;
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			TestUtil.removeDSEData(res.keys());
			JSONObject iniJsonObject = TestUtil.getJSONObjectForSession();
			// System.out.println(res);
			// System.out.println(iniJsonObject);
			assertTrue(res.equals(iniJsonObject));
			log(res.toString());
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}

	@Test
	public void testSessionGetCallBack() throws JSONException {
		dirUrl = commonUrl + "?callback=aa";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			String res = response.getEntity(String.class);
			int beginIndex = res.indexOf("(");
			int endIndex = res.indexOf(")");
			assertEquals("aa", res.substring(0, beginIndex));
			assertEquals(");", res.substring(endIndex, res.length()));
			JSONObject jsonObject = new JSONObject(res.substring(
					beginIndex + 1, endIndex));
			TestUtil.removeDSEData(jsonObject.keys());
			assertTrue(jsonObject.equals(TestUtil.getJSONObjectForSession()));
			log(res.toString());
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}

	/**
	 * @Path("{params:.*}")
	 * @GET
	 * @Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	 */
	@Test
	public void testSessionGetParams() {
		dirUrl = commonUrl + "/stringDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			// JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("abc", res.toString());
			log(res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}

	@Test
	public void testSessionGetParamsKcoll() {
		dirUrl = commonUrl + "/restKcollSe/stringDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			// JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("abc", res.toString());
			log(res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}

	@Test
	public void testSessionGetParamsIcoll() throws JSONException {
		dirUrl = commonUrl + "/listSe/0";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			TestUtil.removeDSEData(res.keys());
			JSONObject iniJsonObject = TestUtil.putValueForJSONObject("Se");
			// System.out.println(res);
			// System.out.println(iniJsonObject);
			assertTrue(res.equals(iniJsonObject));
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
	 * @POST
	 * @Produces({ MediaType.APPLICATION_JSON})
	 * @Consumes({ MediaType.APPLICATION_JSON })
	 */
	@Test
	public void testSessionPost() throws JSONException {
		dirUrl = commonUrl;
		String asserString = "aaaaaaaaaaa";
		JSONObject inputJsonObject = new JSONObject();
		inputJsonObject.put("stringDataSe", asserString);
		Resource resource = getResource(dirUrl);
		ClientResponse response = resource.post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			ClientResponse responseGet = resource.get();
			if (responseGet.getStatusCode() == 200) {
				JSONObject res = responseGet.getEntity(JSONObject.class);
				// String res = responseGet.getEntity(String.class);
				assertEquals(asserString, res.get("stringDataSe"));
			} else {
				fail("Response Status Code : " + response.getStatusCode());
			}
			// JSONObject res = response.getEntity(JSONObject.class);
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
	 * @Path("{params:.*}")
	 * @throws JSONException
	 * @POST
	 * @Produces({ MediaType.APPLICATION_JSON})
	 * @Consumes({ MediaType.APPLICATION_JSON })
	 */
	@Test
	public void testSessionPostParamsKcoll() throws JSONException {
		dirUrl = commonUrl + "/restKcollSe";
		String asserString = "aaaaaaaaaaa";
		JSONObject inputJsonObject = new JSONObject();
		inputJsonObject.put("stringDataSe", asserString);
		ClientResponse response = getResource(dirUrl).post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			ClientResponse responseGet = getResource(dirUrl).get();
			if (responseGet.getStatusCode() == 200) {
				JSONObject res = responseGet.getEntity(JSONObject.class);
				assertEquals(asserString, res.get("stringDataSe"));
			} else {
				fail("Response Status Code : " + response.getStatusCode());
			}
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}

	@Test
	public void testSessionPostParamsIcoll() throws JSONException {
		dirUrl = commonUrl + "/listSe/0";
		String asserString = "aaaaaaaaaaa";
		JSONObject inputJsonObject = new JSONObject();
		inputJsonObject.put("stringDataSe", asserString);
		ClientResponse response = getResource(dirUrl).post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			ClientResponse responseGet = getResource(dirUrl).get();
			if (responseGet.getStatusCode() == 200) {
				JSONObject res = responseGet.getEntity(JSONObject.class);
				assertEquals(asserString, res.get("stringDataSe"));
			} else {
				fail("Response Status Code : " + response.getStatusCode());
			}
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
		/*
		 * dirUrl = commonUrl; String s = "{\"stringDataSe\":\"aaaaaaaaaaa\"}";
		 * JSONObject json = new JSONObject(); json.put("stringDataSe",
		 * "aaaaaaa"); ClientResponse response = getResource(dirUrl).put(json);
		 * if (response.getStatusCode() == 200) { JSONObject res =
		 * response.getEntity(JSONObject.class);
		 * System.out.println(response.getStatusType()); // String res =
		 * response.getEntity(String.class); log(res.toString()); } else {
		 * String res = response.getEntity(String.class); log(res.toString());
		 * log(response.getStatusType()); fail("Response Status Code : " +
		 * response.getStatusCode()); }
		 */
	}

	/**
	 * @Path("{params:.*}")
	 * @throws JSONException
	 * @PUT
	 * @Produces({ MediaType.APPLICATION_JSON})
	 * @Consumes({ MediaType.APPLICATION_JSON })
	 */
	@Test
	public void testSessionPutParams() throws JSONException {
		/*
		 * dirUrl = commonUrl + "/restKcollSe"; String s =
		 * "{\"stringDataSe\":\"aaaaaaaaaaa\"}"; JSONObject json = new
		 * JSONObject(); json.put("stringDataSe", "aaaaaaa"); ClientResponse
		 * response = getResource(dirUrl).put(json); if
		 * (response.getStatusCode() == 200) { JSONObject res =
		 * response.getEntity(JSONObject.class); // String res =
		 * response.getEntity(String.class); log(res.toString()); } else {
		 * String res = response.getEntity(String.class); log(res.toString());
		 * log(response.getStatusType()); fail("Response Status Code : " +
		 * response.getStatusCode()); }
		 */
	}

	/**
	 * @Path("{params:.*}")
	 * @throws JSONException
	 * @DELETE
	 * @Produces({ MediaType.APPLICATION_JSON})
	 */
	@Test
	public void testSessionDeleteParams() throws JSONException {
		dirUrl = commonUrl + "/stringDataSe";
		ClientResponse response = getResource(dirUrl).delete();
		if (response.getStatusCode() == 204) {
			ClientResponse responseGet = getResource(dirUrl).get();
			if (responseGet.getStatusCode() == 404) {
				JSONObject res = responseGet.getEntity(JSONObject.class);
				JSONObject jso = new JSONObject();
				jso.put("error", "Object not found.");
				jso.put("dse_ErrorFlag",true);
				assertTrue(res.equals(jso));
			} else {
				fail("Response Status Code : " + response.getStatusCode());
			}
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}

//	@Test
	public void testSessionDeleteParamsKcoll() throws JSONException {
		dirUrl = commonUrl + "/restKcollSe";
		ClientResponse response = getResource(dirUrl).delete();
		if (response.getStatusCode() == 204) {
			ClientResponse responseGet = getResource(dirUrl).get();
			if (responseGet.getStatusCode() == 404) {
				JSONObject res = responseGet.getEntity(JSONObject.class);
				System.out.println(res.toString());
				JSONObject jso = new JSONObject();
				jso.put("error", "Object not found.");
				assertTrue(res.equals(jso));
			} else {
				fail("Response Status Code : " + response.getStatusCode());
			}
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}

//	@Test
	public void testSessionDeleteParamsIcoll() throws JSONException {
		dirUrl = commonUrl + "/listSe";
		ClientResponse response = getResource(dirUrl).delete();
		if (response.getStatusCode() == 204) {
			ClientResponse responseGet = getResource(dirUrl).get();
			if (responseGet.getStatusCode() == 404) {
				JSONObject res = responseGet.getEntity(JSONObject.class);
				JSONObject jso = new JSONObject();
				jso.put("error", "Object not found.");
				assertTrue(res.equals(jso));
			} else {
				fail("Response Status Code : " + response.getStatusCode());
			}
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
	public void testSessionEstablish() {
		dirUrl = commonUrl + "/establish";
		JSONObject json = new JSONObject();
		ClientResponse response = getResource(dirUrl).post(json);
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			TestUtil.removeDSEData(res.keys());
//			System.out.println(res.toString());
//			System.out.println(jsonObjectOriginal.toString());
//			assertTrue(res.equals(jsonAssert));
			log(res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}

	
	
	
}