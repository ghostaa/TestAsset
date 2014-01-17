/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2012 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.event._ConditionMixin"); 

/**
 * 
 * This is an internal class which is used to provide the condition reuse function
 * User can register conditions into engine instance from several different files with url
 * */
dojo.declare("com.ibm.btt.event._ConditionMixin", null,{
	
	/**
	 * 
	 * internal variable which is used to keep the all the conditions loaded form the js
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this property in customer code.
	 * */
	_conditionMap : {},
	
	
	/**
	 * 
	 * register the condition to engine instance from the specified url
	 * 
	 * @tag public 
	 * */
	registerCond : function(url) {
		if (url) {
			var xhrArgs = {
				'url' : url,
				handleAs : "json",
				sync : true,
				load : dojo.hitch(this, "_loadCond"),
				error : dojo.hitch(this, "_loadCondError", url)
			};
			dojo.xhrGet(xhrArgs);
		} else {
			console.error("The argument can not be null.");
		}
	},
	
	/**
	 * 
	 * internal method to load condition js from url
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this property in customer code.
	 * */
	_loadCond : function(cond){
		if(cond){
			for (var name in cond) {
				if (name && cond[name] && typeof (cond[name]) == 'function') {
					this._conditionMap[name] = cond[name];
				}
			}
		}
	},
	
	/**
	 * 
	 * internal method to handle the error when load condition js
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this property in customer code.
	 * */
	_loadCondError : function(url, error){
		console.error("Fail to load the condition on " + url + ", error : " + error);
	},
	
	/**
	 * 
	 * public method used to execute the condition with given name and arguments
	 * 
	 * @param this first argument is the condition name and the rest of arguments are condition execution arguments
	 * 
	 * @tag public 
	 * 
	 * */
	executeCond: function(){
		var name = arguments[0];
		var args = [];
		var length = Number(arguments.length);
		var i = 1;
		while (i < length) {
			args.push(arguments[i]);
			i++;
		}
		try{
			if(this._conditionMap[name]){
				return this._conditionMap[name].apply(this, args);
			} else {
				console.error("Condition with specified name is not found. condition=" + name);
			}
		}catch(e){
			console.error("An error occured while executing the condition " + name + ", error " + e);
		}
	},
	
	
	executeDeprecatedCond: function(){
		var name = arguments[0];
		console.warn("The condition [" + name +"] is deprecated.");
		this.executeCond(arguments);
	}
});