/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.util.AjaxUtil");

(function(){
	
	AjaxUtil = {
		
		ajaxOperationUrl : "Ajax",
		
		constants : {
			"BTT_OPERATIONNAME" : "dse_operationName", 
			"BTT_PAGEID" : "dse_pageId", 
			"BTT_SESSIONID" : "dse_sessionId", 
			"BTT_ERRORPAGE" : "dse_errorPage", 
			"BTT_PROCESSORID" : "dse_processorId",
			"BTT_TIMEZONE" : "dse_timezone",
			"BTT_AJAXINPUTMAP" : "dse_ajaxInputMapping",
			"BTT_AJAXOUTPUTMAP": "dse_ajaxOutputMapping",
			"BTT_SUBMITFORMID" : "dse_submitFormId"
		},
		
		xhrPost : function(request, data) {
			
			request.postData = dojo.toJson(data);
			
			if (typeof request.url == 'undefined') {
				request.url = this.ajaxOperationUrl;
			}
			if (typeof request.handleAs == 'undefined') {
				request.handleAs = "text";
			}
			if (typeof request.success == 'undefined') {
				request.load = function(e) {
					console.info("Ajax request response from ajax channel. " + e);
				};
			} else {
				request.load = request.success;
				delete request.success;
			}
			if (typeof request.error == 'undefined') {
				request.error = function(e) {
					console.info("Ajax request error. " + e);
				};
			}
			dojo.xhrPost(request);
		},
		
		getTimzone : function(){
			var d = new Date();
			return  (-d.getTimezoneOffset() / 60).toString();
		},
		
		prepareBTTParams : function(params){
			var obj = {};
			if (params != undefined) {
				if (params[this.constants.BTT_ERRORPAGE]) {
					obj[this.constants.BTT_ERRORPAGE] = params[this.constants.BTT_ERRORPAGE];
				}
				if (params[this.constants.BTT_OPERATIONNAME]) {
					obj[this.constants.BTT_OPERATIONNAME] = params[this.constants.BTT_OPERATIONNAME];
				}
				if (params[this.constants.BTT_PAGEID]) {
					obj[this.constants.BTT_PAGEID] = params[this.constants.BTT_PAGEID];
				} else {
					obj[this.constants.BTT_PAGEID] = '-1';
				}
				if (params[this.constants.BTT_PROCESSORID]) {
					obj[this.constants.BTT_PROCESSORID] = params[this.constants.BTT_PROCESSORID];
				}
				if (params[this.constants.BTT_SESSIONID]) {
					obj[this.constants.BTT_SESSIONID] = params[this.constants.BTT_SESSIONID];
				}
				if (params[this.constants.BTT_TIMEZONE]) {
					obj[this.constants.BTT_TIMEZONE] = params[this.constants.BTT_TIMEZONE];
				} else {
					obj[this.constants.BTT_TIMEZONE] = AjaxUtil.getTimzone();
				}
				//G025
				if (params[this.constants.BTT_AJAXINPUTMAP])
					obj[this.constants.BTT_AJAXINPUTMAP] = params[this.constants.BTT_AJAXINPUTMAP];
				if (params[this.constants.BTT_AJAXOUTPUTMAP])
					obj[this.constants.BTT_AJAXOUTPUTMAP] = params[this.constants.BTT_AJAXOUTPUTMAP];
			}
			return obj;
		}
		
	};
	
})();