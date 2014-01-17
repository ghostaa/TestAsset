/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2012 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/


dojo.provide("com.ibm.btt.dijit.CheckedMultiSelect");

dojo.require("dojox.form.CheckedMultiSelect");

dojo.declare("com.ibm.btt.dijit.CheckedMultiSelect", [com.ibm.btt.dijit.AbstractWidgetMixin, dojox.form.CheckedMultiSelect], {
	//default value for submit
	labelFieldForSubmit : "label",
	valueFieldForSubmit : "value",
	width : "",
	_lastFocusedOption : null,
	
	postCreate : function() {
		this.inherited(arguments);
	
		if(this.width != ""){
			dojo.style(this.domNode, "width", this.width);
		}
	},

	_setDisabledAttr: function(value){
		dojo.forEach(this.getOptions(), function(node){
			if(node){
				node["disabled"] = value;
			}
		});
		this.inherited(arguments);
	}, 
	
	_setReadOnlyAttr: function(value){
		this.inherited(arguments);
		dojo.toggleClass(this.domNode, "dojoxMultiSelectReadOnly dijitReadOnly", value);
	},

	onAfterAddOptionItem: function(item, option){
		item.set("readOnly", this.readOnly);
		item.set("disabled", this.disabled);
		dojo.attr(item.checkBox.focusNode, "tabIndex", this.tabIndex);
		item.connect(item, "onFocus", dojo.hitch(this, function(){
			if (this._lastFocusedOption){
				dojo.style(this._lastFocusedOption, "border", "dotted 0px gray");
			}
			this._lastFocusedOption = item.labelNode;
			if(!(this.disabled || this.readOnly)){
				dojo.style(this._lastFocusedOption, "border", "dotted 1px gray");
			}
		}));
	},
	
	onBlur: function(){
		this.inherited(arguments);
		if (this._lastFocusedOption){
			dojo.style(this._lastFocusedOption, "border", "dotted 0px gray");
		}
	},
	
	_getValueAttr : function(){
		
		// summary:
		//		Returns the value of the widget by reading the options for
		//		the selected flag
		var opts = this.getOptions();
		
		var selection = dojo.filter(opts, function(n){
			return n.selected;
		});
		
		return dojo.map(selection, dojo.hitch(this, function(i){
			var result = {};
			result[ this.labelFieldForSubmit] = i.label || i.innerText;
			result[ this.valueFieldForSubmit] = i.value;
			return result;
		}));
	},
	
	// defect 30685
	_setHintAttr : function(value){
		this.hint = value;
		var node = this.domNode;
		node.title = StringUtil.removeWarp(this.getI18NString(value));
	}

});