/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.dijit.Hidden");
dojo.require("dijit._Templated");
dojo.require("dijit._Widget");

dojo.declare("com.ibm.btt.dijit.Hidden", [dijit._Widget, dijit._Templated ], {

	value : "",

	name : "",
	
	state : "",
	
	type : "hidden",

	templateString : "<input type='${type}'/>",

	attributeMap : dojo.delegate(dijit._Widget.prototype.attributeMap, {
		
		value : {
			node : "domNode"
		},
		
		name : {
			node : "domNode"
		}

	}),
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setValueAttr : function(value) {
		this.value = value;
		this.domNode.value = value;
	}
});