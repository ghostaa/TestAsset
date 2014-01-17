/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.dijit.Tree");

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit.Tree");
dojo.require("dojo.data.ItemFileWriteStore");
dojo.require("dijit.tree.ForestStoreModel");

dojo.declare("com.ibm.btt.dijit.Tree", [ dijit.Tree,
		com.ibm.btt.dijit.AbstractWidgetMixin], {

	//data store name, the form will check this data name, if it defined and not be null
	//the form will invoke the setStoreData function to set the store data for the tree.

	storeDataName : "",
	
	name : "",

	storeData : null,

	showRoot : false,
	
	value : "",
	
	_selectedItem : null,
	
	width : "",
	
	height : "",
	
	persist: false,
	
	templateString: dojo.cache("com.ibm.btt.dijit","templates/Tree.html"),
	
	attributeMap : dojo.delegate(dijit.Tree.prototype.attributeMap, {

//		visibility : {
//			node : "domNode"
//		},
		
		name : {
			node : "formNode"
		},
		
		value : {
			node : "formNode"
		},
		
		width : {
			node : "formNode"
		},
		
		height : {
			node : "formNode"
		}

	}),

	postMixInProperties : function() {
		this.inherited(arguments);
		this.loadStoreData();
	},
	
	postCreate : function(){
		this.inherited(arguments);
		this.treeEvents = [];
		var _this = this;
		this.treeEvents.push(
			dojo.connect(this,"onClick",this,function(item){
				_this.set("value", item.id[0]);
			})
		);
		this._lastValue = this.value;
	},
	
	onLoad : function(){
		this.inherited(arguments);
		this._expandNode(this.tree.rootNode.getChildren()[0], false);
		this.reset();
		
		if (this.value != "") {
			var tmppaths = this.value.split(".");
			var tmpPath = tmppaths[0];
			for ( var i = 1; i < tmppaths.length; i++) {
				var n = this._itemNodesMap[tmpPath];
				if (n) {
					this._expandNode(n[0], false);
				}
				tmpPath += "." + tmppaths[i];
			}
			var nodes = this._itemNodesMap[this.value];
			this._expandNode(nodes[0], false);
			nodes[0].setSelected(true);
		}
		
	},

	/**
	 * 
	 * convert the a object data to data store format data. The full path id of context structure
	 * will be used as the id(identify of store) of each data item.   
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_parseStoreData : function(parent, data) {
		
		this.firstSelectedItem=null; // reset firstSelectedItem when ajax submit
		
		var result = [];
		for ( var name in data) {
			// create new object for tree node.
			var item = {};
			// set the full path id to be the new id of this tree node.
			if (parent != null && typeof (parent.id) != "undefined") {
				item.id = parent.id + "." + name;
			} else {
				item.id = name;
			}
			// set the id to be the label which will display on the tree node.
			item.label = data[name]["label"];
			item.value = data[name]["value"];
			if ( data[name]["children"]) {
				item.children = this._parseStoreData(item, data[name]["children"]);
			}
			result.push(item);
		}
		
		//console.log(dojo.toJson(result));
		return result;
	},

	/**
	 * 
	 * override the default getLabel method to support NLS
	 * 
	 * @tag public
	 * 
	 * */
	getLabel: function(item){
		return	I18nUtil.getI18nString(this.inherited(arguments));
	},
	
	
	loadStoreData : function(){
		var dataItems = this._parseStoreData(null, this.storeData);

		if(!this.model) {
			var data = {
					'identifier' : 'id',
					'label' : 'label',
					'items' : dataItems
				};
			var store = new dojo.data.ItemFileWriteStore( {
				'data' : data
			});
			
			this.model = new dijit.tree.ForestStoreModel( {
				'store' : store
			});
		} else {
			var tree = this;
			var store = this.model.store;
			this.model.store.fetch({queryOptions:{deep:true},  onComplete: function(items, request) {
				for (var i = items.length - 1; i >= 0; i--){
					store.deleteItem(items[i]);
				  }
			}});
			
			store.save();
			
			(function(pItems, parentItem) {
				for(var i = 0; i < pItems.length; i ++) {
					
					var children;
					if(pItems[i].children && pItems[i].children.length) {
						children = pItems[i].children;
						pItems[i].children = [];
					} else {
						children = null;
					}
					if(parentItem) 
						var parent = store.newItem(pItems[i], {parent:parentItem, attribute:"children"});
					else 
						var parent = store.newItem(pItems[i]);
					if(children) {
						arguments.callee(children, parent);
					}
					
				}
				
			})(dataItems);
			
			store.save();
		}
	},
	 
	// btt context data for data store.
	/**
	 * 
	 * load JavaScript object data to tree store, 
	 * this store may be invoked when page loading or ajax response with tree data
	 * 
	 * @tag public
	 * 
	 * */
	setStoreData : function(data) {
		var tempData = {};
		tempData[this.storeDataName] = data
		this.storeData = tempData;
		this.loadStoreData();
		
		if(this.dndController) {
			this.dndController.destroy();
			var params={};
			for(var i=0; i<this.dndParams.length;i++){
				if(this[this.dndParams[i]]){
					params[this.dndParams[i]] = this[this.dndParams[i]];
				}
			}
			this.dndController = new this.dndController.constructor(this, params);
		}
		this.set("paths", []);
	},
	
	destroy : function(){
		while (this.treeEvents && this.treeEvents.length > 0) {
			dojo.disconnect(this.treeEvents.pop());
		}
		this.treeEvents = undefined;
		
		this.inherited(arguments);
	},
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setValueAttr : function(value){
		dojo.forEach(this.get("selectedNodes"), function(widget){
			widget.setSelected(false);
		});
		
		if(this._lastValue){
			var node = this._itemNodesMap[this._lastValue];
			if(node){
				node[0].setSelected(false);
			}
		}
		
		
		this.set("paths", []);
		var nodes = this._itemNodesMap[value];
		/*this.value = "";
		this.formNode.value = "";*/
		
		this.value = value;
		this.formNode.value = value;
		
		if(nodes){
			this.set("selectedNodes", nodes);	
			this._selectedItem = nodes[0].item;
		}
	},
	
	/**
	 * 
	 * return the label of selected tree item, this label was not 
	 * translated into native language if the data applied NLS support
	 * 
	 * @tag public
	 * 
	 * */
	getSelectedLabel : function(){
		if(this._selectedItem){
			return this._selectedItem.label[0];
		}else{
			return undefined;
		}
	},
	
	/**
	 * 
	 * return the label of selected tree item, this label was already translated
	 * into native language if the data applied NLS support
	 * 
	 * @tag public
	 * */
	getSelectedLabelNLS : function(){
		if(this._selectedItem){
			return I18nUtil.getI18nString(this._selectedItem.label[0]);
		}else{
			return undefined;
		}
	},
	
	/**
	 * 
	 * return the value of selected item 
	 * 
	 * @tag public
	 * */
	getSelectedValue : function(){
		if(this._selectedItem){
			return this._selectedItem.value[0];
		}else{
			return undefined;
		}
	},
	
//	isFocusable:function(){
//		return (!this.disabled) && (!this.readOnly) && (dojo.style(this.domNode, "display") !== "none") && (dojo.style(this.domNode, "visibility") !== "hidden");
//	},
	
	reset : function() {
		this.inherited(arguments);
		if (this.params.value) {
			this.set("value", this.params.value);
		}else{
			this.set("value", "");
		}
	},

	getTooltip: function(/*dojo.data.Item*/ item){
		var tip = this.getI18NString(this.hint);
		if (tip == undefined)
			tip = "";
		this.hint = tip;
		return tip;
	},
	
	/**
	 * 
	 * hook method for hint attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHintAttr : function(value){
		this.hint = value;
		var title = StringUtil.removeWarp(this.getI18NString(value));
		this.domNode.title = title;
		if(this.rootNode){
			this._setHintForAllChild(this.rootNode, title);
		}
	},
	
	/**
	 * 
	 * hook method for hint attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHintForAllChild : function(root, hint){
		var _this = this;
		root.set("tooltip", hint);
		root.set("hint", hint);
		if(root.hasChildren()){
			dojo.forEach(root.getChildren(), function(child, idx){
				_this._setHintForAllChild(child, hint);
			});
		}
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
		this.resize();
	}	
});
