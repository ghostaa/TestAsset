/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2011 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit._FormXValidationMixin"); 

dojo.declare("com.ibm.btt.dijit._FormXValidationMixin", null,{
	// summary:
	//		Mixin for BTT form widget
	// description:
	//		Validate form according to cross fields validation rules	
	
	//xValidations: Collection?
	//				List of xValidation rules
	xValidations : [],
	
	//xValidations: boolean?
	//				Indidates if form is valid according to xValidation rules
	xValid : true,
	
	//_xHintWidget: dijit._widget?
	//				The widget where xvalidation message to be shown around
	
	_xHintWidget : null,
	
	//return value of property by given id
	getPW : function(id, property) {
		var value=dijit.byId(id).get(property);
		return value;
	},
	
	//return widget by given id
	getW : function(id) {
		return dijit.byId(id);
	},
	
	//invoke function of widget by given id
	runWF: function( id, functionName, parameter){		
		
		var targetObj = dijit.byId(id);
		var args = [];
		for ( var i = 2; i < arguments.length; i++) {
			args[i - 2] = arguments[i];
		}

		var result = targetObj[functionName].apply(targetObj, args);
		return result;
	},
	
	//Do xValidation and return the hint message for the hint message for the first invalid rule
	xValidate: function( xRules){
		if(!xRules || xRules.length == 0){
			return "";
		}
		var inValidRule = null;
		for(var i=0; i<xRules.length; i++){
			if(!xRules[i].cond.call(this)){
				inValidRule = xRules[i];
				break;
			}
		}
		return inValidRule;
	},
	
	/**
	 *summary: conditions of an active xValidation for widget
	 *			1. xValidation contains the widget
	 *			2. all values of widgets in xValidation are not null
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getActiveXValidationsForWidget: function(/*String*/ widgetId){	
		return this._getActiveXValidations(this._getXValidationRuleByWidget(widgetId),widgetId);	
	},
	
	
	
	/**
	 * 
	 * @return xvalidation rules in which all values of widget are not null
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getActiveXValidations: function(rules,widgetId){
		return dojo.filter(rules,function(xValidation){
			return dojo.every(xValidation.widgets,function(id){				
				return ((id == widgetId) || (id != widgetId && dijit.byId(id).get("value") != ""));
			});
		});			
	},
	
	/**
	 * 
	 * @return return xValidations which contain the widget
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getXValidationRuleByWidget: function(/*String*/ widgetId){
		var rules = dojo.filter(this.xValidations,function(xValidation){
			return dojo.indexOf(xValidation.widgets,widgetId)>=0;

		});		
		return rules;
	},
	
	//show hint message around widget
	showXValidationMsg : function(/*String*/ hintMsg, widget){
		if(widget){
			this._hideXHint();
			this._xHintWidget = widget;
			dijit.showTooltip(this.getI18NString(hintMsg), widget.domNode);
		}
	},
	
	/**
	 * 
	 * hide current hint message
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_hideXHint : function(){
		if(this._xHintWidget){
			_xHintWidget = null;
			dijit.hideTooltip(this._xHintWidget.domNode);
		}
	},
	
	destroy : function(){
		this.inherited(arguments);
		/*
		 * When destroy the form, the tooltips may still be there event the page is
		 * disposed in ajax mode, need check and close all tooltips when form is disposed
		 * */
		this._hideXHint();
	}
});