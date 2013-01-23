package com.ibm.btt.rest.test;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.Date;

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
	public void testSessionGetParamsString() {
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
			assertEquals("aaaa", res.toString());
		} else {
			String res = response.getEntity(String.class);
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
	public void testSessionGetParamsDate() {
		dirUrl=commonUrl+"/dateDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("2012-09-09", res);
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	/**
	 *  @Path("{params:.*}")
		@GET  ERROR
	    @Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	 */
	@Test
	public void testSessionGetParamsNumber() {
		dirUrl=commonUrl+"/numberDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			//assertEquals("123.0", res);
		} else {
			String res = response.getEntity(String.class);
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
	public void testSessionGetParamsRestKcollSe() {
		dirUrl=commonUrl+"/restKcollSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("{\"booleanDataSe\":true,\"byteDataSe\":\"1\",\"numberDataSe\":123.0,\"XMLGregorianCalendarDataSe\":null,\"dateDataSe\":\"2012-09-09\",\"bigDecimalDataSe\":null,\"doubleDataSe\":null,\"stringDataSe\":\"aaaa\",\"currencyDataSe\":\"10.00\",\"byteArrayDataSe\":null,\"durationDataSe\":null,\"FloatDataSe\":null,\"shortDataSe\":null,\"longDataSe\":null,\"bigIntegerDataSe\":null,\"integerDataSe\":123}", res.toString());
					
		} else {
			String res = response.getEntity(String.class);
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
	public void testSessionGetParamsCurrencyDataSe() {
		dirUrl=commonUrl+"/currencyDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("10.00", res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	/**
	 *  @Path("{params:.*}")
		@GET  ERROR
	    @Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	 */
	@Test
	public void testSessionGetParamsBooleanDataSe() {
		dirUrl=commonUrl+"/booleanDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("true", res.toString());
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	/**
	 *  @Path("{params:.*}")
		@GET ?????????????????????????????????????????????????????????????
	    @Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	 */
	@Test
	public void testSessionGetParamsByteArrayDataSe() {
		dirUrl=commonUrl+"/byteArrayDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("2012-09-09", res);
		} else {
			String res = response.getEntity(String.class);
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
	public void testSessionGetParamsDurationDataSe() {
		dirUrl=commonUrl+"/durationDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("10", res);
		} else {
			String res = response.getEntity(String.class);
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
	public void testSessionGetParamsXMLGregorianCalendarDataSe() {
		dirUrl=commonUrl+"/XMLGregorianCalendarDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("2012-10-10", res);
		} else {
			String res = response.getEntity(String.class);
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
	public void testSessionGetParamsByteDataSe() {
		dirUrl=commonUrl+"/byteDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("10", res);
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	/**
	 *  @Path("{params:.*}")
		@GET  ERROR
	    @Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	 */
	@Test
	public void testSessionGetParamsShortDataSe() {
		dirUrl=commonUrl+"/shortDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("10", res);
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	/**
	 *  @Path("{params:.*}")
		@GET ERROR
	    @Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	 */
	@Test
	public void testSessionGetParamsIntegerDataSe() {
		dirUrl=commonUrl+"/integerDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("123", res);
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	/**
	 *  @Path("{params:.*}")
		@GET ERROR
	    @Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	 */
	@Test
	public void testSessionGetParamsLongDataSe() {
		dirUrl=commonUrl+"/longDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("1010", res);
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	/**
	 *  @Path("{params:.*}")
		@GET  ERROR
	    @Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	 */
	@Test
	public void testSessionGetParamsFloatDataSe() {
		dirUrl=commonUrl+"/FloatDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("10.10", res);
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	/**
	 *  @Path("{params:.*}")
		@GET  ERROR
	    @Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	 */
	@Test
	public void testSessionGetParamsDoubleDataSe() {
		dirUrl=commonUrl+"/doubleDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("10.10", res);
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	/**
	 *  @Path("{params:.*}")
		@GET  ERROR
	    @Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	 */
	@Test
	public void testSessionGetParamsBigIntegerDataSe() {
		dirUrl=commonUrl+"/bigIntegerDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("10", res);
		} else {
			String res = response.getEntity(String.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	/**
	 *  @Path("{params:.*}")
		@GET ERROR
	    @Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	 */
	@Test
	public void testSessionGetParamsBigDecimalDataSe() {
		dirUrl=commonUrl+"/bigDecimalDataSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			String res = response.getEntity(String.class);
			assertEquals("10", res);
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
	public void testSessionPostString() {
		dirUrl=commonUrl;
		String s = "{\"stringDataSe\":\"aaaaaaaaaaa\"}";
		ClientResponse response = getResource(dirUrl).post(s);
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			System.out.println(response.getStatusType());
		String res = response.getEntity(String.class);
			log(res.toString());
			//assertEquals("123", res.toString());
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
	public void testSessionPostDate() {
		dirUrl=commonUrl;
		String s = "{\"dateDataSe\":\"2012-09-10\"}";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.post(s);
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			System.out.println(response.getStatusType());
			//String res = response.getEntity(String.class);
			//assertEquals("2012-09-09", res);
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
	public void testSessionPostNumber() {
		dirUrl=commonUrl;
		String s = "{\"numberDataSe\":\"666\"}";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.post(s);
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("123.0", res);
			System.out.println(response.getStatusType());
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
	public void testSessionPostRestKcollSe() {
		dirUrl=commonUrl+"/restKcollSe";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("{\"booleanDataSe\":true,\"byteDataSe\":\"1\",\"numberDataSe\":123.0,\"XMLGregorianCalendarDataSe\":null,\"dateDataSe\":\"2012-09-09\",\"bigDecimalDataSe\":null,\"doubleDataSe\":null,\"stringDataSe\":\"aaaa\",\"currencyDataSe\":\"10.00\",\"byteArrayDataSe\":null,\"durationDataSe\":null,\"FloatDataSe\":null,\"shortDataSe\":null,\"longDataSe\":null,\"bigIntegerDataSe\":null,\"integerDataSe\":123}", res.toString());
					
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
	public void testSessionPostCurrencyDataSe() {
		dirUrl=commonUrl;
		String s = "{\"currencyDataSe\":\"20\"}";
		ClientResponse response = getResource(dirUrl).post(s);
		
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("10.00", res.toString());
			System.out.println(response.getStatusType());
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
	public void testSessionPostBooleanDataSe() {
		dirUrl=commonUrl;
		String s = "{\"booleanDataSe\":\"false\"}";
		ClientResponse response = getResource(dirUrl).post(s);
	
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("true", res.toString());
			System.out.println(response.getStatusType());
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
	public void testSessionPostByteArrayDataSe() {
		dirUrl=commonUrl;
		String s = "{\"byteArrayDataSe\":\"aaaaaaaaaaa\"}";
		ClientResponse response = getResource(dirUrl).post(s);
	
		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("2012-09-09", res);
			System.out.println(response.getStatusType());
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
	public void testSessionPostDurationDataSe() {
		dirUrl=commonUrl;
		String s = "{\"durationDataSe\":\"20\"}";
		ClientResponse response = getResource(dirUrl).post(s);

		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("10", res);
			System.out.println(response.getStatusType());
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
	public void testSessionPostXMLGregorianCalendarDataSe() {
		dirUrl=commonUrl;
		String s = "{\"XMLGregorianCalendarDataSe\":\"30\"}";
		ClientResponse response = getResource(dirUrl).post(s);

		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("2012-10-10", res);
			System.out.println(response.getStatusType());
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
	public void testSessionPostByteDataSe() {
		dirUrl=commonUrl;
		String s = "{\"byteDataSe\":\"20\"}";
		ClientResponse response = getResource(dirUrl).post(s);

		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("10", res);
			System.out.println(response.getStatusType());
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
	public void testSessionPostShortDataSe() {
		dirUrl=commonUrl;
		String s = "{\"shortDataSe\":\"30\"}";
		ClientResponse response = getResource(dirUrl).post(s);

		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("10", res);
			System.out.println(response.getStatusType());
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
	public void testSessionPostIntegerDataSe() {
		dirUrl=commonUrl;
		String s = "{\"integerDataSe\":\"50\"}";
		ClientResponse response = getResource(dirUrl).post(s);

		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("123", res);
			System.out.println(response.getStatusType());
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
	public void testSessionPostLongDataSe() {
		dirUrl=commonUrl;
		String s = "{\"longDataSe\":\"50\"}";
		ClientResponse response = getResource(dirUrl).post(s);

		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("1010", res);
			System.out.println(response.getStatusType());
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
	public void testSessionPostFloatDataSe() {
		dirUrl=commonUrl;
		String s = "{\"FloatDataSe\":\"10.3\"}";
		ClientResponse response = getResource(dirUrl).post(s);

		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("10.10", res);
			System.out.println(response.getStatusType());
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
	public void testSessionPostDoubleDataSe() {
		dirUrl=commonUrl;
		String s = "{\"doubleDataSe\":\"10.3\"}";
		ClientResponse response = getResource(dirUrl).post(s);

		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("10.10", res);
			System.out.println(response.getStatusType());
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
	public void testSessionPostBigIntegerDataSe() {
		dirUrl=commonUrl;
		String s = "{\"bigIntegerDataSe\":\"99\"}";
		ClientResponse response = getResource(dirUrl).post(s);

		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("10", res);
			System.out.println(response.getStatusType());
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
	public void testSessionPostBigDecimalDataSe() {
		dirUrl=commonUrl;
		String s = "{\"bigDecimalDataSe\":\"88\"}";
		ClientResponse response = getResource(dirUrl).post(s);

		if (response.getStatusCode() == 200) {
			//JSONObject res = response.getEntity(JSONObject.class);
			//String res = response.getEntity(String.class);
			//assertEquals("10", res);
			System.out.println(response.getStatusType());
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
