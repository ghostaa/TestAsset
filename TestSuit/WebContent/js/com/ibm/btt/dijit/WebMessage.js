/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.WebMessage"); 

dojo.require("dijit._Widget"); 
dojo.require("dojox.cometd");

dojo.require("com.ibm.btt.util.GlobalConfigurationUtil");

if (dojo.getObject("com.ibm.btt.WebMessageEngine") == undefined){
	dojo.setObject("com.ibm.btt.WebMessageEngine", {
		defered : false,
		initWebMsg : function(){
			if(this.defered) return this.defered;
			
			var gcfg = com.ibm.btt.util.GlobalConfigurationUtil;
			this.privateTopic   = gcfg.getValue("PrivateTopic", "/btt/private/");
			this.broadcastTopic = gcfg.getValue("BroadcastTopic", "/btt/broadcast");
			var webMsgServlet   = gcfg.getValue("WebMsgServlet", "bttwebmsg");

			this.defered = dojox.cometd.init(webMsgServlet);
			console.debug("initWebMsg @ " + webMsgServlet);
						
			return this.defered;
		}
	});
}


dojo.declare("com.ibm.btt.dijit.WebMessage", dijit._Widget, { 

	uid : "",
	isBroadcast : false,
	topics : [],

	_subscribedTopics : [],
	_wme : dojo.getObject("com.ibm.btt.WebMessageEngine"),
	
	constructor : function() {
		this.uid = "";
		this.isBroadcast = false;
		this.topics = [];
		this._subscribedTopics = [];
		
		this.inherited(arguments);
	},
	
	postCreate : function(){
		this.inherited(arguments);

		dojo.style(this.domNode, "display", "none");
		
		var def = this._wme.initWebMsg();
		
		if (this.uid != ""){
			def = def.then(dojo.hitch(this, this.subscribe, this._wme.privateTopic + this.uid));
		}
		
		if (this.isBroadcast){
			def = def.then(dojo.hitch(this, this.subscribe, this._wme.broadcastTopic));
		}	
		
		for (var i=0; i<this.topics.length; i++){
			def = def.then(dojo.hitch(this, this.subscribe, this.topics[i]));
		}
	},
	
//	_setUidAttr : function(value){
//		if (this.uid!="" && this.uid!=value){
//			this.unsubscribe(this.privateTopic + this.uid);
//		}
//		if (value!="" && this.uid!=value){
//			this.subscribe(this.privateTopic + value);
//		}
//		this.uid = value;
//	},
	
//	_setIsBroadcastAttr : function(value){
//		if(this.isBroadcast && !value){
//			this.unsubscribe(this._wme.broadcastTopic);
//		}
//		
//		if (!this.isBroadcast && value){
//			this.subscribe(this._wme.broadcastTopic);
//		}
//		
//		this.isBroadcast = value;
//	},
	
	publishMsg : function(/*String*/ topic, /*JSON*/  msg){
		console.debug("WebMessage.publish message[" + msg + "] @ topic : " + topic );
		return dojox.cometd.publish(topic, dojo.fromJson(msg));
	},
	
	sendPrivateMsg : function(/*String*/ uid, /*JSON*/  msg){
		this.publishMsg(this._wme.privateTopic + uid, msg);
	},
	
	broadcastMsg : function(/*JSON*/  msg){
		this.publishMsg(this._wme.broadcastTopic, msg);
	},
	
	subscribe : function(/*String*/ topic){
		console.debug("WebMessage.subscribe topic : " + topic );
		if (dojo.indexOf(this._subscribedTopics, topic)<0){
			this._subscribedTopics.push(topic);
			return dojox.cometd.subscribe(topic, this, this._onWebMessage);
		}
		return false;
	},
	
	unsubscribe : function(/*String*/ topic){
		console.debug("WebMessage.unsubscribe topic : " + topic );
		var i = dojo.indexOf(this._subscribedTopics, topic);
		if (i > -1){
			delete this._subscribedTopics[i];
			return dojox.cometd.unsubscribe(topic, this, this._onWebMessage);
		}
		return false;
	},
	
	_onWebMessage : function(/* JSON */ webmsg){
		console.debug("WebMessage._onWebMessage topic : " + webmsg.channel);
		console.debug("WebMessage._onWebMessage message : " + dojo.toJson(webmsg.data));
		this.onWebMessage(webmsg);
	},
	
	/**
	 * This is a callback function, connect to this function to receive web message
	 */
	onWebMessage : function(/* JSON */ webmsg){
	},
	
	destroy : function() {
//		if (this.uid != ""){
//			this.unsubscribe("/btt/uid/" + this.uid);
//		}
//		if (this.isBroadcas){
//			this.unsubscribe(this._wme.broadcastTopic);
//		}
//		for (var i=0; i<this.topics.length; i++){
//			this.unsubscribe(this.topics[i]);
//		}
		
		while(this._subscribedTopics && this._subscribedTopics.length > 0){
			dojox.cometd.unsubscribe(this._subscribedTopics.pop(), this, this._onWebMessage);
		}
		this._subscribedTopics = undefined;
		
		console.debug("WebMessage.destroy : " + this.id);
		this.inherited(arguments);
	}
});
