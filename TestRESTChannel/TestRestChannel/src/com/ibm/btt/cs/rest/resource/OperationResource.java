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

import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.cs.rest.RestConstants;
import com.ibm.btt.cs.rest.exception.ForbiddenException;
import com.ibm.btt.cs.rest.exception.UnauthorizedException;

@Path("operations")
public class OperationResource extends BaseResource {
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
	private static BTTLog log = BTTLogFactory.getLog(OperationResource.class
			.getName());

	@Context
	private HttpServletRequest req;
	@Context
	private HttpServletResponse resp;

	@Path("{operation}")
	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	public Response executeOperation(@PathParam("operation") String opName)
			throws ForbiddenException, UnauthorizedException {
		if (log.doDebug())
			log.entry();

		if (opName == null || opName.length() <= 0) {
			return Response.status(Status.NOT_FOUND).build();
		}

		checkOperationAuthorization(req, opName);
		filterRequest(req, null, null, null);

		JSONObject params = new JSONObject();

		try {
			if (params != null
					&& params.containsKey(RestConstants.NEXTEVENTNAME)) {
				params.remove(RestConstants.NEXTEVENTNAME);
			}

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERRORFLAG,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();
			} else {
				json = RestUtils.INSTANCE.executeOperation(req, resp, opName,
						params);
				filterResponse(req, null, null, json);
				return Response.ok().entity(json)
						.type(MediaType.APPLICATION_JSON).build();
			}

		} catch (Exception e) {
			if (log.doError())
				log.error(e.getMessage(), e);
			JSONObject obj = new JSONObject();
			try {
				obj.put(RestConstants.ERRORFLAG, e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error.", e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	@Path("{operation}")
	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	@Consumes({ MediaType.APPLICATION_JSON })
	public Response executeOperation(@PathParam("operation") String opName,
			JSONObject params) throws ForbiddenException, UnauthorizedException {
		if (log.doDebug())
			log.entry();

		if (opName == null || opName.length() <= 0) {
			return Response.status(Status.NOT_FOUND).build();
		}
		checkOperationAuthorization(req, opName);
		filterRequest(req, null, null, params);

		try {
			if (params != null
					&& params.containsKey(RestConstants.NEXTEVENTNAME)) {
				params.remove(RestConstants.NEXTEVENTNAME);
			}

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERRORFLAG,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();
			} else {
				json = RestUtils.INSTANCE.executeOperation(req, resp, opName,
						params);
				filterResponse(req, null, null, json);
				return Response.ok().entity(json)
						.type(MediaType.APPLICATION_JSON).build();
			}

		} catch (Exception e) {
			if (log.doError())
				log.error(e.getMessage(), e);
			JSONObject obj = new JSONObject();
			try {
				obj.put(RestConstants.ERRORFLAG, e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error.", e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	@Path("{operation}")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getOperationContext(@PathParam("operation") String opName,
			@QueryParam("callback") String callback, @Context HttpHeaders hh)
			throws ForbiddenException, UnauthorizedException {
		if (log.doDebug())
			log.entry();

		if (opName == null || opName.length() <= 0) {
			return Response.status(Status.NOT_FOUND).build();
		}
		checkOperationAuthorization(req, opName);
		filterRequest(req, null, null, null);

		try {

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERRORFLAG,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();
			}
			json = RestUtils.INSTANCE.getOperationContext(req, opName);

			if (json == null) {
				return Response.status(Status.NOT_FOUND)
						.type(MediaType.APPLICATION_JSON).build();
			} else {
				filterResponse(req, null, null, json);
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
		} catch (Exception e) {
			if (log.doError())
				log.error(e.getMessage(), e);
			JSONObject obj = new JSONObject();
			try {
				obj.put(RestConstants.ERRORFLAG, e.getMessage());
			} catch (JSONException e1) {
				if (log.doError())
					log.error("Failed to create JSONObject for error.", e);
			}
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
					.entity(obj).type(MediaType.APPLICATION_JSON).build();
		}
	}

	@Path("{operation}/{params:.*}")
	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public Response getOperationContext(@PathParam("operation") String opName,
			@PathParam("params") String params, @Context UriInfo ui,
			@Context HttpHeaders hh, @QueryParam("callback") String callback)
			throws ForbiddenException, UnauthorizedException {
		if (log.doDebug())
			log.entry();

		MultivaluedMap<String, String> queryParams = ui.getQueryParameters();
		MultivaluedMap<String, String> headerParams = hh.getRequestHeaders();

		String[] datanames;
		if (opName == null || opName.length() <= 0) {
			return Response.status(Status.NOT_FOUND).build();
		}
		if (params == null || params.length() <= 0) {
			return getOperationContext(opName, callback, hh);
		} else {
			datanames = params.split("/");
		}

		checkOperationAuthorization(req, opName);
		filterRequest(req, null, null, null);

		try {

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERROR_KEY,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();
			}
			json = RestUtils.INSTANCE.getOperationContext(req, opName);

			Object obj = RestUtils.INSTANCE.getHierarchyContextData(json,
					datanames);
			if (obj == null) {
				JSONObject result = new JSONObject();
				result.put(RestConstants.ERROR_KEY, "Object not found.");
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
				this.filterResponse(req, null, null, obj);
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

	@Path("{operation}/{params:.*}")
	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	@Consumes({ MediaType.APPLICATION_JSON })
	public Response postOperationContext(@PathParam("operation") String opName,
			@PathParam("params") String params, JSONObject post)
			throws ForbiddenException, UnauthorizedException {
		if (log.doDebug())
			log.entry();
		String[] datanames;
		if (opName == null || opName.length() <= 0) {
			return Response.status(Status.NOT_FOUND).build();
		}
		if (params == null || params.length() <= 0) {
			// execute operation
			if (log.doDebug())
				log.debug("No url parameters, executing the operation now.");
			return executeOperation(opName, post);
		} else {
			datanames = params.split("/");
		}

		checkOperationAuthorization(req, opName);
		filterRequest(req, null, null, post);

		try {

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERROR_KEY,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();

			}
			json = RestUtils.INSTANCE.getOperationContext(req, opName);
			if (log.doDebug())
				log.debug("Operation Context : " + json.toString());

			boolean result = RestUtils.INSTANCE.updateHierarchyContextData(
					json, datanames, post);

			if (result) {
				BTTServerOperation oper = RestUtils.INSTANCE
						.readOperation(opName);
				JSONObject error = validateOperationContext(oper, json);
				if (error.optBoolean(RestConstants.VALIDATION_ERROR_KEY, true)) {
					return Response.ok().entity(error)
							.type(MediaType.APPLICATION_JSON).build();
				} else {
					RestUtils.INSTANCE.setOperationContext(req, opName, json);
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

	@Path("{operation}/{params:.*}")
	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	@Consumes({ MediaType.TEXT_PLAIN })
	public Response postOperationContext(@PathParam("operation") String opName,
			@PathParam("params") String params, String post)
			throws ForbiddenException, UnauthorizedException {
		if (log.doDebug())
			log.entry();

		if (post == null || post.length() <= 0) {
			return Response.status(Status.BAD_REQUEST).build();
		}

		try {
			JSONObject temp = new JSONObject(post);
			if (JSONObject.isValidObject(temp)) {
				postOperationContext(opName, params, temp);
			}
		} catch (JSONException e) {
			// nothing to do here, continue process as String input
		}

		String[] datanames;
		if (opName == null || opName.length() <= 0) {
			return Response.status(Status.NOT_FOUND).build();
		}
		if (params == null || params.length() <= 0) {
			// execute operation
			if (log.doDebug())
				log.debug("No url parameters, executing the operation now.");
			return executeOperation(opName);
		} else {
			datanames = params.split("/");
		}

		checkOperationAuthorization(req, opName);
		filterRequest(req, null, null, post);

		try {

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERROR_KEY,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();

			}
			json = RestUtils.INSTANCE.getOperationContext(req, opName);
			if (log.doDebug())
				log.debug("Operation Context : " + json.toString());

			boolean result = RestUtils.INSTANCE.updateHierarchyContextData(
					json, datanames, post);

			if (result) {
				BTTServerOperation oper = RestUtils.INSTANCE
						.readOperation(opName);
				JSONObject error = validateOperationContext(oper, json);
				if (error.optBoolean(RestConstants.VALIDATION_ERROR_KEY, true)) {
					return Response.ok().entity(error)
							.type(MediaType.APPLICATION_JSON).build();
				} else {
					RestUtils.INSTANCE.setOperationContext(req, opName, json);
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

	@Path("{operation}/{params:.*}")
	@PUT
	@Produces({ MediaType.APPLICATION_JSON })
	@Consumes({ MediaType.APPLICATION_JSON })
	public Response updateOperationContext(
			@PathParam("operation") String opName,
			@PathParam("params") String params, JSONObject post)
			throws ForbiddenException, UnauthorizedException {
		return postOperationContext(opName, params, post);

	}

	@Path("{operation}/{params:.*}")
	@PUT
	@Produces({ MediaType.APPLICATION_JSON })
	@Consumes({ MediaType.TEXT_PLAIN })
	public Response updateOperationContext(
			@PathParam("operation") String opName,
			@PathParam("params") String params, String post)
			throws ForbiddenException, UnauthorizedException {
		return postOperationContext(opName, params, post);
	}

	@Path("{operation}")
	@DELETE
	@Produces({ MediaType.APPLICATION_JSON })
	public Response removeOperationContext(@PathParam("operation") String opName)
			throws ForbiddenException, UnauthorizedException {
		if (log.doDebug())
			log.entry();

		if (opName == null || opName.length() <= 0) {
			return Response.status(Status.NOT_FOUND).build();
		}
		checkOperationAuthorization(req, opName);
		filterRequest(req, null, null, null);

		try {
			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERROR_KEY,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();

			}
			if (log.doDebug())
				log.debug("No path parameters, remove the operation context from session.");
			if (RestUtils.INSTANCE.removeOperationContext(req, opName)) {
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

	@Path("{operation}/{params:.*}")
	@DELETE
	@Produces({ MediaType.APPLICATION_JSON })
	public Response removeOperationContext(
			@PathParam("operation") String opName,
			@PathParam("params") String params) throws ForbiddenException,
			UnauthorizedException {

		if (log.doDebug())
			log.entry();

		String[] datanames;
		if (opName == null || opName.length() <= 0) {
			return Response.status(Status.NOT_FOUND).build();
		}

		checkOperationAuthorization(req, opName);
		filterRequest(req, null, null, null);

		try {
			if (params == null || params.length() <= 0) {
				return removeOperationContext(opName);
			} else {
				if (log.doDebug())
					log.debug("Try to remove the specified list member in operation context.");
				datanames = params.split("/");
			}

			JSONObject json = null;
			if (RestUtils.INSTANCE.checkSession(req, resp) == RestConstants.SESSION_EXPIRED) {
				json = new JSONObject();
				json.put(RestConstants.ERROR_KEY,
						RestConstants.SESSION_EXPIRED_ERR_MSG);
				return Response.status(Status.BAD_REQUEST).entity(json).build();

			}
			json = RestUtils.INSTANCE.getOperationContext(req, opName);

			boolean result = RestUtils.INSTANCE.removeHierarchyContextData(
					json, datanames);

			if (result) {
				BTTServerOperation oper = RestUtils.INSTANCE
						.readOperation(opName);
				JSONObject error = validateOperationContext(oper, json);
				if (error.optBoolean(RestConstants.VALIDATION_ERROR_KEY, true)) {
					return Response.ok().entity(error)
							.type(MediaType.APPLICATION_JSON).build();
				} else {
					RestUtils.INSTANCE.setOperationContext(req, opName, json);
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

	private JSONObject validateOperationContext(BTTServerOperation oper,
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
			if (oper.validate(kc)) {
				valid.put(RestConstants.VALIDATION_ERROR_KEY, false);
			} else {
				valid.put(RestConstants.VALIDATION_ERROR_KEY, true);
				valid.put(RestConstants.VALIDATION_SINGLE_ERROR_KEY,
						getSingleFieldErrorMessages(oper.getContext()));
				valid.put(RestConstants.VALIDATION_CROSS_ERROR_KEY,
						getCrossFieldErrorMessages(oper.getContext()));
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				valid.put(RestConstants.VALIDATION_ERROR_KEY, true);
				JSONArray arr = new JSONArray();
				JSONObject err = new JSONObject();
				err.put("0", e.getMessage());
				arr.add(err);
				valid.put(RestConstants.ERRORMESSAGES, arr);
			} catch (JSONException e1) {
				e1.printStackTrace();
			}
		}
		return valid;
	}
}
