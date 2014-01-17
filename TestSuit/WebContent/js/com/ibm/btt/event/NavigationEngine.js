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
	//_contentPane : null,
	_containerNode : null,
	
	_sessionId : "",

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
	/*_cover : null,*/

	constructor : function() {
		var _this = this;
		
		if(dojo._postLoad){
			this.postCreate();
			this.onLoad();
		}else{
			dojo.addOnLoad(function() {
				_this.postCreate();
				_this.onLoad();
				dojo.query("script", dojo.body()).forEach(dojo.hitch(this, function(script) {
					if (script.src && dojo.attr(script, "data-btt-eca") === "true") {
						var urls = script.src.split("/");
						urls = urls[urls.length-1];
						urls = urls.substring(0, urls.indexOf("."));
						_this._registerECAEvent(urls, script.src);
					}
				}));
			});
		}
	},

	postCreate : function() {
		// Update page title with NLS
		var head = document.getElementsByTagName('head')[0].innerHTML;
		var titles = head.match(/<title>(.*)<\/title>/i);
		if(titles){
			var newtitle = StringUtil.escapeEnterWrap(I18nUtil.getI18nString(titles[1]));
			document.title = newtitle;
		}
		this.registerCommand("render_page", dojo.hitch(this, this.renderPageHandler));
		this.registerCommand("popup_page", dojo.hitch(this, this.popupPageHandler));
		this.registerCommand("redirect", dojo.hitch(this, this.redirectPage));
		this.registerCommand("remote_flow", dojo.hitch(this, this.remoteFlowHandler));
		this.registerCommand("print", dojo.hitch(this, this.printHandler));
		this.registerCommand("render_sub_page", dojo.hitch(this, this.renderSubPageHandler));
		this.registerCommand("do_nothing", function(){console.info("do nothing is returned from server side.");});
		
		// added for IBK start
		dojo.addOnLoad(dojo.hitch(this, function(){
			//this._initWidgets();
			this.onLoad();
		}));
		// added for IBK end
	},
	
	setRootContainer : function(nodeId){
		var tmpNode = this._getNodeByContainerId(nodeId);
		if (tmpNode) {
			this._containerNode = tmpNode;
		} 
	},
	
	launchNewFlow : function(/*FlowId/OperationId*/operationId, divId){
		if (!operationId) {
			return;
		}
		if (!this._sessionId) {
			this.sessionId = this._findSessionId();
			if(!this._sessionId) {
				return;
			}
		}
		var bttParams = {
			'dse_sessionId' : this._sessionId
		};
		if (operationId) {
			bttParams["dse_operationName"] = operationId;
		}
		bttParams["dse_nextEventName"] = "start";
		if (this._requestData && this._requestData.data["dse_pageId"]) {
			bttParams["dse_pageId"] = this._requestData.data["dse_pageId"];
		} else {
			bttParams["dse_pageId"] = "-1";
		}
		bttParams["dse_applicationId"] = "-1";
		this._submitData(bttParams, this._getNodeByContainerId(divId));
	},
	
	registerRules : function(rules, divId) {
		//override the ECA rule register method
		//remove the implementation to be compatible with older html mode ECA
		
		//for the new application with ajax mode, we should use new API registerECARules to load the eca rules
	},
	
	registerECARules : function(rules, divId, handler) {
		return com.ibm.btt.event.Engine.prototype.registerRules.call(this, rules, divId, handler);
	},
	
	_findSessionId : function(){
		var form = dojo.query('form[widgetId]', dojo.body()).map(dijit.byNode)[0];
		if(!form) {
			return undefined;
		}
		var bttParams = dojo.fromJson(form.bttParams);
		return bttParams["dse_sessionId"];
	},
	
	changeFlowEvent : function(event, container){
		if (!event) {
			return;
		}
		var node = this._getNodeByContainerId(container);
		if (!node) {
			node = this._containerNode;
		}
		var form = dojo.query('form[widgetId]', node).map(dijit.byNode)[0];
		if(!form) {
			return;
		}
		dojo.forEach(form.getDescendants(), function(widget){
			if(widget.onFormSubmit) {
				widget.onFormSubmit();
			}
		});	
		if (form.onFormSubmit) {
			form.onFormSubmit();
		}
		var bttParams = dojo.fromJson(form.bttParams);
		bttParams["dse_nextEventName"] = event;
		var data = form.get("value");
		this._submitData(dojo.mixin(data, bttParams), node);
	},

	_getNodeByContainerId : function(container){
		var node = null;
		if (container) {
			var tmpNode = dijit.byId(container);
			if (tmpNode && tmpNode.containerNode) {
				node = tmpNode.containerNode;
			} else {
				tmpNode = dojo.byId(container);
				if (tmpNode) {
					node = tmpNode;
				} 
			}
		}
		return node;
	},
	
	onLoad : function(e, node) {
		this._delegateAllFormSubmit(node);
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
	_disposeAllWidgets : function(container) {
		var node;
		var tmpNode = this._getNodeByContainerId(container);
		if (tmpNode) {
			node = tmpNode;
		} else {
			node = this._containerNode;
		}
		if (node) {
			//this._destroyContentPane();
			this._destroyDialog();
			dojo.forEach(this._queryAllWidgets(node), function(widget) {
				if(window[widget.id]){
					window[widget.id] = undefined;
				}
				try{
					widget.destroy();
				}catch(e){
					//do nothing, just in case there is a exception thrown out while destroying the widgets
					console.debug("An error occured while destroying the widget[id=" + widget.id + "]. Error:" + e);
				}
			});
			dojo.empty(node);
		} else {
			this._destroyDialog();
			this._destroyCover();

			dojo.forEach(this._queryAllWidgets(), function(widget) {
				if(window[widget.id]){
					window[widget.id] = undefined;
				}
				try{
					widget.destroy();
				}catch(e){
					//do nothing, just in case there is a exception thrown out while destroying the widgets
					console.error("An error occured, while destroying the widget. Error:" + e);
				}
			});
			dojo.empty(dojo.body());
			dijit._masterTT = undefined;
			this._containerNode = dojo.create("div", {style:"width:100%;height:100%"}, dojo.body(), "last");
		}

		if (com.ibm.btt.dijit.keyboards.instances) {
			var keyboards = com.ibm.btt.dijit.keyboards.instances;
			for ( var i = 0; i < keyboards.length; i++) {
				if (keyboards[i] && keyboards[i].destroy) {
					keyboards[i].destroy();
				}
			}
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
	_delegateAllFormSubmit : function(node) {
		var _this = this;
		
		dojo.forEach(this._queryAllWidgets(node), function(widget) {
				
			if(widget.type != "undefined" && (
					widget.type == "save" || widget.type == "cancel")){
				if(!widget.hasEventBundle) {
					var btnClick = widget._onButtonClick;
					widget._onButtonClick = dojo.hitch(_this, _this._onButtonClick, widget, btnClick);
				}
			}
			
			if(widget.domNode.nodeName === "A" ){
				if(!widget.hasEventBundle) {
					var linkClick = widget.onClick;
					widget.onClick = dojo.hitch(_this, _this._onLinkClick, widget, linkClick);
				}
			}
			
			if(widget.domNode.nodeName === "FORM"){
				widget._rawOnSubmit = widget.onSubmit;
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
					var button = widget._querySubmitButton(e);
					dojo.forEach(widget.getDescendants(), function(widget){
						if(widget.onFormSubmit) {
							try{
								//G028  						
								widget.launchNew=false;
								if ( widget instanceof com.ibm.btt.dijit.Grid ){										
									var current_bttparams= dojo.fromJson(widget.bttParam4Link);
									var button_bttparams;
									if (button!=undefined) {
										if (button.bttParams['dse_operationName']!=undefined)
											button_bttparams=button.bttParams;
										else
											button_bttparams= dojo.fromJson(button.bttParams);
										if (current_bttparams['dse_operationName'] !=button_bttparams['dse_operationName'])
											widget.launchNew=true;		
									}
								}///
						
								widget.onFormSubmit();
								
							}catch(e){
								console.error("Error occured while excuting the onFormSubmit events before form submitted.");
							}
						}
					});	
					
					if (widget.onFormSubmit) {
						widget.onFormSubmit();
					}
					_this._submitFormData(widget, button);
					return false;
				});
			}
		});
		
	},
	
	//G028 , check if the button is launching new flow/op 
	_checkNewLaunch : function(form, button){
		
		dojo.forEach(form.getDescendants(), function(widget){
			if(widget.onFormSubmit) {				 					 
					if ( widget instanceof com.ibm.btt.dijit.Grid){	
						widget.launchNew=false;
						//var current_bttparams= dojo.fromJson(widget.bttParam4Link);
						//var button_bttparams= dojo.fromJson(button.bttParams);
						var current_bttparams= typeof widget.bttParam4Link == "string" ? dojo.fromJson(widget.bttParam4Link) : widget.bttParam4Link;
						var button_bttparams= typeof button.bttParams == "string" ? dojo.fromJson(button.bttParams) : button.bttParams;
						if (current_bttparams['dse_operationName'] !=button_bttparams['dse_operationName'])
							widget.launchNew=true;																			 
					}///			 									 
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
	_onLinkClick : function(link, linkClick, e){
		if (link.bttParams) {
			dojo.stopEvent(e);
			if (link.get("target") !== "_blank") {
				var node = this._checkParentContainer(link.domNode);
				this._submitData(typeof link.bttParams == "string" ? dojo.fromJson(link.bttParams) : link.bttParams, node);
			} else {
				window.open(link.domNode.href);
			}
			return false;
		} else if(link.action == "#" || !link.action){
			linkClick.apply(link, [e]);
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
		if(button.get("disabled") == false && (button.type == "submit" || button.type == "cancel" || button.type == "save") ) {
			var form = button._getParentForm();
			if(form)
				form._clickedButton = button;
		}
		else {
			var form = button._getParentForm();
			if(form)
				form._clickedButton = null;
		}
		if (button.type == "save" && button.get("disabled") == false) {
			button._onClick(e);
			e.preventDefault();
			var form = button._getParentForm();
			this._checkNewLaunch (form, button);
			if(form && button.bttParams){
				// Modified for PMR BP34446 - Start
				dojo.forEach(form.getDescendants(), function(widget){
					if(widget.onFormSubmit) {
						widget.onFormSubmit();
					}
				});
				// Modified for PMR BP34446 - End
				if (form.onFormSubmit) {
					form.onFormSubmit();
				}
				var node = this._checkParentContainer(button.domNode);
				this._submitData(dojo.mixin(form.get('validValue'), typeof button.bttParams == "string" ? dojo.fromJson(button.bttParams) : button.bttParams), node);
			}
		} else if (button.type == "cancel" && button.get("disabled") == false) {
			button._onClick(e);
			e.preventDefault();
			if(button.bttParams){
				var node = this._checkParentContainer(button.domNode);
				this._submitData(typeof button.bttParams == "string" ? dojo.fromJson(button.bttParams) : button.bttParams, node);
			}
		} else {
			btnClickMethod.apply(button, [e]);
		}
	},
	
	_checkParentContainer : function(node){
		var tmpNode = node;
		var resNode = null;
		while(tmpNode){
			if (dojo.hasClass(tmpNode, "divFlowContainer")) {
				resNode = tmpNode;
				break;
			}
			tmpNode = tmpNode.parentNode;
		}
		if(resNode && resNode.id) {
			resNode = this._getNodeByContainerId(resNode.id);
		}
		return resNode;
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
			var x = dojo.mixin(form.get('value'), typeof button.bttParams == "string" ? dojo.fromJson(button.bttParams) : button.bttParams);
			x.dse_errorPage = form.bttErrorPage? form.bttErrorPage : null;
			if(x['dse_nextEventName'])
				x[AjaxUtil.constants.BTT_SUBMITFORMID] = form.get("id");
			var node = this._checkParentContainer(button.domNode);
			this._submitData(x, node);
		}else if(form.bttParams){
			var x = dojo.mixin(form.get('value'), typeof form.bttParams == "string" ? dojo.fromJson(form.bttParams) : form.bttParams);
			x.dse_errorPage = form.bttErrorPage? form.bttErrorPage : null;
			if(x['dse_nextEventName'])
				x[AjaxUtil.constants.BTT_SUBMITFORMID] = form.get("id");
			var node;
			if (button) {
				node = this._checkParentContainer(button.domNode);
			} else {
				node = this._checkParentContainer(form.domNode);
			}
			
			this._submitData(x, node);
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
	_submitData : function(data, node){
		if (!data[AjaxUtil.constants.BTT_TIMEZONE]) {
			data[AjaxUtil.constants.BTT_TIMEZONE] = AjaxUtil.getTimzone();
		}
		AjaxUtil.xhrPost( {
			headers : {
				'requesttype':'ajax'
			},
			url : this.url,
			handleAs : "json",
			success : dojo.hitch(this, this._handleFormResponse, node),
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
	_handleFormResponse : function(node, e) {
		var closeCover;
		if (this._commandMap[e["command"]]) {
			try{
				closeCover = this._commandMap[e["command"]](e, node);
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

	/*createContentPane : function(){
		return new com.ibm.btt.dijit.ContentPane({'style':'padding:0px;overflow:auto;',refreshOnShow: false}, dojo.create("div", null, dojo.body(),"last"));
	},*/
	
	/**
	 * 
	 * singleton method to get a contentpane instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	/*_getContentPane : function(data){
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
	},*/
	
	/**
	 * 
	 * destroy the contentpane instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	/*_destroyContentPane : function(){
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
	},*/
	
	createDialog : function(props) {
//		var viewport = dojo.window.getBox();
//		var mxwidth = viewport.w - 50;
//		var mxheight = viewport.h - 50;
		var dialog = new com.ibm.btt.dijit.Dialog(dojo.mixin({
			"title" : "",
//			style : "overflow:auto;max-width:"+mxwidth+"px;max-height:"+mxheight+"px;",
			"closable" : false
		}, props));
//		dojo.style(dialog.containerNode, "overflow", "auto");
		return dialog;
	},
	
	//added for IBK closable dialog event
//	_closeEvent: function( data ){
//		this._submitData( data.prop.bttParams );
//	},
	
	//added for dialog left and top adjustment
	_adjustDialogPosition: function (data){
		var viewport = dojo.window.getBox();
		var top = 0;
		var left = 0;
		var bb = dojo._getBorderBox(this._dialog.domNode);
		if(data.prop==undefined || data.prop.top==undefined){
			top = Math.floor(viewport.t + (viewport.h - bb.h) / 2);
		}else {
			top = data.prop.top;
		}
		if (top < 0){
			top = 0;
		}
		
		if(data.prop==undefined || data.prop.left==undefined){
			left = Math.floor(viewport.l + (viewport.w - bb.w) / 2);
		}else {
			left = data.prop.left;
		}
		if(left < 0){
			left = 0;
		}
		
		// this.set('style', 'left: '+ left +'px; top: '+ top +'px;');
		dojo.style(this._dialog.domNode,{
			left: left + "px",
			top: top + "px"
		});
	},
	
	/**
	 * singleton method to get the dialog instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getDialog : function(data){
		if (!this._dialog) {
			this._dialog = this.createDialog();
			// set top & left
			// this._dialog.connect(this._dialog, "onLoad", this._adjustDialogPosition);
			this._dialog._position = function(){};
			this._dialog.eng = this;
			this._dialog.connect(this._dialog, "onCancel", function(){
				if(this.bttParams){
					this.eng._submitData( this.bttParams );
				}
			});
			this._dialog.startup();
		}
//		else{
//			if (this._dialog.get('open')) {
//				this._dialog.hide();
//			}
//			this._dialog.destroyDescendants();
//		}
		
		var height = "auto";
		var width = "auto";
		var title = "";
		var closable = false;
		var bttParams = undefined;
		if( typeof(data.prop) != "undefined"){
			//set height and width
			// the minimum hieght is 50 px
			if(data.prop.height && data.prop.height>50){
				height = data.prop.height + "px";
			}
			// the minimum width is 100 px
			if(data.prop.width && data.prop.width>100){
				width = data.prop.width + "px";
			}
			
			// set title
			if(data.prop.title != undefined){
				title = data.prop.title;
			}

			// set closable & BTT params
			closable = data.prop.closable?true:false;
			if(closable && data.prop.bttParams != undefined){
				bttParams = data.prop.bttParams;
			}
		}
		data = undefined;
		
		dojo.style(this._dialog.containerNode, {"overflow":"auto", "height":height, "width":width});
		
		if((width+height).indexOf("px")>0)
		{
			this._dialog._size = function(){};
		}
		this._dialog.set("title", StringUtil.escapeEnterWrap(I18nUtil.getI18nString(title)));
		this._dialog.set("closable", closable);
		this._dialog.bttParams = bttParams;

//		if(this._dialogOnLoadEvt){
//			this._unregisterEvents(this._dialogOnLoadEvt);
//		}
//		this._dialogOnLoadEvt = dojo.connect(
//			this._dialog, 
//			'onLoad',
//			this, 
//			dojo.hitch(this, this._afterPageLoaded, data, this._dialog)
//		);
		
//		if(this._dialogOnCloseEvt){
//			this._unregisterEvents(this._dialogOnCloseEvt);
//		}
//		this._dialogOnCloseEvt = dojo.connect(
//			this._dialog, 
//			'onHide',
//			this,
//			dojo.hitch(this, this._closeEvent, data, this._dialog)
//		);

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
//			this._unregisterEvents(this._dialogOnLoadEvt);
//			this._dialogOnLoadEvt = undefined;
			delete this._dialog.eng;
			this._dialog.eng = undefined;
			delete this._dialog.bttParams;
			this._dialog.bttParams = undefined;
//			this._dialog.hide();
			try{
				this._dialog.destroyDescendants();
				this._dialog.destroy();
			}catch(e){
				console.debug("exception @ _destroyDialog: " + e);
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
		return ScreenCover.getInstance();
	},
	
	/**
	 * destroy the cover instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_destroyCover : function(){
		if(ScreenCover._instance){
			ScreenCover._instance.destroy();
			ScreenCover._instance = undefined;
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
			// var _this = this;
			dojo.query("script", container.domNode).forEach(dojo.hitch(this, function(script) {
				// added for IBK start
				this._initWidgetsLite(script, container.domNode);
				// added for IBK end

				if (script.src && this.isECARuleFile(script.src, data["page_name"])) {
					this._registerECAEvent(data["page_name"], script.src);
				}
			}));
		}
		
		this.onLoad(data, container.domNode);
	},
	
	// added for IBK start
	_WCONFIGP : /^\s*window\["dse_widgetsConfig"\]/,
	_initWidgetsLite : function(script, domNode){
//		var content = dojo.trim(script.innerHTML);
//		var target = "window[\"dse_widgetsConfig\"]";
//		if(content.slice(0, target.length) == target){
//			dojo.eval(content);
		if (this._WCONFIGP.test(script.innerHTML)){
			dojo.eval(script.innerHTML);
			// instantiate widgets
			if(window.dse_widgetsConfig){
				for(var idx = window.dse_widgetsConfig.length -1; idx>=0; idx --){
					var config = window.dse_widgetsConfig[idx];
					if(config.id){
						try{
							var node = dojo.byId(config.id);
							if(node) {
								for(var p in config) {
									if(p && p!="id") {
										// dojo.attr(node, p, config[p]);
										// force to set everything to the node attributes rather than the dojo.attr() did
										// note that dojo.parser will ignore any property which is outside of the attributes list
										node.setAttribute(p, config[p]);
									}
								}
							}
							
						} catch(e) {
							console.error(e);
						}
					}
				}
				window.dse_widgetsConfig = undefined;
				dojo.parser.parse(domNode?domNode:dojo.body());
			}
		}
	},
	// added for IBK end
	
	/**
	 * get the ECA js file with ajax request
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_registerECAEvent : function(name, url, divId){
		var xhrArg = {
			url : url,
			handleAs : "text",
			load : dojo.hitch(this, function(e) {
				dojo.eval(e);
				if (window[name]) {
					this.registerECARules(window[name], divId);
					try{						
						delete window[name];
					}catch(e){// failed on IE8
					}
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
		if(dijit._masterTT_BTT && dijit._masterTT_BTT.aroundNode)//defect 29891
			dijit.hiddenBTTTooltip(dijit._masterTT_BTT.aroundNode);
		this._getCover().show();
		this.clearRules();
		this._destroyDialog();

		if (dojo.isOpera)
		{
			dojo.query("*").attr("tabIndex", -1);
		}
		
		// fix for Firefox 3.6.*, the dojo in ContentPane breaks page rendering
		var page = dojo.isFF<4 ? data["page"].replace('src="js/dojo/dojo_BTT.js"', '') : data["page"];
		
		// Update locale for new page
		var test = page.match(/locale:'(.*)'/);
		if(test){
			var newlocale = test[1];
			if(newlocale.length >= 2){
				if(djConfig.locale != newlocale || dojo.locale != newlocale){
					var old1 = djConfig.locale;
					var old2 = dojo.locale;
					if(!this._loadedLocales){
						this._loadedLocales = [];
					}
					if(old1 != old2){
						this._loadedLocales.push(old1);
						this._loadedLocales.push(old2);
					}else{
						this._loadedLocales.push(old1);
					}

					djConfig.locale = newlocale;
					dojo.locale = newlocale;
					console.debug("djConfig.locale : " + old1);
					console.debug("dojo.locale : " + old2);
					console.debug("new locale : " + newlocale);
					
					for(var module in dojo._loadedModules){
						var modulename = "" + module;
						var ms = modulename.split(".nls.");
						if(ms && ms.length >= 2){
							if( !this._containsLocale(ms[1]) && newlocale != "ROOT"){
								// console.debug("Loading new bundle : " + modulename + " " + newlocale);
								try{									
									dojo.requireLocalization(ms[0], ms[1], newlocale, "", "");
								}catch(e){
									console.debug("Fail to load : " + modulename + " " + newlocale);
								}
							}
						}
					}
				}
			}
		}

		var dialog = this._getDialog(data);
		dialog.set('content', page)
			  .then(dojo.hitch(this, this._afterPageLoaded, data, dialog))
			  .then(dojo.hitch(this, function(){
				  dialog.show();
				  this._adjustDialogPosition(data);
			  }));
				
		return dialog;
	},

	renderPageHandler : function(data, node) {
		if(dijit._masterTT_BTT && dijit._masterTT_BTT.aroundNode)//defect 29891
			dijit.hiddenBTTTooltip(dijit._masterTT_BTT.aroundNode);
		
		this._getCover().show();

		var container;
		
		if (node) {
			this.clearRules(node.id);
			this._disposeAllWidgets(node);
			container = node;
		} else {
			this.clearAllRules();
			this._disposeAllWidgets();
			container = this._containerNode;
		}
		
		var page = dojo.isFF < 4?data["page"].replace('src="js/dojo/dojo_BTT.js"', ''): data["page"];
		
		// Update locale for new page
		var test = page.match(/locale:'(.*)'/);
		if(test){
			var newlocale = test[1];
			if(newlocale && newlocale.length > 1){
				if(djConfig.locale != newlocale || dojo.locale != newlocale){
					var old1 = djConfig.locale;
					var old2 = dojo.locale;
					if(!this._loadedLocales){
						this._loadedLocales = [];
					}
					if(old1 != old2){
						this._loadedLocales.push(old1);
						this._loadedLocales.push(old2);
					}else{
						this._loadedLocales.push(old1);
					}

					djConfig.locale = newlocale;
					dojo.locale = newlocale;
					console.debug("djConfig.locale : " + old1);
					console.debug("dojo.locale : " + old2);
					console.debug("new locale : " + newlocale);
					
					for(var module in dojo._loadedModules){
						var modulename = "" + module;
						var ms = modulename.split(".nls.");
						if(ms && ms.length >= 2){
							if( !this._containsLocale(ms[1]) && newlocale != "ROOT"){
								// console.debug("Loading new bundle : " + modulename + " " + newlocale);									
								try{									
									dojo.requireLocalization(ms[0], ms[1], newlocale, "", "");
								}catch(e){
									console.debug("Fail to load : " + modulename + " " + newlocale);
								}
							}
						}
					}
				}
				
				var localeValues = newlocale.split("-");
				if(localeValues && localeValues[0]) {
					var language = localeValues[0];
					var htmlTag = document.getElementsByTagName('html')[0];
					if(htmlTag.getAttribute('lang')) {
						htmlTag.setAttribute('lang', language);
					}
					
					if(htmlTag.getAttribute('xml:lang')) {
						htmlTag.setAttribute('xml:lang', language);
					}
				}
			}
		}
		
		//Update window title
		var titles = page.match(/<title>(.*)<\/title>/i);
		if(titles){
			var newtitle = StringUtil.escapeEnterWrap(I18nUtil.getI18nString(titles[1]));
			console.debug("New page title is " + newtitle);
			document.title = newtitle;
		}
		
		container.innerHTML = page;
		
		// defect 30648 -start
		if(!node) {
			dojo.parser.parse(container);
		} else { // if node is not null or undefined, the page is used for partial refresh(for Q009 Div flow)
			dojo.parser.parse(container, {noStart:true});
			dojo.query("[widgetid]", container).forEach(function(node){
				var widget = node.getAttribute && dijit.byId(node.getAttribute("widgetid"));
				if(widget && dojo.isFunction(widget.startup) && !widget._started) {
					widget.startup();
				}
			});
		}
		// defect 30648 -end
		
		this.updateHash();
		
		if(data["page_name"]){
			dojo.query("script", container).forEach(dojo.hitch(this, function(script) {
				this._initWidgetsLite(script, this._containerNode);
				if (script.src && this.isECARuleFile(script.src, data["page_name"])) {
					this._registerECAEvent(data["page_name"], script.src);
				}
			}));
		}
			
		this.onLoad(data, container);
	},
	
	/**
	 * Check if the modulename contain any previous locales
	 * Yes, return true
	 * None, return false
	 */
	_containsLocale: function(/*String*/ moduleName){
		if(this._loadedLocales){
			for(var i=0; i< this._loadedLocales.length; i++){
				var p1 = dojo.i18n.normalizeLocale(this._loadedLocales[i]);
				var p2 = p1.replace(/\-/g, '_');
				var p3 = p2.substring(0,2);
				var p4 = 'ROOT';
				
				if(moduleName.indexOf(p1) !==-1 || moduleName.indexOf(p2) !==-1 ||moduleName.indexOf(p3) !==-1 ||moduleName.indexOf(p4) !==-1){
					return true;
				}
			}
			return false;
		}
		return false;
	},
	
	remoteFlowHandler: function(data) {
		if(dijit._masterTT_BTT && dijit._masterTT_BTT.aroundNode)//defect 29891
			dijit.hiddenBTTTooltip(dijit._masterTT_BTT.aroundNode);
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
		
		//send the timezone information when remote flow
		if (!submit_data[AjaxUtil.constants.BTT_TIMEZONE]) {
			submit_data[AjaxUtil.constants.BTT_TIMEZONE] = AjaxUtil.getTimzone();
		}
		
		AjaxUtil.xhrPost( {
			headers : {
				'requesttype':'ajax'
			},
			url : submit_data.dse_RemoteSubFlow_URL,  // URL of starting remoteFlow or restoring parent flow
			handleAs : "json",
			success : dojo.hitch(this, this._handleFormResponse, undefined),
			error : dojo.hitch(this, this._handleError)
		}, submit_data);
		 
		return false;
	},

	renderSubPageHandler : function(data) {
		if(dijit._masterTT_BTT && dijit._masterTT_BTT.aroundNode)//defect 29891
			dijit.hiddenBTTTooltip(dijit._masterTT_BTT.aroundNode);
		this._getCover().show();

		for ( var i = 0; i < data.data.length; i++) {
			var divId = data.data[i].divId;
			var node = this._getNodeByContainerId(data.data[i].divId);
			if (!node) {
				return;
			}
			this.clearRules(data.data[i].divId);
			this._disposeAllWidgets(node);
			node.innerHTML = data.data[i].page;
			// defect 30648 -start
			dojo.parser.parse(node, {noStart:true});
			dojo.query("[widgetid]", node).forEach(function(node){
				var widget = node.getAttribute && dijit.byId(node.getAttribute("widgetid"));
				if(widget && dojo.isFunction(widget.startup) && !widget._started) {
					widget.startup();
				}
			});
			// defect 30648 -end
			if(data.data[i]["page_name"]){
				dojo.query("script", node).forEach(dojo.hitch(this, function(script) {
					if (script.src && this.isECARuleFile(script.src, data.data[i]["page_name"])) {
						this._registerECAEvent(data.data[i]["page_name"], script.src, data.data[i].divId);
					}
				}));
			}
			this.onLoad(data, node);
		}
	},
	
	//hanlder for print state
	printHandler : function(data){
		var tmpData = dojo.fromJson(data.page);
		var bttParam = dojo.fromJson(tmpData.bttParams);
		delete tmpData.bttParams;
		var result = document.printApplet.printToDevice(dojo.toJson(tmpData));
		if(result === true || result === "true"){
			bttParam["dse_nextEventName"] = "success";
		} else {
			//alert(result);
			bttParam["dse_nextEventName"] = "error";
		}
		this._submitData(bttParam);
	},
	
	destroy : function(){
		this.inherited(arguments);
		this._commandMap = undefined;
		// this._destroyContentPane();
		// this._destroyDialog();
		this._disposeAllWidgets();
		this._destroyCover();
	}
});

var Engine = {};

Engine.getInstance = function() {
	if(!Engine._instance){
		Engine._instance = new com.ibm.btt.event.NavigationEngine();
	}
	return Engine._instance;
};

Engine.setInstance = function(engine) {
	Engine._instance = engine;
};
