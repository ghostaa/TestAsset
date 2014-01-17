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

dojo.require("com.ibm.btt.event._EventMixin");

dojo.declare("com.ibm.btt.event.Engine", [com.ibm.btt.event._ConditionMixin, com.ibm.btt.event._AccessKeyMixin, com.ibm.btt.event._EventMixin], {

	monitor : null,
	
	/**
	 * 
	 * handler array for dojo connect method,
	 * used for unregister the event when clear the rules or destroy the engine
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this property in customer code.
	 * */
	_ruleEvents : {},
	
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
	
	registerRules : function(rules, divId, handler) {
		this._formOnLoaded = [];
		for ( var i = 0; i < rules.length; i++){
			if (rules[i].evts) {
				for ( var j = 0; j < rules[i].evts.length; j++) {
					this._registerEvent(rules[i], rules[i].evts[j], divId, handler);
				}
			}
			if (rules[i].type && rules[i].type == "AG") {
				this._ruleMaps[rules[i].name] = rules[i];
			}
		}
		
		for ( var i = 0; i < this._formOnLoaded.length; i++) {
			if (this._formOnLoaded[i].onLoaded) {
				this._formOnLoaded[i].onLoaded();
			}
		}
		
		delete this._formOnLoaded;
		this._formOnLoaded = undefined;
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
	_registerEvent : function(rule, event, divId, handler) {
		
		var size = event.repeatAt ? dijit.byId(event.repeatAt).get("size") : 1;

		for(var i = 0; i < size; i ++) {
			if (event.id.lastIndexOf(".") == -1) {
				var widgetId = event.id + (event.repeatAt ? "_" + i : "");
			} else {
				var parentId = event.id.substring(0, event.id.indexOf("."));
				var childId = event.id.substring(event.id.indexOf("."), event.id.length);
				var widgetId = parentId + (event.repeatAt ? "_" + i : "") + childId;
			}
			var obj = this._getWidget(widgetId);
			if(!obj) {
				obj = dojo.byId(widgetId);
			}
			if (!obj) {
				console.error("Failed to register event[name=" + rule.name + "] because cannot find widget[id=" + widgetId + "]");
				console.warn("  parent widget must provide getWidget(id) to support subwidget function.");
				continue;
			}
			
			//use dojo connect to listen and trigger the event
			var _event = dojo.connect(obj, event.e, this, (function(innerIndex) {
				return function(evt) {
					this.idxPostfix = event.repeatAt ? "_" + innerIndex : null;
					if(event.repeatAt) {
						dijit.byId(event.repeatAt).setCurrentPanelIndex(innerIndex);
					} 
					if (this.monitor != null) {
						this.monitor.monitorStartRule(event, rule);
					}
					var conSize = !event.repeatAt && rule.repeatCondAt ? dijit.byId(rule.repeatCondAt).get("size") : 1;
					for(var j = 0; j < conSize; j ++){
						if(!event.repeatAt && rule.repeatCondAt) {
							this.idxPostfix = "_" + j;
							dijit.byId(rule.repeatCondAt).setCurrentPanelIndex(j);
						}
						var result = this._executeCondition(rule, evt);
						if (this.monitor != null) {
							this.monitor.monitorCondition(event, rule, result);
						}
						var actSize = !event.repeatAt && !rule.repeatCondAt && rule.repeatActionAt ? dijit.byId(rule.repeatActionAt).get("size") : 1;
						for (var m = 0; m < actSize; m ++) {
							if(!event.repeatAt && !rule.repeatCondAt && rule.repeatActionAt) {
								this.idxPostfix =   "_" + m ;
								dijit.byId(rule.repeatActionAt).setCurrentPanelIndex(m);
							}
							this._executeAction(result, rule, evt);
						}
					}
					if (this.monitor != null) {
						this.monitor.monitorEndRule(event,  rule);		
					}
				};
			})(i));
			
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
		}
		if (!divId) {
			divId = "pageDefaultDivId";
		}
		if (!this._ruleEvents[divId]) {
			this._ruleEvents[divId] = [];
		}

		if (handler) {
			handler.push(_event);
		} else {
			this._ruleEvents[divId].push(_event);
		}
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
				result = rule.cond.call(this, evt, rule);
				// test the result and convert the result to boolean
				if(result) {
					result = true;
				}else{
					result = false;
				}
			} catch (e) {
				result = undefined; // in this case, the following action will NOT be executed.
				console.error("An error occured while testing the ECA condition. Terminate this ECA." + e.toString());
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
		if (result===true) {
			if (rule.onTrue) {
				try {
					rule.onTrue.call(this, evt, rule);
				} catch (e) {
					console.error("An error occured while ECA on true state excuting." + e.toString());
				}
			}
		} else if(result===false){
			if (rule.onFalse) {
				try {
					rule.onFalse.call(this, evt, rule);
				} catch (e) {
					console.error("An error occured while ECA on false state excuting." + e.toString());
				}
			}
		}
	},
	
	executeAG : function(name, evt) {
		if(name){
			var rule = this._ruleMaps[name];
			if (rule) {
				var inRepeat = !!this.idxPostfix;
				if(this.monitor && this.monitor.monitorStartAG){
					this.monitor.monitorStartAG(rule);
				}
				var conSize = !inRepeat && rule.repeatCondAt ? dijit.byId(rule.repeatCondAt).get("size") : 1;
				for(var j = 0; j < conSize; j ++){
					if(!inRepeat && rule.repeatCondAt) {
						this.idxPostfix =  "_" + j ;
						dijit.byId(rule.repeatCondAt).setCurrentPanelIndex(j);
					}
					var result = this._executeCondition(rule, evt);
					if(this.monitor && this.monitor.monitorAGCondition){
						this.monitor.monitorAGCondition(rule, result);
					}
					var actSize = !inRepeat && !rule.repeatCondAt && rule.repeatActionAt ? dijit.byId(rule.repeatActionAt).get("size") : 1;
					for (var m = 0; m < actSize; m ++) {
						if(!inRepeat && !rule.repeatCondAt && rule.repeatActionAt){
							this.idxPostfix =  "_" + m;
							dijit.byId(rule.repeatActionAt).setCurrentPanelIndex(m);
						}
						this._executeAction(result, rule, evt);
					}
				}
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
	
	clearRules : function(divId) {
		if (!(divId && this._ruleEvents && this._ruleEvents[divId])) {
			return;
		}
		var tmpRules = this._ruleEvents[divId];
		while (tmpRules.length > 0) {
			try {				
				dojo.disconnect(tmpRules.pop());
			} catch (e) {
				console.error("exception @ Engine.clearRules :" + e);
			}
		}
	},
	
	clearAllRules : function() {
		for ( var name in this._ruleEvents) {
			if(name && this._ruleEvents[name]){
				while (this._ruleEvents[name].length > 0) {
					try {
						dojo.disconnect(this._ruleEvents[name].pop());
					} catch (e) {
						console.error("exception @ Engine.clearRules :" + e);
					}
				}
				this._ruleEvents[name] = undefined;
			}
		}
		this._ruleEvents = {};
		this._ruleMaps = {};
	},

	setPW : function(id, property, value) {
		if (this.monitor != null) {
			this.monitor.monitorSetPropertyAction(id, property, value);
		}
		var obj = this._getWidget(id);

		if("xValidations" == property && obj && typeof obj.idxPostfix != "undefined") {
			var newValue = [];
			for (var m = 0; m < value.length; m ++) {
				if (value[m].repeatCondAt && this.idxPostfix == null) {
					var rPanel = dijit.byId(value[m].repeatCondAt);
					for(var j = 0; j < rPanel.get('size'); j ++) {
						var valueItem = {};
						valueItem.name = value[m].name + "_" + j;
						valueItem.cond = (function(cIdxPf, condFunc){
							return function() {
								this.idxPostfix = cIdxPf;
								return condFunc.call(this);
							};
						})("_" + j, value[m].cond);
						valueItem.widgets = [];
						for(var i = 0; i < value[m].widgets.length; i++) {
							if(dojo.isArray(value[m].widgets[i])){
								var widgetId = value[m].widgets[i][0];
								if (widgetId.lastIndexOf(".") == -1) {
									var newWidgetId = widgetId + "_" + j;
								} else {
									var parentId = widgetId.substring(0, widgetId.indexOf("."));
									var childId = widgetId.substring(widgetId.indexOf("."), widgetId.length);
									var newWidgetId = parentId + "_" + j + childId;
								}
								valueItem.widgets.push(newWidgetId);
							} else {
								valueItem.widgets.push(value[m].widgets[i]);
							}
						}
						valueItem.hint = value[m].hint;
						valueItem.repeatCondAt = value[m].repeatCondAt;
						newValue.push(valueItem);
					}
								
				} else if (value[m].repeatCondAt && this.idxPostfix){
					obj.idxPostfix = this.idxPostfix;
					newValue.push(value[m]);
				} else {
					newValue.push(value[m]);
				}
			}
			for(var z = 0; z < newValue.length; z ++) {
				value[z] = newValue[z];
			}
		}
		
		var dn = undefined;
		if(!obj){
			dn = dojo.byId(id);
		}
		if (!obj && !dn) {
			console.error("Failed to set property[" + property + "] because cannot find the widget[id=" + id + "]");
			return undefined;
		}
		if (obj){
			return obj.set(property, value);
		}else if (dn){
			return dojo.attr(dn, property, value);
		}
	},

	getPW : function(id, property) {
		var obj = this._getWidget(id);
		var dn = undefined;
		if(!obj){
			dn = dojo.byId(id);
		}
		if (!obj && !dn) {
			if (this.monitor != null) {
				this.monitor.monitorGetPropertyAction(id, property, "ERROR[widget=null]");
			}
			console.error("Failed to get property[" + property + "] because cannot find the widget[id=" + id + "]");
			return undefined;
		}
		
		var value = undefined;
		if(obj){
			value = obj.get(property);
		}else if(dn){
			value = dojo.attr(dn, property);
		}
			
		if (this.monitor != null) {
			this.monitor.monitorGetPropertyAction(id, property, value);
		}
		return value;
	},

	getW : function(id) {
		var obj = this._getWidget(id);
		if (!obj) {
			console.error("Failed to find widget[id=" + id + "]");
			return undefined;
		}
		return obj;
	},
	
	runWF: function( id, functionName, parameter){		
		var targetObj = this._getWidget(id);
		if (!targetObj) {
			if (this.monitor != null) {
				this.monitor.monitorCallFunctionAction(id, functionName, args, "ERROR[widget=null]");
			}
			console.error("Failed to run function[" + functionName + "] because cannot find the widget[id=" + id + "]");
			return undefined;
		}
		var args = [];
		for ( var i = 2; i < arguments.length; i++) {
			args[i - 2] = arguments[i];
		}

		var result = undefined;
		var er = null;
		try{
			result = targetObj[functionName].apply(targetObj, args);
		}catch(e){
			er = "An error occured while running function[" + functionName + "]. " + e.toString();
		}

		if (this.monitor != null) {
			this.monitor.monitorCallFunctionAction(id, functionName, args, er?"ERROR[exception]":result);
		}
		if (er){
			console.error(er);
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
		var result;
		try{			
			result = this.runFunction(obj, func, []);
		}catch(e){
			result = undefined;
			console.error("exception @ Engine.runInlineScript:" + e);
		}
		return result;
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

// register specific logic to dojo parser to process the div with ‘display:table’ in IE7 & IE6
(function(){
	
	function processDIV(node){

		var nl = node.children;
		for (var i=0; i<nl.length; i++)
		{
			processDIV(nl.item(i));
		}
		if (node.tagName != "DIV")
		{
			return;
		}
		if (dojo.hasClass(node, "BTTCellStyle"))
		{
			return processCell(node);
		}
		if (dojo.hasClass(node, "BTTRowStyle"))
		{
			return processRow(node);
		}
		if (dojo.hasClass(node, "BTTTableStyle"))
		{
			return processTable(node);
		}
	}
	
	// BTTTableStyle
	function processTable(node){
		var attrs = node.attributes;
		var nat = [];
		for (var i=0; i<attrs.length; i++)
		{
			var ar = attrs[i];
			if (ar.specified){
				nat[ar.nodeName] = ar.nodeValue;
			}
		}

		var table = dojo.create("table", nat);
		table.style.cssText = node.style.cssText;
		var tbody = dojo.doc.createElement('tbody');
		while (node.firstChild) {
			tbody.appendChild(node.firstChild);
		}
		table.appendChild(tbody);
		node.replaceNode(table);
	}
	
	// BTTRowStyle
	function processRow(node){
		replaceTag(node, "tr");
	}

	// BTTCellStyle
	function processCell(node){
		replaceTag(node, "td");
	}
	
	function replaceTag(node, tagName){
		var attrs = node.attributes;
		var nat = [];
		for (var i=0; i<attrs.length; i++)
		{
			var ar = attrs[i];
			if (ar.specified){
				nat[ar.nodeName] = ar.nodeValue;
			}
		}

		var nn = dojo.create(tagName, nat);
		nn.style.cssText = node.style.cssText;
		while (node.firstChild) {
			nn.appendChild(node.firstChild);
		}
		node.replaceNode(nn);
	}


	if (dojo.isIE && dojo.isIE<8)
	{
		dojo.parser.fp_dojo_parser_parse = dojo.parser.parse;
		dojo.parser.parse = function(rootNode, args){
			var root = (rootNode&&rootNode.rootNode)?rootNode.rootNode:rootNode;
			if (root==undefined)
			{
				root = dojo.body();
			}
			// console.debug("div-->table: " + root.nodeName);
			processDIV(root);
			
			return this.fp_dojo_parser_parse(rootNode, args);
		};
	}
})();


