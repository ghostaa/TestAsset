/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.dijit.RadioButton");

dojo.require("dijit.form.RadioButton");
dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");

dojo.declare("com.ibm.btt.dijit.RadioButton", [ dijit.form.RadioButton, com.ibm.btt.dijit.AbstractWidgetMixin], {

	isChecked : false,

	text : "",

	visibility : "visible",
	
	width : "",
	
	height : "",
	
	textWrap : false,

	attributeMap : dojo.delegate(dijit.form.RadioButton.prototype.attributeMap,{

		text : {
			node : "labelNode"
		},
		
		isChecked : {
			node : "domNode"
		},

		visibility : {
			node : "domNode"
		}

	}),

	postMixInProperties: function(){
		if(this.isChecked==true){
			this.checked = "checked";
			this.params.checked = "checked";
		}
		this.inherited(arguments);
	},
	
	create : function() {
		this.labelNode = dojo.create("label", {'class':'dijitLabelBase'}, this.domNode, "after");
		this.inherited(arguments);
		this.labelNode.htmlFor = this.id;
		dojo.place(this.labelNode, this.domNode, "after");
		

		if (this.width && this.width != "") {
			this.set("width", this.width);
		}
		
		if (this.height && this.height != "") {
			this.set("height", this.height);
		}
		
	},

	/**
	 * 
	 * hook method for isChecked attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setIsCheckedAttr : function(value){
		this.set("checked", value);
	},
	
	/**
	 * 
	 * hook method for checked attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setCheckedAttr : function(value){
		if (value == false || value == "false" || value == "") {
			this.isChecked = false;
		}else {
			this.isChecked = true;
		}
		this.inherited(arguments);
	},
	
	/**
	 * 
	 * hook method for text attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextAttr : function(value){
		this.text = value;
		this.labelNode.innerHTML = StringUtil.escapeEnterWrap(this.getI18NString(value));
	},
	
	/**
	 * 
	 * hook method for style attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setStyleAttr : function(value){
		dojo.attr(this.labelNode, "style", value);
	},
	
	/**
	 * 
	 * hook method for class attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setClassAttr : function(value){
		dojo.attr(this.labelNode, "class", value);
	},

	/**
	 * 
	 * hook method for hint attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHintAttr : function(value){
		this.hint = value;
		var tmpVal = StringUtil.removeWarp(this.getI18NString(value));
		this.domNode.title = tmpVal;
		this.labelNode.title = tmpVal;
	},
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setVisibilityAttr : function(value){
		this.visibility = value;
		if (value === "gone") {
			dojo.style(this.domNode, "visibility", "visible");
			dojo.style(this.domNode, "display", "none");
			
			dojo.style(this.labelNode, "visibility", "visible");
			dojo.style(this.labelNode, "display", "none");
		} else if (value === "hidden") {
			dojo.style(this.domNode, "display", "");
			dojo.style(this.domNode, "visibility", "hidden");
			
			dojo.style(this.labelNode, "display", "");
			dojo.style(this.labelNode, "visibility", "hidden");
		} else {
			dojo.style(this.domNode, "display", "");
			dojo.style(this.domNode, "visibility", "visible");
			
			dojo.style(this.labelNode, "display", "");
			dojo.style(this.labelNode, "visibility", "visible");
		}
	},
	
	/**
	 * 
	 * hook method for readOnly attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setReadOnlyAttr: function(/*Boolean*/ value){
		this.inherited(arguments);
		if (value === "true" || value === true) {
			this.labelNode.htmlFor = "";
		}
		else{
			this.labelNode.htmlFor = this.id;
		}
	},
	
	/**
	 * 
	 * override default onclick method to fix read only bug for IE6/7/8
	 * this mathod will be removed after dojo fixed this defect
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onClick : function(e) {
		this.inherited(arguments);
		if (dojo.isIE && this.readOnly && this.focusNode.form) {
			dojo.stopEvent(e);
			dojo.query("INPUT[type=radio]", this.focusNode.form).forEach(
				dojo.hitch(this, function(inputNode) {
					if (inputNode.name == this.name && inputNode.form == this.focusNode.form) {
						var widget = dijit.getEnclosingWidget(inputNode);
						if (widget && "checked" in widget) {
							widget.set('checked', widget.checked);
						}
					}
			}));
		}
	},
	
	/**
	 * 
	 * hook method for textWrap attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextWrapAttr : function(value) {
		this.textWrap = value;
		if (this.textWrap) {
			dojo.addClass(this.labelNode, "dijitLabelWrap");
		} else {
			dojo.removeClass(this.labelNode, "dijitLabelWrap");
		}
	},
	
	/**
	 * 
	 * hook method for width attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setWidthAttr : function(value){
		if(this.width != ""){
			this.width = value;
			
			var width = value.replace(new RegExp("px", "gm"), "");
			try{
				width = Number(width);
			} catch(e) {
				console.error("Illegal input argument. Can not convert input width:"+ value +" to number.");
				return;
			}
			var box = dojo.marginBox(this.domNode);
			var labelWidth = width - box.w;
			if(labelWidth<0){
				labelWidth = 0;
			}
			dojo.style(this.labelNode, "width", labelWidth + "px");
		}
	},
	
	/**
	 * 
	 * hook method for height attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHeightAttr : function(value){
		if(this.height != ""){
			this.height = value;
			var height = value.replace(new RegExp("px", "gm"), "");
			/*try{
				height = Number(height);
			} catch(e) {
				console.error("Illegal input argument. Can not convert input height:"+ value +" to number.");
				return;
			}
			var box = dojo.marginBox(this.domNode);
			var labelHeight = height - box.h;
			if(labelHeight<0){
				labelHeight = 0;
			}*/
			dojo.style(this.labelNode, "height", height + "px");
		}
	},
	
	/**
	 * 
	 * hook method for focus event
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	// fix for JR41901, remove focused style for empty label
	_onFocus: function(){
		this.inherited(arguments);
		if(!this.text || this.text === "" || this.text === null ){
			dojo.query("label[for='"+this.id+"']").removeClass("dijitFocusedLabel");
		}
	},
	
	destroy : function(){
		this.inherited(arguments);
		dojo.destroy(this.labelNode);
		this.labelNode = null;
	}
});