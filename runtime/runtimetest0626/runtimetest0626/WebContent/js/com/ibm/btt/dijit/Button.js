/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Button");

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit.form.Button");

dojo.declare("com.ibm.btt.dijit.Button", [ dijit.form.Button,
		com.ibm.btt.dijit.AbstractWidgetMixin], {
	
	bttParams : "",
	
	icon : "",
	
	text : "",
	
	/**
	 * This property indicates whether the button can be enable or disable when form valid status changes
	 * 
	 */	
	inValid : false,	
	
	width : "",
	
	height : "",
	
	textWrap : false,
		
	attributeMap: dojo.delegate(dijit.form.Button.prototype.attributeMap, {
		visibility : {
			node : "domNode"
		},
		text : {
			node : "textNode",
			type : "innerHTML"
		},
		icon : {
			node : "iconImageNode",
			type : "attribute",
			attribute : "src"
		},
		width : {
			node : "domNode"
		},
		height : {
			node : "domNode"
		}
	}),
	
	buildRendering : function(){
		this.inherited(arguments);
		this.iconImageNode = dojo.create("img", {'style':'display:none;'}, this.containerNode, "last");
		this.textNode = dojo.create("span", {'class':'dijitLabelBase'}, this.containerNode, "last");
		dojo.style(this.focusNode, 'overflow', 'hidden');
		dojo.addClass(this.focusNode.parentNode, "dijitLabelBase");
		if (dojo.isIE && dojo.isIE>8)
		{
//			dojo.addClass(this.focusNode.parentNode, "dijitButtonFocus_IE9");
			dojo.style(this.focusNode.parentNode, "overflow", "visible");
		}
	},
	
	postCreate : function(){
		this.inherited(arguments);
		this._setIconAttr(this.icon); //add to fix the icon display error for IE6/IE7
	},
	
	/**
	 * 
	 * hook method for text attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextAttr : function(value) {
		this.text = value;
		this.textNode.innerHTML = StringUtil.escapeEnterWrap(this.getI18NString(value));
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
			dojo.addClass(this.textNode, "dijitLabelWrap");
		} else {
			dojo.removeClass(this.textNode, "dijitLabelWrap");
		}
	},
	
	/**
	 * 
	 * hook method for icon attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setIconAttr : function(value){
		this.icon = value;
		if (value) {
			this.iconImageNode.src = value;
			dojo.style(this.iconImageNode,"display","");
		}else{
			dojo.style(this.iconImageNode,"display","none");
		}
	},
	
	/**
	 * 
	 * hook method for width attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setWidthAttr : function(value) {
		if (value != "") {
			this.width = value;
			dojo.style(this.focusNode.parentNode,"width", this.handleLenUint(this.width));
		}
	},
	
	/**
	 * 
	 * hook method for height attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHeightAttr : function(value) {
		if (value != "") {
			this.height = value;
			dojo.style(this.focusNode.parentNode,"height", this.handleLenUint(this.height));
		}		
	},
	
	/**
	 * 
	 * hook method for inValid attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setInValidAttr : function(value){
		
		this.inValid = value;
		
		if (this.type == "submit") {
			var form = this._getParentForm();
			if (form && form.setSubmitButtonState) {
				form.setSubmitButtonState();
			} else {
				this.set("disabled", value);
			}
		} else {
			this.set("disabled", value);
		}
		
	},
	
	
	/**
	 * 
	 * override default button click mehtod to support canle and save type button
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onButtonClick : function(e){
		var form = this._getParentForm();
		if(form && this.get("disabled") == false && this.type == "cancel"){
			this._onClick(e);
			this._doCancelAction(form);
			e.preventDefault();
		}else if(form && this.get("disabled") == false && this.type == "save"){
			this._onClick(e);
			this._doSaveAction(form);
			e.preventDefault();
		}else{
			if(form){
				form._lastClickedButton = this;
			}
			this.inherited(arguments);
		}
		
	},
	
	/**
	 * 
	 * get the the parent form container which this button in
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getParentForm : function(){
		for(var node=this.domNode; node.parentNode/*#5935*/; node=node.parentNode){
			var widget=dijit.byNode(node);
			if(widget && typeof widget._onSubmit == "function"){
				return widget;
			}
		}
	},
	
	/**
	 * 
	 * handle the cancel action when button is cancel type
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_doCancelAction : function(form){
		var form = this._createHiddenForm(form, dojo.fromJson(this.bttParams));
		form.submit();
	},
	
	/**
	 * 
	 * handle save action whne button is save type
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_doSaveAction : function(form){
		var form = this._getParentForm();
		if(form.onFormSubmit){
			form.onFormSubmit();
		}
		var formValue = form.get('validValue');
		var form = this._createHiddenForm(form, dojo.mixin(formValue, dojo.fromJson(this.bttParams)));
		form.submit();
	},

	/**
	 * 
	 * create hidden filed to submit data
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_createHiddenForm : function(form, params){
		var form = dojo.create("form", {
				'style' : 'display:none;',
				'action' : form.get('action'),
				'method' : form.get('method')
			}, dojo.body(), 'last');
		var plainKeyValue = [];
		for(var name in params){
			if (name != undefined && name != null && name != "") {
				plainKeyValue = plainKeyValue.concat(this._convertToKeyValuePair(name, params[name]));
			}
		}
		
		for(var i=0;i<plainKeyValue.length;i++){
			dojo.create("input", {
				'type' : 'hidden',
				'name' : plainKeyValue[i].key,
				'value' : plainKeyValue[i].value
			}, form, "last");
		}
		
		return form;
	},
	
	/**
	 * 
	 * convert object data to plain key value pair data
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_convertToKeyValuePair : function(name, value){
		var res = [];
		if (dojo.isObject(value)) {
			for(var key in value){
				if (key != undefined && key != null && key != "") {
					res = res.concat(this._convertToKeyValuePair(name+"."+key, value[key]));
				}
			}
		} else if (dojo.isArray(value)) {
			for ( var i = 0; i < value.length; i++) {
				res = res.concat(this._convertToKeyValuePair(name+"."+i, value[i]));
			}
		} else {
			res.push( {
				'key' : name,
				'value' : value
			});
		}
		return res;
	}
});