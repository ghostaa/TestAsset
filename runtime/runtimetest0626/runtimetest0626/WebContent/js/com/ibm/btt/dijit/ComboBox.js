/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.ComboBox");

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit.form.ComboBox");
dojo.require("com.ibm.btt.dijit.ValidationTextBox");
dojo.require("dojo.data.ItemFileReadStore");

dojo.declare("com.ibm.btt.dijit.ComboBox",[com.ibm.btt.dijit.ValidationTextBox,dijit.form.ComboBox,com.ibm.btt.dijit.AbstractWidgetMixin],{
	
	storeDataName : "",
	
	storeData : "",
	
	storeURL : "",	
	
	labelField : "label",
	
	storeDataFormat : {itemLabel:this.labelField},
	
	asyncStatus : 0,
	
	asyncErrorMessage : "",	
	
	constructor : function() {
		
		this.storeDataFormat = {itemLabel:"label"};
		
		this.searchAttr = this.storeDataFormat.itemLabel;
		
	},	
	
	attributeMap: dojo.delegate(dijit.form.ComboBox.prototype.attributeMap, {
		
		visibility : {
			node : "domNode"
		}
	
	}),
	
	postMixInProperties: function(){
		this.storeDataFormat.itemLabel = this.labelField;
		this.searchAttr = this.storeDataFormat.itemLabel;
	
		var root = this.srcNodeRef;
		
		var dataObj = {label: this.storeDataFormat.itemLabel, items: []};
		
		var labelName = this.storeDataFormat.itemLabel;
		
		var scope = this;
		dojo.query("> option", root).forEach(function(node){
			
			var item = {};
			
			item[labelName] = scope.getI18NString(dojo.trim(node.innerHTML));
			
			dataObj.items.push(item);
			
		});
		
		if(dataObj.items.length == 0) {
			if(this.storeData) {
				var tmpValue = dojo.fromJson(this.storeData);
				dataObj = this._formatStoreData(tmpValue);
			}
		}
		
		this.store = new dojo.data.ItemFileReadStore({data:dataObj});
		
		this.inherited(arguments);
		
	},
	
	postCreate: function(){
		
		this.inherited(arguments);
		
		if(!this.storeDataName && this.storeURL) {
		
			this.loadStoreFromURL(this.storeURL);
			
		}
	},	

	setStoreData : function(data) {
		
		var data = this._formatStoreData(data);
		this.store.clearOnClose = true;
		this.store.data = data;
		this.store._jsonData = null;
		this.store.close();
		
	},
	
	/**
	 * 
	 * convert object or array data to data store format data
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_formatStoreData : function(data) {
		
		var resData = {label:this.storeDataFormat.itemLabel, items:[]};
		if(data instanceof Array ) {
			for(var i = 0; i < data.length; i ++) {
				if(data[i] != null) {
					var item = {};
					if(dojo.isObject(data[i])) {
						if(data[i][resData.label] != null) {
							item[resData.label] = this.getI18NString(data[i][resData.label]);
						}
					} else if(dojo.isString(data[i])) {
						item[resData.label] = this.getI18NString(data[i]);
					} else {
						item[resData.label] = data[i].toString();
					}
					if(item[resData.label])
						resData.items.push(item);
				}
			}

		} else if (data instanceof Object) {
			for(var p in data) {
				var item = {};
				item[resData.label] = this.getI18NString(p);
				resData.items.push(item);
			}
		}
		
		return resData;
	},
	
	/**
	 * 
	 * error handling method for loading data with xhr 
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleStoreLoadingError : function(err) {
		
		if(err.status !== undefined)
		{				
			this.asyncStatus = err.status;
			this.asyncErrorMessage = err.message;
			this.onAsyncError();
		}
		
	},
	
	onAsyncOK : function() {
		
	},

	onAsyncError : function() {
		
	},
		
	loadStoreFromURL : function(url) {
		
		this.storeURL = url;
		
		var xhrArgs = {
			url:this.storeURL,
			handleAs: "json",
			load: dojo.hitch(this, "_handleStoreLoadingResponse"),
    		error: dojo.hitch(this, "_handleStoreLoadingError")
         };
		
	    this.asyncStatus = 0;
	    this.asyncErrorMessage = "";    
	    dojo.xhrGet(xhrArgs);
	},
	
	/**
	 * 
	 * handle loading data xhr response
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleStoreLoadingResponse : function(data) {
		
		this.setStoreData(data);
		this.onAsyncOK();
		
	},	
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setVisibilityAttr : function(value){
		this.visibility = value;
		var iconNode;
		if (typeof (this.domNode.children[0]) != "undefined"
				&& typeof (this.domNode.children[0].children[1]) != "undefined") {
			iconNode = this.domNode.children[0].children[1];
		} else {
			iconNode = null;
		}
		if (value == "gone") {
			dojo.style(this.domNode, "visibility", "visible");
			dojo.style(this.domNode, "display", "none");
			if (iconNode != null) {
				dojo.style(iconNode, "visibility", "");
			}
		} else if (value == "hidden") {
			dojo.style(this.domNode, "display", "");
			dojo.style(this.domNode, "visibility", "hidden");
			if (iconNode != null) {
				dojo.style(iconNode, "visibility", "hidden");
			}
		} else {
			dojo.style(this.domNode, "display", "");
			dojo.style(this.domNode, "visibility", "visible");
			if (iconNode != null) {
				dojo.style(iconNode, "visibility", "");
			}
		}
	}	
	
});