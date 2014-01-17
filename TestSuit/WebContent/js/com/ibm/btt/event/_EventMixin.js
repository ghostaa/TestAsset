/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2012 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.event._EventMixin"); 

/**
 * 
 * This is an internal class which is used to monitor the navigation event that raised either form keyboard or browser
 * User can register handlers into engine instance to override the back/forward handling method
 * */
dojo.declare("com.ibm.btt.event._EventMixin", null,{
	
	/**
	 * 
	 * internal variable which is used to keep the all the conditions loaded form the js
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this property in customer code.
	 * */
	_handlers : {},
	
	// Current hash position, incremented after every form submit (or link or button click, etc.)
	hashPos: 0,
	
	// Misc startup
	constructor: function() {
		// Registers the hash change handler
		window.onhashchange = this.hashChangeHandler;
	},

	// Called every time the user navigates back and forth, or when the hash is programmatically changed
	hashChangeHandler: function() {
		console.log(">>>>> Hash changed: ", location.hash);
		
		var currentHash = Engine.getInstance().parseHash(location.hash);
		
		if(Engine.getInstance().hashPos > currentHash){
			if(Engine.getInstance().backward(window.event)===false){ //doesn't allow backward
				console.log(">>>>> Reject Backward Hash change: ", location.hash);
				location.hash = Engine.getInstance().hashPos ;
			}else{
				console.log(">>>>> Allow Backward Hash change: ", location.hash);
				return;
			}
		} else if(window.engine.hashPos < currentHash){
			if(Engine.getInstance().forward(window.event)===false){ //doesn't allow backward
				console.log(">>>>> Reject Forward Hash change: ", location.hash);
				location.hash = Engine.getInstance().hashPos ;
			}else{
				console.log(">>>>> Allow Forward Hash change: ", location.hash);
				return;
			}
		}
	},

	// Update Hash bypass hashChangeHandler 
	updateHash : function(hash) {
		console.log(">>>>> Update Hash ", location.hash);
		window.onhashchange = null;
		this.hashPos++;
		location.hash = this.hashPos;
		window.onhashchange = this.hashChangeHandler;
	},
	
	// Parses the hash portion of the URL, to extract the history position
	parseHash: function(hash) {
		if (hash == null || hash == "") {
			console.log(">>>>> Invalid Hash Found, return 0 instead: ", location.hash);
			return 0;
		}
		if (hash.charAt(0) != "#") {
			alert("Error: unexpected hash: " + hash);
			return 0;
		}
		var pos = parseInt(hash.substring(1), 10);
		if (isNaN(pos)) {
			alert("Error: unexpected hash: " + hash);
			return 0;
		}
		return pos;
	},

	/**
	 * 
	 * register the condition to engine instance from the specified url
	 * 
	 * @tag public 
	 * */
	registerHandler : function(url) {
		if (url) {
			var xhrArgs = {
				'url' : url,
				handleAs : "json",
				sync : true,
				load : dojo.hitch(this, "_loadHandler"),
				error : dojo.hitch(this, "_loadHandlerError", url)
			};
			dojo.xhrGet(xhrArgs);
		} else {
			console.error("The argument can not be null.");
		}
	},
	
	/**
	 * 
	 * internal method to load navigationhandler js from url
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this property in customer code.
	 * */
	_loadHandler : function(handlers){
		
		if(handlers){
			for (var i=0; i<handlers.length; i++) {
				var h = handlers[i];
				if (h && h.name && h.handler) {
					if(h.name==='forward')
						this.forward = dojo.hitch(this,h.handler);
					else if(h.name==='backward')
						this.backward = dojo.hitch(this,h.handler);
					else if(h.name==='refresh')
						this.refresh = dojo.hitch(this, h.handler);
					else if(h.name==='leave'){						
						this.leave = h.handler;
						window.onbeforeunload = this.leave;
					}
				}
			}
		}
	},
	
	/**
	 * 
	 * internal method to handle the error when load navigationhandler js
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this property in customer code.
	 * */
	_loadHandlerError : function(url, error){
		console.error("Fail to load the navigation handler on " + url + ", error : " + error);
	},
	
	
	forward : function (evt) {
		
	},
	
	backward : function (evt) {
		
	},
	
	refresh : function (evt) {
	},
	
	leave : function (evt) {
		
	}

});