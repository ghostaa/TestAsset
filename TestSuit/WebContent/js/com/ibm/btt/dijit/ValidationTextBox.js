/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/


dojo.provide("com.ibm.btt.dijit.ValidationTextBox"); 

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit.form.ValidationTextBox");
dojo.require("com.ibm.btt.util.I18nBundle");
dojo.requireLocalization("com.ibm.btt.dijit", "TextBox");

dojo.declare("com.ibm.btt.dijit.ValidationTextBox",[dijit.form.ValidationTextBox,
                                                    com.ibm.btt.dijit.AbstractWidgetMixin ],{
	
	width : "",
	
	errorDisplayer : null,
	
	singleFieldErrorMessage : "",
	
	isMandatory : false,
	
	attributeMap: dojo.delegate(dijit.form.ValidationTextBox.prototype.attributeMap, {
		
//		visibility : {
//			node : "domNode"
//		},
		
		width : {
			node : "domNode"
		}
		
	}),
	
	postMixInProperties : function(){
		this.inherited(arguments);
		this.bundle = new com.ibm.btt.util.I18nBundle("com.ibm.btt.dijit", "TextBox");
		if (this.placeHolder) {
			this.placeHolder = this.getI18NString(this.placeHolder);
			this.watch("readOnly", this._updatePlaceHolder);
			this.watch("disabled", this._updatePlaceHolder);
		}
	},
	
	_updatePlaceHolder: function(){
		if(this._phspan && (this.disabled || this.readOnly)){
			this._phspan.style.display="none";
		}else{
			this.inherited(arguments);
		}
	},
	
	acceptedCharReg : "",
	postCreate: function(){
		this.inherited(arguments);
		if(this.acceptedCharReg){
			this.acceptedCharReg = new RegExp(this.acceptedCharReg);
			if(!this.acceptedCharReg) return;
			this.connect(this.textbox, "onkeypress", function(evt){
				if (evt.keyChar && !this.acceptedCharReg.test(evt.keyChar)){
					return dojo.stopEvent(evt);
				}
			});
		}
	},
	
	validator: function(/*anything*/value, /*dijit.form.ValidationTextBox.__Constraints*/constraints){
		var result = typeof(this.regExpGen(constraints))!="undefined" && this.testRegularExpression(this.regExpGen(constraints), value);
		if(!result) {
			this.invalidMessage = this.bundle.getMessage("regularExpressionMessage");
			return false;
		}else{
			var res = (!this.required || !this._isEmpty(value)) &&
                (this._isEmpty(value) || this.parse(value, constraints) !== undefined); // Boolean
            if(res){
            	return true;
            }else{
            	this.invalidMessage = this.bundle.getMessage("invalidMessage");
            	return false;
            }
        }
	},
	
	testRegularExpression : function(reg, value){
		return (new RegExp("^(?:" + reg + ")"+(this.required?"":"?")+"$")).test(value);
	},
	
	/**
	 * 
	 * hook method for width attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setWidthAttr : function(value) {
		if (value != "") {
			this.width = value;
			dojo.style(this.domNode, "width", this.handleLenUint(this.width));
		}
	},
	
	_setIsMandatoryAttr : function(value) {
		this.isMandatory = value;
	},
	
	isErasable : function() {
		if (this.isMandatory || this.textbox.value!="") return false;
		
		var __isR = this.required;
		this.required = false;
		var isE = this.validator("", this.constraints);
		this.required = __isR;
		return isE;
	},
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
//	_setVisibilityAttr : function(value){
//		this.visibility = value;
//		var iconNode;
//		if (typeof (this.domNode.children[0]) != "undefined"
//				&& typeof (this.domNode.children[0].children[0]) != "undefined") {
//			iconNode = this.domNode.children[0].children[0];
//		} else {
//			iconNode = null;
//		}
//		if (value == "gone") {
//			dojo.style(this.domNode, "visibility", "visible");
//			dojo.style(this.domNode, "display", "none");
//			if (iconNode != null) {
//				dojo.style(iconNode, "visibility", "");
//			}
//		} else if (value == "hidden") {
//			dojo.style(this.domNode, "display", "");
//			dojo.style(this.domNode, "visibility", "hidden");
//			if (iconNode != null) {
//				dojo.style(iconNode, "visibility", "hidden");
//			}
//		} else {
//			dojo.style(this.domNode, "display", "");
//			dojo.style(this.domNode, "visibility", "visible");
//			if (iconNode != null) {
//				dojo.style(iconNode, "visibility", "");
//			}
//		}
//	},
	
	_onFocus: function(/*String*/ by) {
		this.onShowErrorFlag=false;
		if(this.errorDisplayer) this.errorDisplayer.hide(this.domNode);
		this.inherited(arguments);
	},
	
	
	onShowErrorFlag : false,
	showErrorMessage: function(/*String*/ message){
		
		if(dojo.isArray(message)) {
			var nlsMessageArray = [];
			for(var i = 0; i < message.length; i ++) {
				var tempMessage = this.getI18NString(message[i]);
				if(tempMessage == null) tempMessage = message[i];
				nlsMessageArray.push(tempMessage);
			}
			if(nlsMessageArray.length != 0) {
				var nlsMsg = nlsMessageArray.join(" ");
			} else {
				var nlsMsg = "";
			}
		} else {
			var  args=[];
			var  values=[];
			if (arguments.length==0){
				arguments[0]="";
				message="";
			}
			
			for (var i=1;i<arguments.length; i++ ){
				values[i-1]=arguments[i];
			}	
			args[0]=arguments[0];
			args[1]=values;
			args[2]=true;
			var nlsMsg=this.getI18NString.apply(this,args );	
			if (nlsMsg==null) nlsMsg=message;
		}
			
		 if (message!=""){
			// if(this._message == message){ return; }
			 this._message = message;
			 dijit.hideTooltip(this.domNode);
			 //This line is used to fix PMR JR41644, 
			 //set cursor to current textBox when show error message toolTip beside textBox
			 //this.focus();
			 dojo.window.scrollIntoView(this.focusNode);
			 
			 this.onShowErrorFlag=true;
			 if(!this.errorDisplayer)  
				 this.errorDisplayer = new dijit._MasterTooltip();		
			 this.errorDisplayer.show( nlsMsg , this.domNode, this.tooltipPosition, !this.isLeftToRight());	
		 }
		 else {
			 this.onShowErrorFlag=false;
			 if(this.errorDisplayer) 
					this.errorDisplayer.hide(this.domNode);
		 }
			
		 this._refreshState();
	},
	// override
	validate: function( isFocused){ 
	
		if (this.onShowErrorFlag){ //mask warnings
			//this.state = "Error" ; 
			this._set("state", "Error");
			this._setStateClass();
			dijit.setWaiState(this.focusNode, "invalid", false ? "false" : "true");
			if(isFocused){
				if(this.state == "Error"){
					message = this.getErrorMessage(true);
				}else{
					message = this.getPromptMessage(true); // show the prompt whever there's no error
				}
				this._maskValidSubsetError = true; // since we're focused, always mask warnings
			}
			//this.displayMessage(message);  // not show internal error message, just mask ! warnings only
			return false; 
		}else
			return this.inherited(arguments);
	},
	
	destroy : function(){
		this.displayMessage("");
		if(this.errorDisplayer){
			this.errorDisplayer.hide(this.domNode);
		}
		this.inherited(arguments);
		if(this.errorDisplayer){
			this.errorDisplayer.destroy();
			this.errorDisplayer = undefined;
		}
	}

});

dojo.declare("com.ibm.btt.dijit.MappedTextBox",[com.ibm.btt.dijit.ValidationTextBox,dijit.form.MappedTextBox],{});

dojo.declare("com.ibm.btt.dijit.RangeBoundTextBox",[com.ibm.btt.dijit.MappedTextBox,dijit.form.RangeBoundTextBox],{
	
	postMixInProperties : function(){
		this.inherited(arguments);
		this.bundle = new com.ibm.btt.util.I18nBundle("com.ibm.btt.dijit", "TextBox");
	},
	
	rangeCheck: function(/*Number*/ primitive, /*dijit.form.RangeBoundTextBox.__Constraints*/ constraints){	
		if("min" in constraints && this.compare(primitive,constraints.min) < 0){
			this.rangeMessage = this.bundle.getMessage("rangeMinMessage",{value:constraints.min});
			return false;
		}
		if("max" in constraints && this.compare(primitive,constraints.max) > 0){
			this.rangeMessage = this.bundle.getMessage("rangeMaxMessage",{value:constraints.max});
			return false;
		}
		return true;
	}

});