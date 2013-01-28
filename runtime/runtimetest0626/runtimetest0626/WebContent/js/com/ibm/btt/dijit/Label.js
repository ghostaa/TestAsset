/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Label"); 

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit._Templated"); 
dojo.require("dijit._Widget"); 

dojo.declare("com.ibm.btt.dijit.Label",[dijit._Widget,dijit._Templated,com.ibm.btt.dijit.AbstractWidgetMixin] ,{ 

	templateString : "<label class='dijitLabelBase' dojoAttachPoint='labelContainer' ${nameAttrSetting} ></label>",
	
	text : "",
	
	name: "",
	
	"for" : "",
	
	width : "",
	
	height : "",
	
	textWrap : false,
	
	isNotSubmitted : true,
	
	fieldReference : "",
	
	postMixInProperties: function(){

		this.nameAttrSetting = this.name ? ("name='" + this.name + "'") : "";
		this.inherited(arguments);
	},
	
	attributeMap : dojo.delegate(dijit._Widget.prototype.attributeMap, {
		text : {
			node : "domNode",
			type : "innerHTML"
		},
		visibility : {
			node : "domNode"
		},
		"for" : {
			node : "domNode"
		}
	}),
	
	postCreate : function() {
		this.inherited(arguments);
		if (this.hint == undefined || this.hint == null || this.hint == "") {
			this.set('hint', this.text);
		}
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
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setValueAttr : function(value){
		this.set("text", value);
	},
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getValueArrt : function(name){
		return this.get("text");
	},
	
	/**
	 * 
	 * hook method for for attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setForAttr : function(value){
		this.domNode.htmlFor = value;
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
