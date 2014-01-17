/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2011 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.AbstractAjaxMixin"); 
dojo.require("com.ibm.btt.util.AjaxUtil");

dojo.declare("com.ibm.btt.dijit.AbstractAjaxMixin", null,{
	
	/**
	 * nls bundle
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_bundle : new com.ibm.btt.util.I18nBundle("com.ibm.btt.dijit", "Form"),
	
	/**
	 * BTT channel property, contains the parameters required by the BTT HTML channel.
	 */
	bttParams : "",
	
	/**
	 * The async code is used to identity the Ajax calling. It is a random string input by the developers on the tooling.
	 * 
	 */
	asyncCode : '',
	
	/**
	 * HTML status of the Ajax calling.
	 * 
	 */
	asyncStatus : 0,
	
	/**
	 * XHR error message from the browser.
	 * 
	 */
	asyncErrorMessage :"",
	
	/**
	 * Operation name defined on the server
	 * 
	 */
	asyncOperation : "",
	
	/**
	 * Constants used in the BTT channel.
	 * 
	 */
	
	
	/**
	 * Ajax calling function. 
	 * 
	 * @tag	public
	 * 
	 * @param bttOperationId String variable: BTT operation ID
	 * @param asyncCode String variable: random code for XHR
	 * @param timeout Integer variable: milliseconds for timeout
	 * @param respsContainer the response container id which the response data will be set to
	 */
	callAsyncOperation : function(bttOperationId, asyncCode, timeout, showCover, respsContainer) {
 
		var formValues = this.get("value");
		var bttParam = {};
		if(this.bttParams){
			bttParam = dojo.fromJson(this.bttParams);
		}
		 
		bttParam[AjaxUtil.constants.BTT_OPERATIONNAME] = bttOperationId;
		bttParam = AjaxUtil.prepareBTTParams(bttParam);
		
		

		if (showCover === true || showCover === "true") {
			ScreenCover.getInstance().show();
		}
		
		AjaxUtil.xhrPost({
			success : dojo.hitch(this, "_handleOperationResponse", asyncCode, respsContainer),
			error : dojo.hitch(this, "_handleOperationError", asyncCode),
			'timeout' : timeout
		}, dojo.mixin(formValues, bttParam));
		
	},
	
	//G025
	callAsyncOpWithMapping  : function(bttOperationId, asyncCode, timeout, inputMapping, outputMapping, showCover, respsContainer) {
		 
		var formValues = this.get("value");
		var bttParam = {};
		if(this.bttParams){
			bttParam = dojo.fromJson(this.bttParams);
		}
		 
		bttParam[AjaxUtil.constants.BTT_OPERATIONNAME] = bttOperationId;
		
		bttParam[AjaxUtil.constants.BTT_AJAXINPUTMAP]=inputMapping;
		bttParam[AjaxUtil.constants.BTT_AJAXOUTPUTMAP]=outputMapping;
		 
		bttParam = AjaxUtil.prepareBTTParams(bttParam);
		
		if (showCover === true || showCover === "true") {
			ScreenCover.getInstance().show();
		}
		
		AjaxUtil.xhrPost({
			success : dojo.hitch(this, "_handleOperationResponse", asyncCode, respsContainer),
			error : dojo.hitch(this, "_handleOperationError", asyncCode),
			'timeout' : timeout
		}, dojo.mixin(formValues, bttParam));
		
	},
	
	/**
	 * Handler for successful response of XHR.
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 *              
	 * @param asyncCode random code for XHR to identify different request
	 * @param respsContainer the response container id which the response data will be set to
	 * @param responseData response data returned from server
	 */
	_handleOperationResponse : function(asyncCode, respsContainer, responseData) {
		
		try {
			var resData = dojo.fromJson(responseData || null);
			responseData = resData;
		} catch(e) {
			this._handleHTMLResponse(responseData);
			return ;
		}
		this.asyncCode = asyncCode;
		var values = null;
		var singleFieldErrors = null;
		var crossFieldErrors = null;
		if(dojo.isArray(responseData)) {
			values = responseData[0].data;
			if(responseData[0].validationError) {
				singleFieldErrors = responseData[0].singleFieldErrors;
				crossFieldErrors = responseData[0].crossFieldErrors;
			}
		} else {
			values = responseData;
		}
		if(values) {
			if(respsContainer && dijit.byId(respsContainer)){
				dijit.byId(respsContainer).set('value', values);
			}else{
				this.set('value', values);
			}
		}
		if((singleFieldErrors && singleFieldErrors.length != 0)|| (crossFieldErrors && crossFieldErrors.length != 0)) {
			var wgtMap = this._getWidgetMap();
			this._handleSingleFieldErrors(singleFieldErrors, wgtMap);
			this._handleCrossFieldErrors(crossFieldErrors, wgtMap);
		}
		
		ScreenCover.getInstance().hide();
		
		this.onAsyncOK();
		
	},	
	
	/**
	 * handle plain html response of XHR
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleHTMLResponse : function(htmlText) {
		(new dijit.Dialog({
            title: this._bundle.getMessage("errorDialogTitle"),
            content : htmlText
        })).show();
	},
	
	/**
	 * get all descendant widgets under this container
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getWidgetMap : function() {
		var map = { };
		dojo.forEach(this.getDescendants(), function(widget){
			if(!widget.name){ return; }
			var entry = map[widget.name] || (map[widget.name] = [] );
			entry.push(widget);
		});
		return map;
	},
	
	/**
	 * Handle the single field error messages from the server side.
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleSingleFieldErrors : function(singleFieldErrors, widgetMap) {
		if(singleFieldErrors != null) {
			for(var i = 0; i < singleFieldErrors.length; i++) {
				if(widgetMap[singleFieldErrors[i].id]) {
					var entry = widgetMap[singleFieldErrors[i].id];
					if(entry){
						for(var j = 0; j < entry.length; j++) {
							if(entry[j].showErrorMessage) { 
								entry[j].showErrorMessage(singleFieldErrors[i].msg);
							}
						}
					}
				}
			}
		}
	},
	
	/**
	 * Handle the cross field error messages from the server side.
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleCrossFieldErrors : function(crossFieldErrors, widgetMap) {
		if(crossFieldErrors != null) {
			var entry = widgetMap["dse_errorMessages"];
			if(entry) {
				for(var j = 0; j < entry.length; j++) {
					entry[j].displayMessageArray(crossFieldErrors);
				}
			}	
		}
	},
	
	/**
	 * Set the data to the corresponding store on the web page.
	 * 
	 */
	setStoreData : function(obj) {

		var map = { };
		dojo.forEach(this.getDescendants(), function(widget){
			if(!widget.name){ return; }
			var entry = map[widget.name] || (map[widget.name] = [] );
			entry.push(widget);
		});

		for(var name in map){
			if(!map.hasOwnProperty(name)){
				continue;
			}
			var widgets = map[name],						// array of widgets w/this name
				storeDatas = dojo.getObject(name, false, obj);	// list of values for those widgets

			if(storeDatas === undefined){
				continue;
			}
			if(!dojo.isArray(storeDatas)){
				storeDatas = [ storeDatas ];
			}

			dojo.forEach(widgets, function(w, i){
				if(w.setStoreData) {
					w.setStoreData(storeDatas[i]);
				}
			});
		}
		
	},
	
	/**
	 * Handler for error in the process of XHR
	 *  
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleOperationError : function(asyncCode, error) {
		
		if(error.dojoType === "timeout") {
			this.asyncCode  = asyncCode;
			this.asyncStatus  = 0;
			this.asyncErrorMessage  = error.message;
			this.onAsyncTimeOut();
			
		} else if(error.status !== undefined) {
			this.asyncCode  = asyncCode;
			this.asyncStatus  = error.status;
			this.asyncErrorMessage  = error.message;
			this.onAsyncError();
		}
		
		ScreenCover.getInstance().hide();
		
	},
   
	
	/**
	 * Function used to publish Ajax timeout event.
	 */	
	onAsyncTimeOut : function() {
		
	},
	
	/**
	 * Function used to publish Ajax successful event.
	 */
	onAsyncOK : function() {
		
	},

	/**
	 * Function used to pubish Ajax error event.
	 * 
	 */
	onAsyncError : function() {
		
	},
	
	
	/**
	 * Get values from the widgets on the page.
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getValueAttr: function(){

		var obj = { };
		var scope = this;
		dojo.forEach(this.getDescendants(), function(widget){
			var name = widget.name;
			
			//Modify to filter the value of label and anchor
			if((!name || (widget.disabled && !(widget instanceof com.ibm.btt.dijit.RichTextEditor)) || widget.isNotSubmitted) && (!widget.storeDataName || !widget.getEditableStroeData || ( ( widget instanceof com.ibm.btt.dijit.Grid) &&  widget.readOnly))){ return; }
			
			if(typeof(widget.ajaxSubmit)!="undefined" && widget.ajaxSubmit==false){ return; }
			
			if(widget.storeDataName && widget.getEditableStroeData && ( (widget instanceof com.ibm.btt.dijit.Grid) && widget.editable && !widget.readOnly) && widget.getEditableStroeData()) {
				dojo.setObject(widget.storeDataName, scope._convertValueToString(widget.getEditableStroeData()), obj);
			}
			// Single value widget (checkbox, radio, or plain <input> type widget
			var value = widget.get('value');

			//if(value == undefined || value == null){ return ; }
			if(value === undefined){ return ; }

			if ((widget instanceof com.ibm.btt.dijit.Grid) && (value == null || value == undefined)) {
				return;
			}
			if ((widget instanceof com.ibm.btt.dijit.Grid) && value != null && value != undefined) {
				if (!widget.launchNew) 
					name="dse_tableSelectedRows"; 
				widget.launchNew=false;
			}	
			
			if(value == null){
				value = "";
			}
			
			// Store widget's value(s) as a scalar, except for checkboxes which are automatically arrays
			if(typeof widget.checked !== 'undefined'){
				if(/Radio/.test(widget.declaredClass)){
					// radio button
					if(value !== false){
						dojo.setObject(name, scope._convertValueToString(value), obj);
					}else{
						// give radio widgets a default of null
						value = dojo.getObject(name, false, obj);
						if(value === undefined){
							dojo.setObject(name, null, obj);
						}
					}
					
				}else{
					// checkbox/toggle button
					if(value !== false){
						dojo.setObject(name, scope._convertValueToString(value), obj);
					}					
				}
			}else{
				
				if (typeof value == "number" && widget.serialize) {
					value = widget.serialize(value, widget.constraints);
				} else if(value != null &&  value instanceof Date) {
					if(widget.serialize) {
						value = widget.serialize(value, widget.constraints);
					} else {
						value = value.getFullYear() + "-" + (value.getMonth() + 1)+ "-" + value.getDate();
					}
				}
				
				value = scope._convertValueToString(value);
				var prev = dojo.getObject(name, false, obj);
				if(typeof prev != "undefined"){
					if(dojo.isArray(prev)){
						prev.push(value);
					}else{
						dojo.setObject(name, [prev, value], obj);
					}
				}else{
					// unique name
					dojo.setObject(name, value, obj);
				}
			}
		});

		for(var p in obj){
			if (obj.hasOwnProperty(p)){
				if(p.indexOf("REMOVEBEFORESUBMIT_") >= 0){
					delete obj[p];
				}
			}
	    }
		
		return obj;
	},	
	
	/**
	 * convert a object type value to string value
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_convertValueToString : function(vobj) {
		
		if(vobj === null) {
			return null;
		} 
		if(typeof vobj === "string") {
			return vobj;
		} else if(typeof vobj === "number" || typeof vobj === "boolean") {
			return String(vobj);
		} else if(typeof vobj === "object") {
			if(dojo.isArray(vobj)) {
				for(var i = 0; i < vobj.length; i++) {
					vobj[i] = arguments.callee(vobj[i]);
				}
			} else {
				for(var p in vobj) {
					if(p.indexOf("_") != 0){
						vobj[p] = arguments.callee(vobj[p]);
					}
				}
			}
			return vobj;
		} else {
			return null;
		}
		
	},
	
	/**
	 * Set values to the widgets on the page.
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setValueAttr: function(/*object*/obj){
		// summary:
		//		Fill in form values from according to an Object (in the format returned by attr('value'))

		// generate map from name --> [list of widgets with that name]
		var map = { };
		var storeMap = {};
		dojo.forEach(this.getDescendants(), function(widget){
			if(widget.storeDataName) {
				var storeEntry = storeMap[widget.storeDataName] || (storeMap[widget.storeDataName] = [] );
				storeEntry.push(widget);
			}
			if(!widget.name){ return; }
			var entry = map[widget.name] || (map[widget.name] = [] );
			entry.push(widget);
		});

		for(var name in storeMap) {
			var widgets = storeMap[name];
			var storeData = dojo.getObject(name, false, obj);
			if(storeData !== undefined) {
				dojo.forEach(widgets, function(w, i){
					w.setStoreData(i == 0 ? storeData : dojo.clone(storeData));
				});
			}
		}
		
		for(var name in map){
			if(!map.hasOwnProperty(name)){
				continue;
			}
			
			var widgets = map[name],						// array of widgets w/this name
				values = dojo.getObject(name, false, obj);	// list of values for those widgets
			
			if(values === undefined){
				continue;
			}
			
			if(!dojo.isArray(values)){
				values = [ values ];
			}			
			
			if(typeof widgets[0].checked !== 'undefined'){
				// for checkbox/radio, values is a list of which widgets should be checked
				dojo.forEach(widgets, function(w, i){
					w.set('value', dojo.indexOf(values, w.value) != -1);
				});
			}else if(widgets[0].multiple){
				// it takes an array (e.g. multi-select)
				widgets[0].set('value', values);
			}else{
				// otherwise, values is a list of values to be assigned sequentially to each widget
				dojo.forEach(widgets, function(w, i){
					w.set('value', values[i]);
				});
			}
		}

	},
	
	
	validValue : null,
	
	/**
	 * Get values from the widgets on the page.
	 *
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * 
	 * @return This method only return the widget value which is valid and not change compared with the initial value.
	 * 
	 * */
	_getValidValueAttr: function(){

		var obj = { };
		var scope = this;
		dojo.forEach(this.getDescendants(), function(widget){
			var name = widget.name;
			
			//Modify to filter the value of label and anchor
			if((!name || widget.disabled || widget.isNotSubmitted) && (!widget.storeDataName || !widget.getEditableStroeData || ( ( widget instanceof com.ibm.btt.dijit.Grid) &&  widget.readOnly && !widget.disabled))){ return; }
			
			//BP32964
			if(!widget.isErasable || !widget.isErasable())
			{
				if(widget.state && !(widget.get("state") == "" || widget.get("state") == "Normal")){return;}
			}
			
			if(typeof(widget.ajaxSubmit)!="undefined" && widget.ajaxSubmit==false){ return; }
			
			if(widget.storeDataName && widget.getEditableStroeData && ( (widget instanceof com.ibm.btt.dijit.Grid) && !widget.readOnly)) {
				var tmpData = widget.getEditableStroeData();
				if(tmpData){
					dojo.setObject(widget.storeDataName, scope._convertValueToString(tmpData), obj);
				}
			}
			// Single value widget (checkbox, radio, or plain <input> type widget
			var value = widget.get('value');

			//if(value == undefined || value == null){ return ; }
			if(value === undefined){ return ; }
			
			if ((widget instanceof com.ibm.btt.dijit.Grid) && value != null && value != undefined) {
				if (!widget.launchNew) 
					name="dse_tableSelectedRows"; 
				widget.launchNew=false;
			}	
			
			if(value == null){
				value = "";
			}
			
			// Store widget's value(s) as a scalar, except for checkboxes which are automatically arrays
			if(typeof widget.checked !== 'undefined'){
				if(/Radio/.test(widget.declaredClass)){
					// radio button
					if(value !== false){
						dojo.setObject(name, scope._convertValueToString(value), obj);
					}else{
						// give radio widgets a default of null
						value = dojo.getObject(name, false, obj);
						if(value === undefined){
							dojo.setObject(name, null, obj);
						}
					}
					
				}else{
					// checkbox/toggle button
					if(value !== false){
						dojo.setObject(name, scope._convertValueToString(value), obj);
					}					
				}
			}else{
				
				if (typeof value == "number" && widget.serialize) {
					value = widget.serialize(value, widget.constraints);
				} else if (value != null &&  value instanceof Date) {
					if(widget.serialize) {
						value = widget.serialize(value, widget.constraints);
					} else {
						value = value.getFullYear() + "-" + (value.getMonth() + 1)+ "-" + value.getDate();
					}
				}
				
				value = scope._convertValueToString(value);
				
				if (widget.type !== "hidden" && (
						(widget.params.value && widget.params.value == value) || 
								(!widget.params.value && "" == value))) {
					return;
				}
				
				var prev = dojo.getObject(name, false, obj);
				if(typeof prev != "undefined"){
					if(dojo.isArray(prev)){
						prev.push(value);
					}else{
						dojo.setObject(name, [prev, value], obj);
					}
				}else{
					// unique name
					dojo.setObject(name, value, obj);
				}
			}
		});
		
		for(var p in obj){
			if (obj.hasOwnProperty(p)){
				if(p.indexOf("REMOVEBEFORESUBMIT_") >= 0){
					delete obj[p];
				}
			}
	    }

		return obj;
	}
	
}); 
	