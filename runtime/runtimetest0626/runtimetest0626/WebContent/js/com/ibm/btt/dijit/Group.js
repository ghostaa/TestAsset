/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Group");

dojo.require("dijit._Templated"); 
dojo.require("dijit._Widget"); 
dojo.require("dijit._Container");
dojo.require("dijit.layout._ContentPaneResizeMixin");
dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");

dojo.declare("com.ibm.btt.dijit.Group", [dijit._Widget,
                                         dijit._Templated,
                                         dijit._Container,
                                         dijit.layout._ContentPaneResizeMixin,
                                         com.ibm.btt.dijit.AbstractWidgetMixin], {
	
	text : "",

	parseOnLoad: true,
	
	isContainer: true,
	
	width : "",
	
	height : "",
	
	templateString : "<fieldset dojoAttachPoint='domNode' class='dijitGroupBase'><legend dojoAttachPoint='textNode'></legend><div dojoAttachPoint='containerNode'></div></fieldset>",
	
	attributeMap: dojo.delegate(dijit._Widget.prototype.attributeMap, {
		text : {
			node : "textNode"
		},
		width : {
			node : "containerNode"
		},
		height : {
			node : "containerNode"
		}
	}),
	
	/**
	 * 
	 * hook method for text attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextAttr : function(value) {
		this.text = value;
		this.textNode.innerHTML = StringUtil.escapeHTML(this.getI18NString(value));
	},
	
	/**
	 * 
	 * hook method for width attribute
	 * 
	 * For Group, the container node must inherite the size of widget
	 * and set the inside elements overflow to hidden, otherwise the
	 * inside elements may break the size
	 *
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setWidthAttr : function(value) {
		if (value != "") {
			this.width = value;
//			dojo.style(this.domNode, "width", this.handleLenUint(this.width));
//			dojo.style(this.domNode, "overflow", "hidden"); // firefox Bug 261037
			dojo.style(this.containerNode, "width", this.handleLenUint(this.width));
			dojo.style(this.containerNode, "overflow", "auto");
		}
	},
	
	/**
	 * 
	 * hook method for height attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHeightAttr : function(value){
		if (value != "") {
			this.height = value;
			dojo.style(this.containerNode, "height", this.handleLenUint(this.height));
		}
	}
	
});