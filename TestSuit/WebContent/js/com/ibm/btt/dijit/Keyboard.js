/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Keyboard"); 
dojo.getObject("com.ibm.btt.dijit.keyboards", true); 

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit._Templated"); 
dojo.require("dijit._Widget"); 

dojo.declare("com.ibm.btt.dijit.Keyboard",[dijit._Widget,dijit._Templated,com.ibm.btt.dijit.AbstractWidgetMixin] ,{ 
	
	templateString: dojo.cache("com.ibm.btt.dijit", "templates/Keyboard.html"),
	
	_keys : null,
	
	_evts : [],
	
	dynamicKeys : false,
	
	postCreate : function() {

		this._initKeys();

		if (!com.ibm.btt.dijit.keyboards.instances) {
			com.ibm.btt.dijit.keyboards.instances = [];
		}
		com.ibm.btt.dijit.keyboards.instances.push(this);
		
	},
	
	refWidget : "",
	
	_getRefWidgetAttr : function(value){
		this.refWidget = value;
		//logic
	},
	
	_initKeys : function(){
		
		this._keys = ["7", "8", "9", "+", "4", "5", "6", "-", "1", "2", "3", "*", "0", "."];
		
		for ( var i = 0; i < 16; i++) {
			this._evts.push(dojo.connect(this["key"+i], "onmousedown", this, dojo.hitch(this, this._onMouseDown, this["key"+i])));
			this._evts.push(dojo.connect(this["key"+i], "onmouseup", this, dojo.hitch(this, this._onMouseUp, this["key"+i])));
			this._evts.push(dojo.connect(this["key"+i], "onmouseover", this, dojo.hitch(this, this._onMouseOver, this["key"+i])));
			this._evts.push(dojo.connect(this["key"+i], "onmouseout", this, dojo.hitch(this, this._onMouseOut, this["key"+i])));
		}
		
		for ( var i = 0; i < 15; i++) {
			if (i == 11) {
				continue;
			}
			var num;
			if (this.dynamicKeys) {
				num = parseInt(Math.random() * this._keys.length); 
			} else {
				num = 0;
			}
			this["key" + i].innerHTML = this._keys[num];
			this._evts.push(dojo.connect(this["key" + i], "onclick", this, dojo.hitch(this, this._onCellClick, this._keys[num], this["key" + i])));
			this._keys.splice(num, 1);
		}
		
		this._evts.push(dojo.connect(this["key11"], "onclick", this, dojo.hitch(this, this._onBackClicked, this["key"+i])));
		this._evts.push(dojo.connect(this["key15"], "onclick", this, dojo.hitch(this, this._onEnterClicked, this["key"+i])));

		this._evts.push(dojo.connect(this.domNode, "onclick", this, this._onKeyboardClicked));
		
	},
	
	_onCellClick : function(key, node){
		if (this.refWidget) {
			var refWidget = dijit.byId(this.refWidget);
			refWidget.set("value", refWidget.get("value") + key);
		}
	},
	
	_onBackClicked : function(node){
		
		if (this.refWidget) {
			var refWidget = dijit.byId(this.refWidget);
			var value = refWidget.get("value").toString();
			refWidget.set("value",  value.substr(0, value.length-1));
		}
	},
	
	_onEnterClicked : function(node){
		this.hide();
	},
	
	show : function(){
		if (!this.refWidget) {
			return;
		}
		var refWidget = dijit.byId(this.refWidget);
		var aroundNode = refWidget.domNode;
		var pos = dijit.placeOnScreenAroundElement(this.domNode, aroundNode, dijit.getPopupAroundAlignment(dijit.Tooltip.defaultPosition));
		dojo.style(this.domNode, "display", "");
		this._focusRefWidget();
	},
	
	hide : function(){
		dojo.style(this.domNode, "display", "none");
		this._focusRefWidget();
	},
	
	_onKeyboardClicked : function(){
		this._focusRefWidget();
	},
	
	_focusRefWidget : function(){
		if (this.refWidget) {
			var refWidget = dijit.byId(this.refWidget);
			refWidget.focus();
		}
	},
	
	_onMouseDown : function(node){
		dojo.addClass(node, "active");
	},
	
	_onMouseUp : function(node){
		dojo.removeClass(node, "active");
	},
	
	_onMouseOver : function(node){
		if (!dojo.hasClass(node, "hovered")) {
			dojo.addClass(node, "hovered");
		}
	},
	
	_onMouseOut : function(node){
		dojo.removeClass(node, "hovered");
	}
	
}); 
