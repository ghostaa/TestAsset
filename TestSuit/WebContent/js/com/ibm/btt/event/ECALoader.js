dojo.provide("com.ibm.btt.event.ECALoader");

dojo.declare("com.ibm.btt.event.ECALoader", dijit._Widget, {
	//widget prefix
	prefix: '',	
	//ECA rule's URL
	url: '',
	
	_ruleEvents:[],
	
	postCreate : function() {
		this.inherited(arguments);
		this._ruleEvents = [];
		this.loadECA();
	},
	
	//prepare ECA/CA rules after create widget
	loadECA: function() {
		var THIS = this;
		dojo.xhrPost({
			url: this.url,
			handleAs: "json",
			load: function(ECARules){
				dojo.forEach(ECARules, function(rule) {
					if(THIS.prefix!='' && rule) {
						rule.prefix = THIS.prefix;
						dojo.forEach(rule.evts, function(event) {
							if(event){
								event.id = THIS.prefix + "_" + event.id;
							}
							if(event.repeatAt){
								event.repeatAt = THIS.prefix + "_" + event.repeatAt;
							}
						});
						if (rule.repeatCondAt){
							rule.repeatCondAt = THIS.prefix + "_" + rule.repeatCondAt;
						}
						if (rule.repeatActionAt){
							rule.repeatActionAt = THIS.prefix + "_" + rule.repeatActionAt;
						}
					}
				});
				
				dojo.addOnLoad(function(){
					if (Engine.getInstance() instanceof com.ibm.btt.event.NavigationEngine) {
						Engine.getInstance().registerECARules(ECARules, null, THIS._ruleEvents);	
					} else {
						Engine.getInstance().registerRules(ECARules, null, THIS._ruleEvents);	
					}
				});
			},
			
			error: function(error, args) {
				console.error("Can't load ECA from " + args.url);
				console.error(error);
			}
		});
	},
	
	destroy : function() {
		while (this._ruleEvents && this._ruleEvents.length > 0) {
			try{				
				dojo.disconnect(this._ruleEvents.pop());
			}catch(e){
				console.error("exception @ Engine.clearRules :" + e);
			}
		}
		
		this._ruleEvents = undefined;
		
		this.inherited(arguments);
	}
});