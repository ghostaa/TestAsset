/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.util.I18nBundle");

dojo.require("dojo.i18n");

dojo.declare("com.ibm.btt.util.I18nBundle", null,{
	
	bundle : null,
	
	constructor : function(/*String*/packageName, /*String*/bundleName, /*String?*/locale){
		try{
			dojo.requireLocalization(packageName, bundleName, locale);
			this.bundle =  dojo.i18n.getLocalization(packageName, bundleName, locale);
		}catch(e){
			console.info("Can not load NLS resources. packageName="+packageName+", bundleName="+bundleName+", locale="+locale);
			this.bundle = undefined;
		}
	},
	
	/**
	 * Sample 1, TRANSFER_WARNING: You can't transfer more than 3 times daily.
	 * Sample 2, TRANSFER_ERROR:Your {account} doesn't can't transfer value exceeds {amount}.
	 * @key key , like TRANSFER_WARNING, TRANSFER_ERROR
	 * @values , like ['2828 2323 8742 9876', '50000'] ; Or {name:"zhangjun", gender:"malel"} ; Or  "zhuangjun", male",...
	 * 
	 */
	getMessage : function(key, values){
		if (typeof (this.bundle) != "undefined" && typeof (key) != "undefined"
				&& typeof (this.bundle[key]) != "undefined") {
			if((values !== undefined) && (dojo.isArray(values))){	// pass in values is an array
				//Sample , TRANSFER_ERROR:Your {account} doesn't can't transfer value exceeds {amount}.
				//The result is replace value of account and amount.
				var text = this.bundle[key];
				var i = 0;   
				text = dojo.replace(text, dojo.hitch(values, function ( _ , k){
					if(i < values.length ) {
						if(values[i] !== undefined && values[i++] !== null) {
							return values[i - 1];
						}
					}
					return "{" + k + "}";
					
				}));
				
				return text;
			}else if (values !== undefined && values !== null && dojo.isObject(values)){
				
				return dojo.replace(this.bundle[key], dojo.hitch(values, function(_, k){ 
						var value = dojo.getObject(k, false, values);
						if(value !== null && value !== undefined) 
							return value;
						else 
							return "{" + k + "}";
							
					}));
					
			}else if(values !== undefined && values !== null) {
				var tempArray = [];
				for(var i = 1; i < arguments.length; i++) {
					tempArray.push(arguments[i]);
				}
				return arguments.callee.apply(this, [key, tempArray]);
			}else {
				return this.bundle[key];
			}
		} else {
			return undefined;
		}
	}
});