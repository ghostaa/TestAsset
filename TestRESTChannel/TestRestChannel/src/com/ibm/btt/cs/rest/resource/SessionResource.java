/*_
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 1998,2012
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */
package com.ibm.btt.cs.rest.resource;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

import com.ibm.btt.automaton.html.DSEHtmlProcessor;
import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.cs.rest.RestConstants;
import com.ibm.btt.cs.rest.exception.ForbiddenException;
import com.ibm.btt.cs.rest.exception.UnauthorizedException;
import com.ibm.btt.sm.BTTSMException;
import com.ibm.btt.sm.CSSessionHandler;
import com.ibm.btt.sm.SessionEntry;

@Path("/session")
public class SessionResource extends BaseResource {
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
	private static BTTLog log = BTTLogFactory.getLog(SessionResource.class
			.getName());

	@Context
	private HttpServletRequest req;
	@Context
	private HttpServletResponse resp;

	@GET
	@Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	public Response getSessionContext(@Context HttpHeaders hh,
			@QueryParam("callback") String callback) throws ForbiddenException,
			UnauthorizedException {
		if (log.doDebug())
			log.entry();
		checkRequestAuthorization(req);
		filterRequest(req, null, null, null);
		MultivaluedMap<String, String> headerParams = hh.getRequestHeaders();

		try {
			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put("error", "Session expired.");
				return Response.status(Status.BAD_REQUEST).entity(json).build();
			}
			json = RestUtils.INSTANCE.getSessionContextJSON(req);
			filterRequest(req, null, RestUtils.INSTANCE.getSessionContext(req),
					json);

			if (log.doDebug())
				log.debug("Session Context : " + json.toString());

			filterResponse(req, null, null, json);
			if (callback == null) {
				return Response.ok().entity(json)
						.type(MediaType.APPLICATION_JSON).build();
			} else {
				return Response.ok()
						.entity(RestUtils.INSTANCE.getJSONP(callback, json))
						.type(RestConstants.JSONP_MIME_TYPE).build();
			}
		} catch (Exception e) {
			if (log.doError())
				log.error(e.getMessage(), e);
			JSONObject obj = new JSONObject();
			try {
				obj.put("error", e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error.", e);
			}

			if (callback == null) {
				return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
						.entity(obj).type(MediaType.APPLICATION_JSON).build();
			} else {
				return Response.ok()
						.entity(RestUtils.INSTANCE.getJSONP(callback, obj))
						.type(RestConstants.JSONP_MIME_TYPE).build();
			}

		}
	}

	@Path("{params:.*}")
	@GET
	@Produces({ MediaType.APPLICATION_JSON, RestConstants.JSONP_MIME_TYPE })
	public Response getSessionContext(@PathParam("params") String params,
			@Context UriInfo ui, @Context HttpHeaders hh,
			@QueryParam("callback") String callback) throws ForbiddenException,
			UnauthorizedException {
		if (log.doDebug())
			log.entry();
		checkRequestAuthorization(req);
		filterRequest(req, null, null, null);

		MultivaluedMap<String, String> queryParams = ui.getQueryParameters();
		MultivaluedMap<String, String> headerParams = hh.getRequestHeaders();

		String[] datanames = {};
		if (params != null || params.length() > 0) {
			datanames = params.split("/");
		}
		try {
			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put("error", "Session expired.");
				return Response.status(Status.BAD_REQUEST).entity(json).build();
			}
			json = RestUtils.INSTANCE.getSessionContextJSON(req);

			if (log.doDebug())
				log.debug("Session Context : " + json.toString());

			if (datanames.length == 0) {
				if (callback == null) {
					return Response.ok().entity(json)
							.type(MediaType.APPLICATION_JSON).build();
				} else {
					return Response
							.ok()
							.entity(RestUtils.INSTANCE.getJSONP(callback, json))
							.type(RestConstants.JSONP_MIME_TYPE).build();
				}
			}

			Object obj = RestUtils.INSTANCE.getHierarchyContextData(json,
					datanames);

			if (obj == null) {
				JSONObject result = new JSONObject();
				result.put("error", "Object not found.");
				return Response.status(Status.NOT_FOUND).entity(result)
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

					filterResponse(req, null, null, result);

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

							if (callback == null) {
								return Response
										.ok(part.getJSONArray(RestConstants.PAGINATION_RESULT_KEY),
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

					if (callback == null) {
						return Response.ok(result, MediaType.APPLICATION_JSON)
								.build();
					} else {
						return Response
								.ok()
								.entity(RestUtils.INSTANCE.getJSONP(callback,
										result))
								.type(RestConstants.JSONP_MIME_TYPE).build();
					}
				} else {
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
				obj.put("error", e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error.", e);
			}

			if (callback == null) {
				return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
						.entity(obj).type(MediaType.APPLICATION_JSON).build();
			} else {
				return Response.ok()
						.entity(RestUtils.INSTANCE.getJSONP(callback, obj))
						.type(RestConstants.JSONP_MIME_TYPE).build();
			}

		}
	}

	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	@Consumes({ MediaType.APPLICATION_JSON })
	public Response postSessionContext(JSONObject post)
			throws ForbiddenException, UnauthorizedException {
		if (log.doDebug())
			log.entry();
		checkRequestAuthorization(req);
		filterRequest(req, null, null, post);

		String[] datanames = {};
		try {
			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put("error", "Session expired.");
				return Response.status(Status.BAD_REQUEST).entity(json).build();

			}
			json = RestUtils.INSTANCE.getSessionContextJSON(req);
			log.info("Session Context : " + json.toString());

			boolean result = RestUtils.INSTANCE.updateHierarchyContextData(
					json, datanames, post);

			if (result) {
				JSONObject error = validateSessionContext(req, json);
				if (error.optBoolean("validationError", true)) {
					return Response.ok().entity(error)
							.type(MediaType.APPLICATION_JSON).build();
				} else {
					RestUtils.INSTANCE.setSessionContext(req, json);
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
				obj.put("error", e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error.", e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	@Path("/{params:.*}")
	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	@Consumes({ MediaType.APPLICATION_JSON })
	public Response postSessionContext(@PathParam("params") String params,
			JSONObject post) throws ForbiddenException, UnauthorizedException {
		if (log.doDebug())
			log.entry();
		checkRequestAuthorization(req);
		filterRequest(req, null, null, post);

		String[] datanames;
		datanames = params.split("/");
		try {
			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put("error", "Session expired.");
				return Response.status(Status.BAD_REQUEST).entity(json).build();

			}
			json = RestUtils.INSTANCE.getSessionContextJSON(req);
			if (log.doDebug())
				log.debug("Session Context : " + json.toString());

			boolean result = RestUtils.INSTANCE.updateHierarchyContextData(
					json, datanames, post);

			if (result) {
				JSONObject error = validateSessionContext(req, json);
				if (error.optBoolean("validationError", true)) {
					return Response.ok().entity(error)
							.type(MediaType.APPLICATION_JSON).build();
				} else {
					RestUtils.INSTANCE.setSessionContext(req, json);
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
				obj.put("error", e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error.", e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	@PUT
	@Produces({ MediaType.APPLICATION_JSON })
	@Consumes({ MediaType.APPLICATION_JSON })
	public Response updateSessionContext(JSONObject post)
			throws ForbiddenException, UnauthorizedException {
		return postSessionContext(post);
	}

	@Path("/{params:.*}")
	@PUT
	@Produces({ MediaType.APPLICATION_JSON })
	@Consumes({ MediaType.APPLICATION_JSON })
	public Response updateSessionContext(@PathParam("params") String params,
			JSONObject post) throws ForbiddenException, UnauthorizedException {
		return postSessionContext(params, post);
	}

	@Path("/{params:.*}")
	@DELETE
	@Produces({ MediaType.APPLICATION_JSON })
	public Response removeSessionContext(@PathParam("params") String params)
			throws ForbiddenException, UnauthorizedException {
		if (log.doDebug())
			log.entry();
		checkRequestAuthorization(req);
		filterRequest(req, null, null, null);

		String[] datanames;
		try {
			if (params == null || params.length() <= 0) {
				return Response.status(Status.BAD_REQUEST)
						.type(MediaType.APPLICATION_JSON).build();
			} else {
				log.info("Try to remove the specified list member in operation context.");
				datanames = params.split("/");
			}

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put("error", "Session expired.");
				return Response.status(Status.BAD_REQUEST).entity(json).build();

			}
			json = RestUtils.INSTANCE.getSessionContextJSON(req);
			log.info("Session Context : " + json.toString());

			boolean result = RestUtils.INSTANCE.removeHierarchyContextData(
					json, datanames);

			if (result) {
				JSONObject error = validateSessionContext(req, json);
				if (error.optBoolean("validationError", true)) {
					return Response.ok().entity(error)
							.type(MediaType.APPLICATION_JSON).build();
				} else {
					RestUtils.INSTANCE.setSessionContext(req, json);
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
				obj.put("error", e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error.", e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	@Path("/establish")
	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	public Response establishSession() throws ForbiddenException,
			UnauthorizedException {
		if (log.doDebug())
			log.entry();
		checkRequestAuthorization(req);
		filterRequest(req, null, null, null);
		try {
			JSONObject json = RestUtils.INSTANCE.establishSession(req, resp);

			filterResponse(req, null, null, json);
			return Response.ok().entity(json).type(MediaType.APPLICATION_JSON)
					.build();
		} catch (Exception e) {
			if (log.doError())
				log.error("Failed to establish session.", e);
			JSONObject obj = new JSONObject();
			try {
				obj.put("error", "Failed to establish session.");
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error.", e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	@Path("/logout")
	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	public Response logout() {

		String sessionId;

		try {

			sessionId = req.getSession(false).getId();

			if (sessionId != null) {
				SessionEntry se = CSSessionHandler.getSession(sessionId);
				if (se != null) {
					HttpSession hs = se.getHttpSession();
					if (hs != null) {
						hs.invalidate();
					}
					CSSessionHandler.removeSession(sessionId);
				}
				if (log.doDebug())
					log.debug("Logged out session id : " + sessionId);
			}
		} catch (BTTSMException e) {
			e.printStackTrace();
			JSONObject obj = new JSONObject();
			try {
				obj.put(RestConstants.ERRORFLAG, e.getMessage());
			} catch (JSONException e1) {
				e1.printStackTrace();
			}
			return Response.status(Response.Status.NOT_FOUND).entity(obj)
					.type(MediaType.APPLICATION_JSON).build();
		} catch (Exception e) {
			e.printStackTrace();
			JSONObject obj = new JSONObject();
			try {
				obj.put(RestConstants.ERRORFLAG, e.getMessage());
			} catch (JSONException e1) {
				e1.printStackTrace();
			}
			return Response.status(Response.Status.NOT_FOUND).entity(obj)
					.type(MediaType.APPLICATION_JSON).build();
		}

		return Response.ok().type(MediaType.APPLICATION_JSON).build();
	}

	private JSONObject validateSessionContext(HttpServletRequest req,
			JSONObject newCtx) throws JSONException {
		JSONObject valid = new JSONObject();

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

		try {
			com.ibm.btt.base.Context sc = RestUtils.INSTANCE
					.getSessionContext(req);
			if (validateContext(sc, kc, DSEHtmlProcessor.HTML)) {
				valid.put(RestConstants.ERRORFLAG, false);
			} else {
				valid.put(RestConstants.ERRORFLAG, true);
				valid.putOpt(RestConstants.VALIDATION_SINGLE_ERROR_KEY,
						getSingleFieldErrorMessages(sc));
				valid.putOpt(RestConstants.VALIDATION_CROSS_ERROR_KEY,
						getCrossFieldErrorMessages(sc));
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				valid.put(RestConstants.VALIDATION_ERROR_KEY, true);
				JSONArray arr = new JSONArray();
				JSONObject err = new JSONObject();
				err.put("0", e.getMessage());
				arr.add(err);
				valid.put("dse_errorMessages", arr);
			} catch (JSONException e1) {
				e1.printStackTrace();
			}
		}
		return valid;
	}
}
