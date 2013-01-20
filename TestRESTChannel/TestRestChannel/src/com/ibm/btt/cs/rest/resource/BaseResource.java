/*_
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 1998,2012
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */
package com.ibm.btt.cs.rest.resource;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.wink.json4j.JSONArray;
import org.apache.wink.json4j.JSONException;
import org.apache.wink.json4j.JSONObject;

import com.ibm.btt.base.BTTClassLoader;
import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.DSEInvalidArgumentException;
import com.ibm.btt.base.DSEInvalidRequestException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.DataElement;
import com.ibm.btt.base.DataField;
import com.ibm.btt.base.ErrorInfo;
import com.ibm.btt.base.Hashtable;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.DSETypeException;
import com.ibm.btt.channel.HandlerUtils;
import com.ibm.btt.clientserver.ChannelContext;
import com.ibm.btt.cs.rest.RestConstants;
import com.ibm.btt.cs.rest.SecurityAdvice;
import com.ibm.btt.cs.rest.exception.ForbiddenException;
import com.ibm.btt.cs.rest.exception.UnauthorizedException;
import com.ibm.btt.dojo.tag.StrEscapeUtil;

/**
 * The base resource class with some common methods
 * 
 */
public class BaseResource {
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
	private static BTTLog log = BTTLogFactory.getLog(BaseResource.class
			.getName());

	/**
	 * Validate new context data against the context, return true for valid,
	 * return false for any mismatch, error or exceptions. Note, this does not
	 * do cross fields validation.
	 * 
	 * @param ctx
	 *            the context
	 * @param kc
	 *            the data to be validated
	 * @param convType
	 *            the conversion type
	 * @return
	 * @throws DSEObjectNotFoundException
	 * @throws DSEInvalidArgumentException
	 */
	public boolean validateContext(Context ctx, KeyedCollection kc,
			String convType) throws DSEObjectNotFoundException,
			DSEInvalidArgumentException {

		if (log.doDebug()) {
			log.debug("Entered validateContext(Context ctx, KeyedCollection kc, String convType)");
		}

		boolean isValid = true;
		// TODO XValidate
		// OperationXValidate validator = getXValidator();

		String qualifiedName = null;
		boolean remoteFlag = kc.tryGetElementAt("dse_remoteFlowID") != null ? true
				: false;

		Hashtable ht = kc.calculeNestedQualifiedElements();
		for (Enumeration enu = ht.keys(); enu.hasMoreElements();) {

			qualifiedName = (String) enu.nextElement();

			if (log.doDebug())
				log.debug("Begin to validate [" + qualifiedName
						+ "] DataElement.");

			DataElement de = (DataElement) kc.getElementAt(qualifiedName);
			// =====req26
			// DataElement ce = ctx.getElementAt(qualifiedName);
			DataElement ce;
			if (remoteFlag)
				ce = ctx.tryGetElementAt(qualifiedName);
			else
				ce = ctx.getElementAt(qualifiedName);
			// end ===

			Object initialValue = de.getValue();

			// =======req26 change start
			if (remoteFlag && ce == null) {
				try {
					if (!qualifiedName.startsWith("dse_remote")) {
						DataField newfield = new DataField();
						newfield.setName(qualifiedName);
						newfield.setValue(de.getValue());
						ctx.getKeyedCollection().addElement(newfield);
					}
				} catch (DSEInvalidRequestException e) {

					e.printStackTrace();
				}

			} else // ====end
			// Perform the semantic validation only for DataFields
			if (de instanceof DataField) {
				try {
					Object value = ce.validate(de.getValue(), convType); // delete
					de.setValue(value); // delete

					// if (validator != null)
					// validator.validate(qualifiedName, (DataField) de, ctx);
					// As both validation has been passed set the input data
					// value to the context
					ce.setValue(value); // delete
				} catch (DSETypeException e) {
					ErrorInfo errorInfo = ce.getErrorInfo();
					if (errorInfo == null) {
						errorInfo = new ErrorInfo(initialValue);
						ce.setErrorInfo(errorInfo);
					} else {
						errorInfo.setInputObject(initialValue);
					}
					errorInfo.put(e.getCode(), e.getMessage());
					// iterate through nested exceptions
					Exception ne = e.getNestedException();
					while (ne != null) {
						// String code=null;
						if (ne instanceof DSETypeException) {
							errorInfo.put(((DSETypeException) ne).getCode(),
									ne.getMessage());
							ne = ((DSETypeException) ne).getNestedException();
						} else
							ne = null;
					}
					ce.setErrorInfo(errorInfo);
					isValid = false;

					if (log.doDebug()) {
						log.debug(qualifiedName, e);
					}
				}
			} // end catch validation exceptions...

		} // end for loop running through data elements

		if (log.doDebug()) {
			log.debug("Exiting validateContext(Context ctx, KeyedCollection kc, String convType)");
		}
		return isValid;
	}

	/**
	 * Iterate through the context to validate each field, then put any
	 * validation errors to the JSONObject for return.
	 * 
	 * @param element
	 *            the starting DataElement
	 * @param json
	 *            the result to be manipulated
	 * @throws DSEObjectNotFoundException
	 * @throws JSONException
	 */
	private void iterateContext(DataElement element, JSONArray json)
			throws DSEObjectNotFoundException, JSONException {
		if (element instanceof KeyedCollection) {
			KeyedCollection collection = (KeyedCollection) element;
			for (int index = 0; index < collection.size(); index++) {
				DataElement ele = (DataElement) collection.getElementAt(index);
				iterateContext(ele, json);
			}
		} else if (element instanceof IndexedCollection) {
			IndexedCollection collection = (IndexedCollection) element;
			for (int index = 0; index < collection.size(); index++) {
				DataElement ele = (DataElement) collection.getElementAt(index);
				iterateContext(ele, json);
			}
		} else if (element instanceof DataField) {
			DataField field = (DataField) element;
			ErrorInfo errorInfo = field.getErrorInfo();
			if (errorInfo != null) {
				Enumeration enumeration = errorInfo.keys();
				JSONArray msgs = new JSONArray();
				while (enumeration.hasMoreElements()) {
					String key = (String) enumeration.nextElement();
					JSONObject msg = new JSONObject();
					msg.put(key, StrEscapeUtil.escapeForJS(errorInfo.get(key)
							.toString()));
					msgs.add(msg);
				}
				JSONObject obj = new JSONObject();
				obj.put("id", field.getCompositeKey());
				obj.put("msg", msgs);
				json.add(obj);
			}
		}
	}

	/**
	 * Retrieve the cross fields validation error messages from specified
	 * Context
	 * 
	 * @param ctx
	 *            the context containing any validation errors messages
	 * @return
	 * @throws DSEObjectNotFoundException
	 */
	public JSONArray getCrossFieldErrorMessages(com.ibm.btt.base.Context ctx)
			throws DSEObjectNotFoundException {
		JSONArray arr = new JSONArray();
		Object errs = ctx.tryGetValueAt(RestConstants.ERRORMESSAGES);
		String[] errors = {};
		if (errs != null) {
			errors = (String[]) errs;
			for (int i = 0; i < errors.length; i++) {
				arr.add(StrEscapeUtil.escapeForJS(errors[i]));
			}
		}
		return arr;
	}

	/**
	 * Retrieve the validation error message of all single field from specified
	 * Context
	 * 
	 * @param ctx
	 *            the context containing validation messages
	 * @return
	 * @throws DSEInvalidRequestException
	 * @throws DSEObjectNotFoundException
	 * @throws JSONException
	 */
	public JSONArray getSingleFieldErrorMessages(com.ibm.btt.base.Context ctx)
			throws DSEInvalidRequestException, DSEObjectNotFoundException,
			JSONException {
		JSONArray arr = new JSONArray();
		iterateContext(ctx.getKeyedCollection(), arr);

		return arr;
	}

	/**
	 * Initialize SecurityDelegate from btt.xml configuration for REST channel
	 * 
	 * @return
	 */
	public SecurityAdvice getSecurityAdvice() {

		String security = null;

		try {
			security = (String) HandlerUtils.findRegistryValue(
					RestConstants.REST_CHANNEL_KEY,
					RestConstants.SECURITY_ADVICE_KEY);
			Object cls = BTTClassLoader.loadClass(security);
			if (null != cls) {
				SecurityAdvice sa = (SecurityAdvice) cls;
				return sa;
			} else {
				return null;
			}

		} catch (Exception e) {
			if (log.doDebug())
				log.debug(security, e);
			return null;
		}
	}

	/**
	 * 
	 * @param req
	 * @throws ForbiddenException
	 * @throws UnauthorizedException
	 */
	public void checkRequestAuthorization(HttpServletRequest req)
			throws ForbiddenException, UnauthorizedException {
		SecurityAdvice sa = getSecurityAdvice();
		if (null != sa) {
			sa.checkAuthorization(req);
		}
	}

	/**
	 * 
	 * @param req
	 * @param operationName
	 * @throws ForbiddenException
	 * @throws UnauthorizedException
	 */
	public void checkOperationAuthorization(HttpServletRequest req,
			String operationName) throws ForbiddenException,
			UnauthorizedException {
		SecurityAdvice sa = getSecurityAdvice();
		if (null != sa) {
			sa.checkAuthorization(req, operationName);
		}
	}

	/**
	 * 
	 * @param req
	 * @param processorName
	 * @param procId
	 * @throws ForbiddenException
	 * @throws UnauthorizedException
	 */
	public void checkProcessorAuthorization(HttpServletRequest req,
			String processorName, String procId) throws ForbiddenException,
			UnauthorizedException {
		SecurityAdvice sa = getSecurityAdvice();
		if (null != sa) {
			sa.checkAuthorization(req, processorName, procId);
		}
	}

	/**
	 * 
	 * @param req
	 * @param processorName
	 * @param procId
	 * @param nextEvent
	 * @throws ForbiddenException
	 * @throws UnauthorizedException
	 */
	public void checkNavigationAuthorization(HttpServletRequest req,
			String processorName, String procId, String nextEvent)
			throws ForbiddenException, UnauthorizedException {
		SecurityAdvice sa = getSecurityAdvice();
		if (null != sa) {
			sa.checkAuthorization(req, processorName, procId, nextEvent);
		}
	}

	/**
	 * Filter the request input data using specified SecurityAdvice. Any of the
	 * parameters may be null.
	 * 
	 * @param req
	 *            the original HttpServletRequest
	 * @param cc
	 *            the BTT ChannelContext dealing with this request
	 * @param ctx
	 *            the Context of the session, operation or processor
	 * @param requestData
	 *            the payload of the request, it would be a JSON object of POST
	 *            request
	 */
	public void filterRequest(HttpServletRequest req, ChannelContext cc,
			com.ibm.btt.base.Context ctx, Object requestData) {
		SecurityAdvice sa = getSecurityAdvice();
		if (null != sa) {
			sa.filterRequest(req, cc, ctx, requestData);
		}
	}

	/**
	 * Filter the response data using specified SecurityAdvice. Any of the
	 * parameters may be null.
	 * 
	 * @param req
	 *            the original HttpServletRequest producing the response
	 * @param cc
	 *            the ChannelContext dealing with the request and response
	 * @param ctx
	 *            the Context of session, operation or processor
	 * @param responseData
	 *            the JSON data to be returned to client
	 */
	public void filterResponse(HttpServletRequest req, ChannelContext cc,
			com.ibm.btt.base.Context ctx, Object responseData) {
		SecurityAdvice sa = getSecurityAdvice();

		if (null != sa) {
			sa.filterResponse(req, cc, ctx, responseData);
		}
	}
}
