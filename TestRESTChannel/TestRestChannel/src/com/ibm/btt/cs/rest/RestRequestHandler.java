/*_
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 1998,2012
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */
package com.ibm.btt.cs.rest;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;

import com.ibm.btt.automaton.html.DSEHtmlProcessor;
import com.ibm.btt.automaton.html.DSEHtmlProcessorOperation;
import com.ibm.btt.base.BTTLog;
import com.ibm.btt.base.BTTLogFactory;
import com.ibm.btt.base.BTTOperation;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.DSEException;
import com.ibm.btt.base.DSEInvalidRequestException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.DataField;
import com.ibm.btt.base.JavaExtensions;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.ServerOperation;
import com.ibm.btt.channel.ChannelInitializer;
import com.ibm.btt.channel.HandlerUtils;
import com.ibm.btt.clientserver.ChannelContext;
import com.ibm.btt.clientserver.DSECSSessionNotEstablishedException;
import com.ibm.btt.clientserver.DSENoRegisteredPresentationHandlerException;
import com.ibm.btt.clientserver.PresentationHandler;
import com.ibm.btt.cs.ajax.AjaxHtmlRequestHandler;
import com.ibm.btt.cs.html.HtmlConstants;
import com.ibm.btt.cs.html.RequestValidationServices;
import com.ibm.btt.cs.html.remote.RemoteConstant;
import com.ibm.btt.cs.html.util.SessionHandler;
import com.ibm.btt.sm.AjaxRequestData;
import com.ibm.btt.sm.CSSessionHandler;
import com.ibm.btt.sm.ProcessorCounter;
import com.ibm.btt.sm.SessionEntry;
import com.ibm.btt.utils.StringUtils;

public class RestRequestHandler extends AjaxHtmlRequestHandler {
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
	private static BTTLog log = BTTLogFactory.getLog(RestRequestHandler.class
			.getName());
	private Hashtable clientSettings = new Hashtable();

	@Override
	public void processSessionRequest(ChannelContext channelContext) {
		if (log.doDebug()) {
			log.entry();
		}

		PresentationHandler presHandler = null;
		ServerOperation theOperation = null;
		try {
			presHandler = (PresentationHandler) getPresentationHandler(channelContext);
			try {
				theOperation = executeSessionRequest(channelContext);

				if (theOperation != null) {

					// set the next page id for the client
					// String nextPageId =
					// getRVS(channelContext).getNextPageId((String)
					// theOperation.getValueAt(HtmlConstants.SESSIONID)) ; //
					// comment for resolve warning
					String nextPageId = RequestValidationServices
							.getNextPageId((String) theOperation
									.getValueAt(HtmlConstants.SESSIONID));
					// get the session ctx. It must have been created by the
					// operation

					Context sessionCtx = SessionHandler
							.getCurrentContextForSession(getSessionId(channelContext));

					if (sessionCtx == null) {
						// The session ctx has not been created. The pageId will
						// be setted in the operation ctx.
						sessionCtx = theOperation.getContext();
					}
					// add the consequentiality information to the session ctx
					addFieldTo(sessionCtx, HtmlConstants.PAGEID, nextPageId);
				}

				presHandler.processReply(channelContext, theOperation);

			} catch (Exception e) {
				if (log.doError()) {
					log.error(RestConstants.ERROR_KEY, e);
				}

				try {
					// Remove the dummy session
					String sessionType = CSSessionHandler
							.getTypeForSession(getSessionId(channelContext));
					if (sessionType != null
							&& (sessionType.toString())
									.equals(HtmlConstants.DUMMYSESSIONTYPE))
						CSSessionHandler
								.removeSession(getSessionId(channelContext));
				} catch (DSEException sessionExc) {
					// Session not existing. Go on with the exception handling
					if (log.doWarn()) {
						log.warn("warn", sessionExc);
					}
				}

				presHandler.processException(channelContext, e);
			}
		} catch (Exception e) {
			if (log.doError()) {
				log.error(RestConstants.ERROR_KEY, e);
			}

			try {
				// Remove the dummy session
				String sessionType = CSSessionHandler
						.getTypeForSession(getSessionId(channelContext));
				if (sessionType != null
						&& (sessionType.toString())
								.equals(HtmlConstants.DUMMYSESSIONTYPE))
					CSSessionHandler
							.removeSession(getSessionId(channelContext));
			} catch (DSEException sessionExc) {
				// Session not existing. Go on with the exception handling
				if (log.doWarn()) {
					log.warn("warn", sessionExc);
				}
			}

			handleException(channelContext, e);
		}

		if (theOperation != null)
			endSessionRequest(theOperation);

		return;
	}

	@Override
	public ServerOperation executeSessionRequest(ChannelContext channelContext)
			throws Exception {
		HttpServletRequest req = getOrgRequest(channelContext);

		// ------
		// Obtain an all alpha session id!
		// ------
		String sessionId = getSessionId(channelContext);

		SessionEntry oldEntry = CSSessionHandler.getSession(sessionId);
		if (oldEntry != null) {
			Context sessionCtx = com.ibm.btt.channel.SessionHandler
					.findCurrentContextForSession(sessionId);
			if (sessionCtx != null) {
				sessionCtx.prune();
			}
			CSSessionHandler.removeSession(sessionId);
		}

		// find client settings key for current device type
		String clientSettingsKey = (String) HandlerUtils.findRegistryValue(
				channelContext.getDeviceType(), "clientSettings");
		clientSettings = (Hashtable) ChannelInitializer.getSettings()
				.getValueAt(clientSettingsKey);
		DataField startupOp = (DataField) clientSettings.get("startUpOp");
		DataField homepage = (DataField) clientSettings.get("homePage");
		DataField errorpage = (DataField) clientSettings.get("errorPage");
		DataField filepath = (DataField) clientSettings.get("filePath");

		// ------
		// Get the name of the operation which will establish a context that is
		// used
		// for this session's data, then read the operation from the external
		// files.
		// ------
		// ======= req 26 ....
		String establishSessionOp = null;

		if (channelContext.getRequestData().tryGetElementAt(
				RemoteConstant.IN_REMOTE_CALL_KEY) != null)
			establishSessionOp = (String) ChannelInitializer.getSettings()
					.tryGetValueAt(RemoteConstant.REMOTE_STARTUP_OP);

		if (establishSessionOp == null && startupOp != null)
			establishSessionOp = startupOp.getValue().toString();

		BTTServerOperation operation = (BTTServerOperation) BTTServerOperation
				.readObject(establishSessionOp);

		// ------
		// Save the sessionId and pageId in the operation context.
		// ------
		Context opCtx = operation.getContext();
		// add the reply page: Obtain the start page name from the Settings
		// (btt.xml) and
		// set the response page name in the context.
		addFieldTo(opCtx, HtmlConstants.REPLYPAGE, (String) homepage.getValue());

		// add errorMessages
		addFieldTo(opCtx, HtmlConstants.ERRORMESSAGES, new String[0]);

		// ------
		// Run the operation which establishes and saves the session context.
		// ------
		addFieldTo(opCtx, HtmlConstants.SESSIONID, sessionId);

		// ------
		// Prepare the operation context for the application session id
		// ------
		addFieldTo(opCtx, HtmlConstants.APPLICATIONID, HtmlConstants.IGNORE);

		// ------
		// Save the error page for the initialization step in case of error
		// occurred in the validation time
		// ------
		addFieldTo(opCtx, HtmlConstants.ERRORPAGE,
				(String) errorpage.getValue());

		// ------
		// Save the basePath from the settings
		// ------
		addFieldTo(opCtx, HtmlConstants.JSPBASEPATH,
				(String) filepath.getValue());

		// -------
		// Create the extrapath field in the context
		// -------
		addFieldTo(opCtx, HtmlConstants.EXTRAPATHINFO, "");

		// -------
		// Create the locale field in the context
		// -------
		setLocale(req, opCtx);

		// ------
		// Now we need to update the operation context with data from the form
		// which was added by the
		// user. First, get the keyed collection with this data.
		// ------
		KeyedCollection kcReqData = (KeyedCollection) channelContext
				.getRequestData().getElementAt(HtmlConstants.DATAKEY);
		// kcReqData.removeElementAt("callback");
		if (operation.updateContext(kcReqData, DSEHtmlProcessor.HTML) != false) {

			// ------
			// Save a reference to the operation context in the request to make
			// it available to the JSP.
			// ------

			req.setAttribute(HtmlConstants.OPERATIONCONTEXT,
					operation.getContext());
			operation.runInSession(sessionId);
			SessionEntry se = new SessionEntry(req.getSession());
			se.setSessionId(getSessionId(channelContext));
			se.setTimeStamp(new Long(System.currentTimeMillis()));
			se.setCurrentContext(operation.getContext().getParent());
			CSSessionHandler.addSession(se);

			addRequiredDataToSessionCtx(sessionId, req);

			/**
			 * this fake processor id is used maintain a processor counter that
			 * will handle all the Ajax request that directly run under session
			 */
			String fakeProcId = JavaExtensions.getAlphaUniqueCode();
			se.put(HtmlConstants.FAKE_AJAX_PROCID, fakeProcId);

			ProcessorCounter pc = new ProcessorCounter();
			se.setProcInfo(fakeProcId, pc);
		} else {

			// Some problem occured with the validation of the received data
			operation = null;
			req.setAttribute(HtmlConstants.OPERATIONCONTEXT, opCtx);

		}

		// ------
		// Update the timestamp of the current session and check the session
		// table for expired sessions
		// ------

		//
		// if (usingCookies(channelContext)) {
		// Context.setTimeStampForSession(sessionId, null);
		// } else {
		// Context.setTimeStampForSession(sessionId, new
		// Long());
		// }

		// New for making RVS one instance per session instead of a static
		// common one
		SessionEntry se = SessionHandler.getSession(sessionId);
		se.put(HtmlConstants.RVS, new RequestValidationServices());

		return operation;
	}

	protected void addRequiredDataToSessionCtx(String sessionId,
			HttpServletRequest req) {
		// ------
		// Place the value from Settings (btt.xml) specified for filePath. This
		// path
		// will be used as a relative path from the web root directory to locate
		// web resources (ie JSP files).
		// ------
		try {
			// add the sessionId
			Context seCtx = SessionHandler
					.getCurrentContextForSessionOrApplication(sessionId);

			addFieldTo(seCtx, HtmlConstants.SESSIONID, sessionId);

			DataField filepath = (DataField) clientSettings.get("filePath");

			// add the jspBasePath and the sessionExtraPathInfo
			String viewBasePath = (String) filepath.getValue();

			addFieldTo(seCtx, HtmlConstants.JSPBASEPATH, viewBasePath);

			// NLS managing
			try {

				seCtx.getValueAt(HtmlConstants.LOCALE);

			} catch (DSEObjectNotFoundException objnf) {
				if (log.doDebug()) {
					log.debug("No locale defined, using the request locale or default ");
				}
				setLocale(req, seCtx);
			}
		} catch (Exception e) {
			if (log.doError()) {
				log.error(RestConstants.ERROR_KEY, e);
			}
		}
	}

	public void processNavigation(ChannelContext channelContext)
			throws Exception {
		RestPresentationHandler presHandler = (RestPresentationHandler) getPresentationHandler(channelContext);
		BTTServerOperation theOperation = null;
		String sessionId, applicationId;
		boolean isProcessorOp = false;
		try {
			preProcessRequest(channelContext);
			theOperation = (BTTServerOperation) executeRequest(channelContext);

			if (theOperation == null) {
				// There have been validation errors
				presHandler.processReply(channelContext, null);
			} else {
				if (theOperation instanceof DSEHtmlProcessorOperation)
					isProcessorOp = true;

				sessionId = (String) theOperation
						.getValueAt(HtmlConstants.SESSIONID);
				applicationId = (String) theOperation
						.getValueAt(HtmlConstants.APPLICATIONID);
				setNextPageId(channelContext, theOperation, sessionId,
						applicationId, presHandler);

				if (isProcessorOp)
					saveProcessor((DSEHtmlProcessorOperation) theOperation,
							sessionId, applicationId);

				presHandler.processReply(channelContext, theOperation);
				endRequest(channelContext);

				if (isProcessorOp)
					putProcessorIntoCache((DSEHtmlProcessorOperation) theOperation);

				channelContext.getChannelRequest().setAttribute(
						RestConstants.REST_RESULT_ATTR_KEY,
						presHandler.getResult());
			}
		} catch (Exception e) {
			// let the response show the first initialized exception.
			getPresentationHandler(channelContext).processException(
					channelContext, e);
			endRequest(channelContext);
			throw e;
		}
	}

	public void endRequest(ChannelContext channelContext) {

		try {
			this.commitSessionCtx(channelContext);

			syncRequestEnd(channelContext);
		} catch (DSEObjectNotFoundException onf) {
			String msg = "It has not been possible to close the operation. If current operation is a logoff operation, this message should be ignored.";
			if (log.doWarn()) {
				log.warn(msg, onf);
			}
		} catch (Exception e) {
			try {
				((PresentationHandler) getPresentationHandler(channelContext))
						.processException(channelContext, e);
				syncRequestEnd(channelContext);
			} catch (DSENoRegisteredPresentationHandlerException dsee) {
				if (log.doError()) {
					log.error(RestConstants.ERROR_KEY, dsee);
				}
			} catch (DSEException exc) {
				if (log.doError()) {
					log.error(RestConstants.ERROR_KEY, exc);
				}
			}
		}

	}

	/**
	 * Returns an operation containing either the operation going to be executed
	 * or a processor operation encapsulating the processor to execute. If this
	 * is the case, the processor is initialized before return the operation.
	 * 
	 * @param isProcessorOp
	 *            boolean indicating if the request intends to execute a
	 *            processor or an operation
	 * @param kcReqData
	 *            KeyedCollection created with the info sent from client
	 * @param operationName
	 *            String with the id of the operation or processor that will be
	 *            passed to the right externalizer
	 * @param sessionId
	 *            String
	 * @exception DSECSSessionNotEstablishedException
	 *                The session is expired
	 * @exception DSEInvalidRequestException
	 *                Operation or processor can not be found, instantiated or
	 *                initialized
	 */
	protected BTTServerOperation readOperation(String operationName,
			boolean isProcessorOp, KeyedCollection kcReqData, String sessionId)
			throws DSECSSessionNotEstablishedException,
			DSEInvalidRequestException {
		BTTServerOperation oper = null;
		try {

			if (!isProcessorOp) {
				oper = (BTTServerOperation) BTTOperation
						.readObject(operationName);
			} else {
				// add ProcessorCounter object for each processor when first
				// created
				// it is used to control ajax and html channel request
				// concurrency
				boolean isFirstInit = false;
				Object pidObj = kcReqData
						.tryGetValueAt(HtmlConstants.PROCESSORID);
				if (pidObj == null || pidObj.toString().trim().length() < 1) {
					isFirstInit = true;
				}

				oper = (BTTServerOperation) BTTOperation
						.readObject(HtmlConstants.PROCESSOROPERATIONNAME);
				((DSEHtmlProcessorOperation) oper)
						.initializeProcessor(kcReqData);

				// add a ProcessorCounter align with the new processor
				if (isFirstInit) {
					SessionEntry se = SessionHandler.getSession(sessionId);
					ProcessorCounter pc = new ProcessorCounter();
					pc.getChannelLock(ProcessorCounter.HTML);
					String procId = ((DSEHtmlProcessorOperation) oper)
							.getProcessor().getProcessorId();
					se.setProcInfo(procId, pc);
					// reset the FakeProcessorCounter if it is used before. for
					// the new processor counter
					// will take effect now.
					if (procId != null) {
						String fpid = (String) se
								.get(HtmlConstants.FAKE_AJAX_PROCID);
						ProcessorCounter fakepc = se.getProcCounter(fpid);
						if (fakepc != null
								&& fakepc.getChannelLockOwner() == ProcessorCounter.HTML) {
							fakepc.releaseChannelLock(ProcessorCounter.HTML);
						}

						DataField df = new DataField();
						df.setName(HtmlConstants.PROCESSORID);
						df.setValue(procId);
						kcReqData.addElement(df);
					}
				}
			}
			return oper;

		} catch (DSEObjectNotFoundException dseobjnf) {
			// Trace and throw an exception
			throw new DSECSSessionNotEstablishedException(dseobjnf);
		}

		catch (Exception e) {
			throw new DSEInvalidRequestException(
					DSEException.critical,
					HtmlConstants.SESSIONID,
					new StringBuilder()
							.append("Cannot create operation ")
							.append(operationName)
							.append(". It may not correspond to any defined operation or processor. ")
							.append(e.getMessage()).toString(), e);
		}

	}

	@Override
	protected void syncRequestStart(ChannelContext channelContext)
			throws DSEInvalidRequestException, DSEObjectNotFoundException,
			DSECSSessionNotEstablishedException {
		// check whether the request is under a processor
		String sessionId = SessionHandler.getSessionId(channelContext);
		SessionEntry se = SessionHandler.getSession(sessionId);

		String procId = getProcessorId(channelContext);
		ProcessorCounter pc = null;
		// this means the ajax reqeust is directly run under session,
		// here we use a dummy proc id for control
		if (procId == null) {
			procId = (String) se.get(HtmlConstants.FAKE_AJAX_PROCID);
		}

		if (procId != null) {
			pc = se.getProcCounter(procId);
		}

		if (sessionId == null || se == null) {
			String msg = new StringBuilder()
					.append("Session can not find for ajax request, sessionId=")
					.append(sessionId).append(", processorId=").append(procId)
					.toString();
			throw new DSEObjectNotFoundException(msg);
		}

		if (pc == null) {
			String msg = new StringBuilder()
					.append("Error when Ajax syncRequestStart ! Can not find ProcessorCounter for procId=")
					.append(procId).append(", sessionId=").append(sessionId)
					.toString();
			throw new DSEObjectNotFoundException(msg);
		}
		// default use the processor time out value, it is better to
		// define a ajax request default timeout value in btt.xml
		long timeout = RequestValidationServices.getReqTimeOut();

		if (pc.getChannelLock(ProcessorCounter.HTML)) {
			synchronized (pc) {
				AjaxRequestData data = new AjaxRequestData();
				// just make below instruction is the first between get channel
				// lock.
				// so that to reduce the html & ajax channel cocurrency
				// probability
				pc.addReqData(data);
				// if it is the first ajax request
				KeyedCollection requestData = channelContext.getRequestData();
				// Get the data fields necessary to execute the operation.
				String operName = (String) requestData
						.getValueAt(HtmlConstants.DATAOPERATIONNAME);
				data.setOperationId(operName);
			}
		} else {
			// pending on a semaphore for wait the html channel request finished
			pc.getChannelLocker().waitOn(timeout);
			synchronized (pc) {
				// if ajax channel can get the channel locker, it means the ajax
				// request thread is
				// wake up by the html request
				if (pc.getChannelLock(ProcessorCounter.HTML)) {
					AjaxRequestData data = new AjaxRequestData();
					// just make below instruction is the first between get
					// channel lock.
					// so that to reduce the html & ajax channel cocurrency
					// probability
					pc.addReqData(data);
					// if it is the first ajax request
					KeyedCollection requestData = channelContext
							.getRequestData();
					// Get the data fields necessary to execute the operation.
					String operName = (String) requestData
							.getValueAt(HtmlConstants.DATAOPERATIONNAME);
					data.setOperationId(operName);
				} else {
					// it means that the ajax thread is waked up timeout or
					// other un-expected
					// problems, the html request still own the channel.
					pc.removeAllReqData();
					throw new DSEInvalidRequestException(
							StringUtils
									.contactString("Ajax channel wait timeout occurred, but some html request still in processing, In fact there should not have html request when ajax channel own the channel lock. ajax operation terminated!"));
				}
			}
		}
	}
}
