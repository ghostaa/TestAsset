/*_
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 1998,2012
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */
package com.ibm.btt.cs.rest.resource;

import java.io.StringWriter;
import java.math.BigDecimal;
import java.text.MessageFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MultivaluedMap;

import org.apache.wink.json4j.JSONArray;
import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;

import com.ibm.btt.automaton.DSEProcessor;
import com.ibm.btt.automaton.Processor;
import com.ibm.btt.automaton.html.HtmlProcessorManager;
import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;
import com.ibm.btt.base.BTTOperation;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.DSEException;
import com.ibm.btt.base.DSEInvalidArgumentException;
import com.ibm.btt.base.DSEInvalidRequestException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.DataElement;
import com.ibm.btt.base.DataField;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.AbstractPropertyDescriptor;
import com.ibm.btt.channel.ChannelRequest;
import com.ibm.btt.channel.ChannelResponse;
import com.ibm.btt.channel.SessionHandler;
import com.ibm.btt.clientserver.ChannelContext;
import com.ibm.btt.clientserver.ChannelDriver;
import com.ibm.btt.cs.html.HtmlConstants;
import com.ibm.btt.cs.rest.RestChannelDriver;
import com.ibm.btt.cs.rest.RestChannelRequest;
import com.ibm.btt.cs.rest.RestChannelResponse;
import com.ibm.btt.cs.rest.RestConstants;
import com.ibm.btt.cs.rest.RestEstablishSessionRequest;
import com.ibm.btt.sm.CSSessionHandler;
import com.ibm.btt.sm.SessionEntry;

public enum RestUtils {

	INSTANCE;
	@SuppressWarnings("unused")
	private static final String COPYRIGHT = "Licensed Materials - Property of IBM " + //$NON-NLS-1$
			"Restricted Materials of IBM "
			+ //$NON-NLS-1$
			"5724-H82 "
			+ //$NON-NLS-1$
			"(C) Copyright IBM Corp. 2012 All Rights Reserved. "
			+ //$NON-NLS-1$
			"US Government Users Restricted Rights - Use, duplication or disclosure "
			+ //$NON-NLS-1$
			"restricted by GSA ADP Schedule Contract with IBM Corp ";//$NON-NLS-1$
	private static BTTLog log = BTTLogFactory.getLog(RestUtils.class.getName());

	/**
	 * Convert given Indexed Collection basing on give Locale and conversion
	 * type to JSONArray
	 * 
	 * @param ic
	 * @param loc
	 * @param convType
	 * @return the result JSONArray
	 */
	public static JSONArray convertToArray(IndexedCollection ic, Locale loc,
			String convType) {
		JSONArray ja = new JSONArray(ic.size());
		try {
			for (int i = 0; i < ic.size(); i++) {
				DataElement de = ic.getElementAt(i);
				if (de instanceof DataField) {
					DataField df = (DataField) de;
					Object dv = de.getValue();
					AbstractPropertyDescriptor descriptor = (AbstractPropertyDescriptor) df
							.getDescriptor();
					if (descriptor != null && loc != null && dv != null) {
						StringWriter sw = new StringWriter();
						descriptor.formatToWriter(de.getValue(), convType, sw,
								loc, df.getParameters());
						String valueType = descriptor.getType().getName();
						if (valueType.equalsIgnoreCase("Integer")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = x.intValue();
						} else if (valueType.equalsIgnoreCase("Number")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = x.floatValue();
						} else if (valueType.equalsIgnoreCase("Short")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = x.shortValue();
						} else if (valueType.equalsIgnoreCase("Long")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = x.longValue();
						} else if (valueType.equalsIgnoreCase("Float")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = x.floatValue();
						} else if (valueType.equalsIgnoreCase("Double")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = x.doubleValue();
						} else if (valueType.equalsIgnoreCase("BigInteger")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = x.longValue();
						} else if (valueType.equalsIgnoreCase("BigDecimal")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = new BigDecimal(x.doubleValue());
						} else if (valueType.equalsIgnoreCase("Boolean")) {

							dv = Boolean.parseBoolean(sw.toString());
						} else {
							dv = sw.toString();
						}
					}
					if (dv instanceof String[]) {
						String[] strArray = (String[]) dv;
						JSONArray ja2 = new JSONArray(strArray.length);
						for (String str : strArray)
							ja2.add(str);
						dv = ja2;
					}
					if (dv != null && !(dv instanceof Number)
							&& !(dv instanceof Boolean)
							&& !(dv instanceof String)) {
						dv = dv.toString();
					}
					ja.add(dv);
				} else if (de instanceof IndexedCollection) {
					ja.add(convertToArray((IndexedCollection) de, loc, convType));
				} else if (de instanceof KeyedCollection) {
					ja.add(convertToJson((KeyedCollection) de, loc, convType));
				}
			}
		} catch (Exception e) {
			throw new IllegalArgumentException(e);
		}
		return ja;
	}

	/**
	 * Convert the JSONObject to KeyedCollection in flat format
	 * 
	 * @param jo
	 * @return
	 */
	public KeyedCollection convertToFlatKeyedCollection(JSONObject jo) {
		return parseRequestDataToFlat(convertToKeyedCollection(jo));
	}

	/**
	 * Convert the indexed collection to JSONArray
	 * 
	 * @param ic
	 *            the indexed collection
	 * @return the JSONArray
	 */
	public IndexedCollection convertToIndexedCollection(JSONArray ja) {
		return convertToIndexedCollection(ja, null);
	}

	/**
	 * Convert the indexed collection to JSONArray
	 * 
	 * @param ic
	 *            the indexed collection
	 * @return the JSONArray
	 */
	public IndexedCollection convertToIndexedCollection(JSONArray ja,
			String name) {
		IndexedCollection ic = new IndexedCollection();
		ic.setName(name);

		for (int i = 0; i < ja.size(); i++) {
			Object jo = ja.get(i);
			if (jo instanceof JSONObject) {
				ic.addElement(convertToKeyedCollection((JSONObject) jo));
			} else if (jo instanceof JSONArray) {
				ic.addElement(convertToIndexedCollection((JSONArray) jo));
			} else {
				DataField field = new DataField();
				try {
					field.setValue(jo);
				} catch (DSEInvalidArgumentException e) {
					throw new IllegalArgumentException(e);
				}
				ic.addElement(field);
			}
		}
		return ic;
	}

	/**
	 * Convert given Context basing on give Locale and conversion type to
	 * JSONObject then return it as String
	 * 
	 * @param ctx
	 * @param loc
	 * @param convType
	 * @return
	 */
	public static String convertToJson(Context ctx, Locale loc, String convType) {
		try {
			JSONObject result = convertToJson(ctx.getKeyedCollection(), loc,
					convType);
			return result.toString();
		} catch (Exception e) {
			throw new IllegalArgumentException(e);
		}
	}

	/**
	 * Convert given KeyedCollection basing on give Locale and conversion type
	 * to JSONObject
	 * 
	 * @param kc
	 * @param loc
	 * @param convType
	 * @return
	 */
	public static JSONObject convertToJson(KeyedCollection kc, Locale loc,
			String convType) {
		JSONObject result = new JSONObject();
		try {
			for (int i = 0; i < kc.size(); i++) {
				DataElement de = kc.getElementAt(i);
				if (de instanceof DataField) {
					DataField df = (DataField) de;
					Object dv = de.getValue();
					AbstractPropertyDescriptor descriptor = (AbstractPropertyDescriptor) df
							.getDescriptor();
					if (descriptor != null && loc != null && dv != null) {
						StringWriter sw = new StringWriter();
						descriptor.formatToWriter(de.getValue(), convType, sw,
								loc, df.getParameters());
						String valueType = descriptor.getType().getName();
						if (valueType.equalsIgnoreCase("Integer")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = x.intValue();
						} else if (valueType.equalsIgnoreCase("Number")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = x.floatValue();
						} else if (valueType.equalsIgnoreCase("Short")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = x.shortValue();
						} else if (valueType.equalsIgnoreCase("Long")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = x.longValue();
						} else if (valueType.equalsIgnoreCase("Float")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = x.floatValue();
						} else if (valueType.equalsIgnoreCase("Double")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = x.doubleValue();
						} else if (valueType.equalsIgnoreCase("BigInteger")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = x.longValue();
						} else if (valueType.equalsIgnoreCase("BigDecimal")) {
							Number x = NumberFormat.getNumberInstance(loc)
									.parse(sw.toString());
							dv = new BigDecimal(x.doubleValue());
						} else if (valueType.equalsIgnoreCase("Boolean")) {

							dv = Boolean.parseBoolean(sw.toString());
						} else {
							dv = sw.toString();
						}
					}
					if (dv instanceof String[]) {
						String[] strArray = (String[]) dv;
						JSONArray ja2 = new JSONArray(strArray.length);
						for (String str : strArray) {
							if (str != null) {
								if (str.indexOf("'") >= 0) {
									str = str.replace('\'', '\"');

								}

							}
							ja2.add(str);
						}

						dv = ja2;
					}
					if (dv != null && !(dv instanceof Number)
							&& !(dv instanceof Boolean)
							&& !(dv instanceof String)) {
						dv = dv.toString();
					}
					if (dv != null && dv instanceof String) {
						if (((String) dv).indexOf("'") >= 0) {
							dv = ((String) dv).replace('\'', '\"');

						}

					}
					result.put(de.getName(), dv);
				} else if (de instanceof IndexedCollection) {
					result.put(
							de.getName(),
							convertToArray((IndexedCollection) de, loc,
									convType));
				} else if (de instanceof KeyedCollection) {
					result.put(de.getName(),
							convertToJson((KeyedCollection) de, loc, convType));
				}
			}
		} catch (Exception e) {
			throw new IllegalArgumentException(e);
		}

		return result;
	}

	/**
	 * Convert the JSONObject to KeyedCollection
	 * 
	 * @param jo
	 *            the JSONObject
	 * @return the converted JSON object
	 */
	public KeyedCollection convertToKeyedCollection(JSONObject jo) {
		return convertToKeyedCollection(jo, null);
	}

	/**
	 * * Convert the keyed collection to JSONObject
	 * 
	 * @param kc
	 *            the keyed collection
	 * @return the converted JSON object
	 */
	public KeyedCollection convertToKeyedCollection(JSONObject jo, String name) {
		KeyedCollection kc = new KeyedCollection();
		kc.setName(name);

		Set joKeys = jo.keySet();
		for (Object key : joKeys) {
			Object obj = jo.get(key);
			if (obj instanceof JSONArray) {
				kc.addElement(convertToIndexedCollection((JSONArray) obj,
						(String) key));
			} else if (obj instanceof JSONObject) {
				kc.addElement(convertToKeyedCollection((JSONObject) obj,
						(String) key));
			} else {
				DataField field = new DataField();
				field.setName((String) key);
				try {
					field.setValue(obj);
				} catch (DSEInvalidArgumentException e) {
					throw new IllegalArgumentException(e);
				}
				kc.addElement(field);
			}

		}

		return kc;
	}

	/**
	 * Parse KeyedCollection in RequestData into flat format
	 * 
	 * @param keyedData
	 * @return
	 */
	private static KeyedCollection parseRequestDataToFlat(
			KeyedCollection keyedData) {
		if (log.doDebug())
			log.entry();
		Hashtable ht = keyedData.calculeNestedQualifiedElements();
		KeyedCollection resultKColl = new KeyedCollection();
		for (Enumeration enu = ht.keys(); enu.hasMoreElements();) {
			String qualifiedName = (String) enu.nextElement();

			try {
				DataElement de = (DataElement) keyedData
						.getElementAt(qualifiedName);

				if (de instanceof DataField) {
					de.setName(qualifiedName);
					resultKColl.addElement(de);
				}
			} catch (DSEObjectNotFoundException e) {
				if (log.doError())
					log.error("Error when get element from request data:", e);
			}
		}
		if (log.doDebug())
			log.exit();
		return resultKColl;
	}

	/**
	 * Check if BTT Session is established or not
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	public int checkSession(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		if (log.doDebug())
			log.entry();
		HttpSession session = req.getSession(false);
		if (session != null && !session.isNew()) {
			SessionEntry se = CSSessionHandler.getSession(session.getId());
			if (se != null) {
				if (se.getExpired()) {
					return RestConstants.SESSION_EXPIRED; // expired
				} else {
					return RestConstants.SESSION_VALID; // valid
				}
			} else {
				return RestConstants.SESSION_EXPIRED; // no btt session
			}
		} else {
			return RestConstants.SESSION_EXPIRED; // no http session
		}
	}

	/**
	 * Establish a new BTT session then return the session context
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	public JSONObject establishSession(HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		JSONObject json = null;

		ChannelDriver driver = new RestChannelDriver();
		ChannelRequest request = new RestEstablishSessionRequest(req);
		ChannelResponse response = new RestChannelResponse(resp);
		final ChannelContext ctx = driver.createChannelContext(request,
				response);
		driver.service(ctx);

		String sessionId = ctx.getChannelSession().getId();
		HttpSession session = req.getSession();

		if (log.doDebug())
			log.debug(MessageFormat.format(
					"Established REST Channel, new session Id {0} created.",
					sessionId));

		com.ibm.btt.base.Context seCtx = SessionHandler
				.getCurrentContextForSession(sessionId);
		if (seCtx == null) {
			if (log.doWarn())
				log.warn(MessageFormat
						.format("Session context of session id {0} is null.",
								sessionId));
		} else {
			Locale loc = (Locale) seCtx.getValueAt(HtmlConstants.LOCALE);
			if (loc == null) {
				loc = Locale.getDefault();
			}
			String jsonStr = RestUtils.convertToJson(seCtx, loc, "html");
			json = new JSONObject(jsonStr);
			json.put("dse_sessionLastAccessedTime",
					session.getLastAccessedTime());
			json.put("dse_sessionMaxInactiveInterval",
					session.getMaxInactiveInterval());
		}

		return json;
	}

	/**
	 * Execute processor/flow with give processor/flow id or instance id, and
	 * necessary parameters, then return the flow context at current state
	 * 
	 * @param req
	 * @param resp
	 * @param flowName
	 * @param procId
	 * @param flowParams
	 * @return
	 * @throws Exception
	 */
	public JSONObject executeFlow(HttpServletRequest req,
			HttpServletResponse resp, String flowName, String procId,
			JSONObject flowParams) throws Exception {

		if (flowParams == null)
			flowParams = new JSONObject();

		flowParams.put("dse_operationName", flowName);
		flowParams.put("dse_processorId", procId);
		flowParams.put("dse_sessionId", req.getSession(false).getId());
		// in case client did not provide page id
		flowParams.putOnce("dse_pageId", "-1");
		flowParams.putOnce("dse_applicationId", "-1");

		if (flowName != null) {
			req.setAttribute(RestConstants.DATAKEY, flowParams);
		}

		JSONObject json = new JSONObject();
		ChannelDriver driver = new RestChannelDriver();
		ChannelRequest request = new RestChannelRequest(req);
		ChannelResponse response = new RestChannelResponse(resp);
		final ChannelContext ctx = driver.createChannelContext(request,
				response);

		driver.service(ctx);

		String jsonStr = ctx.getChannelRequest()
				.getAttribute(RestConstants.REST_RESULT_ATTR_KEY).toString();
		json = new JSONObject(jsonStr);

		return json;
	}

	/**
	 * Execute the operation of give name with specified parameters, then return
	 * the operation context as JSONObject
	 * 
	 * @param req
	 * @param resp
	 * @param operationName
	 * @param operationParams
	 * @return
	 * @throws Exception
	 */
	public JSONObject executeOperation(HttpServletRequest req,
			HttpServletResponse resp, String operationName,
			JSONObject operationParams) throws Exception {

		if (operationParams != null) {
			operationParams.put("dse_operationName", operationName);
			operationParams.put("dse_sessionId", req.getSession(false).getId());
			// in case client did not provide page id
			operationParams.put("dse_pageId", "-1");
		}
		if (operationName != null) {
			req.setAttribute(RestConstants.DATAKEY, operationParams);
		}

		JSONObject json = new JSONObject();
		ChannelDriver driver = new RestChannelDriver();
		ChannelRequest request = new RestChannelRequest(req);
		ChannelResponse response = new RestChannelResponse(resp);
		final ChannelContext ctx = driver.createChannelContext(request,
				response);

		driver.service(ctx);

		String jsonStr = ctx.getChannelRequest()
				.getAttribute(RestConstants.REST_RESULT_ATTR_KEY).toString();
		json = new JSONObject(jsonStr);

		return json;
	}

	/**
	 * Filter given JSONArray basing on given parameters.
	 * 
	 * @param arr
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public JSONArray filterJSONArray(JSONArray arr, MultivaluedMap params)
			throws Exception {
		if (log.doDebug())
			log.debug("Filering JSONArray " + arr.toString()
					+ " with parameters : " + params.toString());
		boolean dosort = false;
		String sortParams = null;
		JSONArray result = new JSONArray();
		for (Object key : params.keySet()) {
			if (key.toString().startsWith(RestConstants.SORT_KEY)) {
				// this is a sort parameter, we need process sort later
				dosort = true;
				sortParams = key.toString();
				continue;
			} else if (key.toString().equalsIgnoreCase(
					RestConstants.CALLBACK_KEY)) {
				// this is a callback parameter, skip it here
				continue;
			} else if (key.toString().equalsIgnoreCase(
					RestConstants.SESSION_ID_KEY)) {
				// this is a session id for cross domain access, skip it here
				continue;
			}
			List qv = (List) params.get(key);
			if (log.doDebug())
				log.debug("Query Param Value : " + qv);

			for (Object member : arr) {
				if (member instanceof JSONObject) {
					if (((JSONObject) member).containsKey(key)) {
						Object value = ((JSONObject) member).get(key);
						boolean flag = false;
						for (Object v : qv) {
							if (value.toString().equals(v.toString())) {
								flag = true;
								break;
							}
						}
						if (flag) {
							result.add(member);
						}
					}
				}
			}
			arr = new JSONArray(result);
			result.clear();
		}

		if (arr.size() > 1 && dosort) {
			arr = sortJSONArray(arr, sortParams);
		}

		return arr;
	}

	/**
	 * Extract a set of JSONArray by given pagination parameters, then return
	 * them inside a JSONObject
	 * 
	 * @param input
	 * @param start
	 * @param end
	 * @return
	 * @throws JSONException
	 */
	public JSONObject paginateJSONArray(JSONArray input, int start, int end)
			throws JSONException {
		JSONObject json = new JSONObject();

		JSONArray result = new JSONArray();
		if (end > input.size() - 1)
			end = input.size() - 1;
		result = new JSONArray(input.subList(start, end));

		json.put("result", result);
		json.put("start", start);
		json.put("end", end);
		return json;
	}

	/**
	 * Find current BTT session id from BTT Channel Driver
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	public String getCurrentSessionId(HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		ChannelDriver driver = new RestChannelDriver();
		ChannelRequest request = new RestChannelRequest(req);
		ChannelResponse response = new RestChannelResponse(resp);
		final ChannelContext ctx = driver.createChannelContext(request,
				response);

		driver.service(ctx);

		String sessionId = ctx.getChannelSession().getId();
		return sessionId;
	}

	/**
	 * Return the specific processor/flow context by given http request, flow id
	 * and instance id
	 * 
	 * @param req
	 * @param flowName
	 * @param procId
	 * @return
	 * @throws Exception
	 */
	public JSONObject getFlowContext(HttpServletRequest req, String flowName,
			String procId) throws Exception {

		JSONObject json = new JSONObject();
		String sessionId = req.getSession(false).getId();
		com.ibm.btt.base.Context seCtx = SessionHandler
				.getCurrentContextForSession(sessionId);

		log.info("session context name : " + seCtx.getName());
		log.info(seCtx.toString());

		Context flowctx = null;

		Hashtable ctxt = HtmlProcessorManager.getContextTable(sessionId);
		if (ctxt == null) {
			flowctx = null;
		} else {
			Object o = ctxt.get(procId);
			if (o == null) {
				flowctx = null;
			} else {
				flowctx = (Context) o;
				/*
				 * if (!flowctx.getName().equalsIgnoreCase(flowName)) { return
				 * null; }
				 */
			}
		}

		if (flowctx == null) {
			json = new JSONObject();
		} else {
			Locale loc = (Locale) seCtx.getValueAt(HtmlConstants.LOCALE);
			if (loc == null) {
				loc = Locale.getDefault();
			}
			String jsonStr = RestUtils.convertToJson(flowctx, loc, "html");
			json = new JSONObject(jsonStr);
		}
		return json;
	}

	/**
	 * Return processor/flow context by given session id, flow id and instance
	 * id.
	 * 
	 * @param sid
	 * @param flowName
	 * @param procId
	 * @return
	 * @throws Exception
	 */
	public JSONObject getFlowContext(String sid, String flowName, String procId)
			throws Exception {

		JSONObject json = new JSONObject();
		String sessionId = sid;
		com.ibm.btt.base.Context seCtx = SessionHandler
				.getCurrentContextForSession(sessionId);

		log.info("session context name : " + seCtx.getName());
		log.info(seCtx.toString());

		Context flowctx = null;

		Hashtable ctxt = HtmlProcessorManager.getContextTable(sessionId);
		if (ctxt == null) {
			flowctx = null;
		} else {
			Object o = ctxt.get(procId);
			if (o == null) {
				flowctx = null;
			} else {
				flowctx = (Context) o;
				/*
				 * if (!flowctx.getName().equalsIgnoreCase(flowName)) { return
				 * null; }
				 */
			}
		}

		if (flowctx == null) {
			json = new JSONObject();
		} else {
			Locale loc = (Locale) seCtx.getValueAt(HtmlConstants.LOCALE);
			if (loc == null) {
				loc = Locale.getDefault();
			}
			String jsonStr = RestUtils.convertToJson(flowctx, loc, "html");
			json = new JSONObject(jsonStr);
		}
		return json;
	}

	/**
	 * Return hierarchy context as JSONObject or JSONArray by given datanames
	 * 
	 * @param json
	 * @param datanames
	 * @return
	 * @throws Exception
	 */
	public Object getHierarchyContextData(JSONObject json, String[] datanames)
			throws Exception {

		Object obj = null;
		for (int i = 0; i < datanames.length; i++) {
			String data = datanames[i];
			Object o = json.get(data);
			if (o instanceof JSONObject) {
				if (i == datanames.length - 1) {
					return o; // this is the value
				} else {
					obj = o;
					json = (JSONObject) obj;
				}
			} else if (o instanceof JSONArray) {
				obj = (JSONArray) o;
				if (i == datanames.length - 1) {
					return o; // this is the value
				} else if (i == datanames.length - 2) { // return specified list
														// member
					String str = datanames[i + 1];
					int index = 0;
					if (str.matches("(\\d){1,9}")) {
						index = Integer.parseInt(str);
						obj = ((JSONArray) o).get(index);
					} else {
						obj = null;
					}
					return obj;
				} else {
					obj = null; // it is impossible to continue to next level
					return obj;
				}
			} else {
				if (i == datanames.length - 1) {
					return o; // this is the value
				} else {
					obj = null; // it is impossible to continue to next level
					return obj;
				}
			}
		}

		return obj;
	}

	/**
	 * Return Operation Context by give http request and operation name.
	 * 
	 * @param req
	 * @param operationName
	 * @return
	 * @throws Exception
	 */
	public JSONObject getOperationContext(HttpServletRequest req,
			String operationName) throws Exception {

		JSONObject json = new JSONObject();
		String sessionId = req.getSession(false).getId();
		com.ibm.btt.base.Context seCtx = SessionHandler
				.getCurrentContextForSession(sessionId);

		log.info("session context name : " + seCtx.getName());

		com.ibm.btt.base.Context opctx = null;
		Vector<com.ibm.btt.base.Context> v = seCtx.getChildren();

		for (int i = 0; i < v.size(); i++) {
			com.ibm.btt.base.Context ctx = v.get(i);
			log.info("child context " + i + " : " + ctx.getName());
			log.info(ctx.getKeyedCollection().toString());
			Object opName = ctx.tryGetValueAt("dse_operationName");
			Object isOp = ctx.tryGetValueAt("btt_isOperation");
			if (opName != null && isOp != null
					&& operationName.equalsIgnoreCase(opName.toString())
					&& "true".equalsIgnoreCase(isOp.toString())) {
				opctx = ctx;
				break;
			}
		}

		if (opctx != null) {
			Locale loc = (Locale) seCtx.getValueAt(HtmlConstants.LOCALE);
			if (loc == null) {
				loc = Locale.getDefault();
			}
			String jsonStr = RestUtils.convertToJson(opctx, loc, "html");
			json = new JSONObject(jsonStr);
		} else {
			json = null;
		}
		return json;
	}

	/**
	 * Return Operation Context by given session id and operation name
	 * 
	 * @param sid
	 * @param operationName
	 * @return
	 * @throws Exception
	 */
	public JSONObject getOperationContext(String sid, String operationName)
			throws Exception {

		JSONObject json = new JSONObject();
		com.ibm.btt.base.Context seCtx = SessionHandler
				.getCurrentContextForSession(sid);

		com.ibm.btt.base.Context opctx = null;
		Vector<com.ibm.btt.base.Context> v = seCtx.getChildren();

		for (int i = 0; i < v.size(); i++) {
			com.ibm.btt.base.Context ctx = v.get(i);
			Object opName = ctx.tryGetValueAt("dse_operationName");
			Object isOp = ctx.tryGetValueAt("btt_isOperation");
			if (opName != null && isOp != null
					&& operationName.equalsIgnoreCase(opName.toString())
					&& "true".equalsIgnoreCase(isOp.toString())) {
				opctx = ctx;
				break;
			}
		}

		if (opctx != null) {
			Locale loc = (Locale) seCtx.getValueAt(HtmlConstants.LOCALE);
			if (loc == null) {
				loc = Locale.getDefault();
			}
			String jsonStr = RestUtils.convertToJson(opctx, loc, "html");
			json = new JSONObject(jsonStr);
		} else {
			json = null;
		}
		return json;
	}

	/**
	 * Set session context for specified operation
	 * 
	 * @param req
	 * @param operationName
	 * @param json
	 * @throws Exception
	 */
	public void setOperationContext(HttpServletRequest req,
			String operationName, JSONObject json) throws Exception {

		if (operationName == null || json == null) {
			return;
		}

		KeyedCollection kc = convertToKeyedCollection(json);

		String sessionId = req.getSession(false).getId();
		com.ibm.btt.base.Context seCtx = SessionHandler
				.getCurrentContextForSession(sessionId);

		com.ibm.btt.base.Context opctx = null;
		Vector<com.ibm.btt.base.Context> v = seCtx.getChildren();

		for (int i = 0; i < v.size(); i++) {
			com.ibm.btt.base.Context ctx = v.get(i);
			Object opName = ctx.tryGetValueAt("dse_operationName");
			Object isOp = ctx.tryGetValueAt("btt_isOperation");
			if (opName != null && isOp != null
					&& operationName.equalsIgnoreCase(opName.toString())
					&& "true".equalsIgnoreCase(isOp.toString())) {
				ctx.setKeyedCollection(kc);
				break;
			}
		}
	}

	/**
	 * Set processor/flow Context for specified processor/flow id and instance
	 * id
	 * 
	 * @param req
	 * @param flowName
	 * @param procId
	 * @param json
	 * @throws Exception
	 */
	public void setFlowContext(HttpServletRequest req, String flowName,
			String procId, JSONObject json) throws Exception {

		if (flowName == null || json == null) {
			return;
		}

		KeyedCollection kc = convertToKeyedCollection(json);

		String sessionId = req.getSession(false).getId();
		com.ibm.btt.base.Context seCtx = SessionHandler
				.getCurrentContextForSession(sessionId);

		Context flowctx = null;

		Hashtable ctxt = HtmlProcessorManager.getContextTable(sessionId);

		if (ctxt != null) {
			Object o = ctxt.get(procId);
			if (o != null) {
				flowctx = (Context) o;
				if (flowctx.getName().equalsIgnoreCase(flowName)) {
					((Context) o).setKeyedCollection(kc);
				}
			}
		}
	}

	/**
	 * Set session context
	 * 
	 * @param req
	 * @param json
	 * @throws Exception
	 */
	public void setSessionContext(HttpServletRequest req, JSONObject json)
			throws Exception {

		if (req == null || json == null) {
			return;
		}
		KeyedCollection kc = convertToKeyedCollection(json);
		HttpSession session = req.getSession();
		String sessionId = session.getId();
		com.ibm.btt.base.Context seCtx = SessionHandler
				.getCurrentContextForSession(sessionId);
		if (seCtx == null) {
			if (log.doWarn())
				log.warn(MessageFormat
						.format("Session context of session id {0} is null.",
								sessionId));
		} else {
			seCtx.setKeyedCollection(kc);
		}
	}

	/**
	 * Find current session context
	 * 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public Context getSessionContext(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		String sessionId = session.getId();
		com.ibm.btt.base.Context seCtx = SessionHandler
				.getCurrentContextForSession(sessionId);
		return seCtx;
	}

	/**
	 * Find session context for specified session id
	 * 
	 * @param sid
	 * @return
	 * @throws Exception
	 */
	public Context getSessionContext(String sid) throws Exception {
		if (sid == null)
			return null;
		com.ibm.btt.base.Context seCtx = SessionHandler
				.getCurrentContextForSession(sid);
		return seCtx;
	}

	/**
	 * Return current session context as JSON Object
	 * 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public JSONObject getSessionContextJSON(HttpServletRequest req)
			throws Exception {
		JSONObject json = null;

		HttpSession session = req.getSession();
		String sessionId = session.getId();
		com.ibm.btt.base.Context seCtx = SessionHandler
				.getCurrentContextForSession(sessionId);
		if (seCtx == null) {
			if (log.doWarn())
				log.warn(MessageFormat
						.format("Session context of session id {0} is null.",
								sessionId));
		} else {
			Locale loc = null;
			Object l = seCtx.getValueAt(HtmlConstants.LOCALE);
			if (l != null) {
				if (l instanceof Locale) {
					loc = (Locale) l;
				} else if (l instanceof String) {
					loc = new Locale((String) l);
				} else {
					loc = Locale.getDefault();
				}

			} else {
				loc = Locale.getDefault();
			}
			String jsonStr = RestUtils.convertToJson(seCtx, loc, "html");
			json = new JSONObject(jsonStr);

			json.put(RestConstants.SESSION_LAST_ACCESSED_TIME_KEY,
					session.getLastAccessedTime());
			json.put(RestConstants.SESSION_MAX_INACTIVE_INTERVAL_KEY,
					session.getMaxInactiveInterval());
		}

		return json;
	}

	/**
	 * Get current session context for specified session id
	 * 
	 * @param sid
	 * @return
	 * @throws Exception
	 */
	public JSONObject getSessionContextJSON(String sid) throws Exception {
		JSONObject json = null;

		if (log.doDebug())
			log.debug(MessageFormat.format(
					"Getting session context by given session id {0}.", sid));

		com.ibm.btt.base.Context seCtx = SessionHandler
				.getCurrentContextForSession(sid);

		if (seCtx == null) {
			if (log.doWarn())
				log.warn(MessageFormat.format(
						"Session context of session id {0} is null.", sid));
		} else {
			Locale loc = (Locale) seCtx.getValueAt(HtmlConstants.LOCALE);
			if (loc == null) {
				loc = Locale.getDefault();
			}
			String jsonStr = RestUtils.convertToJson(seCtx, loc, "html");
			json = new JSONObject(jsonStr);

			SessionEntry se = CSSessionHandler.getSession(sid);
			json.put("LastAccessedTime", se.getHttpSession()
					.getLastAccessedTime());
			json.put("MaxInactiveInterval", se.getHttpSession()
					.getMaxInactiveInterval());
		}

		return json;
	}

	/**
	 * Read Operation definition
	 * 
	 * @param operationName
	 * @return
	 * @throws DSEInvalidRequestException
	 */
	public BTTServerOperation readOperation(String operationName)
			throws DSEInvalidRequestException {
		BTTServerOperation oper = null;
		try {
			oper = (BTTServerOperation) BTTOperation.readObject(operationName);
			return oper;

		} catch (Exception e) {
			throw new DSEInvalidRequestException(
					DSEException.critical,
					HtmlConstants.SESSIONID,
					new StringBuilder()
							.append("Cannot find operation ")
							.append(operationName)
							.append(". It may not correspond to any defined operation. ")
							.append(e.getMessage()).toString(), e);
		}

	}

	/**
	 * Read processor/flow definition
	 * 
	 * @param processorName
	 * @return
	 * @throws DSEInvalidRequestException
	 */
	public Processor readProcessor(String processorName)
			throws DSEInvalidRequestException {
		BTTServerOperation oper = null;
		try {
			Processor proc = (Processor) DSEProcessor.getExternalizer()
					.readObjectNonCache(processorName);
			return proc;

		} catch (Exception e) {
			throw new DSEInvalidRequestException(
					DSEException.critical,
					HtmlConstants.SESSIONID,
					new StringBuilder()
							.append("Cannot find processor ")
							.append(processorName)
							.append(". It may not correspond to any defined processor. ")
							.append(e.getMessage()).toString(), e);
		}

	}

	/**
	 * Sort JSONArray members basing on give sorting parameters. The params
	 * should be a String like "(+foo,-bar)"
	 * 
	 * @param arr
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public JSONArray sortJSONArray(JSONArray arr, String params)
			throws Exception {
		if (log.doDebug())
			log.debug("Sorting the JSONArray by params : " + params);
		if (params == null || params.length() <= 0) {
			return arr;
		}
		// only the first sort parameter is valid
		String str = params.substring(4);
		// parse the sort options, it should be something like "+foo,-bar" or
		// "(+foo,-bar)"
		if (str.startsWith("("))
			str = str.substring(1);
		if (str.endsWith(")"))
			str = str.substring(0, str.length() - 1);
		String[] options = str.split(",");

		Object[] a = arr.toArray();
		ArrayList list = new ArrayList(Arrays.asList(a));
		JSONObjectComparator comparator = new JSONObjectComparator(str);
		Collections.sort(list, comparator);
		arr.clear();
		arr.addAll(list);
		return arr;
	}

	/**
	 * Update the hierarchy context data with given value
	 * 
	 * @param json
	 * @param datanames
	 * @param value
	 * @return
	 * @throws Exception
	 */
	public boolean updateHierarchyContextData(JSONObject json,
			String[] datanames, Object value) throws Exception {
		boolean success = false;
		Object obj = null;

		if (datanames.length == 0) {
			if (value instanceof JSONObject) {
				JSONObject jo = (JSONObject) value;
				Iterator it = jo.keys();
				while (it.hasNext()) {
					Object k = it.next();
					Object v = jo.get(k);
					if (json.containsKey(k)) {
						json.put(k, v);
					} else {
						// skip this
					}
				}
				return true;
			} else if (value instanceof JSONArray) {
				// no key for an array
				return false;
			} else {
				// what is it ?
				return false;
			}
		}
		for (int i = 0; i < datanames.length; i++) {
			String key = datanames[i];
			Object o = json.get(key);
			if (o instanceof JSONObject) {
				if (i == datanames.length - 1) {
					if (value instanceof JSONObject) {
						json.put(key, value);
						success = true;
						break;
					} else {
						success = false;
						break;
					}
				} else {
					obj = o;
					json = (JSONObject) obj;
				}
			} else if (o instanceof JSONArray) {
				obj = (JSONArray) o;
				if (i == datanames.length - 1) {
					if (value instanceof JSONArray) {
						json.put(key, value); // this is the value
						success = true;
						break;
					} else if (value instanceof JSONObject) {
						// create a new member without validation
						// we don't do validation here
						((JSONArray) o).add(value);
					} else {
						success = false;
						break;
					}
				} else if (i == datanames.length - 2) { // update specified list
					// member
					String str = datanames[i + 1];
					int index = 0;
					if (str.matches("(\\d){0,9}")) {
						index = Integer.parseInt(str);
						Object item = ((JSONArray) o).get(index);
						if (item == null) {
							success = false;
							break;
						} else if (item instanceof JSONObject
								&& value instanceof JSONObject) {
							// try to update existing item
							((JSONArray) o).set(index, value);
							success = true;
							break;
						} else if (item instanceof JSONArray) {
							success = false;
							break;
						} else {
							success = false;
							break;
						}
					} else {
						success = false;
						break;
					}
				} else {
					obj = null; // it is impossible to continue to next level
					success = false;
				}
			} else {
				if (i == datanames.length - 1) {
					json.put(key, value); // this is the value
					success = true;
				} else {
					obj = null; // it is impossible to continue to next level
					success = false;
				}
			}
		}
		return success;
	}

	/**
	 * Set specified context data value to null
	 * 
	 * @param req
	 * @param operationName
	 * @return
	 */
	public boolean removeOperationContext(HttpServletRequest req,
			String operationName) {
		boolean result = false;
		String sessionId = req.getSession(false).getId();

		try {
			com.ibm.btt.base.Context seCtx = SessionHandler
					.getCurrentContextForSession(sessionId);

			log.info("session context name : " + seCtx.getName());

			com.ibm.btt.base.Context opctx = null;
			Vector<com.ibm.btt.base.Context> v = seCtx.getChildren();

			for (int i = 0; i < v.size(); i++) {
				com.ibm.btt.base.Context ctx = v.get(i);
				log.info("child context " + i + " : " + ctx.getName());
				log.info(ctx.getKeyedCollection().toString());
				Object opName = ctx.tryGetValueAt("dse_operationName");
				Object isOp = ctx.tryGetValueAt("btt_isOperation");
				if (opName != null && isOp != null
						&& operationName.equalsIgnoreCase(opName.toString())
						&& "true".equalsIgnoreCase(isOp.toString())) {
					seCtx.removeChild(ctx);
					result = true;
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * Destroy the flow/processor context, set specified data value to null
	 * 
	 * @param req
	 *            the original HttpServletRequest
	 * @param flowName
	 *            the name of the processor/flow
	 * @param procId
	 *            the id of the processor/flow instance
	 * @return true for destroyed the context successfully, false for not found
	 *         or any error occurred
	 * @throws Exception
	 */
	public boolean removeFlowContext(HttpServletRequest req, String flowName,
			String procId) throws Exception {
		boolean result = false;
		JSONObject json = new JSONObject();
		String sessionId = req.getSession(false).getId();
		com.ibm.btt.base.Context seCtx = SessionHandler
				.getCurrentContextForSession(sessionId);

		log.info("session context name : " + seCtx.getName());
		log.info(seCtx.toString());

		Context flowctx = null;

		Hashtable ctxt = HtmlProcessorManager.getContextTable(sessionId);
		if (ctxt == null) {
			flowctx = null;
		} else {
			Object o = ctxt.get(procId);
			if (o == null) {
				flowctx = null;
			} else {
				flowctx = (Context) o;
				ctxt.remove(o);
				o = null;
				result = true;
			}
		}

		return result;
	}

	/**
	 * Delete specified context data
	 * 
	 * @param json
	 * @param datanames
	 * @return
	 * @throws Exception
	 */
	public boolean removeHierarchyContextData(JSONObject json,
			String[] datanames) throws Exception {
		boolean success = false;
		Object obj = null;

		for (int i = 0; i < datanames.length; i++) {
			String key = datanames[i];
			Object o = json.get(key);
			if (o instanceof JSONObject) {
				if (i == datanames.length - 1) {
					// no support of removing record properties
					success = false;
					break;
				} else {
					obj = o;
					json = (JSONObject) obj;
				}
			} else if (o instanceof JSONArray) {
				obj = (JSONArray) o;
				if (i == datanames.length - 1) {
					// No support of removing collection
					success = false;
					break;
				} else if (i == datanames.length - 2) {
					// remove specified member by index
					String str = datanames[i + 1];
					int index = 0;
					if (str.matches("(\\d){1,9}")) {
						index = Integer.parseInt(str);
						((JSONArray) o).remove(index);
						success = true;
						break;
					} else {
						success = false;
						break;
					}
				} else {
					obj = null; // it is impossible to continue to next level
					success = false;
					break;
				}
			} else {
				success = false;
				break;
			}
		}
		return success;
	}

	/**
	 * Return JSONP String for given JSONObject
	 * 
	 * @param callback
	 * @param json
	 * @return
	 */
	public String getJSONP(String callback, JSONObject json) {
		return callback + "(" + json.toString() + ");";
	}

	/**
	 * Return JSONP String for given JSONArray
	 * 
	 * @param callback
	 * @param json
	 * @return
	 */
	public String getJSONP(String callback, JSONArray json) {
		return callback + "(" + json.toString() + ");";
	}
}
