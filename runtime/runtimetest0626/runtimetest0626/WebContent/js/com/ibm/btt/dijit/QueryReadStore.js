/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2011 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.dijit.QueryReadStore"); 

dojo.require("dojox.data.QueryReadStore");

dojo.declare("com.ibm.btt.dijit.QueryReadStore", dojox.data.QueryReadStore,{
	
	bttParams :{},
	
	/**
	 * 
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_fetchItems: function(request, fetchHandler, errorHandler){

		var serverQuery = request.serverQuery || request.query || {};
		//Need to add start and count
		if(!this.doClientPaging){
			serverQuery.start = (request.start || 0).toString();
			// Count might not be sent if not given.
			if(request.count){
				serverQuery.count = request.count.toString();
			}
		}
		if(!this.doClientSorting && request.sort){
			var sortInfo = [];
			dojo.forEach(request.sort, function(sort){
				if(sort && sort.attribute){
					sortInfo.push((sort.descending ? "-" : "") + sort.attribute);
				}
			});
			serverQuery.sort = sortInfo.join(',');
		}
		// Compare the last query and the current query by simply json-encoding them,
		// so we dont have to do any deep object compare ... is there some dojo.areObjectsEqual()???
		if(this.doClientPaging && this._lastServerQuery !== null &&
			dojo.toJson(serverQuery) == dojo.toJson(this._lastServerQuery)
			){
			this._numRows = (this._numRows === -1) ? this._items.length : this._numRows;
			fetchHandler(this._items, request, this._numRows);
		}else{
			var xhrFunc =  dojo.xhrPost;
			dojo.safeMixin(serverQuery, this.bttParams);
			var xhrHandler = xhrFunc({url:this.url, handleAs:"text", postData:dojo.toJson(serverQuery), failOk: true});
			request.abort = function(){
				xhrHandler.cancel();
			};
			xhrHandler.addCallback(dojo.hitch(this, function(responseText){
				try {
					data = dojo.fromJson(responseText || null);
					this._xhrFetchHandler(data, request, fetchHandler, errorHandler);
				} catch (err) {
					//err.responseText = responseText;
					//errorHandler(err, request);
					console.error(err);
				}
				
			}));
			xhrHandler.addErrback(function(error){
				errorHandler(error, request);
			});
			// Generate the hash using the time in milliseconds and a randon number.
			// Since Math.randon() returns something like: 0.23453463, we just remove the "0."
			// probably just for esthetic reasons :-).
			this.lastRequestHash = new Date().getTime()+"-"+String(Math.random()).substring(2);
			this._lastServerQuery = dojo.mixin({}, serverQuery);
		}
	}
	
});