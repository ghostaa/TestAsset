/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.dijit.ScreenCover");

dojo.require("dijit._Widget");
dojo.require("dijit._Templated");
dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");

dojo.declare("com.ibm.btt.dijit.ScreenCover", [ dijit._Widget,
		dijit._Templated, com.ibm.btt.dijit.AbstractWidgetMixin ], {

	templateString : "<div class='dijitScreenCover' style='display:none;' tabIndex='1'><div dojoAttachPoint='containerNode' class='dijitScreenCoverContainer'><div dojoAttachPoint='imageNode' class='dijitScreenCoverImage'></div><div dojoAttachPoint='textNode' class='dijitScreenCoverText'></div></div></div>",

	text : "%com.ibm.btt.dijit.ScreenCover/waitingText",
	
	postCreate : function(){
		this.inherited(arguments);
		dojo.body().appendChild(this.domNode);
		this.domNode.style.display = "none";
		this._events = [];
		this._events.push(dojo.connect(dojo.global, "onresize", this, this.layout));
		this._events.push(dojo.connect(this.domNode, "onkeydown", this, this.onKey));
	},
	
	onKey: function(evt){
		if(evt.keyCode && this.domNode.style.display === "block")
		{
			dojo.stopEvent(evt);
			return false;
		}
	},
	
	/**
	 * 
	 * Calculate the size and position of screen to make sure this widget will cover the whole screen 
	 * 
	 * @tag public
	 * 
	 * */
	layout : function() {
	
		var viewport = dojo.window.getBox();
		var bb = dojo._getBorderBox(this.containerNode);
		var l = Math.floor(viewport.l + (viewport.w - bb.w) / 2);
		var t = Math.floor(viewport.t + (viewport.h - bb.h) / 2);
		
		dojo.style(this.domNode,{
			top : viewport.t + "px",
			left : viewport.l + "px",
			width : viewport.w + "px",
			height : viewport.h + "px"
		});
		dojo.style(this.containerNode,{
			left: l + "px",
			top: t + "px"
		});

	},

	/**
	 * 
	 * hook method for text attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextAttr : function(value){
		this.text = value;
		this.textNode.innerHTML = this.getI18NString(value);
	},
	
	/**
	 * 
	 * This method is used to show the screenCover to cover whole screen and block user operation 
	 * 
	 * @tag public
	 * 
	 * */
	show : function() {
		this.domNode.style.display = "block";
		this.layout();
		this.domNode.focus();
	},

	/**
	 * 
	 * hide the shown cover
	 * 
	 * @tag public
	 * 
	 * */
	hide : function() {
		this.domNode.style.display = "none";
	},
	
	destroy : function(){
		this.inherited(arguments);
		while (this._events.length > 0) {
			dojo.disconnect(this._events.pop());
		}
	}
});
