/*_
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 1998,2012
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */
package com.ibm.btt.cs.rest;

import com.ibm.btt.base.Constants;
import com.ibm.btt.cs.servlet.CSConstants;

/**
 * Symbolic representations of the strings that are used by the Html client are
 * contained in this class.
 * 
 * @copyright(c) Copyright IBM Corporation 2006.
 */
public class RestConstants {
	public static final java.lang.String COPYRIGHT = "Licensed Materials - Property of IBM " + //$NON-NLS-1$
			"Restricted Materials of IBM "
			+ //$NON-NLS-1$
			"5724-H82 "
			+ //$NON-NLS-1$
			"(C) Copyright IBM Corp. 2006 All Rights Reserved. "
			+ //$NON-NLS-1$
			"US Government Users Restricted Rights - Use, duplication or disclosure "
			+ //$NON-NLS-1$
			"restricted by GSA ADP Schedule Contract with IBM Corp "; //$NON-NLS-1$

	/**
	 * The name used in the toolkit to represent the session id. The session and
	 * operation contexts which are used by Html client operations must include
	 * a field which has this name.
	 */
	public static final String SESSIONID = CSConstants.SESSIONIDKEY;

	/**
	 * The name used to save the HttpSession in the operation context when
	 * btt.xml HTMLClient.cookies == true.
	 */
	public static final String HTTPSESSION = "dse_session";

	/**
	 * Every page has a unique (for its session) page id so that requests can be
	 * tracked by the server. There must be a hidden field on each page that has
	 * a form where the toolkit places the page id for the request which the
	 * form will generate when it is posted. The name of this hidden field must
	 * be HtmlConstants.PAGEID.
	 */
	public static final String PAGEID = "dse_pageId";

	/**
	 * When CSReqServlet is called, it fills a keyed collection named
	 * CSConstants.DATAKEY. A hidden field named PARENTCONTEXTNAME must be on
	 * the form to supply the field named parentContextName in this keyed
	 * collection.
	 */
	public static final String PARENTCONTEXTNAME = Constants.PARENTCONTEXTNAME;

	/**
	 * The btt.xml file includes a specified path where web resources will be
	 * obtained by the application server. This path is taken relative to the
	 * web path of the app server. It is referred to internally in the toolkit
	 * by HtmlConstants.JSPBASEPATH.
	 */
	public static final String VIEWBASEPATH = "dse_viewBasePath";

	/**
	 * When a request is issued from a form, the form has a page id on it in a
	 * hidden field. A field in the operation context named
	 * HtmlConstants.CALLINGPAGEID is required for use by the toolkit.
	 */
	public static final String CALLINGPAGEID = "dse_callingPageId";

	/**
	 * When a session is established (by invoking CSEstablishSessionServlet) if
	 * there is any extra data passed on the invokation (eg by calling
	 * CSEstablishSessionServlet/en) then the extra information is saved in the
	 * session in a dynamic field named HtmlConstants.EXTRAPATHINFO.
	 */
	public static final String EXTRAPATHINFO = Constants.EXTRAPATHINFO;

	/**
	 * When a request is issued from a form, the form has a page id on it in a
	 * hidden field. This field is stored as the calling page id for the form.
	 * Upon successful completion of the request, this page id is stored as the
	 * last processed page id, in the variable defined below.
	 */
	public static final String LASTPAGEIDPROCESSED = "dse_lastPageIdProcessed";

	/**
	 * When an operation is run by the toolkit, its context must include a field
	 * HtmlConstants.REPLYPAGE. The operation must place the name of the page to
	 * reply to the client in this field when it executes.
	 */
	public static final String REPLYPAGE = Constants.REPLYPAGE;

	/**
	 * Keyword used to store the requestValidationServices instance of each
	 * session in the application session table.
	 */
	public static final String RVS = "requestValidationServices";

	/**
	 * When the presentation handler is called to process an exception, the
	 * exception is placed in the HttpServletRequest with the key
	 * HtmlConstants.EXCEPTION. The error page can then access the exception by
	 * obtaining the exception from the HttpServletRequest with this key.
	 */
	public static final String EXCEPTION = "dse_exception";

	/**
	 * After an operation executes, its context is saved in the
	 * HttpServletRequest with the key HtmlConstants.OPERATIONCONTEXT. The reply
	 * page can then access the operation results from the context by obtaining
	 * the context from the HttpServletRequest with this key.
	 */
	public static final String OPERATIONCONTEXT = "dse_operCtx";

	/**
	 * When a page wants to specify a particular page to handle validation
	 * errors that occur on it, it should include in a hidden field named
	 * HtmlConstants.ERRORPAGE the name of the page to handle the validation
	 * error.
	 */
	public static final String ERRORPAGE = Constants.ERRORPAGE;

	/**
	 * All the errors that will be displayed for a page and not specific to a
	 * field can be obtained from an array of Strings which is kept in the
	 * context with the key HtmlConstants.ERRORMESSAGES Cross validation errors,
	 * and double click errors fall under this category
	 */
	public static final String ERRORMESSAGES = Constants.ERRORMESSAGES;

	/**
	 * When a page is displayed, the toolkit may have placed any non-fatal
	 * exception in the HttpServletRequest with the key
	 * HtmlConstants.HTMLEXCEPTION. It is up to the JSP author to decide if a
	 * message will be displayed to the user on the page about the exception
	 * which occurred. Normally the exception getCode() method can be called by
	 * the JSP author to obtain more information about the nature of the
	 * non-fatal exception.
	 */
	public static final String HTMLEXCEPTION = "dse_htmlException";

	/**
	 * When an exception is thrown due to a type mismatch on a form, the
	 * exception is saved in the HttpServletRequest with key
	 * HtmlConstants.TYPEEXCEPTION for access by the designated error page.
	 */
	public static final String TYPEEXCEPTION = "dse_typeException";

	/**
	 * The name of the Processor Operation that is to run for a request from an
	 * Html form.
	 */
	public static final String PROCESSOROPERATIONNAME = "dse_htmlProcessorOp";

	/**
	 * The name of a hidden field on a form which is to run under control of a
	 * Processor Operation. The content of this field should specify which event
	 * to pump to the automaton to cause the next operation to be executed.
	 */
	public static final String NEXTEVENTNAME = "dse_nextEventName";

	/**
	 * The name of a hidden field on a form which is submitted for processing by
	 * CSReqServlet which holds the name of the DSEServerOperation to execute.
	 */
	public static final String OPERATIONNAME = Constants.OPERATIONNAME;

	/**
	 * When a non-fatal DSEInvalidRequestException occurs, it may be either an
	 * Aging, a Pending or an Inconsistent processor failure, depending on
	 * whether a request was recently processed for the same page, or if the
	 * server is still processing a prior request for the page. The exception
	 * setCode() method is called to set HtmlConstants.AGINGEXCEPTIONCODE for
	 * Aging errors.
	 */
	public static final String AGINGEXCEPTIONCODE = "Aging";

	/**
	 * When a non-fatal DSEInvalidRequestException occurs, it may be either an
	 * Aging, a Pending or an Inconsistent processor failure, depending on
	 * whether a request was recently processed for the same page, or if the
	 * server is still processing a prior request for the page. The exception
	 * setCode() method is called to set HtmlConstants.PENDINGEXCEPTIONCODE for
	 * Pending errors.
	 */
	public static final String PENDINGEXCEPTIONCODE = "Pending";

	/**
	 * When a non-fatal DSEInvalidRequestException occurs, it may be either an
	 * Aging, a Pending or an Inconsistent processor failure, depending on
	 * whether a request was recently processed for the same page, or if the
	 * server is still processing a prior request for the page, or if the server
	 * is processing a request for this processor. The exception setCode()
	 * method is called to set HtmlConstants.PENDINGEXCEPTIONCODE for Pending
	 * errors.
	 */
	public static final String INCONSISTENTPROCESSOREXCEPTIONCODE = "InconsistentProcessor";

	/**
	 * Field from btt.xml which specifies the name of the default error page to
	 * use when the toolkit has an exception which prevents the normal reply
	 * page from being used.
	 */
	public static final String SETTINGSERRORPAGEKEY = "HTMLClient.errorPage";

	/**
	 * Field from btt.xml which specifies the name of the operation to use when
	 * CSEstablishSessionServlet is invoked.
	 */
	public static final String SETTINGSSTARTUPOPKEY = "HTMLClient.startUpOp";

	/**
	 * Field from btt.xml which specifies the relative path from the application
	 * server web path for web files (jsp files).
	 */
	public static final String SETTINGSFILEPATHKEY = "HTMLClient.filePath";

	/**
	 * Field from btt.xml which specifies the name of the home page to display
	 * when the session is established and the startup op run.
	 */
	public static final String SETTINGSHOMEPAGEKEY = "HTMLClient.homePage";

	/**
	 * Field from btt.xml which specifies the name of the page to display when a
	 * processor finishes and have no finalPage defined.
	 */
	public static final String SETTINGSFINALPAGEKEY = "HTMLClient.finalStatePage";

	/**
	 * Field from btt.xml which specifies the minimum time in seconds between
	 * repeat requests from a given page id in a given session. This value is
	 * intended to help prevent multiple submissions when only one was intended
	 * by the user. The time begins when the server actually completes the
	 * processing of the operation and has called processReply() for the result
	 * page.
	 */
	public static final String MINREQUESTRESUBMITTIME = "HTMLClient.minRequestResubmitTime";

	// Added for JR37577 start
	/**
	 * Field from btt.xml which specifies the request waiting timeout in
	 * milliseconds. This value is used to make sure that there is no http
	 * request waiting on forever. e.g. If a request's waiting time bigger than
	 * the REQUESTWAITINGTIMEOUT value, it will be a request timeout, this
	 * request will be dropped. the default value is 3 minutes
	 */
	public static final String REQUESTWAITINGTIMEOUT = "HTMLClient.requestWaitingTimeout";
	/**
	 * Field from btt.xml which used to optimize the double click proformance.
	 * the value is "true" or "false", default value is "true" If true, the
	 * duplicated double click request will be drop except the last on waiting
	 * on a semaphore with a specific timeout value If false, the duplicated
	 * double click request will be pending on rvs lock in each session
	 */
	public static final String DOUBLECLICKOPTIMIZATION = "HTMLClient.doubleClickOptimization";
	// Added for JR37577 end

	/**
	 * The name of the Processor state which the processor was in when the reply
	 * page was displayed.
	 */
	public static final String PROCESSORSTATE = Constants.PROCESSORSTATE;

	/**
	 * The id of the Processor which ran the operation which displayed the reply
	 * page.
	 */
	public static final String PROCESSORID = Constants.PROCESSORID;

	/**
	 * When CSReqServlet is called, it fills a keyed collection named
	 * CSConstants.DATAKEY.
	 */
	public static final String DATAKEY = CSConstants.DATAKEY;

	/**
	 * When CSReqServlet is called, it fills a keyed collection named
	 * CSConstants.DATAKEY. DATAOPERATIONNAME is the name of the field in this
	 * keyed collection that holds the operation name from the form which was
	 * submitted.
	 */
	public static final String DATAOPERATIONNAME = new StringBuilder()
			.append(DATAKEY).append(".").append(OPERATIONNAME).toString();

	/**
	 * When CSReqServlet is called, it fills a keyed collection named
	 * CSConstants.DATAKEY. DATANEXTEVENTNAME is the name of the field in this
	 * keyed collection that holds the next event name from the form which was
	 * submitted.
	 */
	public static final String DATANEXTEVENTNAME = new StringBuilder()
			.append(DATAKEY).append(".").append(NEXTEVENTNAME).toString();

	/**
	 * When CSReqServlet is called, it fills a keyed collection named
	 * CSConstants.DATAKEY. DATAPARENTCONTEXTNAME is the name of the field in
	 * this keyed collection that holds the parent context from the form which
	 * was submitted.
	 */
	public static final String DATAPARENTCONTEXTNAME = new StringBuilder()
			.append(DATAKEY).append(".").append(PARENTCONTEXTNAME).toString();

	/**
	 * When CSReqServlet is called, it fills a keyed collection named
	 * CSConstants.DATAKEY. DATAPAGEID is the name of the field in this keyed
	 * collection that holds the page id from the form which was submitted.
	 */
	public static final String DATAPAGEID = new StringBuilder().append(DATAKEY)
			.append(".").append(PAGEID).toString();

	/**
	 * When CSReqServlet is called, it fills a keyed collection named
	 * CSConstants.DATAKEY. DATASESSIONIDKEY is the name of the field in this
	 * keyed collection that holds the session id from the form which was
	 * submitted.
	 */
	public static final String DATASESSIONIDKEY = new StringBuilder()
			.append(DATAKEY).append(".").append(SESSIONID).toString();

	/**
	 * Field from btt.xml which specifies the message which must be appended to
	 * the exception thrown when a double click occurs.
	 */
	public static final String SETTINGSDOUBLECLICKMESSAGE = "HTMLClient.doubleClickMessage";

	/**
	 * Field from btt.xml which specifies the message which must be appended to
	 * the exception thrown when an aging exception occurs.
	 */
	public static final String SETTINGSAGINGMESSAGE = "HTMLClient.agingMessage";

	/**
	 * Field from btt.xml which specifies the message which must be appended to
	 * the exception thrown when an inconsistent processor exception occurs.
	 */
	public static final String SETTINGSINCONSISTENTPROCESSORMESSAGE = "HTMLClient.inconsistentProcessorMessage";

	/**
	 * Field added to the operation/processor context to indicate to the
	 * DSEJspContextServices if there has been validation errors. It is updated
	 * by the request handler when detecting there has been val errors.
	 */
	public static final String ERRORFLAG = Constants.ERRORFLAG;

	/**
	 * Field added in order to support the application session feature. This
	 * field represents the string that identifies an specific application
	 * session in the Html client.
	 */
	public static final String APPLICATIONID = Constants.APPLICATIONID;

	/**
	 * Composite field that matches the application id inside the "structure" of
	 * the request data
	 */
	public static final String DATAAPPLICATIONIDKEY = new StringBuilder()
			.append(DATAKEY).append(".").append(APPLICATIONID).toString();

	/**
	 * Constant defined for use in case to set specified field to a null value
	 */
	public static final String IGNORE = Constants.IGNORE;

	/**
	 * Default processes timeout constant
	 */
	public static final String DEFAULTPROCTIMEOUT = "channelHandlers.html.defaultProcessesTimeout";

	/**
	 * Identifier for the dummy session created during the establish session
	 * process.
	 */
	public static final String DUMMYSESSIONTYPE = "dse_DummySession";

	/**
	 * Session Context identifier
	 */
	public static final String SESSIONCONTEXT = "dse_sessionContext";

	/**
	 * Key used to store the table of processors in the sesison context
	 */
	public static final String PROCINFOTABLE = "dse_procInfoTable";

	/**
	 * Key used to store the locale of the machine
	 */
	public static final String LOCALE = Constants.LOCALE;
	/**
	 * Key used to store the locale of the machine
	 */
	public static final String LOCALEDATA = "data.dse_locale";

	/**
	 * Key used to store the delegateValAssessment flag of the transition
	 */
	public static final String DELVALASSESSMENT = "dse_delegateValAssessment";

	public static final String IGNOREVALIDATIONRESULTS = "dse_ignoreValidationResults";
	public static final String INPUTOBJECT = "dse_inputObject";

	public static final String GRIDSELECTIONDATANAME = "dse_grid_selection_dataname";
	/**
	 * this fake processor id is used maintain a processor counter that will
	 * handle all the Ajax request that directly run under session
	 */
	public static final String FAKE_AJAX_PROCID = "ajax.fake_procId";

	public static final String REST_CHANNEL_KEY = "rest";
	public static final String REST_RESULT_ATTR_KEY = "dse_restResult";

	public static final int SESSION_EXPIRED = 1;
	public static final int SESSION_VALID = 0;
	public static final int SESSION_ESTABLISHED = 2;

	public static final String JSONP_MIME_TYPE = "application/javascript";

	public static final String SESSION_ID_KEY = "sid";
	public static final String SORT_KEY = "sort";
	public static final String CALLBACK_KEY = "callback";

	public static final String SESSION_LAST_ACCESSED_TIME_KEY = "dse_LastAccessedTime";
	public static final String SESSION_MAX_INACTIVE_INTERVAL_KEY = "dse_MaxInactiveInterval";

	public static final String PAGINATION_RANGE_START_KEY = "start";
	public static final String PAGINATION_RANGE_END_KEY = "end";
	public static final String PAGINATION_RANGE_KEY = "Range";
	public static final String PAGINATION_RANGE_PREFIX = "[";
	public static final String PAGINATION_RANGE_SUFFIX = "]";
	public static final String PAGINATION_RANGE_KEY_VALUE_DELIMITER = "=";
	public static final String PAGINATION_RANGE_DASH = "-";
	public static final String FORWARD_SLASH_STRING = "/";
	public static final String PAGINATION_REPLY_RANGE_KEY = "Content-Range";
	public static final String PAGINATION_REPLY_ITEMS_KEY = "items ";
	public static final String PAGINATION_RESULT_KEY = "result";

	public static final String VALIDATION_ERROR_KEY = "validationError";
	public static final String VALIDATION_SINGLE_ERROR_KEY = "singleFieldErrors";
	public static final String VALIDATION_CROSS_ERROR_KEY = "crossFieldErrors";
	public static final String ERROR_KEY = "error";

	public static final String SECURITY_ADVICE_KEY = "securityAdvice";
	public static final String PROCESSOR_START_EVENT = "start";

	public static final String SESSION_EXPIRED_ERR_MSG = "Session expired.";

	public static final String JSON_ERR_MSG = "Failed to create JSONObject for error : ";

	/**
	 * HtmlConstants constructor comment.
	 */
	public RestConstants() {
		super();
	}
}
