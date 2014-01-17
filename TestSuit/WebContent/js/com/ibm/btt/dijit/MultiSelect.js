/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/


dojo.provide("com.ibm.btt.dijit.MultiSelect");

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit.form.MultiSelect");

dojo.declare("com.ibm.btt.dijit.MultiSelect", [com.ibm.btt.dijit.AbstractWidgetMixin,
		 dijit.form.MultiSelect], {
	
	//default value for submit
	labelFieldForSubmit : "label",
	valueFieldForSubmit : "value",
	width : "",
	baseClass : "bttMultiSelect",
	
	buildRendering: function(){
		this.inherited(arguments);
		dojo.query("option", this.containerNode).forEach(function(node){
			if(node){
				dojo.attr(node, "_disabled", node["disabled"]);
			}
		});
	},

	postCreate : function() {
		this.inherited(arguments);
	
		if(this.width != ""){
			dojo.style(this.domNode, "width", this.width);			
		}
	},
	
	_getValueAttr : function(){
		return this.getSelected().map(dojo.hitch(this, function(n){
			var result = {};
			result[this.labelFieldForSubmit] = n.label || n.innerText;
			result[this.valueFieldForSubmit] = n.value;
			return result;
		}));
	},
	
	_setDisabledAttr: function(value){
		var r = this.readOnly;
		dojo.query("option", this.containerNode).forEach(function(node){
			if(node){
				dojo.attr(node, "_disabled", value);
				node["disabled"] = value || r;
			}
//			if (value && node.selected){
//				node.selected = false;
//			}
		});
		this.inherited(arguments);
		dojo.toggleClass(this.domNode, "bttMultiSelectDisabled dijitDisabled", value);
		this.domNode.disabled = value || this.readOnly;
	},
	
	_setReadOnlyAttr: function(value){
		var d = this.disabled;
		dojo.query("option", this.containerNode).forEach(function(node){
			if(node){
				dojo.attr(node, "_readOnly", value);
				node["disabled"] = value || d || dojo.attr(node, "_disabled");
			}
		});
		this.inherited(arguments);
		dojo.toggleClass(this.domNode, "bttMultiSelectReadOnly dijitReadOnly", value);
		this.domNode.disabled = value || this.disabled;
	}

});