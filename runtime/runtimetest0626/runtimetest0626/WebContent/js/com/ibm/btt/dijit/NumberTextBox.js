/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.NumberTextBox");

dojo.require("dijit.form.NumberTextBox");
dojo.require("com.ibm.btt.dijit.ValidationTextBox");
dojo.require("com.ibm.btt.util.I18nBundle");

dojo.declare("com.ibm.btt.dijit.NumberTextBox",[com.ibm.btt.dijit.RangeBoundTextBox,dijit.form.NumberTextBox],{
	
	numberType : "",

	minimumNumber : NaN,

	maximumNumber : NaN,

	locale : dojo.locale,

	pattern : "",

	decimalPlaces : 0,
	
	postMixInProperties : function(){
		
		this.inherited(arguments);
		
		if (this.numberType == "byte" || this.numberType == "int"
			|| this.numberType == "short" || this.numberType == "integer"
			|| this.numberType == "long" || this.numberType == "bigInteger") {
			this.fractional = false;
		} else {
			this.fractional = true;
		}
		
		if (!isNaN(this.minimumNumber)) {
			if (this.fractional) {
				this.constraints.min = Number(this.minimumNumber);
			} else {
				this.constraints.min = parseInt(this.minimumNumber);
			}
		}
		
		if (!isNaN(this.maximumNumber)) {
			if (this.fractional) {	
				this.constraints.max = Number(this.maximumNumber);	
			} else {
				this.constraints.max = parseInt(this.maximumNumber);
			}
		}
		
		this.constraints.locale = this.locale;
		
		if (this.pattern != "") {
			this.constraints.pattern = this.pattern;
		}
		
		this.constraints.fractional = this.fractional;
		
		if(!isNaN(this.decimalPlaces)){
			this.decimalPlaces = Number(this.decimalPlaces);
		}
		
		if (this.fractional && this.decimalPlaces > 0) {
			this.constraints.places = this.decimalPlaces;
		}
		
		this.bundle = new com.ibm.btt.util.I18nBundle("com.ibm.btt.dijit", "TextBox");
		
	},
	
	isNumber : function(value){
		return /^-?\d+(\.\d+)?$/.test(value);
	},
	
	validator : function(/* anything */value, /* dijit.form.ValidationTextBox.__Constraints */
			constraints) {
		
		var formattedValue;
		if(this.isNumber(value)){
			formattedValue = value;
		}
		else{
			formattedValue = this.parse(value, this.constraints);
			if (!this.isNumber(formattedValue) && value != "") {
				this.invalidMessage = this.bundle.getMessage("invalidMessage");
				return false;
			}else{
				if (new RegExp("^[+-]?\\d+$").test(formattedValue) && this.decimalPlaces > 0) {
					var con = {};
					con["max"] = this.constraints["max"];
					con["min"] = this.constraints["min"];
					con["places"] = this.constraints["places"];
					con["fractional"] = this.constraints["fractional"];
					con["locale"] = this.constraints["locale"];
					formattedValue += ".";
					for(var i=0;i<this.decimalPlaces;i++){
						formattedValue += "0";
					}
				}
			}
		}

		if (this.isNumber(formattedValue) && this.fractional && this.decimalPlaces>0 && !(new RegExp("^[+-]?.+[.,]\\d{" + this.decimalPlaces + "}$").test(value))){
			this.invalidMessage = this.bundle.getMessage("decimalPlacesMessage",{value : this.decimalPlaces});
			return false;
		}
		
		if (this.isNumber(formattedValue) && this.numberType == "byte" && (formattedValue > 127 || formattedValue < -128)) {
			this.invalidMessage = this.bundle.getMessage("intOutOfRange",{max:127,min:-128});
			return false;
		}
		if (this.isNumber(formattedValue) && this.numberType == "short" && (formattedValue > 32767 || formattedValue < -32768)) {
			this.invalidMessage = this.bundle.getMessage("intOutOfRange",{max:32767,min:-32768});
			return false;
		}
		if (this.isNumber(formattedValue) && this.numberType == "int" && (formattedValue > 2147483647
				|| formattedValue < -2147483648)) {
			this.invalidMessage = this.bundle.getMessage("intOutOfRange",{max:2147483647,min:-2147483648});
			return false;
		}
		if (this.isNumber(formattedValue) && this.numberType == "integer" && (formattedValue > 2147483647
				|| formattedValue < -2147483648)) {
			this.invalidMessage = this.bundle.getMessage("intOutOfRange",{max:2147483647,min:-2147483648});
			return false;
		}
		if (this.isNumber(formattedValue) && this.numberType == "long" && (formattedValue > 9223372036854775807
				|| formattedValue < -9223372036854775808)) {
			this.invalidMessage = this.bundle.getMessage("intOutOfRange",{max:9223372036854775807,min:-9223372036854775808});
			return false;
		}
		if (formattedValue.toString().replace(new RegExp(".", "g"), "").length > 16) {
			this.invalidMessage = this.bundle.getMessage("numberOutOfRange");
			return false;
		}
		return this.inherited(arguments);
	},
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setValueAttr: function(/*Number*/ value, /*Boolean?*/ priorityChange, /*String?*/formattedValue){
		if(typeof value === "string" && value !== "") {
			var tmpValue = Number(value);
			if(isNaN(tmpValue) && value && value != ""){
				var cons = {};
				if(this.constraints['pattern']){
					cons['pattern'] = this.constraints['pattern'];
				}
				value = this.parse(value, cons);
			} else {
				value = tmpValue;
			}
		}
		this.inherited(arguments);
	},
	
	create: function(/*Object?*/params, /*DomNode|String?*/srcNodeRef){
		
		this.inherited(arguments);
		
		var value = dojo.attr(srcNodeRef, 'value');
		
		if(value && value != ""){
			var cons = {};
			if(this.constraints['pattern']){
				cons['pattern'] = this.constraints['pattern'];
			}
			params.value = this.parse(value, cons);
			if(isNaN(params.value)){
				params.value = Number(value);
			}
			this.set('value', params.value);
		}
		
	},
	
	serialize: function(/*anything*/val, /*Object?*/options){
		return this.format(val, options);
	}
	
});