/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/


dojo.provide("com.ibm.btt.dijit.TextArea");

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("com.ibm.btt.dijit.ValidationTextBox");
dojo.require("dijit.form.SimpleTextarea");

dojo.declare("com.ibm.btt.dijit.TextArea", [com.ibm.btt.dijit.ValidationTextBox, 
		dijit.form.SimpleTextarea], {
	
	width : "",
	
	height : "",
	
	attributeMap: dojo.delegate(dijit.form.SimpleTextarea.prototype.attributeMap, {
		
		visibility : {
			node : "domNode"
		},
		
		width : {
			node : "domNode"
		},
		
		height : {
			node : "domNode"
		}
		
	}),
	
	validator: function(/*anything*/value, /*dijit.form.ValidationTextBox.__Constraints*/constraints){
		if(! (!this.required || !this._isEmpty(value))){
			//this.promptMessage = dojo.i18n.getLocalization("com.ibm.btt.dijit", "TextBox").requiredFieldMessage;
			return false;
		}
		/*if(!(new RegExp("^(?:" + this.regExpGen(constraints) + ")"+(this.required?"":"?")+"$")).test(value)){
			this.invalidMessage = dojo.i18n.getLocalization("com.ibm.btt.dijit", "TextBox").regularExpressionMessage;
			return false;
		}*/
		return true;
	},
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setVisibilityAttr : function(value){
		this.visibility = value;
		if (value == "gone") {
			dojo.style(this.domNode, "visibility", "visible");
			dojo.style(this.domNode, "display", "none");
		} else if (value == "hidden") {
			dojo.style(this.domNode, "display", "");
			dojo.style(this.domNode, "visibility", "hidden");
		} else {
			dojo.style(this.domNode, "display", "");
			dojo.style(this.domNode, "visibility", "visible");
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
	_setHeightAttr : function(value) {
		if (value != "") {
			this.height = value;
			dojo.style(this.domNode, "height", this.handleLenUint(this.height));
		}
	},

	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setValueAttr : function(value){
		value = this.getI18NString(value);
		this.inherited(arguments);
	}
	
});