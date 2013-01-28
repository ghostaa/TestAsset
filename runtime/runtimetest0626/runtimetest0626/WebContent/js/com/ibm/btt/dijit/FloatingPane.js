/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.FloatingPane"); 

dojo.require("dojox.layout.FloatingPane");

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");

dojo.declare("com.ibm.btt.dijit.FloatingPane", [dojox.layout.FloatingPane, com.ibm.btt.dijit.AbstractWidgetMixin],{
	
	_setTitleAttr : function(value){
		this.title = value;
		this.titleNode.innerHTML = this.getI18NString(value);
	},
	
	_getTitleAttr : function(){
		return this.title;
	}
	
}); 
	