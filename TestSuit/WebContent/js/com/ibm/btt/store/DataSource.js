/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.store.DataSource"); 

dojo.require("dojo.store.Memory");
dojo.require("dojo.data.ObjectStore");
dojo.require("dojo.data.ItemFileReadStore");

if (dojo.getObject("com.ibm.btt.store.BTTDataStore") == undefined){

	dojo.setObject("com.ibm.btt.store.BTTDataStore", {
		// default url for special case.
		url : "http://btt.cn.ibm.com",
		// the global state of BTT
		bttState : {
			dse_timezone : (-(new Date().getTimezoneOffset() / 60)).toString(),
			dse_applicationId : "",
			dse_pageId : "-1",
			dse_sessionId: ""
		},
		
		// the btt state(parameters) for every store
		// the structure of state is {"id of container":{state}, ... }
		state : {},
		// the btt data element for every store
		// the structure of data is {"id of container":{data}, ... }
		data : {},
		
		setData : function(/* JSON */data, /* String */ id){
			this.data[id] = data;
		},
		
		setState : function(/* JSON */state, /* String */ id){
			this.updateBTTState(state);
			this.state[id] = state;
		},
		
		updateData : function(/* JSON */data, /* String */ id){
			if (this.data[id]){
				dojo.mixin(this.data[id], data);
			}else{
				this.setData(data, id);
			}
		},

		// filter the btt state(start with dse_) from the data
		_extractBTTState : function(/* JSON */ data){
			var state = {};
			for (var f in data){
				if (f.substr(0,4)=="dse_"){
					state[f] = data[f];
					delete data[f];
				}
			}
			return state;
		},
		
		// send request to server and update the local data
		requestData : function(/* JSON */request, /* String */ id){
			var reqUrl = request.url || request.action || (!request.bttParams)? this.url : (request.bttParams.dse_nextEventName?"Request":"Ajax");
			var xRequest = {
					url : reqUrl,
					sync : request.sync || true,
					handleAs : "json",
					load : dojo.hitch(this, request.loader || function(data, args){
								var state = this._extractBTTState(data);
								// this.updateBTTState(state);
								this.updateState(state, id);
								this.updateData(data, id);
							}),
					error : dojo.hitch(this, request.error || function(e){
								console.error("@BTTDataStore.requestData.error(): " + e);
							}),
					timeout : request.timeout || 30000
				}; 
			
			// from remote file via URL
			if (request.url){
				return dojo.dojo.xhrGet(xRequest);
			}
			
			// from server operation
			var reqData = request.postData || {};
			dojo.mixin(reqData, this.getState(id), this.bttState, request.bttParams);
			if(request.bttParams && !request.bttParams.dse_nextEventName){
				delete reqData.dse_nextEventName;
			}
			dojo.mixin(xRequest, {
					headers : {
						requesttype : 'ajax',
						rawdata : "true"
					},
					postData : dojo.toJson(reqData)
				});
			
			return dojo.xhrPost(xRequest);
		},
		
		updateState : function(/* JSON */state, /* String */ id){
			this.updateBTTState(state);
			if (this.state[id]){
				dojo.mixin(this.state[id], state);
			}else{
				this.state[id] = state;
			}
		},
		
		updateBTTState : function(/* JSON */state){
			for(var sn in this.bttState){
				if(state[sn]){
					this.bttState[sn] = state[sn];
					delete state[sn];
				}
			}
			
//			if(state.dse_sessionId){
//				this.bttState.dse_sessionId = state.dse_sessionId;
//				delete state.dse_sessionId;
//			}
//			if(state.dse_applicationId){
//				this.bttState.dse_applicationId = state.dse_applicationId;
//				delete state.dse_applicationId;
//			}
//			if(state.dse_pageId) {
//				this.bttState.dse_pageId = state.dse_pageId;
//				delete state.dse_pageId;
//			}
//			if(state.dse_timezone){
//				this.dse_timezone = state.dse_timezone;
//				delete state.dse_timezone;
//			}
		},
		
		updateDataField : function(/*String*/dfName, /*Object*/dfValue, /*String*/id){
			if(this.data[id]){
				dojo.setObject(dfName, dfValue, this.data[id]);
			}else {
				this.data[id] = {};
				dojo.setObject(dfName, dfValue, this.data[id]);
			}
		},
		
		updateStateAttr : function(/*String*/dfName, /*Object*/dfValue, /*String*/id){
			if(this.state[id]){
				dojo.setObject(dfName, dfValue, this.state[id]);
			}else {
				this.state[id] = {};
				dojo.setObject(dfName, dfValue, this.state[id]);
			}
		},
			
		getData : function(id){
			return this.data[id];
		},
		
		getState : function(id){
			return this.state[id];
		},

		getDataField : function(/*String*/dfName, /*String*/id){
			return dojo.getObject(dfName, false, this.data[id]);
		},

		getStateAttr : function(dfName, id){
			return dojo.getObject(dfName, false, this.state[id]);
		},
		
		_mapJSON : function (/*JSON*/ mapOpt, /*JSON*/ dst, /*JSON*/ src, /*int*/ index){
			for (var fieldName in mapOpt){
				var fieldValue = mapOpt[fieldName];
				if (dojo.isString(fieldValue) && fieldValue.charAt(0)=='@'){
					var dv = dojo.getObject(fieldValue.substr(1), false, src);
					dst[fieldName] = (dv!==undefined?dv:fieldValue);
				}else if(dojo.isFunction(fieldValue)){
					dst[fieldName] = fieldValue.call(src, src, index);
				}else if(dojo.isArray(fieldValue)){
					var dv = [];
					dst[fieldName] = dv;
					this._mapJSON(fieldValue, dv, src, index);
				}else if(dojo.isObject(fieldValue)){
					var dv = {};
					dst[fieldName] = dv;
					this._mapJSON(fieldValue, dv, src, index);
				}else{
					dst[fieldName] = fieldValue;
				}
			}
		},
		
		_mapJSONArray : function(/*JSON Array*/ rawData, /*JSON*/ mapOpt){
			var newData = [];
			for (var i=0; rawData && i<rawData.length; i++){
				var item = {};
				this._mapJSON(mapOpt, item, rawData[i], i);
				newData.push(item);
			}
			return newData;
		},
		
		_getDynamicDojoStore : function(/*String*/ dfName, /*JSON*/ opts, id){
			return new dojo.store.Memory(dojo.mixin({data: []}, opts, {
				put: function(object, options){
					throw "no implementation";
				},
				
				add: function(object, options){
					throw "no implementation";
				},
				
				remove: function(id){
					throw "no implementation";
				},
				
				query: function(query, options){
					if (query.local) {
						return dojo.store.util.QueryResults(this.queryEngine(query, options)(this.data));
					}
					
					// request data					
					var pd = dojo.mixin({}, query);
					
					var bsp = pd["BTT_STORE_PAG"] = {fieldName:dfName};
					var t = parseInt(options.start);
					if(!isNaN(t)){
						bsp.start = t;
					}
					t = parseInt(options.count);
					if(!isNaN(t)){
						bsp.count = t;
					}
					if(options.sort!==null && options.sort!=undefined){
						bsp.sort = options.sort.toString();
					}
					
					var result = [];
					var total = undefined;
					var request = {
						bttParams : dojo.mixin({}, opts.bttParams, options.bttParams),
						postData: pd,
						loader : function(data, args){
							this._extractBTTState(data);
							if (data[dfName]){
								result = data[dfName];
							}else{
								result = dojo.getObject(dfName, false, data);
							}
							if(data && data.BTT_STORE_PAG){
								total = data.BTT_STORE_PAG.total;
							}
						}
					};
					
					this.requestData(request, id);
					
					// map data
					var queryResult = [];
					if(opts && opts.mapOpt){
						queryResult = this._mapJSONArray(result, opts.mapOpt);
					}
					queryResult.total = total || result.length;
					
					return dojo.store.util.QueryResults(queryResult);
				}
			}));
		},
		
		// build dojo.store.Memory from BTT IndexedCollection
		// for the dojo store consumer
		getDojoStore : function(/*String*/ dfName, /*JSON*/ opts, id){
			if(opts && opts.bttParams) return this._getDynamicDojoStore(dfName, opts, id);
			
			// update data if necessary
//			if(opts && opts.request){
//				this.requestData(opts.request, id);
//				// delete opts.request;
//			}

			var rawData = this.getDataField(dfName, id) || [];
			var newData = rawData;
			if(opts && opts.mapOpt){
				newData = this._mapJSONArray(rawData, opts.mapOpt);
				// delete opts.mapOpt;
			}

			return new dojo.store.Memory(dojo.mixin({data: newData}, opts));
		},
		
		getDojoObjectStore : function(/*String*/ dfName, /*JSON*/ opts, /*String*/ id){
			return new dojo.data.ObjectStore({objectStore:this.getDojoStore(dfName, opts, id)});
		},
			
		// build dojo.data.ItemFileReadStore from BTT IndexedCollection
		// for the dojo data API consumer
		getDojoItems : function(dfName, opts, id){
			return new dojo.data.ItemFileReadStore(dojo.mixin({
					data: {items: this.getDataField(dfName, id)}
				}, opts));
		},
			
		deleteContext : function(id){
			delete this.data[id];
			delete this.state[id];
		}
	});
	
	window.$BTT_ST  = dojo.getObject("com.ibm.btt.store.BTTDataStore");
	
	window.$BTT_DF  = dojo.hitch(window.$BTT_ST, window.$BTT_ST.getDataField);
	window.$BTT_DS  = dojo.hitch(window.$BTT_ST, window.$BTT_ST.getDojoStore);
	window.$BTT_DOS = dojo.hitch(window.$BTT_ST, window.$BTT_ST.getDojoObjectStore);
	window.$BTT_DI  = dojo.hitch(window.$BTT_ST, window.$BTT_ST.getDojoItems);

	window.$BTT_NUMBER  = function (/* Number or String ? */ value, /* Number*/ defaultValue){
		if(typeof value != "number") {
			value = new Number(value);
		}
		return isNaN(value)?defaultValue:value;
	};
}


dojo.require("dijit._Widget");
dojo.declare("com.ibm.btt.store.DataSource", dijit._Widget, {

	_ds: dojo.getObject("com.ibm.btt.store.BTTDataStore"),
	state : {},
	data  : {},
	operation : "",
	url : "",
	
	constructor : function() {
		this.state = {};
		this.data = {};
		this.operation = "";
		this.url = "";
		
		this.inherited(arguments);
	},
	
	postCreate : function(){
		this.inherited(arguments);
		dojo.style(this.domNode, "display", "none");
		
		// init data
		if (this.url){
			this.requestDataURL(this.url);
		}
		
//		this._ds.updateBTTState(this.state);
		this._ds.updateState(this.state, this.id);
		this._ds.updateData(this.data, this.id);
		
		if (this.operation){	
			this.requestDataOP(this.operation);
		}
	},
	
	updateState : function(/* JSON */ state){
		// this._ds.updateBTTState(this.state);
		this._ds.updateState(this.state, this.id);
	},
	
	requestDataURL : function(/* String */ url){
		return this._ds.requestData({'url': url}, this.id);
	},

	requestDataOP : function(/* String */ opName, /* JSON */ postData){
		return this._ds.requestData({
					bttParams : {
						dse_operationName:opName
					}, 
					'postData': postData||{}
				}, this.id);
	},

	destroy : function() {
		console.debug("DataSource.destroy : " + this.id);
		this._ds.deleteContext(this.id);
		this.data = undefined;
		this.state = undefined;
		this.inherited(arguments);
	}
});
