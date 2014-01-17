/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.dijit.Select");

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit.form.FilteringSelect");
dojo.require("dojo.data.ItemFileReadStore");
dojo.require("com.ibm.btt.dijit.ValidationTextBox");
 
dojo.declare("com.ibm.btt.dijit.Select", [com.ibm.btt.dijit.ValidationTextBox, dijit.form.FilteringSelect,
		com.ibm.btt.dijit.AbstractWidgetMixin], {
	storeDataName : "",
	
	storeData : "",
	
	width : "",
	
	storeURL : "",
	
	labelField : "label",
	
	valueField : "value",
	
	asyncStatus : 0,
	
	asyncErrorMessage : "",
	
	_handlers : [],
	
	typeAhead : false,
	
	constructor : function () {
		
		this.storeDataFormat = {
			itemLabel : 'label',
			itemValue : 'value'
		};
		
		this.searchAttr = this.storeDataFormat.itemLabel;
		this._handlers = [];
	},
	
	attributeMap : dojo.delegate(
		dijit.form.FilteringSelect.prototype.attributeMap, {
//		visibility : {
//			node : "domNode"
//		},
		width : {
			node : "domNode"
		}
	}),
	
	postCreate : function () {
		this.inherited(arguments);

		if (!this.storeDataName && this.storeURL) {
			if (this.params.value){
				this.value = this.params.value;
				this._lastValueReported = this.params.value;
				this._resetValue = this.params.value;
			}
			this.loadStoreFromURL(this.storeURL);
		}
		
		this._setWidthAttr(this.width);
		
		if(com.ibm.btt.util.GlobalConfigurationUtil && com.ibm.btt.util.GlobalConfigurationUtil.getValue("selectList.clickModeForDropDown") == "OnWholeWidget"){
			this.typeAhead = false;
		}
		
		if(this.typeAhead){
			// default behavior
		}else{
			this._handlers.push(dojo.connect(this.focusNode, "onclick", dojo.hitch(this, function(){
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
			})));
		}
		
		if ((this.typeAhead != undefined && this.typeAhead == false) || (this.readOnly != undefined && this.readOnly == true))	{					
			this.textbox.readOnly = true;
		}
	},
	
	postMixInProperties : function () {
		
		var root = this.srcNodeRef;
		var dataObj = {
			identifier : this.storeDataFormat.itemValue,
			label : this.storeDataFormat.itemLabel,
			items : []
		};
		
		var scope = this;
		
		dojo.query("> option", root).forEach(
			dojo.hitch(this, function (node, i) {
				var item = {};
				item[this.storeDataFormat.itemLabel] = scope.getI18NString(dojo.trim(node.innerHTML));
				var value = dojo.attr(node, 'value');
				if (value == '') {
					value = '#';
				}
				item[this.storeDataFormat.itemValue] = value;				
				dataObj.items.push(item);
				/*if(node.selected){
					this.item = item;
				}*/
		}));
		
		if (dataObj.items.length == 0 && this.storeData) {
			if(typeof this.storeData == "string"){
				this.storeData = dojo.fromJson(this.storeData);
			}
			dataObj = this._formatStoreData(this.storeData);
		}
		
		dataObj = this.prepareStoreData(dataObj);
		
		this.item = null;
		if(this.params.value){
			for ( var i = 0; i < dataObj.items.length; i++) {
				if(this.params.value == dataObj.items[i].value){
					this.item = dataObj.items[i];
				}
			}
		}
		
		if(dataObj.items.length == 0){
			var item = {};
			item[this.storeDataFormat.itemValue] = '#';
			item[this.storeDataFormat.itemLabel] = '';
			dataObj.items.push(item);
			/*if (this.value && this.storeURL) {
				this.valueTemp = this.value;
			}*/
			this._lastValueReported = '#';
			this.value = '#';
		}
		
		if(!this.item){
			this.item = dataObj.items[0];
			this.value = this.item.value;
			this._lastValueReported = this.item.value;
		}
		
		/*if (dataObj.items.length == 0 && this.storeData) {
			dataObj = this._formatStoreData(this.storeData);
		}
		if (dataObj.items.length != 0) {
			this.value = this.item && this.item.value ? this.item.value:dataObj.items[0]['value'];
		} else {
			var item = {};
			item[this.storeDataFormat.itemValue] = "null";
			item[this.storeDataFormat.itemLabel] = "";
			dataObj.items.push(item);
			if (this.value && this.storeURL) {
				this.valueTemp = this.value;
			}
			this.value = 'null';
		}*/
		this.store = new dojo.data.ItemFileReadStore({
				data : dataObj
		});
		this.inherited(arguments);
	},

	/**
	 * 
	 * Private hook method for storeData attribute
	 * */
	_setStoreDataAttr : function(value){
		if(typeof value == "string"){
			value = dojo.fromJson(value);
		} 
		this.storeData = value;
	},
	
	setStoreData : function (data) {
		this._onChangeActive = false;
		var newdata = this.prepareStoreData(this._formatStoreData(data));
		this.store.clearOnClose = true;
		this.store.data = newdata;
		this.searchAttr = newdata.label;
		this.store.close();
		this.set('value', this.value);
		this._setBlurValue();
		this._onChangeActive = true;
	},
	
	prepareStoreData : function(data){
		return data;
	},
	
	/**
	 * 
	 * convert loaded object data to data store format data
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_formatStoreData : function (data) {
		
		var resData = {
			identifier : this.storeDataFormat.itemValue,
			label : this.storeDataFormat.itemLabel,
			items : []
		};
		if (data instanceof Array) {
			for (var i = 0; i < data.length; i++) {
				if (data[i] != null
					 && data[i][this.valueField] != null
					 && data[i][this.labelField] != null) {
					var item = {};
					item[this.storeDataFormat.itemValue] = data[i][this.valueField];
					item[this.storeDataFormat.itemLabel] = this
						.getI18NString(data[i][this.labelField]);
					if (item[this.storeDataFormat.itemValue] == ''
						&& item[this.storeDataFormat.itemLabel] == '') {
						item[this.storeDataFormat.itemValue] = '#';
					}
					resData.items.push(item);
				}
			}
		} else if (data instanceof Object) {
			for (var p in data) {
				if (data[p] != null) {
					var item = {};
					item[this.storeDataFormat.itemValue] = data[p];
					item[this.storeDataFormat.itemLabel] = this.getI18NString(p);
					if (item[this.storeDataFormat.itemValue] == ''
						&& item[this.storeDataFormat.itemLabel] == '') {
						item[this.storeDataFormat.itemValue] = '#';
					}
					resData.items.push(item);
				}
			}
		}
		
		return resData;
	},
	
	/**
	 * 
	 * handle the error thrown out during the xhr to load the data
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleStoreLoadingError : function (err) {
		
		if (err.status !== undefined) {
			
			this.asyncStatus = err.status;
			this.asyncErrorMessage = err.message;
			this.onAsyncError();
			
		}
	},
	
	onAsyncOK : function () {},
	
	onAsyncError : function () {},
	
	loadStoreFromURL : function (url) {
		
		this.storeURL = url;
		
		var xhrArgs = {
			url : this.storeURL,
			handleAs : "json",
			sync : true,
			load : dojo.hitch(this,
				"_handleStoreLoadingResponse"),
			error : dojo
			.hitch(this, "_handleStoreLoadingError")
		};
		
		this.asyncStatus = 0;
		this.asyncErrorMessage = "";
		dojo.xhrGet(xhrArgs);
	},
	
	/**
	 * 
	 * handle the response of xhr to format and set the return data to store
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleStoreLoadingResponse : function (data) {
		
		this.setStoreData(data);
		/*this._onChangeActive = false;
		this.set('value', this.params.value);
		this._onChangeActive = true;*/
		this.onAsyncOK();
		
	},
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
//	_setVisibilityAttr : function (value) {
//		this.visibility = value;
//		var iconNode;
//		if (typeof(this.domNode.children) != "undefined"
//			 && typeof(this.domNode.children[0]) != "undefined"
//			 && typeof(this.domNode.children[0].children[1]) != "undefined") {
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
	 * hook method for width attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setWidthAttr : function (value) {
		if (value != "") {
			this.width = value;
			dojo.style(this.domNode, "width", this.handleLenUint(this.width));
		}
	},
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setValueAttr : function (value) {
		var isValueInItems = false;
		this.store.fetchItemByIdentity({
			identity : value,
			onItem : function (item) {
				//if (item) for defect 28042, this line code may get the wrong item
				//isValueInItems = true;
			}
		});
		
		var itemArray = this.store._getItemsArray();
		if(itemArray){
			dojo.some(itemArray, function(item) {
				// for defect 30451, the value may be 0 or false
				if(item.value
						&& item.value[0] !== undefined && item.value[0] !== null && item.value[0] !== ''
						&& item.value[0] == value){
					isValueInItems = true;
					return false;
				}
	        });
		}
		
		if (!isValueInItems) {
			var itemArray = this.store._getItemsArray();
			if (itemArray.length == 0) {
				value = '';
			} else {
				var id = this.store.getIdentity(itemArray[0]);
				this.store.fetchItemByIdentity({
					identity : id,
					onItem : dojo.hitch(this, function (item) {
						if (item) {
							isValueInItems = true;
							// for defect 30451, the value may be 0 or false
							value = item.value && item.value[0] !== undefined && item.value[0] !== null && item.value[0] !== '' ? item.value[0] : null;
							this.set('item', item);
						}
					})
				});
			}
			this.value = value;
			this._lastValueReported = value;
		}
		this.inherited(arguments);
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
		if(value == null || value == '#'){
			return '';
		}else{
			return value;
		}
	},
	
	/**
	 * 
	 * hook method for item attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 *              Customer can not use this method directly, they should use set('item', item) instead.
	 * */
	_setItemAttr : function(){
		this.inherited(arguments);
		this.valueNode.value = this.get('value');
	},
	
	destroy: function(){
		while(this._handlers.length>0){
			try{				
				dojo.disconnect(this._handlers.pop());
			}catch(e){}
		}
		this._handlers = undefined;
		this.inherited(arguments);
	}
});
