/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.CurrencyTextBox");

dojo.require("com.ibm.btt.dijit.NumberTextBox");
dojo.require("dijit.form.CurrencyTextBox");

dojo.declare("com.ibm.btt.dijit.CurrencyTextBox", [
		com.ibm.btt.dijit.NumberTextBox, dijit.form.CurrencyTextBox ], {
	
	decimalPlaces : 0,
	
	postMixInProperties : function(){
		this.inherited(arguments);
		this.decimalPlaces = this.constraints.places;
	},
	
	serialize: function(/*anything*/val, /*Object?*/options){
		return isNaN(val) ? "" : (val.toString ? val.toString() : "");
	}
	
});