/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2013 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.RepetitivePanel"); 

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("com.ibm.btt.dijit.AbstractWidgetSizeMixin");

dojo.declare("com.ibm.btt.dijit.RepetitivePanel", [dijit._Widget,com.ibm.btt.dijit.AbstractWidgetMixin,
                                                   com.ibm.btt.dijit.AbstractWidgetSizeMixin],{

	_panelDomList : null,
	
	_visibilityList : null,
	
	_currentPanelIndex : -1,
	
	dataNameForRow: "",
	
	selectionMode: "none",
	
	selectionRowIndex: -1,
	
	_events : [],
	
	postCreate : function(){
		this._panelDomList = [];
		this._visibilityList = [];
		this._events = [];
		var _this = this;
		dojo.query("> div.innerPane", this.domNode).forEach(function(node){
			// attach event handling for "onclick" and "onkeydonw" for each panel
			_this._events.push(dojo.connect(node, "onclick", dojo.hitch(_this, _this._onRowClick, node)));
			_this._events.push(dojo.connect(node, "onkeydown", dojo.hitch(_this, _this._onRowKeyDown, node)));
			// _this._visibilityList.push("visible");
			_this._visibilityList.push("inherit");
			 var tableNodeList = dojo.query("> table", node);
			 if(tableNodeList.length > 0) {
				 _this._panelDomList.push(tableNodeList[0]);
			 } else {
				 var divNodeList = dojo.query("> div.BTTTableStyle", node);
				 if(divNodeList.length > 0) {
					 _this._panelDomList.push(divNodeList[0]);
				 }
			 }
		});
		this.containerNode = this.domNode;
	},
	
	_getSizeAttr : function() {
		return this._panelDomList.length;
	}, 
	
	setVisibility : function(idx, vis) {
		if(this._panelDomList.length <= idx) 
			console.errer("Out of size of the repetitive panel");
		var d = "";
		var v = "inherit";
		switch (vis){
		case "gone":
			d = "none";
			v = "inherit";
			break;
		case "hidden":
			d = "";
			v = "hidden";
			break;
//		case "visible": // strongly recommend not using this value directly
//			d = "";
//			v = "visible";
//			break;
		default:
			vis = "inherit";
			d = "";
			v = "inherit";
		}
		
		this._visibilityList[idx] = vis;

		dojo.style(this._panelDomList[idx], "display", d);
		dojo.style(this._panelDomList[idx], "visibility", v);
	},
	
	getVisibility : function(idx) {
		if(this._panelDomList.length <= idx)
			console.errer("Out of size of the repetitive panel");
		
		var v = this._visibilityList[idx]; // gone, hidden, visible and inherit

		if (v == "inherit"){	// compute the inherited value
			var node = this._panelDomList[idx];
			if (node.offsetWidth<1 || node.offsetHeight<1){
				v = "gone";
			}else{
				v = dojo.style(node, "visibility")=="hidden"?"hidden":"visible";
			}
		}
		
		return v;
	},
	
	setStyleClass : function(idx, cls) {
		if(this._panelDomList.length <= idx)
			console.errer("Out of size of the repetitive panel");
		dojo.removeClass(this._panelDomList[idx]);
		dojo.addClass(this._panelDomList[idx], cls);
	},
	
	hasStyleClass : function(idx, cls) {
		if(this._panelDomList.length <= idx)
			console.errer("Out of size of the repetitive panel");
		return dojo.hasClass(this._panelDomList[idx], cls);
		
	},
	
	getCurrentPanelIndex : function() {
		return this._currentPanelIndex;
	},
	
	setCurrentPanelIndex : function(index) {
		this._currentPanelIndex = index;
	},
	
	/**
	 * Handle action when mouse click on panel:
	 * 	1. update selection style on panel
	 *  2. update selection row index
	 * @param node
	 * @param e
	 */
	_onRowClick : function(node, e) {
		if(this.selectionMode == "single") {
			this._updateSelection(node);
		}
	},
	
	/**
	 * Handle action when space key press on panel
	 * 	1. update selection style on panel
	 *  2. update selection row index
	 * @param node
	 * @param e
	 */
	_onRowKeyDown : function(node, e){
		if(this.selectionMode == "single" && (e.keyCode==dojo.keys.SPACE || e.keyCode==dojo.keys.ENTER)){
			this._updateSelection(node);
		}
	},
	
	/**
	 * Update selection row index
	 * Remove "BTTRepetitiveSelectedRow" from previous selected panel, and set it to current selected panel
	 * @param node
	 */
	_updateSelection : function(node) {
		var preSelection = this.selectionRowIndex;
		
		// update selected row index
		var restRowNodeList = dojo.query("~ div.innerPane", node);
		this.selectionRowIndex = this._panelDomList.length - restRowNodeList.length - 1;
		
		// update style
		if(preSelection != -1 && this.selectionRowIndex != preSelection) {
			var allPanelNodes = dojo.query("> div.innerPane", this.domNode);
				if(preSelection <= allPanelNodes.length) {
					dojo.removeClass(allPanelNodes[preSelection], "BTTRepePanelSelectedRow");
				}
		}
		if(this.selectionRowIndex != preSelection) {
			dojo.addClass(node, "BTTRepePanelSelectedRow");
		}
	},
	
	_findInitiator : function(){
		var src = null;
		var callee = arguments.callee;
		for (var c=0; callee && c++<50; callee=callee.caller){
			var evt = null;
			for(var i=0; i<callee.arguments.length && i<8; i++){
				evt = callee.arguments[i];
				if(evt && (evt.type=="submit" || evt.type=="click" || (evt.type=="keydown" && (evt.keyCode==dojo.keys.SPACE || evt.keyCode==dojo.keys.ENTER)))){
					src = evt.target;
					break;
				}
			}
		}
		var srcPanel = null;
		while(src){
			if(dojo.hasClass(src, "innerPane")){
				srcPanel = src;
				break;
			}
			src = src.parentNode;
		}
		return srcPanel;
	},

	/**
	 * When form submit, create a dynamic hidden widget to submit the selected row index to server
	 */
	onFormSubmit : function(){

		if(this.selectionMode == "single") {
			var node = this._findInitiator();
			if(node){
				this._updateSelection(node);
			}
		}

		if(this.dataNameForRow && this.selectionMode == "single"){
			this._tmpInput = com.ibm.btt.dijit.Hidden({
				name : this.dataNameForRow,
				value : this.selectionRowIndex
			});
			dojo.place(this._tmpInput.domNode, this.domNode, "after");
		}
	},
	
	destroy: function(/*Boolean*/ preserveDom){
		this._beingDestroyed = true;
		
		//release all connections
		while (this._events && this._events.length > 0) {
			try{
				dojo.disconnect(this._events.pop());
			}catch(e){}
		}
		this._events = undefined;
		
		// Recursively destroy the children of this widget and their descendants
		// this.containerNode = this.domNode;
		this.destroyDescendants(preserveDom);
		
		this.inherited(arguments);
	}
	
});