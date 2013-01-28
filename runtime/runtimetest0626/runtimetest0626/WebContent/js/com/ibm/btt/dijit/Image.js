/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Image");

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit._Templated");
dojo.require("dijit._Widget");

dojo.declare("com.ibm.btt.dijit.Image", [ dijit._Widget, dijit._Templated,com.ibm.btt.dijit.AbstractWidgetMixin], {

	templateString : "<img >",

	location : "",

	width : "",

	height : "",

	attributeMap : dojo.delegate(dijit._Widget.prototype.attributeMap,{
		
		location : {
			node : "domNode",
			type : "attribute",
			attribute : "src"
		},
		
		width : {
			node : "domNode",
			type : "attribute"
		},
		
		height : {
			node : "domNode",
			type : "attribute"
		},
		
		visibility : {
			node : "domNode"
		}
		
	}),
	
	/**
	 * 
	 * hook method for hint and alt attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHintAttr : function(value){
		this.inherited(arguments);
		this.domNode.alt = this.domNode.title;
	},
	
	/**
	 * 
	 * hook method for location attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setLocationAttr : function(value){
		this.location = value;
		if (value)
		{
			this.domNode.src = value;
			dojo.style(this.domNode,"display","");
		}else{
			dojo.style(this.domNode,"display","none");
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
	 * hook method for height attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHeightAttr : function(value) {
		if (value != "") {
			this.height = value;
			dojo.style(this.domNode, "height", this.handleLenUint(this.height));
		}
	}
});
