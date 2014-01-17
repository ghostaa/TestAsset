/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.AbstractWidgetSizeMixin"); 

dojo.declare("com.ibm.btt.dijit.AbstractWidgetSizeMixin", null,{
	
	width:"",
	
	height:"",
	
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
	},
	
	handleLenUint : function(value) {
		var endWith = function(src, oString) {
			var reg = new RegExp(oString + "$");
			return reg.test(src);
		};
		if(endWith(value, "px") || endWith(value, "%") || endWith(value, "em")){
			return value;
		}else{
			return value + "px";
		}
	}
	
}); 
	