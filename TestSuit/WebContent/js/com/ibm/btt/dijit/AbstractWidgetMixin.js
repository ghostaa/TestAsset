/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.AbstractWidgetMixin"); 

dojo.require("com.ibm.btt.util.I18nUtil");
dojo.require("com.ibm.btt.util.StringUtil");

dojo.declare("com.ibm.btt.dijit.AbstractWidgetMixin", null,{
	
	visibility : "visible",
	
	accessKey : "",
	
	hint : "",
	
	postCreate : function(){	
		this.applyAccessKey();
		this.inherited(arguments);
	},
	
	/**
	 * support the key is a template
	 * 
	 * @param key , defined in NLS cdd , LIKE Use %com.ibm.btt.nls.msg/transaction01.text as key of nls text.
	 * @paramvalues , dynamic values, the message should be a template like this : TRANSFER_ERROR:Your {account} doesn't can't transfer value exceeds {amount}. 
	 * Alpha developer can invoke the API like message1.display("TRANSFER_ERROR","ERROR", accountTextbox1.value, amounTextbox1.value);
	 * The dynamic values are [accountTextbox1.value,amounTextbox1.value] or {account:"4550 3588 5687 8554", amount:"5000"}
	 *
	 */
	getI18NString : function(key,values) {
				
		return I18nUtil.getI18nString(key, values);
		
	},
	
	replaceWrap : function(){
		
	},
	
	/**
	 * 
	 * hook method for hint attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHintAttr : function(value){
		this.hint = value;
		var node = this.textbox || this.focusNode || this.domNode;
		node.title = StringUtil.removeWarp(this.getI18NString(value));
	},
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setVisibilityAttr : function(value){		
		var d = "";
		var v = "inherit";
		switch (value){
		case "gone":
			d = "none";
			v = "inherit";
			break;
		case "hidden":
			d = "";
			v = "hidden";
			break;
//		case "visible": // strongly recommend not using this value directly
//			d = "";
//			v = "visible";
//			break;
		default:
//			value = "inherit";
			d = "";
			v = "inherit";
		}
		
		this.visibility = value;

		dojo.style(this.domNode, "display", d);
		dojo.style(this.domNode, "visibility", v);
	},
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	// gone, hidden, visible, no inherit
	_getVisibilityAttr : function(){
		var v = this.visibility; // gone, hidden, visible and inherit

		if (v!="gone") {	// compute the inherited value
			if (this.domNode.offsetWidth<1 || this.domNode.offsetHeight<1){
				v = "gone";
			}else{
				v = dojo.style(this.domNode, "visibility")=="hidden"?"hidden":"visible";
			}
		}
		
		return v;
	},
	
	isVisible : function(){
		var isV = false;
		switch (this.visibility){ // gone, hidden, visible and inherit
		case "gone":
		case "hidden":
			isV = false;
			break;
//		case "visible": // depends on its parent
//		case "inherit":	// depends on its parent
		default :
			isV = this.domNode.offsetWidth>0 && this.domNode.offsetHeight>0 && dojo.style(this.domNode, "visibility")!="hidden";
		}
		return isV;
	},
	
	isFocusable: function(){
		// Overridden so that when dijit is hidden, isFocusable return false;
		if(this.isVisible()==false){
			return false;
		} else if(this.disabled || this.readOnly){
			return false;
		} else {
			return this.inherited(arguments);
		}
	},

	applyAccessKey : function() {
		if (this.focusNode && this.accessKey) {
			this.focusNode.setAttribute('accessKey', this.accessKey);
		}
	},
	
	handleLenUint : function(value) {
		var endWith = function(src, oString) {
			var reg = new RegExp(oString + "$");
			return reg.test(src);
		};
		if(endWith(value, "px") || endWith(value, "%") || endWith(value, "em")){
			return value;
		}else{
			return value + "px";
		}
	}
	
}); 
	