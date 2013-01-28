/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 2012 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp.
*/

dojo.provide("com.ibm.btt.event.Engine");

dojo.require("com.ibm.btt.event._ConditionMixin");

dojo.require("com.ibm.btt.event._AccessKeyMixin");

dojo.declare("com.ibm.btt.event.Engine", [com.ibm.btt.event._ConditionMixin, com.ibm.btt.event._AccessKeyMixin], {

	monitor : null,
	
	/**
	 * 
	 * handler array for dojo connect method,
	 * used for unregister the event when clear the rules or destroy the engine
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this property in customer code.
	 * */
	_ruleEvents : [],
	
	/**
	 * 
	 * an object used to save the reference of registered rules
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this property in customer code.
	 * */
	_ruleMaps : {},
	
	setMonitor : function(ecaMonitor){
		 this.monitor = ecaMonitor;
	},
	
	registerRules : function(rules) {
		this._formOnLoaded = [];
		for ( var i = 0; i < rules.length; i++){
			if (rules[i].evts) {
				for ( var j = 0; j < rules[i].evts.length; j++) {
					this._registerEvent(rules[i], rules[i].evts[j]);
				}
			}
			if(rules[i].type && rules[i].type == "AG"){
				this._ruleMaps[rules[i].name] = rules[i];
			}
		}
		
		for ( var i = 0; i < this._formOnLoaded.length; i++) {
			if (this._formOnLoaded[i].onLoaded) {
				this._formOnLoaded[i].onLoaded();
			}
		}
		
		this._formOnLoaded = undefined;
		delete this._formOnLoaded;
	},

	_getWidget :function(id){
		if (id.lastIndexOf(".") == -1) {
			return dijit.byId(id);
		} else {
			var parentId = id.substring(0, id.indexOf("."));
			var childId = id.substring(id.indexOf(".") + 1, id.length);
			obj = dijit.byId(parentId);
			if(obj && obj.getWidget){
				return obj.getWidget(childId);
			} else {
				return null;
			}
		}
	},
	
	/**
	 *
	 * register single rule
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_registerEvent : function(rule, event) {
		
		var obj = this._getWidget(event.id);
		
		// keyboard-eca for panel
		if (!obj)
		{
			obj = dojo.byId(event.id);
		}
		
		if (!obj) {
			console.error("Failed to register event '" + event.id + "', " +
				"parent widget mush provide getWidget(id) widget to support subwidget listening funcion.");
			return;
		}
		
		//use dojo connect to listen and trigger the event
		var _event = dojo.connect(obj, event.e, this, function(evt) {
			
			if (this.monitor != null) {
				this.monitor.monitorStartRule(event, rule);
			}
			
			var result = this._executeCondition(rule, evt);
			
			if (this.monitor != null) {
				this.monitor.monitorCondition(event, rule, result);
			}
			
			this._executeAction(result, rule, evt);
			
			if (this.monitor != null) {
				this.monitor.monitorEndRule(event,  rule);		
			}
			
		});
		

		if (event.e === "onLoaded") {
			var i;
			for ( i = 0; i < this._formOnLoaded.length; i++) {
				if (this._formOnLoaded[i] == obj) {
					break;
				}
			}
			if (i == this._formOnLoaded.length) {
				this._formOnLoaded.push(obj);
			}
		}
		
		this._ruleEvents.push(_event);
	},
	
	/**
	 *
	 * execute the condition of single one rule and get the result
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_executeCondition : function(rule, evt) {
		var result = true;
		if (rule && rule.cond) {
			try{
				result = rule.cond.call(this, evt);
			} catch (e) {
				console.error("An error occured while ECA condition excuting." + e.toString());
			}
		}
		return result;
	},
	
	/**
	 *
	 * execute the action depends on the condition execution result
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_executeAction : function(result, rule, evt){
		if (result) {
			if (rule.onTrue) {
				try {
					rule.onTrue.call(this, evt);
				} catch (e) {
					console.error("An error occured while ECA on true state excuting." + e.toString());
				}
			}
		} else {
			if (rule.onFalse) {
				try {
					rule.onFalse.call(this, evt);
				} catch (e) {
					console.error("An error occured while ECA on false state excuting." + e.toString());
				}
			}
		}
	},
	
	executeAG : function(name) {
		if(name){
			var rule = this._ruleMaps[name];
			if (rule) {
				if(this.monitor && this.monitor.monitorStartAG){
					this.monitor.monitorStartAG(rule);
				}
				var result = this._executeCondition(rule);
				if(this.monitor && this.monitor.monitorAGCondition){
					this.monitor.monitorAGCondition(rule, result);
				}
				this._executeAction(result, rule);
				if(this.monitor && this.monitor.monitorEndAG){
					this.monitor.monitorEndAG(rule);
				}
			} else {
				console.error("can not find corresponding action group with given name '" + name + "'");
			}
			
		} else {
			console.error("Input argument name to execute an action group can not be null or undefined or empty.");
		}
	},
	
	clearRules : function() {
		while (this._ruleEvents.length > 0) {
			dojo.disconnect(this._ruleEvents.pop());
		}
		this._ruleMaps = {};
	},

	setPW : function(id, property, value) {
		if (this.monitor != null) {
			this.monitor.monitorSetPropertyAction(id, property, value);
		}
		var obj = this._getWidget(id);
		if (!obj) {
			console.error("Failed to register event '" + event.id + "', " +
				"parent widget mush provide getWidget(id) widget to support subwidget listening funcion.");
			return;
		}
		obj.set(property, value);
	},

	getPW : function(id, property) {

		var obj = this._getWidget(id);
		if (!obj) {
			obj = dijit.byId(event.id);
			console.error("Failed to register event '" + event.id + "', " +
				"parent widget mush provide getWidget(id) widget to support subwidget listening funcion.");
			return;
		}
		
		var value = obj.get(property);
		if (this.monitor != null) {
			this.monitor.monitorGetPropertyAction(id, property, value);
		}
		return value;
	},

	getW : function(id) {
		var obj = this._getWidget(id);
		if (!obj) {
			console.error("Failed to register event '" + event.id + "', " +
				"parent widget mush provide getWidget(id) widget to support subwidget listening funcion.");
			return;
		}
		return obj;
	},
	
	runWF: function( id, functionName, parameter){		
		
		var targetObj = this._getWidget(id);
		if (!targetObj) {
			console.error("Failed to register event '" + event.id + "', " +
				"parent widget mush provide getWidget(id) widget to support subwidget listening funcion.");
			return;
		}
		var args = [];
		for ( var i = 2; i < arguments.length; i++) {
			args[i - 2] = arguments[i];
		}

		var result = targetObj[functionName].apply(targetObj, args);

		if (this.monitor != null) {
			this.monitor.monitorCallFunctionAction(id, functionName, args,
					result);
		}
		
		return result;
	},
	
	// inline-script-beging
	runFunction : function(obj, func, args)
	{
		return func.apply(obj, args);
	},
	
	runInlineScript : function(obj, func)
	{
		return this.runFunction(obj, func, []);
	},
	
	stopEvent : function(evt)
	{
		dojo.stopEvent(evt);
		return false;
	},
	// inline-script--end
	
	destroy : function() {
		this.clearRules();
		this._ruleEvents = undefined;
		this.monitor = undefined;
		this._ruleMaps = undefined;
	}

});