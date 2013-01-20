/*_
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 1998,2012
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */
package com.ibm.btt.cs.rest;

import java.util.Enumeration;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.btt.automaton.Processor;
import com.ibm.btt.automaton.html.DSEHtmlProcessorOperation;
import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.DSEInvalidArgumentException;
import com.ibm.btt.base.DSEInvalidRequestException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.DataElement;
import com.ibm.btt.base.DataField;
import com.ibm.btt.base.ErrorInfo;
import com.ibm.btt.base.FormatElement;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.TypeConstants;
import com.ibm.btt.channel.ChannelInitializer;
import com.ibm.btt.clientserver.ChannelContext;
import com.ibm.btt.cs.ajax.AbstractPaginationOp;
import com.ibm.btt.cs.ajax.AjaxHtmlPresentationHandler;
import com.ibm.btt.cs.ajax.AjaxUtils;
import com.ibm.btt.cs.html.HtmlConstants;
import com.ibm.btt.cs.html.HtmlPresentationHandler;
import com.ibm.btt.cs.html.util.SessionHandler;
import com.ibm.btt.cs.rest.resource.RestUtils;
import com.ibm.btt.dojo.tag.StrEscapeUtil;
import com.ibm.json.java.JSONArray;
import com.ibm.json.java.JSONObject;

public class RestPresentationHandler extends AjaxHtmlPresentationHandler {
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
	public static final String JSON_FMT = "bttJsonFmt";

	private static BTTLog log = BTTLogFactory
			.getLog(RestPresentationHandler.class.getName());

	private Object result;

	public Object getResult() {
		return result;
	}

	public void setResult(Object result) {
		this.result = result;
	}

	@Override
	public void processException(ChannelContext channelContext,
			Exception exception) {
		// TODO Auto-generated method stub
		super.processException(channelContext, exception);
	}

	@Override
	public void processReply(ChannelContext channelContext, Object operation) {
		HttpServletRequest req = getOrgRequest(channelContext);
		HttpServletResponse res = getOrgResponse(channelContext);

		try {
			Context ctx = (Context) req
					.getAttribute(HtmlConstants.OPERATIONCONTEXT);

			if (operation == null) {
				// Validation Error
				// Convert the context error information to JSON
				JSONObject json = new JSONObject();
				json.put("validationError", "true");
				json.put("singleFieldErrors",
						this.getSingleFieldErrorMessages(ctx));
				json.put("crossFieldErrors",
						this.getCrossFieldErrorMessages(ctx));

				setResult(json);
			} else {
				String flowStatus = "";
				if (operation instanceof DSEHtmlProcessorOperation) {
					Processor proc = ((DSEHtmlProcessorOperation) operation)
							.getProcessor();
					flowStatus = proc.getStatus();
					log.info("Processor status : " + flowStatus);
				}

				BTTServerOperation oper = (BTTServerOperation) operation;

				FormatElement storeFmt = (FormatElement) oper
						.getFormat(JSON_FMT);
				if (storeFmt != null) {
					String jsonStr = storeFmt.format(oper.getContext());
					JSONObject json = JSONObject.parse(jsonStr);
					if (flowStatus.length() > 0) {
						json.put("status", flowStatus);
					}
					setResult(json);
				} else {
					String sessionId = SessionHandler
							.getSessionId(channelContext);
					Context seCtx = SessionHandler
							.getCurrentContextForSessionOrApplication(sessionId);
					Locale loc = (Locale) seCtx
							.getValueAt(HtmlConstants.LOCALE);
					if (loc == null) {
						loc = Locale.getDefault();
					}
					JSONObject json = new JSONObject();
					// add for table pagination support

					String jsonStr = RestUtils.convertToJson(oper.getContext(),
							loc, TypeConstants.CONV_TYPE_HTML);
					json = JSONObject.parse(jsonStr);
					if (flowStatus.length() > 0) {
						json.put("status", flowStatus);
					}
					setResult(json);
				}
			}

		} catch (Exception e) {
			processException(channelContext, e);
		}
	}

	protected String getViewBasePath(Context theContext)
			throws DSEObjectNotFoundException, DSEInvalidRequestException,
			DSEInvalidArgumentException {
		// ------
		// Obtain the jspBasePath, which is relative to the web application
		// web root,
		// and apply it to the name of the file which is to be displayed.
		// By default it is stored in the session ctx, but if we are
		// returning from
		// an op of ending session, this op has the responsibility of
		// copying the field
		// in the op context.
		// If the op ctx does not have this data, it is caught from
		// Settings, but it
		// will not have the extra path info added from the establish
		// session.
		// ------
		Context sessionContext;
		DataElement viewBasePath;
		String sessionId = (String) theContext
				.getValueAt(HtmlConstants.SESSIONID);
		String applicationId = (String) theContext
				.getValueAt(HtmlConstants.APPLICATIONID);
		try {
			if (!(applicationId.equals(HtmlConstants.IGNORE))) {
				sessionContext = SessionHandler.getCurrentContextForSession(
						sessionId, applicationId);
			} else {
				sessionContext = SessionHandler
						.getCurrentContextForSession(sessionId);
			}

			if (sessionContext != null) {
				viewBasePath = (DataField) sessionContext
						.getElementAt(RestConstants.VIEWBASEPATH);
			} else {
				// Maybe the startup operation couldn't be executed and so
				// the session context is not created
				// then the jspBasePath has been saved in the operation
				// context
				viewBasePath = theContext
						.getElementAt(RestConstants.VIEWBASEPATH);
			}
		} catch (DSEObjectNotFoundException noSession) {
			try {
				// If out of session, the operation is responsible of
				// storing the base path in the op ctx
				viewBasePath = (DataField) theContext
						.getElementAt(RestConstants.VIEWBASEPATH);
			} catch (DSEObjectNotFoundException e) {
				// If the session has no base path info, look for it in the
				// Settings. The extrapathinfo will get lost.
				viewBasePath = new DataField();
				viewBasePath.setName(RestConstants.VIEWBASEPATH);
				viewBasePath.setValue(ChannelInitializer.getSettings()
						.getValueAt(HtmlConstants.SETTINGSFILEPATHKEY));
			}
		}
		return (String) viewBasePath.getValue();
	}

	private JSONArray getCrossFieldErrorMessages(Context ctx)
			throws DSEObjectNotFoundException {
		JSONArray errors = new JSONArray();

		String[] errorMessages = (String[]) ctx.getValueAt("dse_errorMessages");

		if (errorMessages != null) {
			for (int i = 0; i < errorMessages.length; i++) {
				errors.add(StrEscapeUtil.escapeForJS(errorMessages[i]));
			}
		}
		return errors;
	}

	private JSONArray getSingleFieldErrorMessages(Context ctx)
			throws DSEInvalidRequestException, DSEObjectNotFoundException {
		JSONArray errors = new JSONArray();
		iterateContext(ctx.getKeyedCollection(), errors);
		return errors;
	}

	private boolean isPaginationTechOp(BTTServerOperation oper) {
		if (oper == null) {
			return false;
		}
		try {
			AbstractPaginationOp techOp = (AbstractPaginationOp) oper;
			return true;
		} catch (ClassCastException e) {
			return false;
		}
	}

	private void iterateContext(DataElement element, JSONArray errors)
			throws DSEObjectNotFoundException {
		if (element instanceof KeyedCollection) {
			KeyedCollection collection = (KeyedCollection) element;
			for (int index = 0; index < collection.size(); index++) {
				DataElement ele = (DataElement) collection.getElementAt(index);
				iterateContext(ele, errors);
			}
		} else if (element instanceof IndexedCollection) {
			IndexedCollection collection = (IndexedCollection) element;
			for (int index = 0; index < collection.size(); index++) {
				DataElement ele = (DataElement) collection.getElementAt(index);
				iterateContext(ele, errors);
			}
		} else if (element instanceof DataField) {
			DataField field = (DataField) element;
			ErrorInfo errorInfo = field.getErrorInfo();
			JSONObject obj = new JSONObject();
			if (errorInfo != null) {
				obj.put("id", field.getCompositeKey());
				JSONArray objarray = new JSONArray();
				Enumeration enumeration = errorInfo.keys();
				boolean isFirst = true;
				while (enumeration.hasMoreElements()) {
					JSONObject ei = new JSONObject();
					String key = (String) enumeration.nextElement();
					ei.put(key, StrEscapeUtil.escapeForJS(errorInfo.get(key)
							.toString()));
					objarray.add(ei);
				}
				obj.put("msg", objarray);
			}
			errors.add(obj);
		}
	}

}
