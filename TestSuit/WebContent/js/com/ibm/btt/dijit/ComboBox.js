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
	
	valueField : "value",
	
	asyncStatus : 0,
	
	asyncErrorMessage : "",	
	
	typeAhead : true,
	
	//internal variable; if 0, means, the value is input by user; if 1 , the value is selected by user
	inputFlag : 0,
	// the value which is used to submit
	comboValue : "", 
	
	_eventsHandler : [],
	
	constructor : function() {
		
		this.storeDataFormat = {
				itemLabel : 'label',
				itemValue : 'value'
			};
		
		this.searchAttr = this.storeDataFormat.itemLabel;
		this._eventsHandler = [];
	},	
	
	attributeMap: dojo.delegate(dijit.form.ComboBox.prototype.attributeMap, {
		
//		visibility : {
//			node : "domNode"
//		}
	
	}),
	
	postMixInProperties: function(){
		this.storeDataFormat.itemLabel = this.labelField? this.labelField:"label";
		this.storeDataFormat.itemValue = this.valueField? this.valueField:"value";
		
		this.searchAttr = this.storeDataFormat.itemLabel;
	
		var root = this.srcNodeRef;
		
		var dataObj = {
				identifier : this.storeDataFormat.itemValue,
				label : this.storeDataFormat.itemLabel,
				items : []
			};
		
		var labelName = this.storeDataFormat.itemLabel;
		
		var scope = this;
		dojo.query("> option", root).forEach(
				dojo.hitch(this, function (node, i) {
			
			var item = {};
			
			item[labelName] = scope.getI18NString(dojo.trim(node.innerHTML));
			var value = dojo.attr(node, 'value');
			if (value == '') {
			//	value = '#';
			}
			item[this.storeDataFormat.itemValue] = value;		
			
			dataObj.items.push(item);
		}));
		
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
		
		if (this.typeAhead != undefined && this.typeAhead == false)	{					
			this.textbox.readOnly = true;
		}else{
			if (this.readOnly != undefined && this.readOnly == true)	{					
				this.textbox.readOnly = true;
			}else{
				this.textbox.readOnly = false;
			}
		}
		
		//IBK6
		dojo.connect(this.focusNode, "onclick", dojo.hitch(this, function(){
			if(!this.typeAhead){
				if(this._opened){
					this.closeDropDown();
				}else{
					/*if(!this.dropDown){
						this.loadDropDown();
					}else{
						this.openDropDown();
					}*/
					this.loadDropDown();//defect 29222
				}
			}
		}));
		
		// If default value is set for combox, label should be selected 
		if (this.typeAhead == false)
		{
			if (this.comboValue != null && this.comboValue != "" )
			{
				// get from urlForList
				var listData = this.store.data;
				if (listData == null)
				{
					//get from dataNameforList
					listData = this.store._jsonData;
				}
				 var items = listData.items;
				 for(var i = 0; items != null && i < items.length; i++){
					 if (items[i][this.storeDataFormat.itemValue] == this.comboValue) {
						 this.textbox.value = items[i][this.storeDataFormat.itemLabel];
						 break;
					 }		            
			     }
			}	
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
		
		var resData = {
				identifier : this.storeDataFormat.itemValue,
				label : this.storeDataFormat.itemLabel,
				items : []
			};
		
		if(data instanceof Array ) {
			for(var i = 0; i < data.length; i ++) {
				if(data[i] != null) {
					var item = {};
					if(dojo.isObject(data[i])) {
						if(data[i][resData.label] != null) {
							item[resData.label] = this.getI18NString(data[i][resData.label]);
							// for combo widget in table
							if (data[i][this.valueField]) {
								item[resData.identifier] = data[i][this.valueField];
							}
							else
							{
								item[resData.identifier] = this.getI18NString(data[i][resData.label]);
							}
						}
					} else if(dojo.isString(data[i])) {
						item[resData.label] = this.getI18NString(data[i]);
						item[resData.identifier] = this.getI18NString(data[i]);
					} else {
						item[resData.label] = data[i].toString();
						item[resData.identifier] = data[i].toString();
					}
					if(item[resData.label])
						resData.items.push(item);
				}
			}

		} else if (data instanceof Object) {
			for(var p in data) {
				var item = {};
				item[resData.label] = this.getI18NString(p);
				item[resData.identifier] = data[p];
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
			sync: true,
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
//	_setVisibilityAttr : function(value){
//		this.visibility = value;
//		var iconNode;
//		if (typeof (this.domNode.children[0]) != "undefined"
//				&& typeof (this.domNode.children[0].children[1]) != "undefined") {
//			iconNode = this.domNode.children[0].children[1];
//		} else {
//			iconNode = null;
//		}
//		if (value == "gone") {
//			dojo.style(this.domNode, "visibility", "visible");
//			dojo.style(this.domNode, "display", "none");
//			if (iconNode != null) {
//				dojo.style(iconNode, "visibility", "");
//			}
//		} else if (value == "hidden") {
//			dojo.style(this.domNode, "display", "");
//			dojo.style(this.domNode, "visibility", "hidden");
//			if (iconNode != null) {
//				dojo.style(iconNode, "visibility", "hidden");
//			}
//		} else {
//			dojo.style(this.domNode, "display", "");
//			dojo.style(this.domNode, "visibility", "visible");
//			if (iconNode != null) {
//				dojo.style(iconNode, "visibility", "");
//			}
//		}
//	},
	
	/**
	 * 
	 * hook method for item attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 *              Customer can not use this method directly, they should use set('item', item) instead.
	 * */
	_setItemAttr: function(/*item*/ item, /*Boolean?*/ priorityChange, /*String?*/ displayedValue){
		
		if(!displayedValue){
			displayedValue = this.store.getValue(item, this.searchAttr);
		}
		this.inputFlag = 1;
		if (this.valueField != null && this.valueField != "") {
			// for dataNameForList
			this.comboValue = this.store.getValue(item, this.valueField);	
		}
		else
		{
			//for urlForList
			this.comboValue = this.store.getValue(item, this.storeDataFormat.itemValue);
		}
		
		this._set("item", item);
		dijit.form.ComboBox.superclass._setValueAttr.call(this, this.comboValue, priorityChange, displayedValue);
	},
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getValueAttr : function () {
		var value = this.inherited(arguments);
		if (this.inputFlag == 0)
		{
			 return value;
		}
		else {
			return this.comboValue;
		}
	},
	
	/**
	 * 
	 * hook method for display value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	 _setDisplayedValueAttr: function(/*String*/ value){
		 if (this.typeAhead == true) {
			 this.textbox.value = value;
			 this.comboValue = value;
			 this.inputFlag = 0;
		 }
		 else {	
			 this.comboValue = value;
			 this.inputFlag = 1;
		 }
	 },
	 
	 destroy : function(){
		if(window[this.id]){
			window[this.id] = undefined;
		}
		
		while(this._eventsHandler && this._eventsHandler.length>0){
			try{				
				dojo.disconnect(this._eventsHandler.pop());
			}catch(e){}
		}
		this._eventsHandler = undefined;
		
		this.inherited(arguments);
	 }
});