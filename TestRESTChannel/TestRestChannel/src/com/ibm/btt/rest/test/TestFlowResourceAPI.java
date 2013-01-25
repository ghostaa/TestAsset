package com.ibm.btt.rest.test;

import static org.junit.Assert.*;

import java.util.Iterator;

import org.apache.wink.client.ClientResponse;
import org.apache.wink.client.Resource;
import org.apache.wink.json4j.JSONArray;
import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;
import org.junit.Test;


public class TestFlowResourceAPI  extends TestFlowResourceBase{
	
	//http://localhost:8080/TestRestChannel/rest/flows/restChannelFlow
	private static String commonflowUrl = baseUrl + flowUrl+flowName+"/"+procId;
	private String dirUrl;
	
	/**
	 * test get method
	 * http://localhost:8080/TestRestChannel/rest/flows/restChannelFlow/AFIAJFBLBPAEETHSGOCYFQJEEOIOFDHDAZJNIUHM
	 * Assert: Json & retun Json
	 * @throws JSONException 
	 */
	@Test
	public void testGet() throws JSONException{
		dirUrl=commonflowUrl;
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			TestUtil.removeDSEData(res.keys());
			assertTrue(res.equals(TestUtil.getJSONObjectForFlow()));
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	@Test
	public void testGetCallBack() throws JSONException{
		dirUrl=commonflowUrl+"?callback=abc";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			String res = response.getEntity(String.class);
			log(res.toString());
			int beginIndex=res.indexOf("(");
			int endIndex=res.indexOf(")");
			assertEquals("abc", res.substring(0,beginIndex));
			assertEquals(");",res.substring(endIndex,res.length()));
			JSONObject jsonObject=new JSONObject(res.substring(beginIndex+1, endIndex));
			TestUtil.removeDSEData(jsonObject.keys());
			assertTrue(jsonObject.equals(TestUtil.getJSONObjectForFlow()));
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
	/**
	 * test get method
	 * http://localhost:8080/TestRestChannel/rest/flows/restChannelFlow/AFIAJFBLBPAEETHSGOCYFQJEEOIOFDHDAZJNIUHM/stringDataFL
	 * Assert: stringDataFL & "abc"
	 */
	@Test
	public void testGetParams(){
		dirUrl=commonflowUrl+"/stringDataFL";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			String res = response.getEntity(String.class);
			assertEquals("abc", res);
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	/**
	 * test get method
	 * http://localhost:8080/TestRestChannel/rest/flows/restChannelFlow/AFIAJFBLBPAEETHSGOCYFQJEEOIOFDHDAZJNIUHM/restKcollFL/stringDataFL
	 * Assert: restKcollFL.stringDataFL & "abc"
	 */
	@Test
	public void testGetParamsKColl(){
		dirUrl=commonflowUrl+"/restKcollFL/stringDataFL";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			String res = response.getEntity(String.class);
			assertEquals("abc", res);
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	/**
	 * test get method
	 * http://localhost:8080/TestRestChannel/rest/flows/restChannelFlow/AFIAJFBLBPAEETHSGOCYFQJEEOIOFDHDAZJNIUHM/listFL/0
	 * Assert: listFL.0.stringDataFL & "abc"
	 * @throws JSONException 
	 */
	@Test
	public void testGetParamsIColl() throws JSONException{
		dirUrl=commonflowUrl+"/listFL/0";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		ClientResponse response = resource.get();
		if (response.getStatusCode() == 200) {
			JSONObject res = response.getEntity(JSONObject.class);
			assertEquals("abc", res.get("stringDataFL"));
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
/*	@Test
	public void testGetParamsCallBack(){
		dirUrl=commonflowUrl+"/stringDataFL?callback=abc";
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
	*/
	
	
	/**
	 * test execute and post method
	 * http://localhost:8080/TestRestChannel/rest/flows/restChannelFlow/AFIAJFBLBPAEETHSGOCYFQJEEOIOFDHDAZJNIUHM
	 * Content Type:application/json
	 * Data:{"stringDataFL":"bbbb"}
	 * Assert: Json & retun Json
	 * @throws JSONException
	 */
	@Test
	public void testPost() throws JSONException {
		dirUrl=commonflowUrl;
		String asserString="bbbb";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		JSONObject inputJsonObject=new JSONObject();
		inputJsonObject.put("stringDataFL", asserString);
		//inputJsonObject.put("dse_nextEventName", "toResult");
		ClientResponse response = resource.post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			ClientResponse responseGet = resource.get();
			JSONObject res = responseGet.getEntity(JSONObject.class);
			TestUtil.removeDSEData(res.keys());
			//It has been updated
			JSONObject iniJsonObject=TestUtil.getJSONObjectForFlow().put("stringDataFL",asserString);
			assertTrue(res.equals(iniJsonObject));
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	/**
	 * test post method
	 * http://localhost:8080/TestRestChannel/rest/flows/restChannelFlow/AFIAJFBLBPAEETHSGOCYFQJEEOIOFDHDAZJNIUHM
	 * Content Type:application/json
	 * Data:{"stringDataFL":"bbbb"}
	 * Assert: stringDataFL & "bbbb"
	 * @throws JSONException
	 */
	@Test
	public void testPostField() throws JSONException {
		dirUrl=commonflowUrl;
		String asserString="bbbb";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		JSONObject inputJsonObject=new JSONObject();
		inputJsonObject.put("stringDataFL", asserString);
		//inputJsonObject.put("dse_nextEventName", "toResult");
		ClientResponse response = resource.post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			Resource resourceGet = client.resource(dirUrl+"/stringDataFL");
			resourceGet.header("Cookie", cookieString);
			resourceGet.accept("application/json");
			resourceGet.contentType("application/json;charset=UTF-8");
			ClientResponse responseGet = resourceGet.get();
			if (responseGet.getStatusCode()==200) {
				String res = responseGet.getEntity(String.class);
				assertEquals(asserString, res);
			}else {
				fail("Response Status Code : " + response.getStatusCode());
			}
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	 /** test post params method
	 * http://localhost:8080/TestRestChannel/rest/flows/restChannelFlow/AFIAJFBLBPAEETHSGOCYFQJEEOIOFDHDAZJNIUHM/restKcollFL
	 * Content Type:application/json
	 * Data:{"stringDataFL":"bbbb"}
	 * Assert: restKcollFL.stringDataFL & "bbbb"
	 */
	@Test
	public void testPostParamsKColl() throws JSONException {
		dirUrl=commonflowUrl+"/restKcollFL";
		String asserString="cccc";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		JSONObject inputJsonObject=new JSONObject();
		inputJsonObject.put("stringDataFL", asserString);
		ClientResponse response = resource.post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			ClientResponse responseGet = resource.get();
			if (responseGet.getStatusCode()==200) {
				JSONObject res = responseGet.getEntity(JSONObject.class);
				assertEquals(asserString, res.get("stringDataFL"));
			}else {
				fail("Response Status Code : " + response.getStatusCode());
			}
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	/** test post params method
	 * http://localhost:8080/TestRestChannel/rest/flows/restChannelFlow/AFIAJFBLBPAEETHSGOCYFQJEEOIOFDHDAZJNIUHM/listFL/0
	 * Content Type:application/json
	 * Data:{"stringDataFL":"bbbb"}
	 * Assert: listFL.0.stringDataFL & "bbbb"
	 */
	@Test
	public void testPostParamsIColl() throws JSONException {
		dirUrl=commonflowUrl+"/listFL/0";
		String asserString="cccc";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		resource.contentType("application/json;charset=UTF-8");
		JSONObject inputJsonObject=new JSONObject();
		inputJsonObject.put("stringDataFL", asserString);
		ClientResponse response = resource.post(inputJsonObject);
		if (response.getStatusCode() == 200) {
			ClientResponse responseGet = resource.get();
			if (responseGet.getStatusCode()==200) {
				JSONObject res = responseGet.getEntity(JSONObject.class);
				assertEquals(asserString, res.get("stringDataFL"));
			}else {
				fail("Response Status Code : " + response.getStatusCode());
			}
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
	
	
	
	@Test
	public void testPut() throws JSONException{
		
	}
	@Test
	public void testPutParams() throws JSONException{
		
	}
	
	/** test delete params method
	 * http://localhost:8080/TestRestChannel/rest/flows/restChannelFlow/AFIAJFBLBPAEETHSGOCYFQJEEOIOFDHDAZJNIUHM/stringDataFL
	 * Assert: stringDataFL & NULL
	 */
	@Test
	public void testRemoveField(){
		dirUrl=commonflowUrl+"/stringDataFL";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		ClientResponse response = resource.delete();
		if (response.getStatusCode() == 204) {
			Resource resourceGet = client.resource(dirUrl);
			resourceGet.header("Cookie", cookieString);
			resourceGet.accept("application/json");
			ClientResponse responseGet = resourceGet.get();
			if (responseGet.getStatusCode()==404) {
				String res=	responseGet.getEntity(String.class);
				assertEquals("", res);
			}else {
				fail("Response Status Code : " + response.getStatusCode());
			}
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
	/** test delete params method
	 * http://localhost:8080/TestRestChannel/rest/flows/restChannelFlow/AFIAJFBLBPAEETHSGOCYFQJEEOIOFDHDAZJNIUHM/restKcollFL/stringDataFL
	 * Assert: restKcollFL.stringDataFL & NULL
	 */
	@Test
	public void testRemoveParamsKColl(){
		dirUrl=commonflowUrl+"/restKcollFL/stringDataFL";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		ClientResponse response = resource.delete();
		if (response.getStatusCode() == 204) {
			Resource resourceGet = client.resource(dirUrl);
			resourceGet.header("Cookie", cookieString);
			resourceGet.accept("application/json");
			ClientResponse responseGet = resourceGet.get();
			if (responseGet.getStatusCode()==404) {
				String res=	responseGet.getEntity(String.class);
				assertEquals("", res);
			}else {
				fail("Response Status Code : " + response.getStatusCode());
			}
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
	/** test delete params method
	 * http://localhost:8080/TestRestChannel/rest/flows/restChannelFlow/AFIAJFBLBPAEETHSGOCYFQJEEOIOFDHDAZJNIUHM/listFL/0
	 * Assert: listFL.0.stringDataFL & NULL
	 */
	@Test
	public void testRemoveParamsIColl(){
		dirUrl=commonflowUrl+"/listFL/0";
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		ClientResponse response = resource.delete();
		if (response.getStatusCode() == 204) {
			Resource resourceGet = client.resource(commonflowUrl+"/listFL");
			resourceGet.header("Cookie", cookieString);
			resourceGet.accept("application/json");
			ClientResponse responseGet = resourceGet.get();
			if (responseGet.getStatusCode()==200) {
				JSONArray res=	responseGet.getEntity(JSONArray.class);
				System.out.println(res);
				assertEquals(1, res.size());
			}else {
				fail("Response Status Code : " + response.getStatusCode());
			}
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
	/** test delete method
	 * http://localhost:8080/TestRestChannel/rest/flows/restChannelFlow/AFIAJFBLBPAEETHSGOCYFQJEEOIOFDHDAZJNIUHM
	 * Assert: stringDataFL & NULL
	 */
	@Test
	public void testRemove(){
		dirUrl=commonflowUrl;
		Resource resource = client.resource(dirUrl);
		resource.header("Cookie", cookieString);
		resource.accept("application/json");
		ClientResponse response = resource.delete();
		if (response.getStatusCode() == 204) {
			Resource resourceGet = client.resource(dirUrl);
			resourceGet.header("Cookie", cookieString);
			resourceGet.accept("application/json");
			ClientResponse responseGet = resourceGet.get();
			if (responseGet.getStatusCode()==200) {
				JSONObject res=	responseGet.getEntity(JSONObject.class);
				assertEquals(new JSONObject(), res);
			}else {
				fail("Response Status Code : " + response.getStatusCode());
			}
		} else {
			JSONObject res = response.getEntity(JSONObject.class);
			log(res.toString());
			log(response.getStatusType());
			fail("Response Status Code : " + response.getStatusCode());
		}
	}
	
}
