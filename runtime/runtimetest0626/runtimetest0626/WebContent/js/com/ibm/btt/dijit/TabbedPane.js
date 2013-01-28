/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.TabbedPane");

dojo.require("dijit.layout.TabContainer");
dojo.require("dijit.layout.ScrollingTabController");
dojo.require("dijit.layout.TabController");
dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");

dojo.declare("com.ibm.btt.dijit.TabbedPane", [dijit.layout.TabContainer,
                                              com.ibm.btt.dijit.AbstractWidgetMixin],{
	width : "800",
	
	height : "600",

	constructor: function(){
    	this._disableWatch = {};
    },
	
	postMixInProperties : function() {
		this.inherited(arguments);
		this.controllerWidget = (this.tabPosition == "top" || this.tabPosition == "bottom")
			&& !this.nested ? "com.ibm.btt.dijit.ScrollingTabController" : "com.ibm.btt.dijit.TabController";
	},
	
	startup : function(){
		this.inherited(arguments);
		this.set("visibility",this.visibility);
		
		//watch disabled attribute of all children,
		//if one child is disabled and this child is current selected
		//then select another enabled child
		var children = this.getChildren();
		dojo.forEach(children, function(child){
			this._disableWatch[child.id] = child.watch("disabled", dojo.hitch(this, this._checkDisabedPane, child));
		}, this);
		this._setInitialTabSelection();
	},
	
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setVisibilityAttr : function(value){
		this.inherited(arguments);
		if(typeof(this.tablist)!=="undefined"){
			if (value == "gone") {
				dojo.style(this.tablist.domNode, "visibility", "visible");
			} else if (value == "hidden") {
				dojo.style(this.tablist.domNode, "visibility", "hidden");
			} else {
				dojo.style(this.tablist.domNode, "visibility", "visible");
			}
		}
	},
	
	/**
	 * 
	 * close the tab by tab index
	 * 
	 * @tag public 
	 * 
	 * @param 
	 * */
	closeChildByIndex : function(i){
		var children = this.getChildren();
		this.closeChild(children[i]);
	},
	
	closeChildById : function(id){
		var children = this.getChildren();
		for(var i=0;i<children.length;i++){
			if(id===children[i].id){
				this.closeChild(children[i]);
			}
		}
	},
	
	selectChildByIndex : function(i){
		var children = this.getChildren();
		this.selectChild(children[i]);
	},
	
	selectChildById : function(id){
		var children = this.getChildren();
		for ( var i = 0; i < children.length; i++) {
			if (id === children[i].id) {
				this.selectChild(children[i]);
				break;
			}
		}
	},
	
	closeChild : function(child){
		if (child.get("disabled") != true) {
			this.inherited(arguments);
		}
	},
	
	selectChild : function(child){
		if (child.get("disabled") != true) {
			this.inherited(arguments);
		}
	},
	
	hideTabByIndex : function(index){
		var children = this.getChildren();
		//check if the input index is a valid number of current tabs
		if (index > -1 && index < children.length) {
			
			//check and save all visible tabs
			var visibleTabs = this._getCurrentVisibleTabs();
			
			//check if there is only one visible tab shown
			//we do nothing, just ignore the hide action
			if (visibleTabs.length > 1) {
				//find the child specified by index
				var child = children[index];
				//find and hide the related tab
				var button = this.tablist.pane2button[child.id];
				dojo.style(button.domNode, "display", "none");
				button._displayMark = "hidden";
				
				//if there are still visible tabs and current tab is just the tab to be hide
				//we need to select the next one tab, and if it is the last tab, we select the previous one.
				if (child.selected) {
					var i;
					for (i = 0; i < visibleTabs.length; i++) {
						if (visibleTabs[i].id == child.id) {
							break;
						}
					}
					if (i + 1 < visibleTabs.length) {
						//If this tab is not the last visible one, we select the next one
						this.selectChildById(visibleTabs[i + 1].id);
					} else {
						//If this tab is the last one, we select the previous one
						this.selectChildById(visibleTabs[i - 1].id);
					}
				}
			} 
		}
		
	},
	
	showTabByIndex : function(index){
		var children = this.getChildren();
		if (index > -1 && index < children.length) {
			var child = this.getChildren()[index];
			this.showTabById(child.id);
		}
	},
	
	hideTabById : function(id){
		var children = this.getChildren();
		for ( var i = 0; i < children.length; i++) {
			if (id === children[i].id) {
				this.hideTabByIndex(i);
				break;
			}
		}
	},
	
	showTabById : function(id){
		//set the specified tab to be visible
		var button = this.tablist.pane2button[id];
		dojo.style(button.domNode, "display", "");
		button._displayMark = "visible"; // add a mark to tab to record this one is visible
		
	},
	
	removeChild: function(/*dijit._Widget*/ child){
		this.inherited(arguments);
		//override removeChild to remove the listener of disabled property when child is removed
		this._disableWatch[child.id].unwatch();
		delete this._disableWatch[child.id];
	},
		
	addChild: function(/*dijit._Widget*/ child, /*Integer?*/ insertIndex){
		this.inherited(arguments);
		//override addChild method to add listener child pane's disabled property when there is a new child add into this container
		this._disableWatch[child.id] = child.watch("disabled", dojo.hitch(this, this._checkDisabedPane, child));
	},
	
	/**
	 * 
	 * This method is used to listen and check child pane
	 * when child pane's disabled attribute changed
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_checkDisabedPane : function(child, name, oldValue, value){
		//set corresponding the style class to tab depends on 
		//the tab is disabled or not
		if (value == true) {
			var button = this.tablist.pane2button[child.id];
			button.set("disabled", true);
			//dojo.addClass(button.domNode, "dijitDisabled");
		} else {
			var button = this.tablist.pane2button[child.id];
			button.set("disabled", false);
			if (dojo.isIE) {
				dojo.removeAttr(child.domNode, "disabled");
			}
			//dojo.removeClass(button.domNode, "dijitDisabled");
		}
		
		//Check If user try to disable the current select tab,
		//find and set the next enabled tab to be selected. If there is no enabled 
		//button after current one, try to find one before current one.
		//If all tabs are disabled, then do nothing, all tabs can not be selected or changed
		this._setTabSelection();
	},
	
	_setInitialTabSelection: function(){
		var visibleTabs = this._getCurrentVisibleTabs();
		var count = 0;
		for (var i = 0; i < visibleTabs.length; i++) {
			if (visibleTabs[i].get("disbaled") == true) {
				count++;
			}
		}
		
		if (visibleTabs.length > 0 && count == visibleTabs.length) {
			visibleTabs[0].disable = false;
			this.selectChildByIndex(0);
			visibleTabs[0].disable = true;
		} else {
			this._setTabSelection();
		}
		
		var children = this.getChildren();
		for(var i=0;i<children.length;i++){
			this._checkDisabedPane(children[i], children[i].title, null, children[i].disabled);
		}
		
	},
	
	_setTabSelection : function(){
		var visibleTabs = this._getCurrentVisibleTabs();
		var selectedTabId = -1;
		for (var i = 0; i < visibleTabs.length; i++) {
			if (visibleTabs[i].selected) {
				selectedTabId = i;
				break;
			}
		}
		if (selectedTabId > -1 && visibleTabs[selectedTabId].get("disabled") == true) {
			// check and save all visible tabs
			for ( var m = selectedTabId + 1; m < visibleTabs.length; m++) {
				if (visibleTabs[m].get("disabled") == false) {
					this.selectChildById(visibleTabs[m].id);
					return;
				}
			}
			for ( var m = selectedTabId - 1; m >= 0; m--) {
				if (visibleTabs[m].get("disabled") == false) {
					this.selectChildById(visibleTabs[m].id);
					return;
				}
			}
		}
		
		if (selectedTabId > -1 && visibleTabs[selectedTabId].get("disabled") == false) {
			var button = this.tablist.pane2button[visibleTabs[selectedTabId].id];
			dojo.attr(button.focusNode, "tabIndex", "0");
		}
	},
	
	/**
	 * An internal method to get the contentPane instances who's tab is still visible
	 * 
	 * @tag private 
	 * */
	_getCurrentVisibleTabs : function(){
		var children = this.getChildren();
		var visibleTabs = [];
		for ( var i = 0; i < children.length; i++) {
			var button = this.tablist.pane2button[children[i].id];
			if (!button._displayMark || button._displayMark == "visible") {
				visibleTabs.push(children[i]);
			}
		}
		return visibleTabs;
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

dojo.declare("com.ibm.btt.dijit.ScrollingTabController", [dijit.layout.ScrollingTabController,com.ibm.btt.dijit.AbstractWidgetMixin],{
	
});

dojo.declare("com.ibm.btt.dijit.TabController", [dijit.layout.TabController,com.ibm.btt.dijit.AbstractWidgetMixin],{
	
});
