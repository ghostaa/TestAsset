/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.StringTextBox"); 

dojo.require("com.ibm.btt.dijit.ValidationTextBox");
dojo.require("com.ibm.btt.util.I18nBundle");
dojo.requireLocalization("com.ibm.btt.dijit", "TextBox");

dojo.declare("com.ibm.btt.dijit.StringTextBox",[com.ibm.btt.dijit.ValidationTextBox],{
	
	maximumLength : NaN,
	minimumLength : NaN,
	validCharacters : "",
	password : false,
	
	postMixInProperties : function(){
		this.inherited(arguments);	
		if(this.password){
			this.type = "password";
		}
	},
	
	postCreate : function(){
		this.inherited(arguments);
		this.set('value', this.get('value'));
		
		// IBK maxLength
		var gcu = com.ibm.btt.util.GlobalConfigurationUtil;
		var isAuto = gcu && (gcu.getValue("com.ibm.btt.stringtextbox.maxlength")=="auto");
		var max = 65535;
		var mlc = parseInt(this.maximumLength) || max;
		var mli = parseInt(this.maxLength) || max;
		var ml = mlc>mli? mli:mlc;
		if (ml>0 && ml < max){
			this.maximumLength = ml;
			if (isAuto){// update the maxLength only when com.ibm.btt.stringtextbox.maxlength=="auto"
				this.maxLength = ml;
				dojo.attr(this.focusNode, "maxLength", ml);
			}
		}
	},
	
	validator: function(/*anything*/value, /*dijit.form.ValidationTextBox.__Constraints*/constraints){	
		var bundle = new com.ibm.btt.util.I18nBundle("com.ibm.btt.dijit", "TextBox");
		if(!isNaN(this.minimumLength) && this.attr('value').length < this.minimumLength){	
			this.invalidMessage = bundle.getMessage("stringMinMessage",{value:this.minimumLength});
			return false;
		}
		else if(!isNaN(this.maximumLength) && this.attr('value').length > this.maximumLength){
			this.invalidMessage = bundle.getMessage("stringMaxMessage",{value:this.maximumLength});
			return false;
		}
		else{
			return this.inherited(arguments);
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
		if (value != null && value != undefined) {
			value = this.getI18NString(value);
			value = value.replace(/&amp;/g, '&').replace(/&lt;/g, '<')
		}else{
			value = "";
		}
		this.value = value;
		this.inherited(arguments);
	}
	
});
