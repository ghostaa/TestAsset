/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Script"); 

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit._Templated"); 
dojo.require("dijit._Widget"); 

dojo.declare("com.ibm.btt.dijit.Script",[dijit._Widget, com.ibm.btt.dijit.AbstractWidgetMixin] ,{ 

	location : "",
	
	executeOnLoad : true,
	
	content : "",
	
	postCreate : function(){
		this.inherited(arguments);
		
		if (this.executeOnLoad == true) {
			this.execute();
		} else{
			/*
			var _this = this;
			dojo.addOnLoad(function() {
				_this.execute();
			});
			*/
		}
	},
	
	_handleLoadingResponse : function(value){
		this.content = value;
	},
	
	_handleLoadingError : function(value){
		console.error("Failed to load script from url, " + value);
	},
	
	_setContentAttr : function(value){
		this.content = value;
	},
	
	_setLocationAttr : function(value){
		this.location = value;
		if(this.content == ""){//defect 29601
			var xhrArgs = {
				url : this.location,
				handleAs : "text",
				sync : true,
				load : dojo.hitch(this, "_handleLoadingResponse"),
				error : dojo.hitch(this, "_handleLoadingError")
			};
			dojo.xhrGet(xhrArgs);
		}
	},
	
	execute : function(){
		var _this = this;
		var x = "";
		if(arguments.length > 0) {
			x += "if(typeof paramTemp != 'undefined') {paramTemp = {'paramTemp':paramTemp};} else {var paramTemp={};}"
		}
		for(var i = 0; i < arguments.length; i++) {
			x+= "if(typeof param" + i + " != 'undefined' ) {paramTemp['param" + i + "'] = param" + i + "; param" + i + " = null; } else {var param" + i + " = null;}"
			if(typeof arguments[i] == 'string') 
				x += "param" + i + "='" + arguments[i].replace(/\'/g, "\\\'").replace(/\"/g, "\\\"")+ "';";
			else 
				x += "param" + i + "=" + arguments[i] + ";";
		}
		
		x = x + _this.content;
		
		for(var i = 0; i < arguments.length; i++) {
			x+= "if(typeof paramTemp['param" + i + "'] != 'undefined'){param" + i + " = paramTemp['param" + i + "'];} else {delete param" + i + ";}";
		}
		if(arguments.length > 0) {
			x+= "if(typeof paramTemp != 'undefined' && typeof paramTemp['paramTemp'] != 'undefined') { paramTemp =  paramTemp['paramTemp']} else {delete paramTemp;}";	
		}
		
		try{
			dojo.eval(x);
		} catch(e){
			console.error("An error occured while executing the script, " + e);
		}
	}
}); 