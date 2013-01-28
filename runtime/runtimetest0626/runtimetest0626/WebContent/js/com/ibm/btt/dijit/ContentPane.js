/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.ContentPane"); 

dojo.require("dijit.layout.ContentPane");
dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("com.ibm.btt.dijit.AbstractAjaxMixin");

dojo.declare("com.ibm.btt.dijit.ContentPane", [dijit.layout.ContentPane, 
                                               com.ibm.btt.dijit.AbstractWidgetMixin,
                                               com.ibm.btt.dijit.AbstractAjaxMixin],{
	
	
	disabled : false,
	
	postCreate : function(){
		this.inherited(arguments);
		if (dojo.isIE && dojo.hasAttr(this.domNode, "disabled")) {
			dojo.removeAttr(this.domNode, "disabled");
		}
	},
	
	
	/**
	 * 
	 * hook set method for disabled attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setDisabledAttr : function(value){
		this._set("disabled", value);
	},
	
	/**
	 * 
	 * hook set method for title attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTitleAttr : function(value){
		this.titleKey = value;
		var _title = this.getI18NString(value);
		this._set("title", _title);
	},
	
	/**
	 * 
	 * hook get method for title attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getTitleAttr : function(){
		return this.titleKey;
	}
	
}); 
	