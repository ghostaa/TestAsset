  /*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Form");

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit.form.Form");
dojo.require("dijit.Dialog");
dojo.require("com.ibm.btt.dijit.AbstractAjaxMixin");
dojo.require("com.ibm.btt.dijit._FormXValidationMixin");


/**
 * Declare a widget to wrap the HTML form and provide the Ajax Calling function.
 * 
 * Basic Function:
 * 		1. The form widget is used to submit the values of input widgets on the BTT Web2.0 web page.
 *      2. The form widget can invoke the validations of the input widgets on the browser side automatically before submitting.
 *      3. The form widget provides the Ajax calling function to submit all the values of input widgets on the page through XHR.
 *      
 * Implemented based on dijit.form.Form.
 */
dojo.declare("com.ibm.btt.dijit.Form", [ dijit.form.Form,
                                         com.ibm.btt.dijit.AbstractWidgetMixin,
                                         com.ibm.btt.dijit.AbstractAjaxMixin,
                                         com.ibm.btt.dijit._FormXValidationMixin], {
	
	bttErrorPage : "",
	
	/**
	 * This property indicates whether the form will invoke the validation of the input widgets in it.
	 * 
	 */
	validateOnSubmit : true,
	
	hiddenParamHandle : {},
	
	_isStarted : false,
	
	_events : [],
	
	attributeMap: dojo.delegate(dijit.form.Form.prototype.attributeMap, {
		
		visibility : {
			node : "domNode"
		}
	
	}),
	
	create : function() {
		this.submitButton = new Array();
		this.submitButtonOS = new Array();
		this.inherited(arguments);
		
//		this._events = [];
		this._events.push(dojo.connect(this.domNode, "onkeydown", this, "_onKey"));
	},
	
	onLoaded : function(){
		/* a Form event to bind ECA rules when page reloading */
	},
	
	onFormSubmit: function(){
		
	},


	/**
	 * 
	 * hook method for xValidation attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setXValidationsAttr: function(value){
		this.xValidations = value;
		//update xValid
		if(this.xValidate(this.xValidations)){
			this.xValid = false;
			this.setSubmitButtonState();
		}			
	},
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_xValidateByWidget : function(widget){
		//1. show xValidation hint if there is inValid rule
		//2. update xValid & submitButton
		var widgetInvalidRule = this.xValidate(this._getActiveXValidationsForWidget(widget.get("id")));
		var hintWidget = widget;
		if(!widgetInvalidRule){
			widgetInvalidRule = this.xValidate(this._getActiveXValidations(this.xValidations));
			hintWidget = widgetInvalidRule ? dijit.byId(widgetInvalidRule.widgets[0]) : widget;
		}
		if(widgetInvalidRule){
			this.showXValidationMsg(widgetInvalidRule.hint,hintWidget);
		}
		
		//update submit button
		var invalidRule;
		if(invalidRule = this.xValidate(this.xValidations)){
			if(!widgetInvalidRule){//in case hint message was not shown
				this.showXValidationMsg(invalidRule.hint,dijit.byId(invalidRule.widgets[0]));
			}
			this.xValid = false;
		}
		else{
			this.xValid = true;
			this._hideXHint();
		}
		this.setSubmitButtonState();		
	},
	
	fireWidgetBlurEvent : function(widget){
		this._xValidateByWidget(widget);
	},
	
	fireWidgetChangeEvent : function(widget){
		this._xValidateByWidget(widget);
		this.onWidgetChange();
	},
	
	//publish onWidgetChange event
	onWidgetChange : function(){
	},
	
	
	//override
	connectChildren: function(/*Boolean*/ inStartup){
		this.inherited(arguments);		
		var conns = this._childConnections; 
		var _this = this;
		var formDescendants = this.getDescendants();
		dojo.forEach(dojo.filter(formDescendants, function(item){ return item.onChange; } ),
				function(widget){
					conns.push(_this.connect(widget, "onChange", dojo.hitch(_this, "fireWidgetChangeEvent", widget)));
					conns.push(_this.connect(widget, "onBlur", dojo.hitch(_this, "fireWidgetBlurEvent", widget)));
				}
		);
	},
	
	/**
	 * 
	 * try to validate form and set the button status and error message
	 * when the status of any widget under this form changed
	 * 
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onWidgetValidateStatesChange : function(widget) {
		if(this.isValid() && !this.xValid){
			if((inValidRule = this.xValidate(this.xValidations))){
				this.xValid = false;
				this.showXValidationMsg(inValidRule.hint,dijit.byId(inValidRule.widgets[0]));
			}
			else{
				this.xValid = true;	
				this._hideXHint();
			}
		}
		this.setSubmitButtonState();
	},
	
	onSubmit : function(e){
			
		var button = this._querySubmitButton(e);
		if (button && button.bttParams) {
			this.handleButtonSubmit(button);
		} else {
			this.parameterHandler(this.bttParams);
		}
		
		if(this.validateOnSubmit) {
			if(!this.isValid() || !this.xValid) return false;
		}
		
		dojo.forEach(this.getDescendants(), function(widget){
			if(widget.onFormSubmit) {
				widget.onFormSubmit();
			}
		});		
		
		if (this.onFormSubmit) {
			this.onFormSubmit();
		}
		
		
		
		return true;
		
	},
	
	/**
	 * 
	 * get the submit button which is clicked to trigger form submit evnet
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_querySubmitButton : function(e){
		if(this._lastClickedButton){
			return this._lastClickedButton;
		}
	},
	
	/**
	 * 
	 * This method is used to set the disabled states for submit buttons
	 * depending on the validation result in the form. If there were any 
	 * validation error, all submit buttons will be disabled. After all fields
	 * in this form passed all validation rules, submit buttons may be enabled
	 * if it is not disabled by customer.
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	setSubmitButtonState : function() {
		if(this.validateOnSubmit){
			//Normal, Incomplete, or Error
			if ((this.get("state") == "" || this.get("state") == "Normal") && this.xValid) {
				for ( var i = 0; i < this.submitButton.length; i++) {
					var btn = this.submitButton[i];
					btn.set('disabled', btn.get("inValid"));
				}
			} else {
				for ( var i = 0; i < this.submitButton.length; i++) {
					this.submitButton[i].set('disabled', true);
				}
			}
		}
	},
	
	/**
	 * 
	 * Handler method for click the submit button, add 
	 * all btt required parameters into the form
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	handleButtonSubmit : function(button) {
		if (button && button.bttParams && button.bttParams != "") {
			this.parameterHandler(button.bttParams);
		}
	},
	
	
	startup : function() {
		if(this._isStarted)
			return;
		this._isStarted = true;
		this.inherited(arguments);
		var _this = this;
		watches = this._childWatches;
		var conns = this._childConnections; 
		dojo.forEach(dojo.filter(this.getDescendants(), function(item) {
			return  item.get('type') && item.get('type').toLowerCase() == "submit" ;
		}), function(widget) {
			_this.submitButton.push(widget);
			_this.submitButtonOS.push(widget.attr("disabled"));
			watches.push(widget.watch("isValid", function(widget, oldVal, newVal){
				_this.setSubmitButtonState();
			}));
		});
		if (this.bttParams != null && this.bttParams != "") {
			this.parameterHandler(this.bttParams);
		}
		
		if(this.bttErrorPage != null && this.bttErrorPage != "") {
			this.errorPageHandler();
		}
		
		this.watch("state", this._onWidgetValidateStatesChange);
		/* as maybe some widgets are filled with default values. 
		 * Fire this event, so Beta can do something using ECA*/
		this.onWidgetChange(); 
		
		this.setSubmitButtonState();
	},
	
	/**
	 * 
	 * this method is used to add all btt required parameters under this form
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	parameterHandler : function(e) {
		var params = dojo.fromJson(e);
		
		params[AjaxUtil.constants.BTT_TIMEZONE] = AjaxUtil.getTimzone();
		
		this.destroyHiddenParams();
		for ( var paramName in params) {
			if (typeof (paramName) != "undefined") {
				var paramValue = params[paramName];
				this.hiddenParamHandle[paramName] = dojo.create("input", {
					type : 'hidden',
					name : paramName,
					value : paramValue
				});
				dojo.place(this.hiddenParamHandle[paramName],
						this.containerNode, "last");
			}
		}
	},
	
	/**
	 * 
	 * destroy all hidden btt required parameters underthis form
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	destroyHiddenParams : function(){
		for(var paramName in this.hiddenParamHandle){
			dojo.destroy(this.hiddenParamHandle[paramName]);
		}
		this.hiddenParamHandle = {};
	},
	
	/**
	 * 
	 * Add error page parameter under form as a hidden file, it will be submitted to server
	 * together with all other parameters and data
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	errorPageHandler : function() {
		var node = dojo.create("input", {
			type : 'hidden',
			name : AjaxUtil.constants["BTT_ERRORPAGE"],
			value : this.bttErrorPage
		});
		dojo.place(node, this.containerNode, "last");
	},
	
	/**
	 * 
	 * monitor the key press event to submit the form when user click enter on the form
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onKey: function(/*Event*/ evt){
		//listen the onkey event on the domNode to monitor the Enter key event
		//If user press Enter on the widget which inside the form
		//We will test the form node to see whether it is active or not,
		//if this form is inactive(no bttParams) we will terminate the submit
		
		if(evt.keyCode != dojo.keys.ENTER) return evt.keyCode;
		
		// find the src widget
		var widget;
		for (var node=evt.target; node && node!=this.domNode; node=node.parentNode)
		{
			var id = node.getAttribute("widgetId");
			if (id)
			{
				widget = dijit.byId(id); 
				break;
			}
		}
		if (widget && !widget.isInstanceOf(com.ibm.btt.dijit.Button) && !widget.isInstanceOf(com.ibm.btt.dijit.Anchor))
		{
			if(this.bttParams && this.bttParams.indexOf("dse_operationName") > -1)
			{
				dojo.stopEvent(evt);
				this.submit();
			}else{
				evt.preventDefault();
			}
			return false;
		}
		
		return evt.keyCode;
	},
	
	destroy : function() {
		//clean all hidden btt parameters before destroy the form
		this.destroyHiddenParams();
		this.inherited(arguments);
		//release all connections
		while (this._events.length > 0) {
			dojo.disconnect(this._events.pop());
		}
	}
	
});