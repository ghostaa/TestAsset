/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2012 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/


dojo.provide("com.ibm.btt.dijit.EnhancedMultiSelect");

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("com.ibm.btt.dijit.CheckedMultiSelect");

dojo.declare("com.ibm.btt.dijit.EnhancedMultiSelect", [dijit._Widget, dijit._Templated, com.ibm.btt.dijit.AbstractWidgetMixin], {
	
	 templateString: dojo.cache("com.ibm.btt.dijit", "templates/Ems.html"),
	 widgetsInTemplate : true,
	 width : "",
	 dataName:"",
	 value: null,

	 labelFieldForSubmit : "label",
	 valueFieldForSubmit : "value",
	 disabled : false,
	 readOnly : false,
	 tabIndex : 0,
	 
	 
	buildRendering: function(){
		this.inherited(arguments);
		this.wrapperDiv.set("disabled", this.disabled);
		this.wrapperDiv.set("readOnly", this.readOnly);
	},
	
	postCreate : function() {
		this.inherited(arguments);

		this.wrapperDiv.addOption(
				dojo.map(this.srcNodeRef.options, function(o){
					return {label: o.text, value: o.value,selected: o.selected, disabled: o.disabled};
				})
		);
		this.value = this.wrapperDiv.get("value");
		
		if(this.width != ""){
			dojo.style(this.domNode, "width", this.width);
			dojo.style(this.wrapperDiv.domNode, "width", this.width);
		}
		
		this.connect(this.wrapperDiv, "onChange", dojo.hitch(this, function(){
			this.onChange();
		}));

		this.connect(this.wrapperDiv, "_updateSelection", dojo.hitch(this, function(i){
			var fil = dojo.filter(this.wrapperDiv.getOptions(), function(item){
			    return item.selected === true;
			});
			this.labelNode.innerHTML = fil.length +" of "+ this.wrapperDiv.getOptions().length +" selected";
		}));
	},
	
	_setDisabledAttr: function(value){
		this.disabled = value;
		this.wrapperDiv.set("disabled", value);
		dojo.toggleClass(this.buttonNode, "enhancedMultiSelectButton", !(this.disabled || this.readOnly));
		dojo.toggleClass(this.buttonNode, "enhancedMultiSelectButtonDisabled",  this.disabled || this.readOnly);
	}, 
	
	_setReadOnlyAttr: function(value){
		this.readOnly = value;
		this.wrapperDiv.set("readOnly", value);
		dojo.toggleClass(this.buttonNode, "enhancedMultiSelectButton", !(this.disabled || this.readOnly));
		dojo.toggleClass(this.buttonNode, "enhancedMultiSelectButtonDisabled",  this.disabled || this.readOnly);
	}, 
	
	_selectAll : function (){
		if(!this.disabled && !this.readOnly) {
			dojo.forEach(
				this.wrapperDiv.getOptions(),
				function(option){
					if(!option.disabled){
						option.selected = true;
					}
				}
			);
			this.wrapperDiv._updateSelection();
		}
	},
	
	_unselectAll : function (){
		if(!this.disabled && !this.readOnly) {
			dojo.forEach(
					  this.wrapperDiv.getOptions(),
					  function(option){
						  if(!option.disabled){
							  option.selected = false;
						  }
					  }
					);
			this.wrapperDiv._updateSelection();
		}
	},
	
	_invertSelection : function (){
		if(!this.disabled && !this.readOnly) {
			dojo.forEach(
					  this.wrapperDiv.getOptions(),
					  function(option){
						  if(!option.disabled){							  
							  option.selected = !option.selected;
						  }
					  }
					);
			this.wrapperDiv._updateSelection();
		}
	},
	
	_getValueAttr: function() {
		this.value = this.wrapperDiv.get("value");
		return this.value;
	},
	
	/**
	 * Get the value of specified item from selected items.
	 * 
	 * @param index	the index of specified item in selected items array.
	 * @returns
	 */
	getValueByIndex: function(index) {
		var value = this.get("value");
		if(value && index < value.length) {
			return value[index][this.valueFieldForSubmit];
		}
	},
	
	/**
	 * Return the number of selected items.
	 * 
	 * @returns
	 */
	getValueLength: function() {
		var value = this.get("value");
		if(value) {
			return value.length;
		}
	},
	
	/**
	 * Callback when this widget's value is changed.
	 */
	onChange: function(){
	}
});