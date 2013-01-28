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
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setVisibilityAttr : function(value){
		this.visibility = value;
		if (value == "gone") {
			dojo.style(this.domNode, "visibility", "");
			dojo.style(this.domNode, "display", "none");
		} else if (value == "hidden") {
			dojo.style(this.domNode, "display", "");
			dojo.style(this.domNode, "visibility", "hidden");
		} else {
			dojo.style(this.domNode, "display", "");
			dojo.style(this.domNode, "visibility", "");
		}
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
		this.domNode.title = StringUtil.removeWarp(this.getI18NString(value));
	},
	
	isFocusable: function(){
		// Overridden so that when dijit is hidden, isFocusable return false;
		if(dojo.style(this.domNode, "visibility") == "hidden"){
			return false;
		} else if(this.disabled){
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
	