/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.store.DataStoreFactory"); 

dojo.require("com.ibm.btt.store.BTTDataStore");

dojo.declare("com.ibm.btt.store.DataStoreFactory", dijit._Widget, {
	
	_ds : dojo.getObject("com.ibm.btt.store.BTTDataStore"),
	_store : null,
	
	storeID : "",
	dataField : "",
	type : "", //  enum [ Store, ObjectStore, Items ]
	operation : "",
	mapOpt : {},
	
	constructor : function() {
		this._store = null;
		this.storeID = "";
		this.dataField = "";
		this.type = "";
		this.operation = "";
		this.mapOpt = {};

		this.inherited(arguments);
	},
	
	postCreate : function(){
		this.inherited(arguments);
		dojo.style(this.domNode, "display", "none");
	},
	
	getStore : function(){
		if(this._store == null){
			var opts = {};
			if (this.operation != ""){
				opts["bttParams"] = {
						dse_operationName : this.operation
				};
			}
			if (this.mapOpt != ""){
				opts["mapOpt"] = this.mapOpt;
			}
			switch (this.type){
				case "Store":
					this._store = this._ds.getDojoStore(this.dataField, opts, this.storeID);
					break;
				case "Items":
					this._store = this._ds.getDojoItems(this.dataField, opts, this.storeID);
					break;
				default: // ObjectStore
					this._store = this._ds.getDojoObjectStore(this.dataField, opts, this.storeID);
			}
		}
		
		return this._store;
	},
	
	destroy : function() {
		this._store = null;
		this.mapOpt = null;
		this.inherited(arguments);
	}
});
