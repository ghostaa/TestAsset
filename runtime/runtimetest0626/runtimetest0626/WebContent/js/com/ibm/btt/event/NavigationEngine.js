/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.event.NavigationEngine");

dojo.require("com.ibm.btt.event.Engine");
dojo.require("com.ibm.btt.dijit.Dialog");
dojo.require("com.ibm.btt.dijit.ScreenCover");


dojo.declare("com.ibm.btt.event.NavigationEngine", [ com.ibm.btt.event.Engine ], {

	
	url : "Request",
	
	/**
	 * An object used to save the registered command type and handler
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_commandMap : {},

	/**
	 * reference of contentpane which is used to render the page return in ajax response
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_contentPane : null,

	/**
	 * reference dialog which is used to render the page return in ajax response
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_dialog : null,
	
	/**
	 * reference screen cover which is used to cover the screen and block user input during the ajax request
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_cover : null,

	constructor : function() {
		var _this = this;
		
		if(dojo._postLoad){
			this.postCreate();
			this.onLoad();
		}else{
			dojo.addOnLoad(function() {
				_this.postCreate();
				_this.onLoad();
			});
		}
	},

	postCreate : function() {
		this.registerCommand("render_page", dojo.hitch(this, this.renderPageHandler));
		this.registerCommand("popup_page", dojo.hitch(this, this.popupPageHandler));
		this.registerCommand("redirect", dojo.hitch(this, this.redirectPage));
		this.registerCommand("remote_flow", dojo.hitch(this, this.remoteFlowHandler));
		this.registerCommand("do_nothing", function(){console.info("do nothing is returned from server side.");});
	},

	onLoad : function(e) {
		this._delegateAllFormSubmit();
		dojo.forEach(
			dojo.filter(dojo.query('form'), function(form){ 
				return form.title && form.title != ""; 
			} ),
			function(form){
				eval(form.title);
			}
		);
		this._getCover().hide();
	},

	setUrl : function(value){
		this.url = value;
	},
	
	registerCommand : function(type, handler) {
		this._commandMap[type] = handler;
	},

	/**
	 * get all widget under specified dome node
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_queryAllWidgets : function(node) {
		if (!node) {
			node = dojo.body();
		}
		return dojo.query('[widgetId]', node).map(dijit.byNode);
	},
	
	/**
	 * destroy all dijit instance in cuerrent page
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_disposeAllWidgets : function() {
		this.clearRules();
		
		if (this._contentPane) {
			this._destroyContentPane();
			this._destroyDialog();
		} else {
			this._destroyDialog();
			this._destroyCover();
			var nodes = this._queryAllWidgets();
			nodes.forEach(function(widget) {
				try{
					widget.destroy();
				}catch(e){
					//do nothing, just in case there is a exception thrown out while destroying the widgets
					console.error("An error occured, while destroying the widget. Error:" + e);
				}
			});
			dojo.empty(dojo.body());
			dijit._masterTT = undefined;
		}
	},

	/**
	 * release event handlers created by dojo.connect
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_unregisterEvents : function(arg, flag) {
		if (flag) {
			while (arg.length > 0) {
				dojo.disconnect(arg.pop());
			}
		} else {
			dojo.disconnect(arg);
		}
	},
	
	/**
	 * Take over all form submission request by engine
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_delegateAllFormSubmit : function() {
		var _this = this;
		
		dojo.forEach(this._queryAllWidgets(), function(widget) {
				
			if(widget.type != "undefined" && (
					widget.type == "save" || widget.type == "cancel")){
				var btnClick = widget._onButtonClick;
				widget._onButtonClick = dojo.hitch(_this, _this._onButtonClick, widget, btnClick);
			}
			
			if(widget.domNode.nodeName === "A" ){
				widget.onClick = dojo.hitch(_this, _this._onLinkClick, widget);
			}
			
			if(widget.domNode.nodeName === "FORM"){				
				widget.onSubmit = dojo.hitch(widget, function(e) {
					if(e){
						if(e.preventDefault){
							e.preventDefault();
						}
						dojo.stopEvent(e);
					}
					if(widget.validateOnSubmit) {
						if(!widget.isValid() || !widget.xValid) return false;
					}
					dojo.forEach(widget.getDescendants(), function(widget){
						if(widget.onFormSubmit) {
							try{
								widget.onFormSubmit();
							}catch(e){
								console.error("Error occured while excuting the onFormSubmit events before form submitted.");
							}
						}
					});	
					var button = widget._querySubmitButton(e);
					if (widget.onFormSubmit) {
						widget.onFormSubmit();
					}
					_this._submitFormData(widget, button);
					return false;
				});
			}
		});
		
	},
	
	/**
	 * 
	 * handle the default like click behavior replace with ajax by engine 
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onLinkClick : function(link, e){
		if (link.bttParams) {
			dojo.stopEvent(e);
			if (link.get("target") !== "_blank") {
				this._submitData(dojo.fromJson(link.bttParams));
			} else {
				window.open(link.domNode.href);
			}
		}
	},
	
	/**
	 * 
	 * override the default button click event to take over and submit the request 
	 * with ajax to support "save" and "cancel" type button
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onButtonClick : function(button, btnClickMethod, e){
		if (button.type == "save" && button.get("disabled") == false) {
			button._onClick(e);
			e.preventDefault();
			var form = button._getParentForm();
			if(form && button.bttParams){
				if (form.onFormSubmit) {
					form.onFormSubmit();
				}
				this._submitData(dojo.mixin(form.get('validValue'), dojo.fromJson(button.bttParams)));
			}
		} else if (button.type == "cancel" && button.get("disabled") == false) {
			button._onClick(e);
			e.preventDefault();
			if(button.bttParams){
				this._submitData(dojo.fromJson(button.bttParams));
			}
		} else {
			btnClickMethod.apply(button, [e]);
		}
	},
	
	/**
	 * 
	 * submit for form request with ajax
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_submitFormData : function(form, button) {
		if(button && button.bttParams){
			var x = dojo.mixin(form.get('value'), dojo.fromJson(button.bttParams));
			x.dse_errorPage = form.bttErrorPage? form.bttErrorPage : null;
			this._submitData(x);
		}else if(form.bttParams){
			var x = dojo.mixin(form.get('value'), dojo.fromJson(form.bttParams));
			x.dse_errorPage = form.bttErrorPage? form.bttErrorPage : null;
			this._submitData(x);
		}else{
			console.log("Do not find default BTT Params on form for user press enter operation.");
		}
	},

	/**
	 * send ajax request to btt service
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_submitData : function(data){
		

		if (!data[AjaxUtil.constants.BTT_TIMEZONE]) {
			data[AjaxUtil.constants.BTT_TIMEZONE] = AjaxUtil.getTimzone();
		}
		
		AjaxUtil.xhrPost( {
			headers : {
				'requesttype':'ajax'
			},
			url : this.url,
			handleAs : "json",
			success : dojo.hitch(this, this._handleFormResponse),
			error : dojo.hitch(this, this._handleError)
		}, data);
		this._getCover().show();
	},
	
	/**
	 * error handler if error occured
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleError : function(e, xhr){
		var displayMsg;
		if(xhr){
			//xhr is not null, this error comes from Ajax 
			//maybe it is a http 404 or 500 error 
			//need to check and display the error page if the there is an error page in the response JSON
			var response = xhr.xhr.responseText;
			if (response && response != "") {
				try{
					response = dojo.fromJson(response);
					if (response["page"]) {
						displayMsg = response["page"];
					} 
				}catch(e){
					displayMsg = response;
				}
			} 
		}
		
		if(!displayMsg){
			if (e.message) {
				displayMsg = e.message;
			} else {
				displayMsg = "An error occured. Messsage : " + e;
			}
		}
		
		this._disposeAllWidgets();

		dojo.body().innerHTML = displayMsg;
		
		this._getCover().hide();
	},
	
	/**
	 * 
	 * handler for form data request response
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleFormResponse : function(e) {
		var closeCover;
		if (this._commandMap[e["command"]]) {
			try{
				closeCover = this._commandMap[e["command"]](e);
			}catch(ee){
				this._handleError('An error occured while excuting the handler:'
					+ e["command"] + ' error:' + ee);
			}
		} else {
			this._handleError('Can not find corresponding command handler for command type=\''
									+ e["command"] + '\'');
		}
		
		/*if(e && e["command"] == "remote_flow"){
			// do nothing before remote flow loaded at onLoad().
		}else{*/
			
		/*}*/
		if (closeCover !== false) {
			this._getCover().hide();
		} 
	},

	createContentPane : function(){
		return new com.ibm.btt.dijit.ContentPane({'style':'padding:0px;overflow:auto;',refreshOnShow: false}, dojo.create("div", null, dojo.body(),"last"));
	},
	
	/**
	 * 
	 * singleton method to get a contentpane instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getContentPane : function(data){
		if(!this._contentPane){
			this._contentPane = this.createContentPane();
		}
		if(this._cpOnLoadEvt){
			this._unregisterEvents(this._cpOnLoadEvt);
		}
		if(this._cpOnErrorEvt){
			this._unregisterEvents(this._cpOnErrorEvt);
		}
		this._cpOnErrorEvt = dojo.connect(
			this._contentPane, 
			'onContentError',
			this, 
			dojo.hitch(this, this._afterPageLoaded, data, this._contentPane)
		);
		this._cpOnLoadEvt = dojo.connect(
			this._contentPane, 
			'onLoad',
			this, 
			dojo.hitch(this, this._afterPageLoaded, data, this._contentPane)
		);
		return this._contentPane;
	},
	
	/**
	 * 
	 * destroy the contentpane instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_destroyContentPane : function(){
		if(this._contentPane){
			this._unregisterEvents(this._cpOnLoadEvt);
			this._cpOnLoadEvt = undefined;
			this._unregisterEvents(this._cpOnErrorEvt);
			this._cpOnErrorEvt = undefined;
			try{
				this._contentPane.destroyDescendants();
				this._contentPane.destroy();
			}catch(e){
				//do nothing just in case there is a exception thrown out when destroy the contentpane.
			}
			this._contentPane = undefined;
		}
	},
	
	createDialog : function() {
		var viewport = dojo.window.getBox();
		var width = viewport.w - 50;
		var height = viewport.h - 50;
		var dialog = new com.ibm.btt.dijit.Dialog({
			title : "",
			style : "overflow:auto;max-width:"+width+"px;max-height:"+height+"px;",
			closable : false
		});
		dojo.style(dialog.containerNode, "overflow", "auto");
		return dialog;
	},
	
	/**
	 * singleton method to get the dialog instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getDialog : function(data){
		if (!this._dialog) {
			var viewport = dojo.window.getBox();
			this._dialog = this.createDialog();
		}
		if(this._dialogOnLoadEvt){
			this._unregisterEvents(this._dialogOnLoadEvt);
		}
		this._dialogOnLoadEvt = dojo.connect(
			this._dialog, 
			'onLoad',
			this, 
			dojo.hitch(this, this._afterPageLoaded, data, this._dialog)
		);
		return this._dialog;
	},
	
	/**
	 * 
	 * destroy the dialog instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_destroyDialog : function(){
		if (this._dialog) {
			this._unregisterEvents(this._dialogOnLoadEvt);
			this._dialogOnLoadEvt = undefined;
			this._dialog.hide();
			try{
				this._dialog.destroyDescendants();
				this._dialog.destroy();
			}catch(e){
				//do nothing just in case there is a exception thrown out when destroy the dialog.
			}
			this._dialog = undefined;
		}
	},
	
	/**
	 * 
	 * singleton method to get a cover instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getCover : function(){
		if(!this._cover){
			this._cover = new com.ibm.btt.dijit.ScreenCover();
		}
		return this._cover;
	},
	
	/**
	 * destroy the cover instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_destroyCover : function(){
		if(this._cover){
			this._cover.destroy();
			this._cover = undefined;
		}
	},
	
	isECARuleFile : function(src, fileName) {
		var endWith = function(src, oString) {
			var reg = new RegExp(oString + "$");
			return reg.test(src);
		};
		return endWith(src, fileName + ".js");
	},
	
	/**
	 * 
	 * parse and load the ECA js after page is loaded
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_afterPageLoaded : function(data, container){
		
		if(data["page_name"]){
			var _this = this;
			dojo.query("script", container.domNode).forEach(dojo.hitch(this, function(script) {
				if (script.src && this.isECARuleFile(script.src, data["page_name"])) {
					_this._registerECAEvent(data["page_name"], script.src);
				}
			}));
		}
		
		this.onLoad(data, container);
		
	},
	
	/**
	 * get the ECA js file with ajax request
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_registerECAEvent : function(name, url){
		var xhrArg = {
			url : url,
			handleAs : "text",
			load : dojo.hitch(this, function(e) {
				dojo.eval(e);
				if (window[name]) {
					//this.registerRules(window[name]);
					delete window[name];
				}
			})
		};
		dojo.xhrGet(xhrArg);
	},
	
	/**
	 * parse and generate the next page url for option1
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_parsenextPageUrl: function(e) {
		var data = dojo.fromJson(e.data);
		var url = [ "Request?dse_applicationId=" + data["dse_applicationId"] ];
		url.push("dse_processorId=" + data["dse_processorId"]);
		url.push("dse_sessionId=" + data["dse_sessionId"]);
		url.push("dse_processorState=" + data["dse_processorState"]);
		url.push("dse_nextEventName=" + data["dse_nextEventName"]);
		url.push("dse_operationName=" + data["dse_operationName"]);
		url.push("dse_pageId=" + data["dse_pageId"]);
		return url.join("&");
	},
	
	redirectPage : function(e){
		location.href = this._parsenextPageUrl(e);
	},

	popupPageHandler : function(data) {
		if (dojo.isOpera)
		{
			dojo.query("*").attr("tabIndex", -1);
		}
		var dialog = this._getDialog(data);
		dialog.destroyDescendants();
		dialog.startup();
		if (!dialog.get('open')) {
			dialog.show();			
		}
		
		// fix for Firefox 3.6.*, the dojo in ContentPane breaks page rendering
		var page = dojo.isFF < 4?data["page"].replace('src="js/dojo/dojo_BTT.js"', ''): data["page"];
		
		dialog.set('content', page);
	},

	renderPageHandler : function(data) {
		this._getCover().show();
		
		this._disposeAllWidgets();
		if(this._dialog && this._dialog.get('open')){
			this._dialog.hide();
		}
		var contentPane = this._getContentPane(data);	
		
		// fix for Firefox 3.6.*, the dojo in ContentPane breaks page rendering
		var page = dojo.isFF < 4?data["page"].replace('src="js/dojo/dojo_BTT.js"', ''): data["page"];
		
		contentPane.set('content', page);		
		contentPane.startup();
	},
	
	remoteFlowHandler: function(data) {
		this._getCover().show();
		
		var submit_data = dojo.fromJson(data["data"]);
		console.info("############ remoteFlowHandler : ",submit_data );
	 
		if (submit_data.dse_remoteFlowID) {
			this.url= submit_data.dse_RemoteRequest_URL ; // requst URL of remote flow transactions
			AjaxUtil.ajaxOperationUrl = submit_data.dse_RemoteAjaxOp_URL;
		}			
		else {
			this.url = submit_data.dse_RemoteSubFlow_URL;  //  requst URL parent flow transactions
			AjaxUtil.ajaxOperationUrl = submit_data.dse_remote_parent_AjaxURL;
		}
		
		if (!submit_data[AjaxUtil.constants.BTT_TIMEZONE]) {
			submit_data[AjaxUtil.constants.BTT_TIMEZONE] = AjaxUtil.getTimzone();
		}
		
		AjaxUtil.xhrPost( {
			headers : {
				'requesttype':'ajax'
			},
			url : submit_data.dse_RemoteSubFlow_URL,  // URL of starting remoteFlow or restoring parent flow
			handleAs : "json",
			success : dojo.hitch(this, this._handleFormResponse),
			error : dojo.hitch(this, this._handleError)
		}, submit_data);
		 
		return false;
	},

	destroy : function(){
		this.inherited(arguments);
		this._commandMap = undefined;
		this._destroyContentPane();
		this._destroyCover();
		this._destroyDialog();
	}
});