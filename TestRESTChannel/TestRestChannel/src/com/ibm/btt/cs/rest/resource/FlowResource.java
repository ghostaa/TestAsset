/*_
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 1998,2012
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */
package com.ibm.btt.cs.rest.resource;

import java.text.MessageFormat;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.core.UriInfo;

import org.apache.wink.json4j.JSONArray;
import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;

import com.ibm.btt.automaton.Processor;
import com.ibm.btt.automaton.html.DSEHtmlProcessor;
import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.cs.rest.RestConstants;
import com.ibm.btt.cs.rest.exception.ForbiddenException;
import com.ibm.btt.cs.rest.exception.UnauthorizedException;

@Path("flows")
public class FlowResource extends BaseResource {
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
	private static BTTLog log = BTTLogFactory.getLog(FlowResource.class
			.getName());

	@Context
	private HttpServletRequest req;
	@Context
	private HttpServletResponse resp;

	/**
	 * Execute the processor/flow with specified processor name. Every time to
	 * execute this, a new processor instance will be created, the instance id
	 * will be included into the returning result
	 * 
	 * @param flowName
	 *            the processor name to be started
	 * @param post
	 *            the data parameters to start the processor, the typical
	 *            parameter could be "dse_nextEventName".
	 * @return return the execution result in JSONObject
	 */
	@Path("{flow}")
	@POST
	@Consumes({ MediaType.APPLICATION_JSON })
	@Produces({ MediaType.APPLICATION_JSON })
	public Response executeFlow(@PathParam("flow") String flowName,
			JSONObject post) throws ForbiddenException, UnauthorizedException {
		if (log.doDebug())
			log.debug(MessageFormat.format(
					"Executing flow {0} with parameters {1} .", flowName, post));

		checkProcessorAuthorization(req, flowName, null);
		filterRequest(req, null, null, post);

		if (null == flowName || flowName.length() <= 0) {
			return Response.status(Status.NOT_FOUND)
					.type(MediaType.APPLICATION_JSON).build();
		}
		if (post != null && post.optString("dse_nextEventName") == null) {
			if (log.doDebug())
				log.debug("No event name specified, set it to 'start' by default.");
			try {
				post.put(RestConstants.NEXTEVENTNAME,
						RestConstants.PROCESSOR_START_EVENT);
			} catch (JSONException e) {
				if (log.doDebug()) {
					log.debug(flowName, e);
				}
				return Response.status(Status.BAD_REQUEST).entity(e)
						.type(MediaType.APPLICATION_JSON).build();
			}
		}
		try {

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				JSONArray errs = new JSONArray();
				json.put(RestConstants.ERRORMESSAGES,
						errs.add(RestConstants.SESSION_EXPIRED_ERR_MSG));
				return Response.status(Status.BAD_REQUEST).entity(json).build();
			} else {
				json = RestUtils.INSTANCE.executeFlow(req, resp, flowName,
						null, post);
				filterResponse(req, null, null, json);
				return Response.ok().entity(json)
						.type(MediaType.APPLICATION_JSON).build();
			}

		} catch (Exception e) {
			if (log.doDebug())
				log.debug(e.getMessage(), e);
			JSONObject obj = new JSONObject();
			try {
				JSONArray errs = new JSONArray();
				obj.put(RestConstants.ERRORMESSAGES, errs.add(e.getMessage()));
			} catch (JSONException e1) {
				if (log.doDebug())
					log.debug(RestConstants.JSON_ERR_MSG, e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	@Path("{flow}/{procId}")
	@POST
	@Consumes({ MediaType.APPLICATION_JSON })
	@Produces({ MediaType.APPLICATION_JSON })
	public Response executeFlow(@PathParam("flow") String flowName,
			@PathParam("procId") String procId, JSONObject params)
			throws ForbiddenException, UnauthorizedException {
		checkProcessorAuthorization(req, flowName, null);
		filterRequest(req, null, null, params);

		if (flowName == null || flowName.length() <= 0) {
			return Response.status(Status.NOT_FOUND).build();
		}

		try {

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERROR_KEY,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();
			} else {
				json = RestUtils.INSTANCE.executeFlow(req, resp, flowName,
						procId, params);
				return Response.ok().entity(json)
						.type(MediaType.APPLICATION_JSON).build();
			}

		} catch (Exception e) {
			if (log.doError())
				log.error(e.getMessage(), e);
			JSONObject obj = new JSONObject();
			try {
				obj.put(RestConstants.ERROR_KEY, e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error : ", e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	@Path("{flow}/{procId}")
	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	@Consumes({ MediaType.APPLICATION_JSON })
	public Response postFlowContext(@PathParam("flow") String flowName,
			@PathParam("procId") String procId, JSONObject post)
			throws ForbiddenException, UnauthorizedException {

		checkProcessorAuthorization(req, flowName, null);
		filterRequest(req, null, null, post);

		String[] datanames = {};
		if (flowName == null || flowName.length() <= 0 || procId == null
				|| procId.length() == 0) {
			return Response.status(Status.NOT_FOUND).build();
		}
		try {

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERROR_KEY,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();

			}
			json = RestUtils.INSTANCE.getFlowContext(req, flowName, procId);
			log.info("Flow Context : " + json.toString());

			boolean result = RestUtils.INSTANCE.updateHierarchyContextData(
					json, datanames, post);

			if (result) {
				Processor proc = RestUtils.INSTANCE.readProcessor(flowName);
				JSONObject error = validateFlowContext(proc, json);
				if (error.optBoolean(RestConstants.VALIDATION_ERROR_KEY, true)) {
					return Response.ok().entity(error)
							.type(MediaType.APPLICATION_JSON).build();
				} else {
					RestUtils.INSTANCE.setFlowContext(req, flowName, procId,
							json);
					return Response.ok().type(MediaType.APPLICATION_JSON)
							.build();
				}
			} else {
				return Response.status(Status.NOT_FOUND).build();
			}

		} catch (Exception e) {
			if (log.doError())
				log.error(e.getMessage(), e);
			JSONObject obj = new JSONObject();
			try {
				obj.put(RestConstants.ERROR_KEY, e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error.", e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	@Path("{flow}/{procId}/{params:.*}")
	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	@Consumes({ MediaType.APPLICATION_JSON })
	public Response postFlowContext(@PathParam("flow") String flowName,
			@PathParam("procId") String procId,
			@PathParam("params") String params, JSONObject post)
			throws ForbiddenException, UnauthorizedException {

		String[] datanames;
		if (flowName == null || flowName.length() <= 0 || procId == null
				|| procId.length() == 0) {
			return Response.status(Status.NOT_FOUND).build();
		}
		if (params == null || params.length() <= 0) {
			// execute operation
			if (log.doDebug())
				log.debug("No url parameters, executing the processor now.");
			return executeFlow(flowName, procId, post);
		} else {
			datanames = params.split("/");
		}

		checkProcessorAuthorization(req, flowName, null);
		filterRequest(req, null, null, post);

		try {

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERROR_KEY,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();

			}
			json = RestUtils.INSTANCE.getFlowContext(req, flowName, procId);

			boolean result = RestUtils.INSTANCE.updateHierarchyContextData(
					json, datanames, post);

			if (result) {
				Processor proc = RestUtils.INSTANCE.readProcessor(flowName);
				JSONObject error = validateFlowContext(proc, json);
				if (error.optBoolean(RestConstants.VALIDATION_ERROR_KEY, true)) {
					return Response.ok().entity(error)
							.type(MediaType.APPLICATION_JSON).build();
				} else {
					RestUtils.INSTANCE.setFlowContext(req, flowName, procId,
							json);
					return Response.ok().type(MediaType.APPLICATION_JSON)
							.build();
				}
			} else {
				return Response.status(Status.NOT_FOUND).build();
			}

		} catch (Exception e) {
			if (log.doError())
				log.error(e.getMessage(), e);
			JSONObject obj = new JSONObject();
			try {
				obj.put(RestConstants.ERROR_KEY, e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error.", e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	@Path("{flow}/{procId}")
	@PUT
	@Produces({ MediaType.APPLICATION_JSON })
	@Consumes({ MediaType.APPLICATION_JSON })
	public Response updateFlowContext(@PathParam("flow") String flowName,
			@PathParam("procId") String procId, JSONObject post)
			throws ForbiddenException, UnauthorizedException {
		return postFlowContext(flowName, procId, post);
	}

	@Path("{flow}/{procId}/{params:.*}")
	@PUT
	@Produces({ MediaType.APPLICATION_JSON })
	@Consumes({ MediaType.APPLICATION_JSON })
	public Response updateFlowContext(@PathParam("flow") String flowName,
			@PathParam("procId") String procId,
			@PathParam("params") String params, JSONObject post)
			throws ForbiddenException, UnauthorizedException {
		return postFlowContext(flowName, procId, params, post);
	}

	@Path("{flow}/{procid}")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getFlowContext(@PathParam("flow") String flowName,
			@PathParam("procid") String procId,
			@QueryParam("callback") String callback) throws ForbiddenException,
			UnauthorizedException {
		if (log.doDebug()) {
			log.debug("Looking for flow context, flow : " + flowName
					+ ", processor id : " + procId + ".");
		}
		checkProcessorAuthorization(req, flowName, procId);
		filterRequest(req, null, null, null);

		if (flowName == null || flowName.length() <= 0) {
			return Response.status(Status.NOT_FOUND).build();
		}
		try {
			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERROR_KEY,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();
			}
			json = RestUtils.INSTANCE.getFlowContext(req, flowName, procId);

			if (json == null) {
				return Response.status(Status.NOT_FOUND).build();
			} else {
				filterResponse(req, null, null, json);
				if (callback == null) {
					return Response.ok().entity(json)
							.type(MediaType.APPLICATION_JSON).build();
				} else {
					return Response
							.ok()
							.entity(RestUtils.INSTANCE.getJSONP(callback,
									(JSONObject) json))
							.type(RestConstants.JSONP_MIME_TYPE).build();
				}
			}
		} catch (Exception e) {
			if (log.doError())
				log.error(e.getMessage(), e);
			JSONObject obj = new JSONObject();
			try {
				obj.put(RestConstants.ERROR_KEY, e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error : ", e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	@Path("{flow}/{procid}/{params:.*}")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getFlowContext(@PathParam("flow") String flowName,
			@PathParam("procid") String procId,
			@PathParam("params") String params, @Context UriInfo ui,
			@Context HttpHeaders hh, @QueryParam("callback") String callback)
			throws ForbiddenException, UnauthorizedException {

		if (log.doDebug())
			log.entry();

		checkProcessorAuthorization(req, flowName, null);
		filterRequest(req, null, null, null);

		MultivaluedMap<String, String> queryParams = ui.getQueryParameters();
		MultivaluedMap<String, String> headerParams = hh.getRequestHeaders();

		String[] datanames;
		if (flowName == null || flowName.length() <= 0 || procId == null
				|| procId.length() <= 0) {
			return Response.status(Status.NOT_FOUND).build();
		}
		if (params == null || params.length() <= 0) {
			return getFlowContext(flowName, procId, callback);
		} else {
			datanames = params.split("/");
		}

		try {

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERROR_KEY,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();

			}
			json = RestUtils.INSTANCE.getFlowContext(req, flowName, procId);

			Object obj = RestUtils.INSTANCE.getHierarchyContextData(json,
					datanames);
			if (obj == null) {
				return Response.status(Status.NOT_FOUND)
						.type(MediaType.APPLICATION_JSON).build();
			} else if (obj instanceof JSONObject) {
				filterResponse(req, null, null, obj);
				if (callback == null) {
					return Response.ok().entity(obj)
							.type(MediaType.APPLICATION_JSON).build();
				} else {
					return Response
							.ok()
							.entity(RestUtils.INSTANCE.getJSONP(callback,
									(JSONObject) obj))
							.type(RestConstants.JSONP_MIME_TYPE).build();
				}
			} else if (obj instanceof JSONArray) {
				// filter the result collection
				if (queryParams.size() > 0) {
					JSONArray arr = (JSONArray) obj;
					JSONArray result = RestUtils.INSTANCE.filterJSONArray(arr,
							queryParams);

					// pagination basing on header params
					// request : Range: items=0-24
					// response : Content-Range: items 0-24/66
					if (headerParams.size() > 0
							&& headerParams
									.containsKey(RestConstants.PAGINATION_RANGE_KEY)) {
						String p = headerParams.get(
								RestConstants.PAGINATION_RANGE_KEY).toString();
						if (p != null) {
							if (p.startsWith(RestConstants.PAGINATION_RANGE_PREFIX))
								p = p.substring(1);
							if (p.endsWith(RestConstants.PAGINATION_RANGE_SUFFIX))
								p = p.substring(0, p.length() - 1);
							String r = p
									.split(RestConstants.PAGINATION_RANGE_KEY_VALUE_DELIMITER)[1];
							String[] x = r
									.split(RestConstants.PAGINATION_RANGE_DASH);
							String s = x[0];
							String e = x[1];
							int start = Integer.parseInt(s);
							int end = Integer.parseInt(e);
							JSONObject part = RestUtils.INSTANCE
									.paginateJSONArray(result, start, end);
							filterResponse(req, null, null, part);
							if (callback == null) {
								return Response
										.ok(part.getJSONArray("result"),
												MediaType.APPLICATION_JSON)
										.header(RestConstants.PAGINATION_REPLY_RANGE_KEY,
												RestConstants.PAGINATION_REPLY_ITEMS_KEY
														+ part.getInt(RestConstants.PAGINATION_RANGE_START_KEY)
														+ RestConstants.PAGINATION_RANGE_DASH
														+ part.getInt(RestConstants.PAGINATION_RANGE_END_KEY)
														+ RestConstants.FORWARD_SLASH_STRING
														+ result.size())
										.build();
							} else {
								return Response
										.ok()
										.entity(RestUtils.INSTANCE.getJSONP(
												callback,
												part.getJSONArray("result")))
										.header(RestConstants.PAGINATION_REPLY_RANGE_KEY,
												RestConstants.PAGINATION_REPLY_ITEMS_KEY
														+ part.getInt(RestConstants.PAGINATION_RANGE_START_KEY)
														+ RestConstants.PAGINATION_RANGE_DASH
														+ part.getInt(RestConstants.PAGINATION_RANGE_END_KEY)
														+ RestConstants.FORWARD_SLASH_STRING
														+ result.size())
										.type(RestConstants.JSONP_MIME_TYPE)
										.build();
							}
						}
					}
					filterResponse(req, null, null, result);
					if (callback == null) {
						return Response.ok().entity(result)
								.type(MediaType.APPLICATION_JSON).build();
					} else {
						return Response
								.ok()
								.entity(RestUtils.INSTANCE.getJSONP(callback,
										result))
								.type(RestConstants.JSONP_MIME_TYPE).build();
					}
				} else {
					filterResponse(req, null, null, obj);
					if (callback == null) {
						return Response.ok().entity(obj)
								.type(MediaType.APPLICATION_JSON).build();
					} else {
						return Response
								.ok()
								.entity(RestUtils.INSTANCE.getJSONP(callback,
										(JSONObject) obj))
								.type(RestConstants.JSONP_MIME_TYPE).build();
					}
				}
			} else {
				filterResponse(req, null, null, obj);
				if (callback == null) {
					return Response.ok().entity(obj)
							.type(MediaType.APPLICATION_JSON).build();
				} else {
					return Response
							.ok()
							.entity(RestUtils.INSTANCE.getJSONP(callback,
									(JSONObject) obj))
							.type(RestConstants.JSONP_MIME_TYPE).build();
				}
			}
		} catch (Exception e) {
			if (log.doError())
				log.error(e.getMessage(), e);
			JSONObject obj = new JSONObject();
			try {
				obj.put(RestConstants.ERROR_KEY, e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error.", e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	@Path("{flow}/{procId}")
	@DELETE
	@Produces({ MediaType.APPLICATION_JSON })
	public Response removeFlowContext(@PathParam("flow") String flowName,
			@PathParam("procId") String procId) throws ForbiddenException,
			UnauthorizedException {
		if (log.doDebug())
			log.entry();

		if (flowName == null || flowName.length() <= 0 || procId == null
				|| procId.length() <= 0) {
			return Response.status(Status.NOT_FOUND).build();
		}

		checkProcessorAuthorization(req, flowName, procId);
		filterRequest(req, null, null, null);

		try {

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERROR_KEY,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();
			}
			if (RestUtils.INSTANCE.removeFlowContext(req, flowName, procId)) {
				return Response.status(Status.NO_CONTENT)
						.type(MediaType.APPLICATION_JSON).build();
			} else {
				return Response.status(Status.NOT_FOUND)
						.type(MediaType.APPLICATION_JSON).build();
			}

		} catch (Exception e) {
			if (log.doError())
				log.error(e.getMessage(), e);
			JSONObject obj = new JSONObject();
			try {
				obj.put(RestConstants.ERROR_KEY, e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error.", e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	@Path("{flow}/{procId}/{params:.*}")
	@DELETE
	@Produces({ MediaType.APPLICATION_JSON })
	public Response removeFlowContext(@PathParam("flow") String flowName,
			@PathParam("procId") String procId,
			@PathParam("params") String params) throws ForbiddenException,
			UnauthorizedException {
		if (log.doDebug())
			log.entry();

		String[] datanames;
		if (flowName == null || flowName.length() <= 0 || procId == null
				|| procId.length() <= 0) {
			return Response.status(Status.NOT_FOUND).build();
		}
		checkProcessorAuthorization(req, flowName, procId);
		filterRequest(req, null, null, null);

		try {
			if (params == null || params.length() <= 0) {
				return removeFlowContext(flowName, procId);
			} else {
				datanames = params.split("/");
			}

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERROR_KEY,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();

			}
			json = RestUtils.INSTANCE.getFlowContext(req, flowName, procId);
			log.info("Flow Context : " + json.toString());

			boolean result = RestUtils.INSTANCE.removeHierarchyContextData(
					json, datanames);

			if (result) {
				Processor proc = RestUtils.INSTANCE.readProcessor(flowName);
				JSONObject error = validateFlowContext(proc, json);
				if (error.optBoolean(RestConstants.VALIDATION_ERROR_KEY, true)) {
					return Response.ok().entity(error)
							.type(MediaType.APPLICATION_JSON).build();
				} else {
					RestUtils.INSTANCE.setFlowContext(req, flowName, procId,
							json);
					return Response.status(Status.NO_CONTENT)
							.type(MediaType.APPLICATION_JSON).build();
				}
			} else {
				return Response.status(Status.NOT_FOUND)
						.type(MediaType.APPLICATION_JSON).build();
			}

		} catch (Exception e) {
			if (log.doError())
				log.error(e.getMessage(), e);
			JSONObject obj = new JSONObject();
			try {
				obj.put(RestConstants.ERROR_KEY, e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error.", e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	private JSONObject validateFlowContext(Processor proc, JSONObject newCtx)
			throws JSONException {
		JSONObject valid = new JSONObject();
		valid.put(RestConstants.VALIDATION_ERROR_KEY, false);

		// clean "dse_" prefixed fields before validation
		JSONObject ctx = new JSONObject(newCtx);
		Iterator it = newCtx.keys();
		while (it.hasNext()) {
			String key = it.next().toString();
			if (key.startsWith("dse_")
					|| key.equalsIgnoreCase("btt_isOperation")) {
				ctx.remove(key);
			}
		}
		KeyedCollection kc = RestUtils.INSTANCE.convertToKeyedCollection(ctx);

		DSEHtmlProcessor hp = (DSEHtmlProcessor) proc;

		try {
			hp.validate(kc, hp.getContext());
		} catch (Exception e) {
			try {
				valid.put(RestConstants.VALIDATION_ERROR_KEY, true);
				valid.put(RestConstants.VALIDATION_SINGLE_ERROR_KEY,
						getSingleFieldErrorMessages(hp.getContext()));
				valid.put(RestConstants.VALIDATION_CROSS_ERROR_KEY,
						getCrossFieldErrorMessages(hp.getContext()));
			} catch (Exception e1) {
				e.printStackTrace();
				try {
					valid.put(RestConstants.VALIDATION_ERROR_KEY, true);
					JSONArray arr = new JSONArray();
					JSONObject err = new JSONObject();
					err.put("0", e1.getMessage());
					arr.add(err);
					valid.put(RestConstants.ERRORMESSAGES, arr);
				} catch (JSONException e2) {
					e2.printStackTrace();
				}
			}
		}
		return valid;
	}
}
