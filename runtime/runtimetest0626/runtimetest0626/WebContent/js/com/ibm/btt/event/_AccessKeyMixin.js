/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2012 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.event._AccessKeyMixin"); 


dojo.declare("com.ibm.btt.event._AccessKeyMixin", null,{
		
	_registeredKeyMaps : {},

	_globalKeyHandler : null,

	constructor : function() {
		this._connectKeyEvents();
	},
	
	_debugKeyState : function(evt)
	{
		if (dojo.config.isDebug){
			console.debug("keyCode : " + evt.keyCode);
			console.debug("altKey : " + evt.altKey);
			console.debug("ctrlKey : " + evt.ctrlKey);
			console.debug("shiftKey : " + evt.shiftKey);
			console.debug("metaKey : " + evt.metaKey);
		}
	},
	
	_connectKeyEvents : function(){
		_globalKeyHandler = dojo.connect(document, "onkeydown", this, this._onKeyDown);
	},
	
	_onKeyDown : function(evt){
		
//		this._debugKeyState(evt);
		var keymap = this._checkKeys(evt);
		if (keymap == null)
		{
			return true;
		}
		
		// execute the action
		if (keymap.onKeyDown)
		{
			keymap.onKeyDown.apply(this, arguments);
		}
		
		if(keymap.keys.defaultPrevented){
			dojo.stopEvent(evt);
			return false;
		}
	},
	
	_checkKeys : function(evt){
		for (var keyname in this._registeredKeyMaps) {
			var keymap = this._registeredKeyMaps[keyname];
			if (keymap.keys.keyCode==evt.keyCode &&
				(!keymap.keys.altKey   || (keymap.keys.altKey  ==evt.altKey)) &&
				(!keymap.keys.ctrlKey  || (keymap.keys.ctrlKey ==evt.ctrlKey)) &&
				(!keymap.keys.shiftKey || (keymap.keys.shiftKey==evt.shiftKey)) &&
				(!keymap.keys.metaKey  || (keymap.keys.metaKey ==evt.metaKey))){
				return keymap;
			}
		}
		return null;
	},

	registerKeys : function(url) {
		if (url) {
			var xhrArgs = {
				'url' : url,
				handleAs : "json",
				sync : true,
				load : dojo.hitch(this, "_loadKeys"),
				error : dojo.hitch(this, "_loadKeysError", url)
			};
			dojo.xhrGet(xhrArgs);
		} else {
			console.error("The argument can not be null.");
		}
	},
	
	// multi-project enable
	_loadKeys : function(keymaps){
		if(keymaps){
			for (var i=0; i<keymaps.length; i++) {
				var keymap = keymaps[i];
				if (keymap && keymap.name && keymap.onKeyDown) {
					this._registeredKeyMaps[keymap.name] = keymap;
				}
			}
		}
	},
	
	_loadKeysError : function(url, error){
		console.error("Fail to load the condition from : " + url);
		console.error("  Error : " + error);
	},
	
	destroy : function() {
		this.inherited(arguments);
		if (_globalKeyHandler != null){
			dojo.disconnect(_globalKeyHandler);
		}
	}
	
});