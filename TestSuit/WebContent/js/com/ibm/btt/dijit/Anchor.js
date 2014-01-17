/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Anchor"); 

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit._Templated"); 
dojo.require("dijit._Widget"); 
dojo.require("com.ibm.btt.dijit.CellWidgetMixin"); 

dojo.declare("com.ibm.btt.dijit.Anchor",[dijit._Widget,dijit._Templated,com.ibm.btt.dijit.AbstractWidgetMixin,com.ibm.btt.dijit.CellWidgetMixin] ,{ 
	
	templateString : "<a class='dijitLabelBase' dojoAttachEvent='onclick:_onClick'></a>",
	
	action : "#",
	
	target : "_parent",
	
	bttParams : "",
	
	text : "",
	
	tabIndex: 0,
	
	disabled : false,
	
	width : "",
	
	height : "",
	
	textWrap : false,
	
	attributeMap: dojo.delegate(dijit._Widget.prototype.attributeMap, {
		target : {
			node : "domNode"
		},
//		tabIndex : {	// do it in postCreate()
//			node : "domNode"
//		},
		text : {
			node : "domNode",
			type : "innerHTML"
		},
//		visibility : {
//			node : "domNode"
//		},
//		disabled : {	// do it in postCreate()
//			node : "domNode"
//		},
		action : {
			node : "domNode"
		}
	}),
	
	postCreate : function() {
		this.inherited(arguments);
		var ti = parseInt(this.tabIndex);
		if (isNaN(ti)){
			this.tabIndex = 0;
		}else{
			this.tabIndex = ti;
		}
		this.disabled = (this.disabled===true || this.disabled==="true");
		this.domNode.disabled = this.disabled;
		if (this.disabled){
			this.domNode.tabIndex = -1;
			dojo.addClass(this.domNode, "bttDisabledLink");
		} else {
			this.domNode.tabIndex = this.tabIndex;
			dojo.removeClass(this.domNode, "bttDisabledLink");
		}
	},
	
	/**
	 * 
	 * join btt params to a url
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_parameterHandler : function(e) {
		var paramString = "";
		var params = dojo.fromJson(e);
		params[AjaxUtil.constants.BTT_TIMEZONE] = AjaxUtil.getTimzone();
		for ( var paramName in params) {
			if (typeof (paramName) != "undefined") {
				var paramValue = params[paramName];
				if (paramString == "") {
					paramString += paramName + "=" + paramValue;
				} else {
					paramString += "&" + paramName + "=" + paramValue;
				}
			}
		}
		return paramString;
	},

	/**
	 * 
	 * hook method for action attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setActionAttr : function(value){
		this.action = value;
		var targetUrl = "";
		if (this.bttParams != "" && this.action != "" && this.action !== "#") {
			targetUrl = this.action;
			if (this.bttParams != "") {
				if (targetUrl.indexOf("?") == -1) {
					targetUrl += "?";
				}
				if (this.bttParams != "") {
					var params = this._parameterHandler(this.bttParams);
					if (targetUrl.substring(targetUrl.length - 1) == "?") {
						targetUrl += params;
					} else {
						targetUrl += "&" + params;
					}
				}
			}
		} else {
			if (this.action != "" && this.action !== "#") {
				targetUrl = this.action;
			} else {
				targetUrl = "javascript:void(0)";
			}
		}
		this.domNode.href = targetUrl;
	},
	
	/**
	 * 
	 * hook method for text attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextAttr : function(value){
		this.text = value;
		this.domNode.innerHTML = StringUtil.escapeEnterWrap(this.getI18NString(value));
	},
	
	/**
	 * 
	 * hook method for disable attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setDisabledAttr : function(value){
		this.disabled = (value===true || value==="true");
		this.domNode.disabled = this.disabled;
		if (this.disabled){
			this.domNode.tabIndex = -1;
			dojo.addClass(this.domNode, "bttDisabledLink");
		} else {
			this.domNode.tabIndex = this.tabIndex;
			dojo.removeClass(this.domNode, "bttDisabledLink");
		}
	},
	
	focus : function(){
		this.domNode.focus();
	},
	
	applyAccessKey : function(){
		if(this.accessKey){
			this.domNode.setAttribute('accessKey', this.accessKey);
		}
	},
	
	/**
	 * 
	 * override default onclick method to block default click when link is disabled
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onClick : function(e){
		if (this.disabled || this.onClick(e) === false) {
			e.preventDefault();
		} 
	},
	
	onClick : function(e){
		//leave onClick event for customer to use.
	},
	
	/**
	 * 
	 * hook method for textWrap attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextWrapAttr : function(value) {
		this.textWrap = value;
		if (this.textWrap) {
			dojo.addClass(this.domNode, "dijitLabelWrap");
		} else {
			dojo.removeClass(this.domNode, "dijitLabelWrap");
		}
	},
	
	/**
	 * 
	 * hook method for width attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setWidthAttr : function(value){
		if(this.width != ""){
			this.width = value;
			dojo.style(this.domNode, "width", this.handleLenUint(this.width));
		}
	},
	
	/**
	 * 
	 * hook method for height attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHeightAttr : function(value){
		if(this.height != ""){
			this.height = value;
			dojo.style(this.domNode, "height", this.handleLenUint(this.height));
		}
	}
}); 
