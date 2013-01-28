/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.SortList"); 

dojo.require("dojox.widget.SortList");
dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");

dojo.declare("com.ibm.btt.dijit.SortList", [dojox.widget.SortList, com.ibm.btt.dijit.AbstractWidgetMixin],{

	_addItem: function(item){
		dojo.create("li", {
			innerHTML: this.getI18NString(this.store.getValue(item, this.key).replace(/</g, "&lt;")),
			id : this.store.getValue(item, "id")
		}, this.containerNode);
	},
	
	_handleClick: function(/* Event */e){
		dojo.toggleClass(e.target,"sortListItemSelected");
		e.target.focus();
		this._updateValues(e.target);
	},
	
	_set: function(/* Event */e){
		// summary: set hover state
		// need to check e.target in case it is null during initialization
		if((e.target !== this.bodyWrapper) && e.target){
			dojo.addClass(e.target,"sortListItemHover");
		}
	}

});