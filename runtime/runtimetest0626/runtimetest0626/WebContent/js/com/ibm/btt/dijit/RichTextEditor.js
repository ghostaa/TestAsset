/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.RichTextEditor");

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit.Editor");

dojo.declare("com.ibm.btt.dijit.RichTextEditor", [ dijit.Editor,
        com.ibm.btt.dijit.AbstractWidgetMixin ], {
	
	width:"",
	
	readOnly : false,
	
	attributeMap: dojo.delegate(dijit.Editor.prototype.attributeMap, {
		
		visibility : {
			node : "domNode"
		},
		
		width : {
			node : "domNode"
		},
		
		readOnly : {
			node : "domNode"
		}
		
	}),

	/**
	 * 
	 * hook method for readOnly attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setReadOnlyAttr : function(value) {
		this.set("disabled", value);
	},

	/**
	 * 
	 * hook method for readOnly attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getReadOnlyAttr : function() {
		return this.get("disabled");
	},
	
	postCreate: function(){
		
		var tmpName = this.name;
		
    	this.inherited(arguments);
		this._setWidthAttr(this.width);
		this._setHintAttr(this.hint);
		this._setVisibilityAttr(this.visibility);
		this.resetContent = this.get("savedContent");
		
		if(tmpName == "" || tmpName == null || tmpName == undefined){
			this.name = null;
		}
		
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
	
	/**
	 * 
	 * hook method for hint attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHintAttr : function(value){
		this.hint = value;
		if (typeof (this.editingArea) != "undefined" && this.editingArea != null) {
			this.editingArea.parentNode.title = StringUtil.removeWarp(this.getI18NString(value));
		}
	},
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	
	_getValueAttr : function(){
		var value = this.inherited(arguments);
		if(dojo.isFF && (value == "<br _moz_editor_bogus_node=\"TRUE\" />" || value == '<br />')){
			return "";
		} else {
			return value;
		}
	},
	
	reset : function(e){
		this.set("value", this.resetContent);
	}

});