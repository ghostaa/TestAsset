/*
	Copyright (c) 2004-2011, The Dojo Foundation All Rights Reserved.
	Available via Academic Free License >= 2.1 OR the modified BSD license.
	see: http://dojotoolkit.org/license for details
*/

/*
	This is an optimized version of Dojo, built for deployment and not for
	development. To get sources and documentation, please visit:

		http://dojotoolkit.org
*/

if(!dojo._hasResource["com.ibm.btt.dijit.CellWidgetMixin"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.CellWidgetMixin"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2013 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/
dojo.provide("com.ibm.btt.dijit.CellWidgetMixin");

dojo.declare("com.ibm.btt.dijit.CellWidgetMixin", null,{
	cellWidgetId:"",
	cellWidgetDataName:""
});

}

if(!dojo._hasResource["com.ibm.btt.util.I18nBundle"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.util.I18nBundle"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.util.I18nBundle");



dojo.declare("com.ibm.btt.util.I18nBundle", null,{
	
	bundle : null,
	
	constructor : function(/*String*/packageName, /*String*/bundleName, /*String?*/locale){
		try{
			dojo.requireLocalization(packageName, bundleName, locale, "");
			this.bundle =  dojo.i18n.getLocalization(packageName, bundleName, locale);
		}catch(e){
			console.info("Can not load NLS resources. packageName="+packageName+", bundleName="+bundleName+", locale="+locale);
			this.bundle = undefined;
		}
	},
	
	/**
	 * Sample 1, TRANSFER_WARNING: You can't transfer more than 3 times daily.
	 * Sample 2, TRANSFER_ERROR:Your {account} doesn't can't transfer value exceeds {amount}.
	 * @key key , like TRANSFER_WARNING, TRANSFER_ERROR
	 * @values , like ['2828 2323 8742 9876', '50000'] ; Or {name:"zhangjun", gender:"malel"} ; Or  "zhuangjun", male",...
	 * 
	 */
	getMessage : function(key, values){
		if (typeof (this.bundle) != "undefined" && typeof (key) != "undefined"
				&& typeof (this.bundle[key]) != "undefined") {
			if((values !== undefined) && (dojo.isArray(values))){	// pass in values is an array
				//Sample , TRANSFER_ERROR:Your {account} doesn't can't transfer value exceeds {amount}.
				//The result is replace value of account and amount.
				var text = this.bundle[key];
				var i = 0;   
				text = dojo.replace(text, dojo.hitch(values, function ( _ , k){
					if(i < values.length ) {
						if(values[i] !== undefined && values[i++] !== null) {
							return values[i - 1];
						}
					}
					return "{" + k + "}";
					
				}));
				
				return text;
			}else if (values !== undefined && values !== null && dojo.isObject(values)){
				
				return dojo.replace(this.bundle[key], dojo.hitch(values, function(_, k){ 
						var value = dojo.getObject(k, false, values);
						if(value !== null && value !== undefined) 
							return value;
						else 
							return "{" + k + "}";
							
					}));
					
			}else if(values !== undefined && values !== null) {
				var tempArray = [];
				for(var i = 1; i < arguments.length; i++) {
					tempArray.push(arguments[i]);
				}
				return arguments.callee.apply(this, [key, tempArray]);
			}else {
				return this.bundle[key];
			}
		} else {
			return undefined;
		}
	}
});

}

if(!dojo._hasResource["com.ibm.btt.util.I18nUtil"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.util.I18nUtil"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.util.I18nUtil");


(function(){ 
	I18nUtil = {
			/**
			 * This method is used to get the translated string through the inputed NLS key.
			 * It has four usages.
			 * 1. I18nUtil.getI18nString("%com.ibm.btt.nlsfile/test")
			 * 2. I18nUtil.getI18nString("%com.ibm.btt.nlsfile/test", {"name":"Jesse", "age":"20"});
			 * 3. I18nUtil.getI18nString("%com.ibm.btt.nlsfile/test", ["Jesse", "20"]);
			 * 4, I18nUtil.getI18nString("%com.ibm.btt.nlsfile/test", "Jesse", "20");
			 * 
			 * The key support dynamic parameter followed with "?" character, the format is:
			 * %nls.fileName/KeyName?[{"n":"paramName1","t":"w","id":"widgetId", "p":"value"},{"n":"paramName2","t": "c","v":"constantValue"}], 
			 * 		Each dynamic parameter is stored as an JSON string, with the following property:
			 * 			n: represent for parameter name
			 * 			t: represent for parameter type, 2 valid values:
			 * 				"w" is for widget property value type
			 * 				"c" is for constant value type
			 * 			id: represent for widget id (only if the type is "w")
			 * 			p: represent for widget property name (only if the type is "w")
			 * 			v: represent for constant value (only if the type is "c")
			 * 
			 * @key String
			 * @values Object or Array or multiple parameters
			 * 			If the key is with dynamic parameters(which means it contains "?"), and also "values" are given, the "values" will be omitted.
			 */
			getI18nString : function(key,values) {
				//assert for "",null,undefined value
				if( ( key === null) || (key === undefined) || ( key === "")){
					return key;
				} 
				var sc1 = "%";
				var sc2 = "/";
				var sc3 = "?";
				key = key.toString();
				var temp = key.substring(0, 1);
				if (key.substring(0, 1) != sc1) {
					return key;
				} else {
					var sKey = key.replace(sc1, "");
					// modified for nls dynamic parameter support - start
					var sc3Index = sKey.indexOf(sc3);
					if(sc3Index > 0) {
						var paramsStr = sKey.substring(sc3Index + 1);
						sKey = sKey.substring(0, sc3Index);
						values = this._parseI18nParamsValues(paramsStr);
					}
					// modified for nls dynamic parameter support - end
					var tmp = sKey.split(sc2);
					var packageName = tmp[0].substring(0, tmp[0].lastIndexOf("."));
					var bundleName = tmp[0].substring(tmp[0].lastIndexOf(".") + 1,
							tmp[0].length);
					var keyName = tmp[1];
					if (typeof (packageName) == "undefined"
							|| typeof (bundleName) == "undefined" || packageName == ""
							|| bundleName == "") {
						return key;
					}
					//dojo.requireLocalization(packageName, bundleName, null, "");
					var bundle = new com.ibm.btt.util.I18nBundle(packageName,
							bundleName);
					//arguments[0] = keyName;
					var tmpMsg = bundle.getMessage(keyName, values);
					if (tmpMsg == undefined || tmpMsg == null) {
						return key;
					}else{
						return tmpMsg;
					}
				}
			},
			
			/**
			 * Parse the dynamic parameters and return the parameters values for NLS key.
			 * 
			 * @param paramsStr the dynamic parameters
			 * @returns parsed parameter values
			 * 
			 * @tag private this is a internal method, may be changed or removed in later version
			 *       please do not use this method in customer code.
			 */
			_parseI18nParamsValues : function(paramsStr) {
				var params = null;
				var values = null;

				try{
					paramsStr = paramsStr.replace(/&quot;/g, "\"");
					paramsStr = paramsStr.replace(/&lt;/g, "<");
					paramsStr = paramsStr.replace(/&gt;/g, ">");
					paramsStr = paramsStr.replace(/&amp;/g, "&");
					paramsStr = paramsStr.replace(/&#039;/g, "\'");
					paramsStr = paramsStr.replace(/&#092;/g, "\\");

					params = dojo.fromJson(paramsStr);
					values = {};
					for(var i=0; i<params.length; i++) {
						var type = params[i].t;
						// if parameter type is constant value
						if(type == "c") {
							values[params[i].n] = params[i].v;
						} else if(type == "w") {	// if parameter type is widget property value
							var widget = dijit.byId(params[i].id);
							var p = widget ? widget.get(params[i].p) : undefined;
							if(p) {
								values[params[i].n] = p;
							} else {
								values[params[i].n] = "";
								console.error("Can not get value of property \"" + params[i].p + "\" from widget \"" + params[i].id +"\"");
							}
						}
					}
				} catch(e) {
					console.error("Exception caught during parsing NLS parameter values.");
					return undefined;
				}

				if(values) {
					return values;
				} else return undefined;
			}
	};
})();

}

if(!dojo._hasResource["com.ibm.btt.util.StringUtil"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.util.StringUtil"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.util.StringUtil");

(function() {
	StringUtil = {
		escapeHTML : function(htmlStr) {
			if (htmlStr) {
				var tmp_String = htmlStr.replace(new RegExp("\r\n", "g"), "\n");
				tmp_String = tmp_String.replace(new RegExp("\n", "g"), "<br/>");
				return StringUtil.replaceAll(tmp_String, " ", "&nbsp;");
			} else {
				return htmlStr;
			}

		},
		
		escapeEnterWrap : function(str) {
			if (str) {
				var tmp_String = str.replace(new RegExp("\r\n", "g"), "\n");
				tmp_String = tmp_String.replace(new RegExp("\n", "g"), "<br/>");
				return tmp_String;
			} else {
				return str;
			}
		},

		replaceAll : function(str, subStr, newSubStr) {
			if (str && subStr && newSubStr) {
				return str.replace(new RegExp(subStr, "gm"), newSubStr);
			} else {
				return str;
			}

		},

		removeWarp : function(str) {
			if (str) {
				var tmp_String = str.replace(new RegExp("\r", "g"), "");
				tmp_String = tmp_String.replace(new RegExp("\n", "g"), "");
				return tmp_String;
			} else {
				return str;
			}
		}
	};
})();

}

if(!dojo._hasResource["com.ibm.btt.dijit.AbstractWidgetMixin"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.AbstractWidgetMixin"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.AbstractWidgetMixin"); 




dojo.declare("com.ibm.btt.dijit.AbstractWidgetMixin", null,{
	
	visibility : "visible",
	
	accessKey : "",
	
	hint : "",
	
	postCreate : function(){	
		this.applyAccessKey();
		this.inherited(arguments);
	},
	
	/**
	 * support the key is a template
	 * 
	 * @param key , defined in NLS cdd , LIKE Use %com.ibm.btt.nls.msg/transaction01.text as key of nls text.
	 * @paramvalues , dynamic values, the message should be a template like this : TRANSFER_ERROR:Your {account} doesn't can't transfer value exceeds {amount}. 
	 * Alpha developer can invoke the API like message1.display("TRANSFER_ERROR","ERROR", accountTextbox1.value, amounTextbox1.value);
	 * The dynamic values are [accountTextbox1.value,amounTextbox1.value] or {account:"4550 3588 5687 8554", amount:"5000"}
	 *
	 */
	getI18NString : function(key,values) {
				
		return I18nUtil.getI18nString(key, values);
		
	},
	
	replaceWrap : function(){
		
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
		var node = this.textbox || this.focusNode || this.domNode;
		node.title = StringUtil.removeWarp(this.getI18NString(value));
	},
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setVisibilityAttr : function(value){		
		var d = "";
		var v = "inherit";
		switch (value){
		case "gone":
			d = "none";
			v = "inherit";
			break;
		case "hidden":
			d = "";
			v = "hidden";
			break;
//		case "visible": // strongly recommend not using this value directly
//			d = "";
//			v = "visible";
//			break;
		default:
//			value = "inherit";
			d = "";
			v = "inherit";
		}
		
		this.visibility = value;

		dojo.style(this.domNode, "display", d);
		dojo.style(this.domNode, "visibility", v);
	},
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	// gone, hidden, visible, no inherit
	_getVisibilityAttr : function(){
		var v = this.visibility; // gone, hidden, visible and inherit

		if (v!="gone") {	// compute the inherited value
			if (this.domNode.offsetWidth<1 || this.domNode.offsetHeight<1){
				v = "gone";
			}else{
				v = dojo.style(this.domNode, "visibility")=="hidden"?"hidden":"visible";
			}
		}
		
		return v;
	},
	
	isVisible : function(){
		var isV = false;
		switch (this.visibility){ // gone, hidden, visible and inherit
		case "gone":
		case "hidden":
			isV = false;
			break;
//		case "visible": // depends on its parent
//		case "inherit":	// depends on its parent
		default :
			isV = this.domNode.offsetWidth>0 && this.domNode.offsetHeight>0 && dojo.style(this.domNode, "visibility")!="hidden";
		}
		return isV;
	},
	
	isFocusable: function(){
		// Overridden so that when dijit is hidden, isFocusable return false;
		if(this.isVisible()==false){
			return false;
		} else if(this.disabled || this.readOnly){
			return false;
		} else {
			return this.inherited(arguments);
		}
	},

	applyAccessKey : function() {
		if (this.focusNode && this.accessKey) {
			this.focusNode.setAttribute('accessKey', this.accessKey);
		}
	},
	
	handleLenUint : function(value) {
		var endWith = function(src, oString) {
			var reg = new RegExp(oString + "$");
			return reg.test(src);
		};
		if(endWith(value, "px") || endWith(value, "%") || endWith(value, "em")){
			return value;
		}else{
			return value + "px";
		}
	}
	
}); 
	

}

if(!dojo._hasResource["com.ibm.btt.dijit.Anchor"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.Anchor"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Anchor"); 


 
 
 

dojo.declare("com.ibm.btt.dijit.Anchor",[dijit._Widget,dijit._Templated,com.ibm.btt.dijit.AbstractWidgetMixin,com.ibm.btt.dijit.CellWidgetMixin] ,{ 
	
	templateString : "<a class='dijitLabelBase' dojoAttachEvent='onclick:_onClick'></a>",
	
	action : "#",
	
	target : "_parent",
	
	bttParams : "",
	
	text : "",
	
	tabIndex: 0,
	
	disabled : false,
	
	width : "",
	
	height : "",
	
	textWrap : false,
	
	attributeMap: dojo.delegate(dijit._Widget.prototype.attributeMap, {
		target : {
			node : "domNode"
		},
//		tabIndex : {	// do it in postCreate()
//			node : "domNode"
//		},
		text : {
			node : "domNode",
			type : "innerHTML"
		},
//		visibility : {
//			node : "domNode"
//		},
//		disabled : {	// do it in postCreate()
//			node : "domNode"
//		},
		action : {
			node : "domNode"
		}
	}),
	
	postCreate : function() {
		this.inherited(arguments);
		var ti = parseInt(this.tabIndex);
		if (isNaN(ti)){
			this.tabIndex = 0;
		}else{
			this.tabIndex = ti;
		}
		this.disabled = (this.disabled===true || this.disabled==="true");
		this.domNode.disabled = this.disabled;
		if (this.disabled){
			this.domNode.tabIndex = -1;
			dojo.addClass(this.domNode, "bttDisabledLink");
		} else {
			this.domNode.tabIndex = this.tabIndex;
			dojo.removeClass(this.domNode, "bttDisabledLink");
		}
	},
	
	/**
	 * 
	 * join btt params to a url
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_parameterHandler : function(e) {
		var paramString = "";
		var params = dojo.fromJson(e);
		params[AjaxUtil.constants.BTT_TIMEZONE] = AjaxUtil.getTimzone();
		for ( var paramName in params) {
			if (typeof (paramName) != "undefined") {
				var paramValue = params[paramName];
				if (paramString == "") {
					paramString += paramName + "=" + paramValue;
				} else {
					paramString += "&" + paramName + "=" + paramValue;
				}
			}
		}
		return paramString;
	},

	/**
	 * 
	 * hook method for action attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setActionAttr : function(value){
		this.action = value;
		var targetUrl = "";
		if (this.bttParams != "" && this.action != "" && this.action !== "#") {
			targetUrl = this.action;
			if (this.bttParams != "") {
				if (targetUrl.indexOf("?") == -1) {
					targetUrl += "?";
				}
				if (this.bttParams != "") {
					var params = this._parameterHandler(this.bttParams);
					if (targetUrl.substring(targetUrl.length - 1) == "?") {
						targetUrl += params;
					} else {
						targetUrl += "&" + params;
					}
				}
			}
		} else {
			if (this.action != "" && this.action !== "#") {
				targetUrl = this.action;
			} else {
				targetUrl = "javascript:void(0)";
			}
		}
		this.domNode.href = targetUrl;
	},
	
	/**
	 * 
	 * hook method for text attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextAttr : function(value){
		this.text = value;
		this.domNode.innerHTML = StringUtil.escapeEnterWrap(this.getI18NString(value));
	},
	
	/**
	 * 
	 * hook method for disable attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setDisabledAttr : function(value){
		this.disabled = (value===true || value==="true");
		this.domNode.disabled = this.disabled;
		if (this.disabled){
			this.domNode.tabIndex = -1;
			dojo.addClass(this.domNode, "bttDisabledLink");
		} else {
			this.domNode.tabIndex = this.tabIndex;
			dojo.removeClass(this.domNode, "bttDisabledLink");
		}
	},
	
	focus : function(){
		this.domNode.focus();
	},
	
	applyAccessKey : function(){
		if(this.accessKey){
			this.domNode.setAttribute('accessKey', this.accessKey);
		}
	},
	
	/**
	 * 
	 * override default onclick method to block default click when link is disabled
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onClick : function(e){
		if (this.disabled || this.onClick(e) === false) {
			e.preventDefault();
		} 
	},
	
	onClick : function(e){
		//leave onClick event for customer to use.
	},
	
	/**
	 * 
	 * hook method for textWrap attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextWrapAttr : function(value) {
		this.textWrap = value;
		if (this.textWrap) {
			dojo.addClass(this.domNode, "dijitLabelWrap");
		} else {
			dojo.removeClass(this.domNode, "dijitLabelWrap");
		}
	},
	
	/**
	 * 
	 * hook method for width attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setWidthAttr : function(value){
		if(this.width != ""){
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
	_setHeightAttr : function(value){
		if(this.height != ""){
			this.height = value;
			dojo.style(this.domNode, "height", this.handleLenUint(this.height));
		}
	}
}); 

}

if(!dojo._hasResource["com.ibm.btt.dijit.Button"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.Button"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Button");



 

dojo.declare("com.ibm.btt.dijit.Button", [ dijit.form.Button,
		com.ibm.btt.dijit.AbstractWidgetMixin,com.ibm.btt.dijit.CellWidgetMixin], {
	
	bttParams : "",
	
	icon : "",
	
	text : "",
	
	/**
	 * This property indicates whether the button can be enable or disable when form valid status changes
	 * 
	 */	
	inValid : false,	
	
	width : "",
	
	height : "",
	
	textWrap : false,
		
	attributeMap: dojo.delegate(dijit.form.Button.prototype.attributeMap, {
//		visibility : {
//			node : "domNode"
//		},
		text : {
			node : "textNode",
			type : "innerHTML"
		},
		icon : {
			node : "iconImageNode",
			type : "attribute",
			attribute : "src"
		},
		width : {
			node : "domNode"
		},
		height : {
			node : "domNode"
		}
	}),
	
	buildRendering : function(){
		this.inherited(arguments);
		this.iconImageNode = dojo.create("img", {'style':'display:none;'}, this.containerNode, "last");
		this.textNode = dojo.create("span", {'class':'dijitLabelBase'}, this.containerNode, "last");
		dojo.style(this.focusNode, 'overflow', 'hidden');
		dojo.addClass(this.focusNode.parentNode, "dijitLabelBase");
		if (dojo.isIE && dojo.isIE>8)
		{
//			dojo.addClass(this.focusNode.parentNode, "dijitButtonFocus_IE9");
			dojo.style(this.focusNode.parentNode, "overflow", "visible");
		}
	},
	
	postCreate : function(){
		this.inherited(arguments);
		this._setIconAttr(this.icon); //add to fix the icon display error for IE6/IE7
	},
	
	/**
	 * 
	 * hook method for text attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextAttr : function(value) {
		this.text = value;
		this.textNode.innerHTML = StringUtil.escapeEnterWrap(this.getI18NString(value));
	},
	
	/**
	 * 
	 * hook method for textWrap attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextWrapAttr : function(value) {
		this.textWrap = value;
		if (this.textWrap) {
			dojo.addClass(this.textNode, "dijitLabelWrap");
		} else {
			dojo.removeClass(this.textNode, "dijitLabelWrap");
		}
	},
	
	/**
	 * 
	 * hook method for icon attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setIconAttr : function(value){
		this.icon = value;
		if (value) {
			this.iconImageNode.src = value;
			dojo.style(this.iconImageNode,"display","");
		}else{
			dojo.style(this.iconImageNode,"display","none");
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
			dojo.style(this.focusNode.parentNode,"width", this.handleLenUint(this.width));
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
			dojo.style(this.focusNode.parentNode,"height", this.handleLenUint(this.height));
		}		
	},
	
	/**
	 * 
	 * hook method for inValid attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setInValidAttr : function(value){
		
		this.inValid = value;
		
		if (this.type == "submit") {
			var form = this._getParentForm();
			if (form && form.setSubmitButtonState) {
				form.setSubmitButtonState();
			} else {
				this.set("disabled", value);
			}
		} else {
			this.set("disabled", value);
		}
		
	},
	
	
	/**
	 * 
	 * override default button click mehtod to support canle and save type button
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onButtonClick : function(e){
		var form = this._getParentForm();
		if(form) {
			if(this.get("disabled") == false && (this.type == "submit" || this.type == "cancel" || this.type == "save"))
				form._clickedButton = this;
			else
				form._clickedButton = null;
		}

		if(form && this.get("disabled") == false && this.type == "cancel"){
			this._onClick(e);
			this._doCancelAction(form);
			e.preventDefault();
		}else if(form && this.get("disabled") == false && this.type == "save"){
			this._onClick(e);
			this._doSaveAction(form);
			e.preventDefault();
		}else{
			if(form){
				form._lastClickedButton = this;
			}
			this.inherited(arguments);
		}
		
	},
	
	/**
	 * 
	 * get the the parent form container which this button in
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getParentForm : function(){
		for(var node=this.domNode; node.parentNode/*#5935*/; node=node.parentNode){
			var widget=dijit.byNode(node);
			if(widget && typeof widget._onSubmit == "function"){
				return widget;
			}
		}
	},
	
	/**
	 * 
	 * handle the cancel action when button is cancel type
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_doCancelAction : function(form){
		var form = this._createHiddenForm(form, typeof this.bttParams == "string" ? dojo.fromJson(this.bttParams) : this.bttParams);
		form.submit();
	},
	
	/**
	 * 
	 * handle save action whne button is save type
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_doSaveAction : function(form){
		var form = this._getParentForm();
		if(form.onFormSubmit){
			form.onFormSubmit();
		}
		var formValue = form.get('validValue');
		var form = this._createHiddenForm(form, dojo.mixin(formValue, typeof this.bttParams == "string" ? dojo.fromJson(this.bttParams) : this.bttParams));
		form.submit();
	},

	/**
	 * 
	 * create hidden filed to submit data
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_createHiddenForm : function(form, params){
		var form = dojo.create("form", {
				'style' : 'display:none;',
				'action' : form.get('action'),
				'method' : form.get('method')
			}, dojo.body(), 'last');
		var plainKeyValue = [];
		for(var name in params){
			if (name != undefined && name != null && name != "") {
				plainKeyValue = plainKeyValue.concat(this._convertToKeyValuePair(name, params[name]));
			}
		}
		
		for(var i=0;i<plainKeyValue.length;i++){
			dojo.create("input", {
				'type' : 'hidden',
				'name' : plainKeyValue[i].key,
				'value' : plainKeyValue[i].value
			}, form, "last");
		}
		
		return form;
	},
	
	/**
	 * 
	 * convert object data to plain key value pair data
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_convertToKeyValuePair : function(name, value){
		var res = [];
		if (dojo.isObject(value)) {
			for(var key in value){
				if (key != undefined && key != null && key != "") {
					res = res.concat(this._convertToKeyValuePair(name+"."+key, value[key]));
				}
			}
		} else if (dojo.isArray(value)) {
			for ( var i = 0; i < value.length; i++) {
				res = res.concat(this._convertToKeyValuePair(name+"."+i, value[i]));
			}
		} else {
			res.push( {
				'key' : name,
				'value' : value
			});
		}
		return res;
	}
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.CheckBox"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.CheckBox"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.CheckBox");




dojo.declare("com.ibm.btt.dijit.CheckBox", [ dijit.form.CheckBox, com.ibm.btt.dijit.AbstractWidgetMixin], {

	text : "",
	
//	visibility : "visible",
	
	uncheckedField : null,

	checkedValue : "true",

	unCheckedValue : "false",
	
	isChecked : false,
	
	checked : "",
	
	width : "",
	
	height : "",
	
	textWrap : false,
	
	attributeMap : dojo.delegate(dijit.form.CheckBox.prototype.attributeMap, {
		
		isChecked : {
			node : "domNode",
			type : "attribute"
		},

		style : {
			node : "labelNode",
			type : "attribute"
		},
		
//		visibility : {
//			node : "domNode"
//		},
		
		text : {
			node : "labelNode",
			type : "innerHTML"
		}
	}),

	postMixInProperties: function(){
		if(this.isChecked==true){
			this.checked = "checked";
			this.params.checked = "checked";
		}
		this.inherited(arguments);
	},
	
	create : function() {
		this.labelNode = dojo.create("label", {'class':'dijitLabelBase'}, this.domNode, "after");
		//this.labelNode.innerHTML = this.getI18NString(this.text);
		this.inherited(arguments);
		this.labelNode.htmlFor = this.id;
		dojo.place(this.labelNode,this.domNode,"after");
		this.set("visibility", this.visibility);
	},

	postCreate : function() {
		this.inherited(arguments);
		this._setSubmitValue();
		this.set('value', this.checkedValue);
		
		if (this.width && this.width != "") {
			this.set("width", this.width);
		}
		if (this.height && this.height != "") {
			this.set("height", this.height);
		}
	},

	setUncheckedValue : function(arg) {
		if(!this.get('name')){
			//never use uncheckedField if name is null or '', as this field will not be submitted
			return;
		}
		if (arg == true) {
			if (this.uncheckedField == null) {
				this.uncheckedField = dojo.create("input", {
					type : 'hidden',
					value : this.unCheckedValue,
					name : this.get('name')
				});
			}
			dojo.place(this.uncheckedField, this.focusNode, "after");
		} else {
			if (this.uncheckedField != null) {
				dojo.destroy(this.uncheckedField);
			}
		}
	},
	
	/**
	 * 
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	// fix for JR41345, remove focused style for empty label
	_onFocus: function(){
		this.inherited(arguments);
		if(!this.text || this.text === "" || this.text === null ){
			dojo.query("label[for='"+this.id+"']").removeClass("dijitFocusedLabel");
		}
	},
	
	/**
	 * 
	 * set the value before submit the data to server
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setSubmitValue : function(){
		if (this.get("isChecked")) {
			this.setUncheckedValue(false);
		} else {
			this.setUncheckedValue(true);
		}
	},
	
	/**
	 * 
	 * hook method for isChencked attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setIsCheckedAttr : function(value){
		this.set("checked", value);
	},
	
	/**
	 * 
	 * hook method for checked attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setCheckedAttr : function(value){
		if (value == false || value == "false" || value == "") {
			this.isChecked = false;
		}else {
			this.isChecked = true;
		}
		this._setSubmitValue();
		this.inherited(arguments);
	},
	
	/**
	 * 
	 * hook method for text attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextAttr : function(value){
		this.text = value;
		this.labelNode.innerHTML = StringUtil.escapeEnterWrap(this.getI18NString(value));
	},
	
	/**
	 * 
	 * hook method for style attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setStyleAttr : function(value){
		dojo.attr(this.labelNode, "style", value);
	},
	
	/**
	 * 
	 * hook method for class attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setClassAttr : function(value){
		dojo.attr(this.labelNode, "class", value);
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
		var tmpVal = StringUtil.removeWarp(this.getI18NString(value));
		var node = this.textbox || this.focusNode || this.domNode;
		node.title = tmpVal;
		this.labelNode.title = tmpVal;
	},
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setVisibilityAttr : function(value){
		
		var d = "";
		var v = "inherit";
		switch (value){
		case "gone":
			d = "none";
			v = "inherit";
			break;
		case "hidden":
			d = "";
			v = "hidden";
			break;
//		case "visible": // strongly recommend not using this value directly
//			d = "";
//			v = "visible";
//			break;
		default:
//			value = "inherit";
			d = "";
			v = "inherit";
		}
		
		this.visibility = value;

		dojo.style(this.domNode, "display", d);
		dojo.style(this.domNode, "visibility", v);
		dojo.style(this.labelNode, "display", d);
		dojo.style(this.labelNode, "visibility", v);
	},
	
	/**
	 * 
	 * hook method for readOnly attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setReadOnlyAttr: function(/*Boolean*/ value){
		this.inherited(arguments);
		if (value === "true" || value === true) {
			this.labelNode.htmlFor = "";
		}
		else{
			this.labelNode.htmlFor = this.id;
		}
	},
	
	/**
	 * 
	 * hook method for disabled attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setDisabledAttr : function(value){
		this.inherited(arguments);
		if(this.uncheckedField!=null){
			dojo.attr(this.uncheckedField, 'disabled', value);
		}
	},
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getValueAttr : function(){
		if(this.isChecked){
			return this.checkedValue;
		}else{
			return this.unCheckedValue;
		}
	},
	
	/**
	 * 
	 * hook method for textWrap attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextWrapAttr : function(value) {
		this.textWrap = value;
		if (this.textWrap) {
			dojo.addClass(this.labelNode, "dijitLabelWrap");
		} else {
			dojo.removeClass(this.labelNode, "dijitLabelWrap");
		}
	},
	
	/**
	 * 
	 * hook method for width attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setWidthAttr : function(value){
		if(this.width != ""){
			this.width = value;
			
			var width = value.replace(new RegExp("px", "gm"), "");
			try{
				width = Number(width);
			} catch(e) {
				console.error("Illegal input argument. Can not convert input width:"+ value +" to number.");
				return;
			}
			var box = dojo.marginBox(this.domNode);
			var labelWidth = width - box.w;
			if(labelWidth<0){
				labelWidth = 0;
			}
			dojo.style(this.labelNode, "width", labelWidth + "px");
		}
	},
	
	/**
	 * 
	 * hook method for height attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHeightAttr : function(value){
		if(this.height != ""){
			this.height = value;
			var height = value.replace(new RegExp("px", "gm"), "");
			/*try{
				height = Number(height);
			} catch(e) {
				console.error("Illegal input argument. Can not convert input height:"+ value +" to number.");
				return;
			}
			var box = dojo.marginBox(this.domNode);
			var labelHeight = height - box.h;
			if(labelHeight<0){
				labelHeight = 0;
			}*/
			dojo.style(this.labelNode, "height", height + "px");
		}
	},
	
	destroy : function(){
		this.inherited(arguments);
		dojo.destroy(this.labelNode);
		this.labelNode = null;
	}
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.ValidationTextBox"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.ValidationTextBox"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/


dojo.provide("com.ibm.btt.dijit.ValidationTextBox"); 




dojo.requireLocalization("com.ibm.btt.dijit", "TextBox", null, "ROOT");

dojo.declare("com.ibm.btt.dijit.ValidationTextBox",[dijit.form.ValidationTextBox,
                                                    com.ibm.btt.dijit.AbstractWidgetMixin ],{
	
	width : "",
	
	errorDisplayer : null,
	
	singleFieldErrorMessage : "",
	
	isMandatory : false,
	
	attributeMap: dojo.delegate(dijit.form.ValidationTextBox.prototype.attributeMap, {
		
//		visibility : {
//			node : "domNode"
//		},
		
		width : {
			node : "domNode"
		}
		
	}),
	
	postMixInProperties : function(){
		this.inherited(arguments);
		this.bundle = new com.ibm.btt.util.I18nBundle("com.ibm.btt.dijit", "TextBox");
		if (this.placeHolder) {
			this.placeHolder = this.getI18NString(this.placeHolder);
			this.watch("readOnly", this._updatePlaceHolder);
			this.watch("disabled", this._updatePlaceHolder);
		}
	},
	
	_updatePlaceHolder: function(){
		if(this._phspan && (this.disabled || this.readOnly)){
			this._phspan.style.display="none";
		}else{
			this.inherited(arguments);
		}
	},
	
	acceptedCharReg : "",
	postCreate: function(){
		this.inherited(arguments);
		if(this.acceptedCharReg){
			this.acceptedCharReg = new RegExp(this.acceptedCharReg);
			if(!this.acceptedCharReg) return;
			this.connect(this.textbox, "onkeypress", function(evt){
				if (evt.keyChar && !this.acceptedCharReg.test(evt.keyChar)){
					return dojo.stopEvent(evt);
				}
			});
		}
	},
	
	validator: function(/*anything*/value, /*dijit.form.ValidationTextBox.__Constraints*/constraints){
		var result = typeof(this.regExpGen(constraints))!="undefined" && this.testRegularExpression(this.regExpGen(constraints), value);
		if(!result) {
			this.invalidMessage = this.bundle.getMessage("regularExpressionMessage");
			return false;
		}else{
			var res = (!this.required || !this._isEmpty(value)) &&
                (this._isEmpty(value) || this.parse(value, constraints) !== undefined); // Boolean
            if(res){
            	return true;
            }else{
            	this.invalidMessage = this.bundle.getMessage("invalidMessage");
            	return false;
            }
        }
	},
	
	testRegularExpression : function(reg, value){
		return (new RegExp("^(?:" + reg + ")"+(this.required?"":"?")+"$")).test(value);
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
	
	_setIsMandatoryAttr : function(value) {
		this.isMandatory = value;
	},
	
	isErasable : function() {
		if (this.isMandatory || this.textbox.value!="") return false;
		
		var __isR = this.required;
		this.required = false;
		var isE = this.validator("", this.constraints);
		this.required = __isR;
		return isE;
	},
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
//	_setVisibilityAttr : function(value){
//		this.visibility = value;
//		var iconNode;
//		if (typeof (this.domNode.children[0]) != "undefined"
//				&& typeof (this.domNode.children[0].children[0]) != "undefined") {
//			iconNode = this.domNode.children[0].children[0];
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
	
	_onFocus: function(/*String*/ by) {
		this.onShowErrorFlag=false;
		if(this.errorDisplayer) this.errorDisplayer.hide(this.domNode);
		this.inherited(arguments);
	},
	
	
	onShowErrorFlag : false,
	showErrorMessage: function(/*String*/ message){
		
		if(dojo.isArray(message)) {
			var nlsMessageArray = [];
			for(var i = 0; i < message.length; i ++) {
				var tempMessage = this.getI18NString(message[i]);
				if(tempMessage == null) tempMessage = message[i];
				nlsMessageArray.push(tempMessage);
			}
			if(nlsMessageArray.length != 0) {
				var nlsMsg = nlsMessageArray.join(" ");
			} else {
				var nlsMsg = "";
			}
		} else {
			var  args=[];
			var  values=[];
			if (arguments.length==0){
				arguments[0]="";
				message="";
			}
			
			for (var i=1;i<arguments.length; i++ ){
				values[i-1]=arguments[i];
			}	
			args[0]=arguments[0];
			args[1]=values;
			args[2]=true;
			var nlsMsg=this.getI18NString.apply(this,args );	
			if (nlsMsg==null) nlsMsg=message;
		}
			
		 if (message!=""){
			// if(this._message == message){ return; }
			 this._message = message;
			 dijit.hideTooltip(this.domNode);
			 //This line is used to fix PMR JR41644, 
			 //set cursor to current textBox when show error message toolTip beside textBox
			 //this.focus();
			 dojo.window.scrollIntoView(this.focusNode);
			 
			 this.onShowErrorFlag=true;
			 if(!this.errorDisplayer)  
				 this.errorDisplayer = new dijit._MasterTooltip();		
			 this.errorDisplayer.show( nlsMsg , this.domNode, this.tooltipPosition, !this.isLeftToRight());	
		 }
		 else {
			 this.onShowErrorFlag=false;
			 if(this.errorDisplayer) 
					this.errorDisplayer.hide(this.domNode);
		 }
			
		 this._refreshState();
	},
	// override
	validate: function( isFocused){ 
	
		if (this.onShowErrorFlag){ //mask warnings
			//this.state = "Error" ; 
			this._set("state", "Error");
			this._setStateClass();
			dijit.setWaiState(this.focusNode, "invalid", false ? "false" : "true");
			if(isFocused){
				if(this.state == "Error"){
					message = this.getErrorMessage(true);
				}else{
					message = this.getPromptMessage(true); // show the prompt whever there's no error
				}
				this._maskValidSubsetError = true; // since we're focused, always mask warnings
			}
			//this.displayMessage(message);  // not show internal error message, just mask ! warnings only
			return false; 
		}else
			return this.inherited(arguments);
	},
	
	destroy : function(){
		this.displayMessage("");
		if(this.errorDisplayer){
			this.errorDisplayer.hide(this.domNode);
		}
		this.inherited(arguments);
		if(this.errorDisplayer){
			this.errorDisplayer.destroy();
			this.errorDisplayer = undefined;
		}
	}

});

dojo.declare("com.ibm.btt.dijit.MappedTextBox",[com.ibm.btt.dijit.ValidationTextBox,dijit.form.MappedTextBox],{});

dojo.declare("com.ibm.btt.dijit.RangeBoundTextBox",[com.ibm.btt.dijit.MappedTextBox,dijit.form.RangeBoundTextBox],{
	
	postMixInProperties : function(){
		this.inherited(arguments);
		this.bundle = new com.ibm.btt.util.I18nBundle("com.ibm.btt.dijit", "TextBox");
	},
	
	rangeCheck: function(/*Number*/ primitive, /*dijit.form.RangeBoundTextBox.__Constraints*/ constraints){	
		if("min" in constraints && this.compare(primitive,constraints.min) < 0){
			this.rangeMessage = this.bundle.getMessage("rangeMinMessage",{value:constraints.min});
			return false;
		}
		if("max" in constraints && this.compare(primitive,constraints.max) > 0){
			this.rangeMessage = this.bundle.getMessage("rangeMaxMessage",{value:constraints.max});
			return false;
		}
		return true;
	}

});

}

if(!dojo._hasResource["com.ibm.btt.dijit.ComboBox"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.ComboBox"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.ComboBox");






dojo.declare("com.ibm.btt.dijit.ComboBox",[com.ibm.btt.dijit.ValidationTextBox,dijit.form.ComboBox,com.ibm.btt.dijit.AbstractWidgetMixin],{
	
	storeDataName : "",
	
	storeData : "",
	
	storeURL : "",	
	
	labelField : "label",
	
	valueField : "value",
	
	asyncStatus : 0,
	
	asyncErrorMessage : "",	
	
	typeAhead : true,
	
	//internal variable; if 0, means, the value is input by user; if 1 , the value is selected by user
	inputFlag : 0,
	// the value which is used to submit
	comboValue : "", 
	
	_eventsHandler : [],
	
	constructor : function() {
		
		this.storeDataFormat = {
				itemLabel : 'label',
				itemValue : 'value'
			};
		
		this.searchAttr = this.storeDataFormat.itemLabel;
		this._eventsHandler = [];
	},	
	
	attributeMap: dojo.delegate(dijit.form.ComboBox.prototype.attributeMap, {
		
//		visibility : {
//			node : "domNode"
//		}
	
	}),
	
	postMixInProperties: function(){
		this.storeDataFormat.itemLabel = this.labelField? this.labelField:"label";
		this.storeDataFormat.itemValue = this.valueField? this.valueField:"value";
		
		this.searchAttr = this.storeDataFormat.itemLabel;
	
		var root = this.srcNodeRef;
		
		var dataObj = {
				identifier : this.storeDataFormat.itemValue,
				label : this.storeDataFormat.itemLabel,
				items : []
			};
		
		var labelName = this.storeDataFormat.itemLabel;
		
		var scope = this;
		dojo.query("> option", root).forEach(
				dojo.hitch(this, function (node, i) {
			
			var item = {};
			
			item[labelName] = scope.getI18NString(dojo.trim(node.innerHTML));
			var value = dojo.attr(node, 'value');
			if (value == '') {
			//	value = '#';
			}
			item[this.storeDataFormat.itemValue] = value;		
			
			dataObj.items.push(item);
		}));
		
		if(dataObj.items.length == 0) {
			if(this.storeData) {
				var tmpValue = dojo.fromJson(this.storeData);
				dataObj = this._formatStoreData(tmpValue);
			}
		}
		
		this.store = new dojo.data.ItemFileReadStore({data:dataObj});
		
		this.inherited(arguments);
		
	},
	
	postCreate: function(){
		
		this.inherited(arguments);
		
		if(!this.storeDataName && this.storeURL) {
		
			this.loadStoreFromURL(this.storeURL);
			
		}
		
		if (this.typeAhead != undefined && this.typeAhead == false)	{					
			this.textbox.readOnly = true;
		}else{
			if (this.readOnly != undefined && this.readOnly == true)	{					
				this.textbox.readOnly = true;
			}else{
				this.textbox.readOnly = false;
			}
		}
		
		//IBK6
		dojo.connect(this.focusNode, "onclick", dojo.hitch(this, function(){
			if(!this.typeAhead){
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
			}
		}));
		
		// If default value is set for combox, label should be selected 
		if (this.typeAhead == false)
		{
			if (this.comboValue != null && this.comboValue != "" )
			{
				// get from urlForList
				var listData = this.store.data;
				if (listData == null)
				{
					//get from dataNameforList
					listData = this.store._jsonData;
				}
				 var items = listData.items;
				 for(var i = 0; items != null && i < items.length; i++){
					 if (items[i][this.storeDataFormat.itemValue] == this.comboValue) {
						 this.textbox.value = items[i][this.storeDataFormat.itemLabel];
						 break;
					 }		            
			     }
			}	
		}
	},	

	setStoreData : function(data) {
		
		var data = this._formatStoreData(data);
		this.store.clearOnClose = true;
		this.store.data = data;
		this.store._jsonData = null;
		this.store.close();
		
	},
	
	/**
	 * 
	 * convert object or array data to data store format data
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_formatStoreData : function(data) {
		
		var resData = {
				identifier : this.storeDataFormat.itemValue,
				label : this.storeDataFormat.itemLabel,
				items : []
			};
		
		if(data instanceof Array ) {
			for(var i = 0; i < data.length; i ++) {
				if(data[i] != null) {
					var item = {};
					if(dojo.isObject(data[i])) {
						if(data[i][resData.label] != null) {
							item[resData.label] = this.getI18NString(data[i][resData.label]);
							// for combo widget in table
							if (data[i][this.valueField]) {
								item[resData.identifier] = data[i][this.valueField];
							}
							else
							{
								item[resData.identifier] = this.getI18NString(data[i][resData.label]);
							}
						}
					} else if(dojo.isString(data[i])) {
						item[resData.label] = this.getI18NString(data[i]);
						item[resData.identifier] = this.getI18NString(data[i]);
					} else {
						item[resData.label] = data[i].toString();
						item[resData.identifier] = data[i].toString();
					}
					if(item[resData.label])
						resData.items.push(item);
				}
			}

		} else if (data instanceof Object) {
			for(var p in data) {
				var item = {};
				item[resData.label] = this.getI18NString(p);
				item[resData.identifier] = data[p];
				resData.items.push(item);
			}
		}
		
		return resData;
	},
	
	/**
	 * 
	 * error handling method for loading data with xhr 
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleStoreLoadingError : function(err) {
		
		if(err.status !== undefined)
		{				
			this.asyncStatus = err.status;
			this.asyncErrorMessage = err.message;
			this.onAsyncError();
		}
		
	},
	
	onAsyncOK : function() {
		
	},

	onAsyncError : function() {
		
	},
		
	loadStoreFromURL : function(url) {
		
		this.storeURL = url;
		
		var xhrArgs = {
			url:this.storeURL,
			handleAs: "json",
			sync: true,
			load: dojo.hitch(this, "_handleStoreLoadingResponse"),
    		error: dojo.hitch(this, "_handleStoreLoadingError")
         };
		
	    this.asyncStatus = 0;
	    this.asyncErrorMessage = "";    
	    dojo.xhrGet(xhrArgs);
	},
	
	/**
	 * 
	 * handle loading data xhr response
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleStoreLoadingResponse : function(data) {
		
		this.setStoreData(data);
		this.onAsyncOK();
		
	},	
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
//	_setVisibilityAttr : function(value){
//		this.visibility = value;
//		var iconNode;
//		if (typeof (this.domNode.children[0]) != "undefined"
//				&& typeof (this.domNode.children[0].children[1]) != "undefined") {
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
	 * hook method for item attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 *              Customer can not use this method directly, they should use set('item', item) instead.
	 * */
	_setItemAttr: function(/*item*/ item, /*Boolean?*/ priorityChange, /*String?*/ displayedValue){
		
		if(!displayedValue){
			displayedValue = this.store.getValue(item, this.searchAttr);
		}
		this.inputFlag = 1;
		if (this.valueField != null && this.valueField != "") {
			// for dataNameForList
			this.comboValue = this.store.getValue(item, this.valueField);	
		}
		else
		{
			//for urlForList
			this.comboValue = this.store.getValue(item, this.storeDataFormat.itemValue);
		}
		
		this._set("item", item);
		dijit.form.ComboBox.superclass._setValueAttr.call(this, this.comboValue, priorityChange, displayedValue);
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
		if (this.inputFlag == 0)
		{
			 return value;
		}
		else {
			return this.comboValue;
		}
	},
	
	/**
	 * 
	 * hook method for display value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	 _setDisplayedValueAttr: function(/*String*/ value){
		 if (this.typeAhead == true) {
			 this.textbox.value = value;
			 this.comboValue = value;
			 this.inputFlag = 0;
		 }
		 else {	
			 this.comboValue = value;
			 this.inputFlag = 1;
		 }
	 },
	 
	 destroy : function(){
		if(window[this.id]){
			window[this.id] = undefined;
		}
		
		while(this._eventsHandler && this._eventsHandler.length>0){
			try{				
				dojo.disconnect(this._eventsHandler.pop());
			}catch(e){}
		}
		this._eventsHandler = undefined;
		
		this.inherited(arguments);
	 }
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.NumberTextBox"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.NumberTextBox"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.NumberTextBox");





dojo.declare("com.ibm.btt.dijit.NumberTextBox",[com.ibm.btt.dijit.RangeBoundTextBox,dijit.form.NumberTextBox],{
	
	numberType : "",

	minimumNumber : NaN,

	maximumNumber : NaN,

	locale : dojo.locale,

	pattern : "",

	decimalPlaces : 0,
	
	postMixInProperties : function(){
		
		this.inherited(arguments);
		
		if (this.numberType == "byte" || this.numberType == "int"
			|| this.numberType == "short" || this.numberType == "integer"
			|| this.numberType == "long" || this.numberType == "bigInteger") {
			this.fractional = false;
		} else {
			this.fractional = true;
		}
		
		if (!isNaN(this.minimumNumber)) {
			if (this.fractional) {
				this.constraints.min = Number(this.minimumNumber);
			} else {
				this.constraints.min = parseInt(this.minimumNumber);
			}
		}
		
		if (!isNaN(this.maximumNumber)) {
			if (this.fractional) {	
				this.constraints.max = Number(this.maximumNumber);	
			} else {
				this.constraints.max = parseInt(this.maximumNumber);
			}
		}
		
		this.constraints.locale = this.locale;
		
		if (this.pattern != "") {
			this.constraints.pattern = this.pattern;
		}
		
		this.constraints.fractional = this.fractional;
		
		if(!isNaN(this.decimalPlaces)){
			this.decimalPlaces = Number(this.decimalPlaces);
		}
		
		if (this.fractional && this.decimalPlaces > 0) {
			this.constraints.places = this.decimalPlaces;
		}
		
		this.bundle = new com.ibm.btt.util.I18nBundle("com.ibm.btt.dijit", "TextBox");
		
	},
	
	isNumber : function(value){
		return /^-?\d+(\.\d+)?$/.test(value);
	},
	
	validator : function(/* anything */value, /* dijit.form.ValidationTextBox.__Constraints */
			constraints) {
		
		var formattedValue;
		if(this.isNumber(value)){
			formattedValue = value;
		}
		else{
			formattedValue = this.parse(value, this.constraints);
			if (!this.isNumber(formattedValue) && value != "") {
				this.invalidMessage = this.bundle.getMessage("invalidMessage");
				return false;
			}else{
				if (new RegExp("^[+-]?\\d+$").test(formattedValue) && this.decimalPlaces > 0) {
					var con = {};
					con["max"] = this.constraints["max"];
					con["min"] = this.constraints["min"];
					con["places"] = this.constraints["places"];
					con["fractional"] = this.constraints["fractional"];
					con["locale"] = this.constraints["locale"];
					formattedValue += ".";
					for(var i=0;i<this.decimalPlaces;i++){
						formattedValue += "0";
					}
				}
			}
		}

		if (this.isNumber(formattedValue) && this.fractional && this.decimalPlaces>0 && !(new RegExp("^[+-]?.+[.,]\\d{" + this.decimalPlaces + "}$").test(value))){
			this.invalidMessage = this.bundle.getMessage("decimalPlacesMessage",{value : this.decimalPlaces});
			return false;
		}
		
		if (this.isNumber(formattedValue) && this.numberType == "byte" && (formattedValue > 127 || formattedValue < -128)) {
			this.invalidMessage = this.bundle.getMessage("intOutOfRange",{max:127,min:-128});
			return false;
		}
		if (this.isNumber(formattedValue) && this.numberType == "short" && (formattedValue > 32767 || formattedValue < -32768)) {
			this.invalidMessage = this.bundle.getMessage("intOutOfRange",{max:32767,min:-32768});
			return false;
		}
		if (this.isNumber(formattedValue) && this.numberType == "int" && (formattedValue > 2147483647
				|| formattedValue < -2147483648)) {
			this.invalidMessage = this.bundle.getMessage("intOutOfRange",{max:2147483647,min:-2147483648});
			return false;
		}
		if (this.isNumber(formattedValue) && this.numberType == "integer" && (formattedValue > 2147483647
				|| formattedValue < -2147483648)) {
			this.invalidMessage = this.bundle.getMessage("intOutOfRange",{max:2147483647,min:-2147483648});
			return false;
		}
		if (this.isNumber(formattedValue) && this.numberType == "long" && (formattedValue > 9223372036854775807
				|| formattedValue < -9223372036854775808)) {
			this.invalidMessage = this.bundle.getMessage("intOutOfRange",{max:9223372036854775807,min:-9223372036854775808});
			return false;
		}
		if (formattedValue.toString().replace(new RegExp(".", "g"), "").length > 16) {
			this.invalidMessage = this.bundle.getMessage("numberOutOfRange");
			return false;
		}
		return this.inherited(arguments);
	},
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setValueAttr: function(/*Number*/ value, /*Boolean?*/ priorityChange, /*String?*/formattedValue){
		if(typeof value === "string" && value !== "") {
			var tmpValue = Number(value);
			if(isNaN(tmpValue) && value && value != ""){
				var cons = {};
				if(this.constraints['pattern']){
					cons['pattern'] = this.constraints['pattern'];
				}
				value = this.parse(value, cons);
			} else {
				value = tmpValue;
			}
		}
		this.inherited(arguments);
	},
	
	create: function(/*Object?*/params, /*DomNode|String?*/srcNodeRef){
		
		this.inherited(arguments);
		
		var value = dojo.attr(srcNodeRef, 'value');
		
		if(value && value != ""){
			var cons = {};
			if(this.constraints['pattern']){
				cons['pattern'] = this.constraints['pattern'];
			}
			params.value = this.parse(value, cons);
			if(isNaN(params.value)){
				params.value = Number(value);
			}
			this.set('value', params.value);
		}
		
	},
	
	serialize: function(/*anything*/val, /*Object?*/options){
		return this.format(val, options);
	}
	
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.CurrencyTextBox"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.CurrencyTextBox"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.CurrencyTextBox");




dojo.declare("com.ibm.btt.dijit.CurrencyTextBox", [
		com.ibm.btt.dijit.NumberTextBox, dijit.form.CurrencyTextBox ], {
	
	decimalPlaces : 0,
	
	postMixInProperties : function(){
		this.inherited(arguments);
		this.decimalPlaces = this.constraints.places;
	},
	
	serialize: function(/*anything*/val, /*Object?*/options){
		return isNaN(val) ? "" : (val.toString ? val.toString() : "");
	}
	
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.DateTextBox"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.DateTextBox"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.DateTextBox");





dojo.declare("com.ibm.btt.dijit.DateTextBox", [com.ibm.btt.dijit.RangeBoundTextBox, dijit.form.DateTextBox], {

	maximumDate : "",

	minimumDate : "",

	locale : dojo.locale,

	pattern : "",
	
	postMixInProperties : function() {
		this.inherited(arguments);
		this.lang = this.locale;
		this.constraints.locale = this.locale;
		if (this.minimumDate != "") {
			if (this.isToday(this.minimumDate)) {
				this.constraints.min = this.parseToday(this.minimumDate);
			} else {
				this.constraints.min = dojo.date.stamp
						.fromISOString(this.minimumDate);
			}
		}
		if (this.maximumDate != "") {
			if (this.isToday(this.maximumDate)) {
				this.constraints.max = this.parseToday(this.maximumDate);
			} else {
				this.constraints.max = dojo.date.stamp
						.fromISOString(this.maximumDate);
			}
		}
		if (this.pattern != "") {
			this.constraints.datePattern = this.pattern;
		}
	},

	create: function(/*Object?*/params, /*DomNode|String?*/srcNodeRef){
		if(params.value==null){
			var dv = dojo.attr(srcNodeRef, "value") || srcNodeRef.value;
			if(dv!=null && dv!="" &&  params.pattern!=null && params.pattern!=""){
				try{
					var option = {
						selector:"date",
						datePattern:params.pattern,
						fullYear:true
					};
					var val = dojo.date.locale.parse(dv,option);
					params.value = val;
				}
				catch(e){
				}
			}
		}
		this.inherited(arguments);
	},
	
	serialize: function(/*anything*/val, /*Object?*/options){
		if (val.toGregorian) {
			val = val.toGregorian();
		}
		if (this.pattern != "") {
			return this.format(val, options);
		} else {
			return dojo.date.stamp.toISOString(val, options);
		}
	},
	
	isToday : function(value) {
		if (value.replace(" ", "").toLowerCase().indexOf("today") > -1) {
			return true;
		} else {
			return false;
		}
	},

	parseToday : function(value) {
		var srcValue = value.replace("today", "");
		var type = "";
		var year = 0;
		var month = 0;
		var day = 0;
		var rightNow = new Date();
		rightNow.setHours(0);
		rightNow.setMinutes(0);
		rightNow.setSeconds(0);
		rightNow.setMilliseconds(0);
		if (srcValue.indexOf("+") > -1) {
			type = "plus";
			srcValue = srcValue.replace("+", "#");
		}
		if (srcValue.indexOf("-") > -1) {
			type = "sub";
			srcValue = srcValue.replace("-", "#");
		}
		if (srcValue.indexOf("y") > -1) {
			year = srcValue.substring(srcValue.lastIndexOf("#") + 1, srcValue
					.indexOf("y"));
			srcValue = srcValue.replace("y", "#");
		}
		if (srcValue.indexOf("m") > -1) {
			month = srcValue.substring(srcValue.lastIndexOf("#") + 1, srcValue
					.indexOf("m"));
			srcValue = srcValue.replace("m", "#");
		}
		if (srcValue.indexOf("d") > -1) {
			day = srcValue.substring(srcValue.lastIndexOf("#") + 1, srcValue
					.indexOf("d"));
		}
		if ("plus" == type) {
			rightNow = dojo.date.add(rightNow, "year", +year);
			rightNow = dojo.date.add(rightNow, "month", +month);
			rightNow = dojo.date.add(rightNow, "day", +day);
		} else {
			rightNow = dojo.date.add(rightNow, "year", -year);
			rightNow = dojo.date.add(rightNow, "month", -month);
			rightNow = dojo.date.add(rightNow, "day", -day);
		}
		return rightNow;
	},
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setValueAttr: function(/*Date*/ value, /*Boolean?*/ priorityChange, /*String?*/ formattedValue){
		
		if (typeof (value) == "string" || value instanceof String) {
			var val = null;
			if (this.pattern == "") {
				value = dojo.date.stamp.fromISOString(value);
			} else {
				var option = {
					selector : "date",
					datePattern : this.pattern,
					fullYear : true
				};
				value = dojo.date.locale.parse(value, option);
			}
		}

		this.inherited(arguments);

	},
	
	_getValueAttr : function(){
		if(this.textbox.value == ""){
			return null;
		} else {
			return this.inherited(arguments);
		}
	},
	
	_handleOnChange: function(newValue, priorityChange){
		if(this._lastValueReported == undefined && (priorityChange === null || !this._onChangeActive)){
			this._resetValue = this._lastValueReported = newValue;
		}
		
		this._pendingOnChange = this._pendingOnChange
		|| (typeof newValue != typeof this._lastValueReported) || (this._lastValueReported != null && newValue == null) || (this._lastValueReported == null && newValue != null);

		var compare = this.compare(newValue, this._lastValueReported) != 0;
		if(newValue == null && null == this._lastValueReported){
			compare = false;
		}
		this._pendingOnChange = this._pendingOnChange || compare;
		
		
		if((this.intermediateChanges || priorityChange || priorityChange === undefined) && this._pendingOnChange){
			this._lastValueReported = newValue;
			this._pendingOnChange = false;
			if(this._onChangeActive){
				if(this._onChangeHandle){
					clearTimeout(this._onChangeHandle);
				}
				this._onChangeHandle = setTimeout(dojo.hitch(this,
					function(){
						this._onChangeHandle = null;
						this.onChange(newValue);
					}), 0);
			}
		}
	}
});

}

if(!dojo._hasResource["com.ibm.btt.util.AjaxUtil"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.util.AjaxUtil"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.util.AjaxUtil");

(function(){
	
	AjaxUtil = {
		
		ajaxOperationUrl : "Ajax",
		
		constants : {
			"BTT_OPERATIONNAME" : "dse_operationName", 
			"BTT_PAGEID" : "dse_pageId", 
			"BTT_SESSIONID" : "dse_sessionId", 
			"BTT_ERRORPAGE" : "dse_errorPage", 
			"BTT_PROCESSORID" : "dse_processorId",
			"BTT_TIMEZONE" : "dse_timezone",
			"BTT_AJAXINPUTMAP" : "dse_ajaxInputMapping",
			"BTT_AJAXOUTPUTMAP": "dse_ajaxOutputMapping",
			"BTT_SUBMITFORMID" : "dse_submitFormId"
		},
		
		xhrPost : function(request, data) {
			
			request.postData = dojo.toJson(data);
			
			if (typeof request.url == 'undefined') {
				request.url = this.ajaxOperationUrl;
			}
			if (typeof request.handleAs == 'undefined') {
				request.handleAs = "text";
			}
			if (typeof request.success == 'undefined') {
				request.load = function(e) {
					console.info("Ajax request response from ajax channel. " + e);
				};
			} else {
				request.load = request.success;
				delete request.success;
			}
			if (typeof request.error == 'undefined') {
				request.error = function(e) {
					console.info("Ajax request error. " + e);
				};
			}
			dojo.xhrPost(request);
		},
		
		getTimzone : function(){
			var d = new Date();
			return  (-d.getTimezoneOffset() / 60).toString();
		},
		
		prepareBTTParams : function(params){
			var obj = {};
			if (params != undefined) {
				if (params[this.constants.BTT_ERRORPAGE]) {
					obj[this.constants.BTT_ERRORPAGE] = params[this.constants.BTT_ERRORPAGE];
				}
				if (params[this.constants.BTT_OPERATIONNAME]) {
					obj[this.constants.BTT_OPERATIONNAME] = params[this.constants.BTT_OPERATIONNAME];
				}
				if (params[this.constants.BTT_PAGEID]) {
					obj[this.constants.BTT_PAGEID] = params[this.constants.BTT_PAGEID];
				} else {
					obj[this.constants.BTT_PAGEID] = '-1';
				}
				if (params[this.constants.BTT_PROCESSORID]) {
					obj[this.constants.BTT_PROCESSORID] = params[this.constants.BTT_PROCESSORID];
				}
				if (params[this.constants.BTT_SESSIONID]) {
					obj[this.constants.BTT_SESSIONID] = params[this.constants.BTT_SESSIONID];
				}
				if (params[this.constants.BTT_TIMEZONE]) {
					obj[this.constants.BTT_TIMEZONE] = params[this.constants.BTT_TIMEZONE];
				} else {
					obj[this.constants.BTT_TIMEZONE] = AjaxUtil.getTimzone();
				}
				//G025
				if (params[this.constants.BTT_AJAXINPUTMAP])
					obj[this.constants.BTT_AJAXINPUTMAP] = params[this.constants.BTT_AJAXINPUTMAP];
				if (params[this.constants.BTT_AJAXOUTPUTMAP])
					obj[this.constants.BTT_AJAXOUTPUTMAP] = params[this.constants.BTT_AJAXOUTPUTMAP];
			}
			return obj;
		}
		
	};
	
})();

}

if(!dojo._hasResource["com.ibm.btt.dijit.AbstractAjaxMixin"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.AbstractAjaxMixin"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2011 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.AbstractAjaxMixin"); 


dojo.declare("com.ibm.btt.dijit.AbstractAjaxMixin", null,{
	
	/**
	 * nls bundle
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_bundle : new com.ibm.btt.util.I18nBundle("com.ibm.btt.dijit", "Form"),
	
	/**
	 * BTT channel property, contains the parameters required by the BTT HTML channel.
	 */
	bttParams : "",
	
	/**
	 * The async code is used to identity the Ajax calling. It is a random string input by the developers on the tooling.
	 * 
	 */
	asyncCode : '',
	
	/**
	 * HTML status of the Ajax calling.
	 * 
	 */
	asyncStatus : 0,
	
	/**
	 * XHR error message from the browser.
	 * 
	 */
	asyncErrorMessage :"",
	
	/**
	 * Operation name defined on the server
	 * 
	 */
	asyncOperation : "",
	
	/**
	 * Constants used in the BTT channel.
	 * 
	 */
	
	
	/**
	 * Ajax calling function. 
	 * 
	 * @tag	public
	 * 
	 * @param bttOperationId String variable: BTT operation ID
	 * @param asyncCode String variable: random code for XHR
	 * @param timeout Integer variable: milliseconds for timeout
	 * @param respsContainer the response container id which the response data will be set to
	 */
	callAsyncOperation : function(bttOperationId, asyncCode, timeout, showCover, respsContainer) {
 
		var formValues = this.get("value");
		var bttParam = {};
		if(this.bttParams){
			bttParam = dojo.fromJson(this.bttParams);
		}
		 
		bttParam[AjaxUtil.constants.BTT_OPERATIONNAME] = bttOperationId;
		bttParam = AjaxUtil.prepareBTTParams(bttParam);
		
		

		if (showCover === true || showCover === "true") {
			ScreenCover.getInstance().show();
		}
		
		AjaxUtil.xhrPost({
			success : dojo.hitch(this, "_handleOperationResponse", asyncCode, respsContainer),
			error : dojo.hitch(this, "_handleOperationError", asyncCode),
			'timeout' : timeout
		}, dojo.mixin(formValues, bttParam));
		
	},
	
	//G025
	callAsyncOpWithMapping  : function(bttOperationId, asyncCode, timeout, inputMapping, outputMapping, showCover, respsContainer) {
		 
		var formValues = this.get("value");
		var bttParam = {};
		if(this.bttParams){
			bttParam = dojo.fromJson(this.bttParams);
		}
		 
		bttParam[AjaxUtil.constants.BTT_OPERATIONNAME] = bttOperationId;
		
		bttParam[AjaxUtil.constants.BTT_AJAXINPUTMAP]=inputMapping;
		bttParam[AjaxUtil.constants.BTT_AJAXOUTPUTMAP]=outputMapping;
		 
		bttParam = AjaxUtil.prepareBTTParams(bttParam);
		
		if (showCover === true || showCover === "true") {
			ScreenCover.getInstance().show();
		}
		
		AjaxUtil.xhrPost({
			success : dojo.hitch(this, "_handleOperationResponse", asyncCode, respsContainer),
			error : dojo.hitch(this, "_handleOperationError", asyncCode),
			'timeout' : timeout
		}, dojo.mixin(formValues, bttParam));
		
	},
	
	/**
	 * Handler for successful response of XHR.
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 *              
	 * @param asyncCode random code for XHR to identify different request
	 * @param respsContainer the response container id which the response data will be set to
	 * @param responseData response data returned from server
	 */
	_handleOperationResponse : function(asyncCode, respsContainer, responseData) {
		
		try {
			var resData = dojo.fromJson(responseData || null);
			responseData = resData;
		} catch(e) {
			this._handleHTMLResponse(responseData);
			return ;
		}
		this.asyncCode = asyncCode;
		var values = null;
		var singleFieldErrors = null;
		var crossFieldErrors = null;
		if(dojo.isArray(responseData)) {
			values = responseData[0].data;
			if(responseData[0].validationError) {
				singleFieldErrors = responseData[0].singleFieldErrors;
				crossFieldErrors = responseData[0].crossFieldErrors;
			}
		} else {
			values = responseData;
		}
		if(values) {
			if(respsContainer && dijit.byId(respsContainer)){
				dijit.byId(respsContainer).set('value', values);
			}else{
				this.set('value', values);
			}
		}
		if((singleFieldErrors && singleFieldErrors.length != 0)|| (crossFieldErrors && crossFieldErrors.length != 0)) {
			var wgtMap = this._getWidgetMap();
			this._handleSingleFieldErrors(singleFieldErrors, wgtMap);
			this._handleCrossFieldErrors(crossFieldErrors, wgtMap);
		}
		
		ScreenCover.getInstance().hide();
		
		this.onAsyncOK();
		
	},	
	
	/**
	 * handle plain html response of XHR
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleHTMLResponse : function(htmlText) {
		(new dijit.Dialog({
            title: this._bundle.getMessage("errorDialogTitle"),
            content : htmlText
        })).show();
	},
	
	/**
	 * get all descendant widgets under this container
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getWidgetMap : function() {
		var map = { };
		dojo.forEach(this.getDescendants(), function(widget){
			if(!widget.name){ return; }
			var entry = map[widget.name] || (map[widget.name] = [] );
			entry.push(widget);
		});
		return map;
	},
	
	/**
	 * Handle the single field error messages from the server side.
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleSingleFieldErrors : function(singleFieldErrors, widgetMap) {
		if(singleFieldErrors != null) {
			for(var i = 0; i < singleFieldErrors.length; i++) {
				if(widgetMap[singleFieldErrors[i].id]) {
					var entry = widgetMap[singleFieldErrors[i].id];
					if(entry){
						for(var j = 0; j < entry.length; j++) {
							if(entry[j].showErrorMessage) { 
								entry[j].showErrorMessage(singleFieldErrors[i].msg);
							}
						}
					}
				}
			}
		}
	},
	
	/**
	 * Handle the cross field error messages from the server side.
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleCrossFieldErrors : function(crossFieldErrors, widgetMap) {
		if(crossFieldErrors != null) {
			var entry = widgetMap["dse_errorMessages"];
			if(entry) {
				for(var j = 0; j < entry.length; j++) {
					entry[j].displayMessageArray(crossFieldErrors);
				}
			}	
		}
	},
	
	/**
	 * Set the data to the corresponding store on the web page.
	 * 
	 */
	setStoreData : function(obj) {

		var map = { };
		dojo.forEach(this.getDescendants(), function(widget){
			if(!widget.name){ return; }
			var entry = map[widget.name] || (map[widget.name] = [] );
			entry.push(widget);
		});

		for(var name in map){
			if(!map.hasOwnProperty(name)){
				continue;
			}
			var widgets = map[name],						// array of widgets w/this name
				storeDatas = dojo.getObject(name, false, obj);	// list of values for those widgets

			if(storeDatas === undefined){
				continue;
			}
			if(!dojo.isArray(storeDatas)){
				storeDatas = [ storeDatas ];
			}

			dojo.forEach(widgets, function(w, i){
				if(w.setStoreData) {
					w.setStoreData(storeDatas[i]);
				}
			});
		}
		
	},
	
	/**
	 * Handler for error in the process of XHR
	 *  
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleOperationError : function(asyncCode, error) {
		
		if(error.dojoType === "timeout") {
			this.asyncCode  = asyncCode;
			this.asyncStatus  = 0;
			this.asyncErrorMessage  = error.message;
			this.onAsyncTimeOut();
			
		} else if(error.status !== undefined) {
			this.asyncCode  = asyncCode;
			this.asyncStatus  = error.status;
			this.asyncErrorMessage  = error.message;
			this.onAsyncError();
		}
		
		ScreenCover.getInstance().hide();
		
	},
   
	
	/**
	 * Function used to publish Ajax timeout event.
	 */	
	onAsyncTimeOut : function() {
		
	},
	
	/**
	 * Function used to publish Ajax successful event.
	 */
	onAsyncOK : function() {
		
	},

	/**
	 * Function used to pubish Ajax error event.
	 * 
	 */
	onAsyncError : function() {
		
	},
	
	
	/**
	 * Get values from the widgets on the page.
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getValueAttr: function(){

		var obj = { };
		var scope = this;
		dojo.forEach(this.getDescendants(), function(widget){
			var name = widget.name;
			
			//Modify to filter the value of label and anchor
			if((!name || (widget.disabled && !(widget instanceof com.ibm.btt.dijit.RichTextEditor)) || widget.isNotSubmitted) && (!widget.storeDataName || !widget.getEditableStroeData || ( ( widget instanceof com.ibm.btt.dijit.Grid) &&  widget.readOnly))){ return; }
			
			if(typeof(widget.ajaxSubmit)!="undefined" && widget.ajaxSubmit==false){ return; }
			
			if(widget.storeDataName && widget.getEditableStroeData && ( (widget instanceof com.ibm.btt.dijit.Grid) && widget.editable && !widget.readOnly) && widget.getEditableStroeData()) {
				dojo.setObject(widget.storeDataName, scope._convertValueToString(widget.getEditableStroeData()), obj);
			}
			// Single value widget (checkbox, radio, or plain <input> type widget
			var value = widget.get('value');

			//if(value == undefined || value == null){ return ; }
			if(value === undefined){ return ; }

			if ((widget instanceof com.ibm.btt.dijit.Grid) && (value == null || value == undefined)) {
				return;
			}
			if ((widget instanceof com.ibm.btt.dijit.Grid) && value != null && value != undefined) {
				if (!widget.launchNew) 
					name="dse_tableSelectedRows"; 
				widget.launchNew=false;
			}	
			
			if(value == null){
				value = "";
			}
			
			// Store widget's value(s) as a scalar, except for checkboxes which are automatically arrays
			if(typeof widget.checked !== 'undefined'){
				if(/Radio/.test(widget.declaredClass)){
					// radio button
					if(value !== false){
						dojo.setObject(name, scope._convertValueToString(value), obj);
					}else{
						// give radio widgets a default of null
						value = dojo.getObject(name, false, obj);
						if(value === undefined){
							dojo.setObject(name, null, obj);
						}
					}
					
				}else{
					// checkbox/toggle button
					if(value !== false){
						dojo.setObject(name, scope._convertValueToString(value), obj);
					}					
				}
			}else{
				
				if (typeof value == "number" && widget.serialize) {
					value = widget.serialize(value, widget.constraints);
				} else if(value != null &&  value instanceof Date) {
					if(widget.serialize) {
						value = widget.serialize(value, widget.constraints);
					} else {
						value = value.getFullYear() + "-" + (value.getMonth() + 1)+ "-" + value.getDate();
					}
				}
				
				value = scope._convertValueToString(value);
				var prev = dojo.getObject(name, false, obj);
				if(typeof prev != "undefined"){
					if(dojo.isArray(prev)){
						prev.push(value);
					}else{
						dojo.setObject(name, [prev, value], obj);
					}
				}else{
					// unique name
					dojo.setObject(name, value, obj);
				}
			}
		});

		for(var p in obj){
			if (obj.hasOwnProperty(p)){
				if(p.indexOf("REMOVEBEFORESUBMIT_") >= 0){
					delete obj[p];
				}
			}
	    }
		
		return obj;
	},	
	
	/**
	 * convert a object type value to string value
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_convertValueToString : function(vobj) {
		
		if(vobj === null) {
			return null;
		} 
		if(typeof vobj === "string") {
			return vobj;
		} else if(typeof vobj === "number" || typeof vobj === "boolean") {
			return String(vobj);
		} else if(typeof vobj === "object") {
			if(dojo.isArray(vobj)) {
				for(var i = 0; i < vobj.length; i++) {
					vobj[i] = arguments.callee(vobj[i]);
				}
			} else {
				for(var p in vobj) {
					if(p.indexOf("_") != 0){
						vobj[p] = arguments.callee(vobj[p]);
					}
				}
			}
			return vobj;
		} else {
			return null;
		}
		
	},
	
	/**
	 * Set values to the widgets on the page.
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setValueAttr: function(/*object*/obj){
		// summary:
		//		Fill in form values from according to an Object (in the format returned by attr('value'))

		// generate map from name --> [list of widgets with that name]
		var map = { };
		var storeMap = {};
		dojo.forEach(this.getDescendants(), function(widget){
			if(widget.storeDataName) {
				var storeEntry = storeMap[widget.storeDataName] || (storeMap[widget.storeDataName] = [] );
				storeEntry.push(widget);
			}
			if(!widget.name){ return; }
			var entry = map[widget.name] || (map[widget.name] = [] );
			entry.push(widget);
		});

		for(var name in storeMap) {
			var widgets = storeMap[name];
			var storeData = dojo.getObject(name, false, obj);
			if(storeData !== undefined) {
				dojo.forEach(widgets, function(w, i){
					w.setStoreData(i == 0 ? storeData : dojo.clone(storeData));
				});
			}
		}
		
		for(var name in map){
			if(!map.hasOwnProperty(name)){
				continue;
			}
			
			var widgets = map[name],						// array of widgets w/this name
				values = dojo.getObject(name, false, obj);	// list of values for those widgets
			
			if(values === undefined){
				continue;
			}
			
			if(!dojo.isArray(values)){
				values = [ values ];
			}			
			
			if(typeof widgets[0].checked !== 'undefined'){
				// for checkbox/radio, values is a list of which widgets should be checked
				dojo.forEach(widgets, function(w, i){
					w.set('value', dojo.indexOf(values, w.value) != -1);
				});
			}else if(widgets[0].multiple){
				// it takes an array (e.g. multi-select)
				widgets[0].set('value', values);
			}else{
				// otherwise, values is a list of values to be assigned sequentially to each widget
				dojo.forEach(widgets, function(w, i){
					w.set('value', values[i]);
				});
			}
		}

	},
	
	
	validValue : null,
	
	/**
	 * Get values from the widgets on the page.
	 *
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * 
	 * @return This method only return the widget value which is valid and not change compared with the initial value.
	 * 
	 * */
	_getValidValueAttr: function(){

		var obj = { };
		var scope = this;
		dojo.forEach(this.getDescendants(), function(widget){
			var name = widget.name;
			
			//Modify to filter the value of label and anchor
			if((!name || widget.disabled || widget.isNotSubmitted) && (!widget.storeDataName || !widget.getEditableStroeData || ( ( widget instanceof com.ibm.btt.dijit.Grid) &&  widget.readOnly && !widget.disabled))){ return; }
			
			//BP32964
			if(!widget.isErasable || !widget.isErasable())
			{
				if(widget.state && !(widget.get("state") == "" || widget.get("state") == "Normal")){return;}
			}
			
			if(typeof(widget.ajaxSubmit)!="undefined" && widget.ajaxSubmit==false){ return; }
			
			if(widget.storeDataName && widget.getEditableStroeData && ( (widget instanceof com.ibm.btt.dijit.Grid) && !widget.readOnly)) {
				var tmpData = widget.getEditableStroeData();
				if(tmpData){
					dojo.setObject(widget.storeDataName, scope._convertValueToString(tmpData), obj);
				}
			}
			// Single value widget (checkbox, radio, or plain <input> type widget
			var value = widget.get('value');

			//if(value == undefined || value == null){ return ; }
			if(value === undefined){ return ; }
			
			if ((widget instanceof com.ibm.btt.dijit.Grid) && value != null && value != undefined) {
				if (!widget.launchNew) 
					name="dse_tableSelectedRows"; 
				widget.launchNew=false;
			}	
			
			if(value == null){
				value = "";
			}
			
			// Store widget's value(s) as a scalar, except for checkboxes which are automatically arrays
			if(typeof widget.checked !== 'undefined'){
				if(/Radio/.test(widget.declaredClass)){
					// radio button
					if(value !== false){
						dojo.setObject(name, scope._convertValueToString(value), obj);
					}else{
						// give radio widgets a default of null
						value = dojo.getObject(name, false, obj);
						if(value === undefined){
							dojo.setObject(name, null, obj);
						}
					}
					
				}else{
					// checkbox/toggle button
					if(value !== false){
						dojo.setObject(name, scope._convertValueToString(value), obj);
					}					
				}
			}else{
				
				if (typeof value == "number" && widget.serialize) {
					value = widget.serialize(value, widget.constraints);
				} else if (value != null &&  value instanceof Date) {
					if(widget.serialize) {
						value = widget.serialize(value, widget.constraints);
					} else {
						value = value.getFullYear() + "-" + (value.getMonth() + 1)+ "-" + value.getDate();
					}
				}
				
				value = scope._convertValueToString(value);
				
				if (widget.type !== "hidden" && (
						(widget.params.value && widget.params.value == value) || 
								(!widget.params.value && "" == value))) {
					return;
				}
				
				var prev = dojo.getObject(name, false, obj);
				if(typeof prev != "undefined"){
					if(dojo.isArray(prev)){
						prev.push(value);
					}else{
						dojo.setObject(name, [prev, value], obj);
					}
				}else{
					// unique name
					dojo.setObject(name, value, obj);
				}
			}
		});
		
		for(var p in obj){
			if (obj.hasOwnProperty(p)){
				if(p.indexOf("REMOVEBEFORESUBMIT_") >= 0){
					delete obj[p];
				}
			}
	    }

		return obj;
	}
	
}); 
	

}

if(!dojo._hasResource["com.ibm.btt.dijit._FormXValidationMixin"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit._FormXValidationMixin"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2011 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit._FormXValidationMixin"); 

dojo.declare("com.ibm.btt.dijit._FormXValidationMixin", null,{
	// summary:
	//		Mixin for BTT form widget
	// description:
	//		Validate form according to cross fields validation rules	
	
	//xValidations: Collection?
	//				List of xValidation rules
	xValidations : [],
	
	//xValid: boolean?
	//				Indidates if form is valid according to xValidation rules
	xValid : true,
	
	//_xHintWidget: dijit._widget?
	//				The widget where xvalidation message to be shown around
	
	_xHintWidget : null,
	
	//return value of property by given id
	idxPostfix : null,
	
	getPW : function(id, property) {
//		var value=dijit.byId(id).get(property);
//		return value;
		
		var obj = dijit.byId(id);
		if (!obj) {
			console.error("xValitate: Failed to get property[" + property + "] because cannot find the widget[id=" + id + "]");
			return undefined;
		}
		
		return obj.get(property);
	},
	
	//return widget by given id
	getW : function(id) {
		return dijit.byId(id);
	},
	
	//invoke function of widget by given id
	runWF: function(id, functionName, parameter){
		var targetObj = dijit.byId(id);
		if (!targetObj) {
			console.error("xValitate: Failed to run function[" + functionName + "] because cannot find the widget[id=" + id + "]");
			return undefined;
		}
		var args = [];
		for ( var i = 2; i < arguments.length; i++) {
			args[i - 2] = arguments[i];
		}

		var result = undefined;
		try{
			result = targetObj[functionName].apply(targetObj, args);
		}catch(e){
			console.error("xValitate: An error occured while running function[" + functionName + "]. " + e.toString());
		}

		return result;
	},
	
	//Do xValidation and return the hint message for the hint message for the first invalid rule
	xValidate: function( xRules){
		if(!xRules || xRules.length == 0){
			return "";
		}
		var inValidRule = null;
		for(var i=0; i<xRules.length; i++){
			if(!xRules[i].cond.call(this)){
				inValidRule = xRules[i];
				break;
			}
		}
		return inValidRule;
	},
	
	/**
	 *summary: conditions of an active xValidation for widget
	 *			1. xValidation contains the widget
	 *			2. all values of widgets in xValidation are not null
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getActiveXValidationsForWidget: function(/*String*/ widgetId){	
		return this._getActiveXValidations(this._getXValidationRuleByWidget(widgetId),widgetId);	
	},
	
	
	
	/**
	 * 
	 * @return xvalidation rules in which all values of widget are not null
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getActiveXValidations: function(rules,widgetId){
		return dojo.filter(rules,function(xValidation){
			return dojo.every(xValidation.widgets,function(id){				
				return ((id == widgetId) || (id != widgetId && dijit.byId(id).get("value") != ""));
			});
		});			
	},
	
	/**
	 * 
	 * @return return xValidations which contain the widget
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getXValidationRuleByWidget: function(/*String*/ widgetId){
		var rules = dojo.filter(this.xValidations,function(xValidation){
			return dojo.indexOf(xValidation.widgets,widgetId)>=0;

		});		
		return rules;
	},
	
	//show hint message around widget
	showXValidationMsg : function(/*String*/ hintMsg, widget){
		if(widget){
			this._hideXHint();
			this._xHintWidget = widget;
			dijit.showTooltip(this.getI18NString(hintMsg), widget.domNode);
		}
	},
	
	/**
	 * 
	 * hide current hint message
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_hideXHint : function(){
		if(this._xHintWidget){
			dijit.hideTooltip(this._xHintWidget.domNode);
			this._xHintWidget = null;
		}
	},
	
	destroy : function(){
		/*
		 * When destroy the form, the tooltips may still be there event the page is
		 * disposed in ajax mode, need check and close all tooltips when form is disposed
		 * */
		this._hideXHint();
		this.inherited(arguments);
	}
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.Form"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.Form"] = true;
  /*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Form");








/**
 * Declare a widget to wrap the HTML form and provide the Ajax Calling function.
 * 
 * Basic Function:
 * 		1. The form widget is used to submit the values of input widgets on the BTT Web2.0 web page.
 *      2. The form widget can invoke the validations of the input widgets on the browser side automatically before submitting.
 *      3. The form widget provides the Ajax calling function to submit all the values of input widgets on the page through XHR.
 *      
 * Implemented based on dijit.form.Form.
 */
dojo.declare("com.ibm.btt.dijit.Form", [ dijit.form.Form,
                                         com.ibm.btt.dijit.AbstractWidgetMixin,
                                         com.ibm.btt.dijit.AbstractAjaxMixin,
                                         com.ibm.btt.dijit._FormXValidationMixin], {
	
	bttErrorPage : "",
	
	/**
	 * This property indicates whether the form will invoke the validation of the input widgets in it.
	 * 
	 */
	validateOnSubmit : true,
	
	hiddenParamHandle : {},
	
	_isStarted : false,
	
	bttAction : "",
	
	_events : [],
	
	_clickedButton : null,
	
	attributeMap: dojo.delegate(dijit.form.Form.prototype.attributeMap, {
		
//		visibility : {
//			node : "domNode"
//		}
	
	}),

	create : function() {
		this.submitButton = new Array();
		this.submitButtonOS = new Array();
		this.inherited(arguments);
		
		this._events = [];
		this._events.push(dojo.connect(this.domNode, "onkeydown", this, "_onKey"));
		if (this._fastTab){
			this._events.push(dojo.connect(this.domNode, "onkeyup", this, "_focusNext"));
		}
	},
	
	onLoaded : function(){
		/* a Form event to bind ECA rules when page reloading */
	},
	
	onFormSubmit: function(){
		
	},


	/**
	 * 
	 * hook method for xValidation attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setXValidationsAttr: function(value){
		this.xValidations = value;
		//update xValid
		if(this.xValidate(this.xValidations)){
			this.xValid = false;
			this.setSubmitButtonState();
		}			
	},
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_xValidateByWidget : function(widget){
		//1. show xValidation hint if there is inValid rule
		//2. update xValid & submitButton
		var widgetInvalidRule = this.xValidate(this._getActiveXValidationsForWidget(widget.get("id")));
		var hintWidget = widget;
		if(!widgetInvalidRule){
			widgetInvalidRule = this.xValidate(this._getActiveXValidations(this.xValidations));
			hintWidget = widgetInvalidRule ? dijit.byId(widgetInvalidRule.widgets[0]) : widget;
		}
		if(widgetInvalidRule){
			this.showXValidationMsg(widgetInvalidRule.hint,hintWidget);
		}
		
		//update submit button
		var invalidRule;
		if(invalidRule = this.xValidate(this.xValidations)){
			if(!widgetInvalidRule){//in case hint message was not shown
				this.showXValidationMsg(invalidRule.hint,dijit.byId(invalidRule.widgets[0]));
			}
			this.xValid = false;
		}
		else{
			this.xValid = true;
			this._hideXHint();
		}
		this.setSubmitButtonState();		
	},
	
	fireWidgetBlurEvent : function(widget){
		this._xValidateByWidget(widget);
	},
	
	fireWidgetChangeEvent : function(widget){
		this._xValidateByWidget(widget);
		this.onWidgetChange();
	},
	
	//publish onWidgetChange event
	onWidgetChange : function(){
	},
	
	
	//override
	connectChildren: function(/*Boolean*/ inStartup){
		this.inherited(arguments);		
		var conns = this._childConnections; 
		var _this = this;
		var formDescendants = this.getDescendants();
		dojo.forEach(dojo.filter(formDescendants, function(item){ return item.onChange; } ),
				function(widget){
					conns.push(_this.connect(widget, "onChange", dojo.hitch(_this, "fireWidgetChangeEvent", widget)));
					conns.push(_this.connect(widget, "onBlur", dojo.hitch(_this, "fireWidgetBlurEvent", widget)));
				}
		);
	},
	
	/**
	 * 
	 * try to validate form and set the button status and error message
	 * when the status of any widget under this form changed
	 * 
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onWidgetValidateStatesChange : function(widget) {
		if(this.isValid() && !this.xValid){
			if((inValidRule = this.xValidate(this.xValidations))){
				this.xValid = false;
				this.showXValidationMsg(inValidRule.hint,dijit.byId(inValidRule.widgets[0]));
			}
			else{
				this.xValid = true;	
				this._hideXHint();
			}
		}
		this.setSubmitButtonState();
	},
	
	onSubmit : function(e){
			
		var button = this._querySubmitButton(e);
		if (button && button.bttParams) {
			this.handleButtonSubmit(button);
		} else {
			this.parameterHandler(this.bttParams);
		}
		
		if(this.validateOnSubmit) {
			if(!this.isValid() || !this.xValid) return false;
		}
		
		dojo.forEach(this.getDescendants(), function(widget){
			if(widget.onFormSubmit) {
				widget.onFormSubmit();
			}
		});		
		
		if (this.onFormSubmit) {
			this.onFormSubmit();
		}
		return true;
		
	},
	
	/**
	 * 
	 * get the submit button which is clicked to trigger form submit evnet
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_querySubmitButton : function(e){
		if(this._lastClickedButton){
			return this._lastClickedButton;
		}
	},
	
	/**
	 * 
	 * This method is used to set the disabled states for submit buttons
	 * depending on the validation result in the form. If there were any 
	 * validation error, all submit buttons will be disabled. After all fields
	 * in this form passed all validation rules, submit buttons may be enabled
	 * if it is not disabled by customer.
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	setSubmitButtonState : function() {
		if(this.validateOnSubmit){
			//Normal, Incomplete, or Error
			if ((this.get("state") == "" || this.get("state") == "Normal") && this.xValid) {
				for ( var i = 0; i < this.submitButton.length; i++) {
					var btn = this.submitButton[i];
					btn.set('disabled', btn.get("inValid"));
				}
			} else {
				for ( var i = 0; i < this.submitButton.length; i++) {
					this.submitButton[i].set('disabled', true);
				}
			}
		}
	},
	
	/**
	 * 
	 * Handler method for click the submit button, add 
	 * all btt required parameters into the form
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	handleButtonSubmit : function(button) {
		if (button && button.bttParams && button.bttParams != "") {
			this.parameterHandler(button.bttParams);
		}
	},
	
	
	startup : function() {
		if(this._isStarted)	return;
		this._isStarted = true;
		this.inherited(arguments);
		var _this = this;
		var watches = this._childWatches;
		var conns = this._childConnections; 
		dojo.forEach(dojo.filter(this.getDescendants(), function(item) {
			return  item.get('type') && item.get('type').toLowerCase() == "submit" ;
		}), function(widget) {
			_this.submitButton.push(widget);
			_this.submitButtonOS.push(widget.get("disabled"));
			watches.push(widget.watch("isValid", function(widget, oldVal, newVal){
				_this.setSubmitButtonState();
			}));
		});
		if (this.bttParams != null && this.bttParams != "") {
			this.parameterHandler(this.bttParams);
		}
		
		if(this.bttErrorPage != null && this.bttErrorPage != "") {
			this.errorPageHandler();
		}
		
		this.watch("state", this._onWidgetValidateStatesChange);
		/* as maybe some widgets are filled with default values. 
		 * Fire this event, so Beta can do something using ECA*/
		this.onWidgetChange(); 
		
		this.setSubmitButtonState();
	},
	
	/**
	 * 
	 * this method is used to add all btt required parameters under this form
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	parameterHandler : function(e) {
		var params = typeof e == "string" ? dojo.fromJson(e) : e;
		params[AjaxUtil.constants.BTT_TIMEZONE] = AjaxUtil.getTimzone();
		if(params['dse_nextEventName']) {
			var temp = {};
			temp[AjaxUtil.constants.BTT_SUBMITFORMID] = this.get("id");
			params = dojo.mixin(temp, params);
		}
		this.destroyHiddenParams();
		for ( var paramName in params) {
			if (typeof (paramName) != "undefined") {
				var paramValue = params[paramName];
				this.hiddenParamHandle[paramName] = dojo.create("input", {
					type : 'hidden',
					name : paramName,
					value : paramValue
				});
				dojo.place(this.hiddenParamHandle[paramName],
						this.containerNode, "last");
			}
		}
	},
	
	/**
	 * 
	 * destroy all hidden btt required parameters underthis form
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	destroyHiddenParams : function(){
		for(var paramName in this.hiddenParamHandle){
			dojo.destroy(this.hiddenParamHandle[paramName]);
		}
		this.hiddenParamHandle = {};
	},
	
	/**
	 * 
	 * Add error page parameter under form as a hidden file, it will be submitted to server
	 * together with all other parameters and data
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	errorPageHandler : function() {
		var node = dojo.create("input", {
			type : 'hidden',
			name : AjaxUtil.constants["BTT_ERRORPAGE"],
			value : this.bttErrorPage
		});
		dojo.place(node, this.containerNode, "last");
	},
	
	_findWidgetByNode : function(anode){
		var widget;
		for (var node=anode; node && node!=this.domNode; node=node.parentNode)
		{
			var id = node.getAttribute("widgetId");
			if (id)
			{
				widget = dijit.byId(id);
				break;
			}
		}
		return widget;
	},
	
	/**
	 * 
	 * monitor the key press event to submit the form when user click enter on the form
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onKey: function(/*Event*/ evt){
		//listen the onkey event on the domNode to monitor the Enter key event
		//If user press Enter on the widget which inside the form
		//We will test the form node to see whether it is active or not,
		//if this form is inactive(no bttParams) we will terminate the submit
		this._clickedButton = null;
		if(evt.keyCode != dojo.keys.ENTER) return evt.keyCode;

		// find the src widget
		var widget = this._findWidgetByNode(evt.target);
		
		if (widget
				&& !widget.isInstanceOf(com.ibm.btt.dijit.Button)
				&& !widget.isInstanceOf(com.ibm.btt.dijit.Anchor)
				&& !widget.isInstanceOf(com.ibm.btt.dijit.TextArea)) {
			if((evt.ctrlKey || evt.metaKey) && this.bttAction != "NoAction") {
				dojo.stopEvent(evt);
				this.submit();
			} else {
				evt.preventDefault();
			}
			return false;
		}
		
		return evt.keyCode;
	},
	
	// compute the focus order of the widgets as its tabIndex order
	_computeFocusOrder : function(){
		
		// compute the focus order based on the source order
		var WS = [];
		function computeSourceOrder(root){
			for(var node = root.firstChild; node; node = node.nextSibling){
				if(node.nodeType != 1) continue;
				var wid = node.getAttribute("widgetId");
				if(!wid) {
					computeSourceOrder(node);
					continue;
				}

				var wgt = dijit.byId(wid);
				if(!wgt) continue;
				
				if (wgt.isInstanceOf(com.ibm.btt.dijit.Group)){
					computeSourceOrder(wgt.containerNode);
					continue;
				}

				WS.push(wgt);
			}
		}
		
		computeSourceOrder(this.containerNode);
		
		// filter the widget whose tabIndex<0
		WS = dojo.filter(WS, function(w){
			return (parseInt(w.tabIndex)>-1 || w.tabIndex=="" || w.tabIndex==undefined);
		});
		
		// re-compute the focus order taking account of the "tabIndex"
		WS = WS.sort(function(wa, wb){
			var ta = parseInt(wa.tabIndex);
			var tb = parseInt(wb.tabIndex);
			ta = isNaN(ta)?0:ta;
			tb = isNaN(tb)?0:tb;
			return ta - tb;
		});
		
		// return an array that store the ID of widgets in its focus order
		return dojo.map(WS, function(w){
			return w.id;
		});
	},
	
	// use "enter" key as "tab" key for stand-alone Input(String,Number,Date), Combo and Select in BTT Form,
	// this includes the sub-widgets of group but not includes the grid's
	_fastTab : true, 
	_focusNext : function(/*Event*/ evt){
		if (!this._fastTab || evt.keyCode!=dojo.keys.ENTER)  return evt.keyCode;

		if (!this._focusWidgets){
			this._focusWidgets = this._computeFocusOrder();
		}
		
		// find the src/current widget
		var cw = this._findWidgetByNode(evt.target);

		if (cw 
			&&  cw.get("state")=="" // keep the focus in widget if its status is not normal
			&&  cw.grid==undefined  // the widget in grid has this attribute in most case and the widget in grid will be filtered in focusNextWidget() in any case
			&&  cw.isInstanceOf(com.ibm.btt.dijit.ValidationTextBox) // includes Input(String,Number,Date), Combo and Select
			&& !cw.isInstanceOf(com.ibm.btt.dijit.TextArea))
		{
			// position and focus
			var p = -1;
			for (var i=0; i<this._focusWidgets.length; i++){
				if (p < 0){ // position the src/current widget
					if (this._focusWidgets[i] == cw.id) {
						p = i;
						continue;
					}					
				}else{  // focus the next element
					var w = dijit.byId(this._focusWidgets[i]);
					if (w && w.isFocusable()){
						w.focus();
						break;
					}
				}
			}
		}
	},
	
	destroy : function() {
		if(window[this.id]){
			window[this.id] = undefined;
		}
		
		//clean all hidden btt parameters before destroy the form
		this.destroyHiddenParams();
		//release all connections
		while (this._events && this._events.length > 0) {
			try{
				dojo.disconnect(this._events.pop());
			}catch(e){}
		}
		this._events = undefined;
		
		this.inherited(arguments);
	}
	
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.Image"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.Image"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Image");






dojo.declare("com.ibm.btt.dijit.Image", [ dijit._Widget, dijit._Templated,com.ibm.btt.dijit.AbstractWidgetMixin,com.ibm.btt.dijit.CellWidgetMixin], {

	templateString : "<img />",

	location : "/",
	
	alt : "",
	
	action : "#",
	
	target : "_parent",
	
	bttParams : "",
	
	tabIndex: 0,
	
	disabled : false,

	width : "",

	height : "",
	
	url : "#",

	attributeMap : dojo.delegate(dijit._Widget.prototype.attributeMap,{
// to avoid the BTT session was reset by the "EMPTY" link in some browser
//		location : {
//			node : "domNode",
//			type : "attribute",
//			attribute : "src"
//		},
		
		width : {
			node : "domNode",
			type : "attribute"
		},
		
		height : {
			node : "domNode",
			type : "attribute"
		},
		
//		visibility : {
//			node : "domNode"
//		}, 
		
		alt : {
			node : "domNode",
			type: "attribute"
		},
		
//		target : {
//			node : "domNode"
//		},
//		tabIndex : {	// do it in postCreate()
//			node : "domNode"
//		},
//		disabled : {	// do it in postCreate()
//			node : "domNode"
//		},
		action : {
			node : "domNode"
		}
	}),
	
	postCreate : function() {
		this.inherited(arguments);
		var ti = parseInt(this.tabIndex);
		if (isNaN(ti)){
			this.tabIndex = 0;
		}else{
			this.tabIndex = ti;
		}
		this.disabled = (this.disabled===true || this.disabled==="true");
		if (this.disabled)
		{
			this.domNode.tabIndex = -1;
		}else{
			this.domNode.tabIndex = this.tabIndex;
		}
	},
	
	/**
	 * 
	 * join btt params to a url
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_parameterHandler : function(e) {
		var paramString = "";
		var params = dojo.fromJson(e);
		for ( var paramName in params) {
			if (typeof (paramName) != "undefined") {
				var paramValue = params[paramName];
				if (paramString == "") {
					paramString += paramName + "=" + paramValue;
				} else {
					paramString += "&" + paramName + "=" + paramValue;
				}
			}
		}
		return paramString;
	},

	/**
	 * 
	 * hook method for action attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setActionAttr : function(value){
		this.action = value;
		var targetUrl = "";
		if (this.bttParams != "" && this.action != "" && this.action !== "#") {
			targetUrl = this.action;
			if (this.bttParams != "") {
				if (targetUrl.indexOf("?") == -1) {
					targetUrl += "?";
				}
				if (this.bttParams != "") {
					var params = this._parameterHandler(this.bttParams);
					if (targetUrl.substring(targetUrl.length - 1) == "?") {
						targetUrl += params;
					} else {
						targetUrl += "&" + params;
					}
				}
			}
		} else {
			targetUrl = "javascript:void(0)";
		}
		//dojo.connect(this.domNode, "onclick", this, this._onClick);
		this.connect(this.domNode, "ondijitclick", this._onClick);
		this.url = targetUrl;
	},
	
	/**
	 * 
	 * hook method for disable attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setDisabledAttr : function(value){
		this.disabled = (value===true || value==="true");
		if (this.disabled)
		{
			this.domNode.tabIndex = -1;
		}else{
			this.domNode.tabIndex = this.tabIndex;
		}
	},
	
	focus : function(){
		this.domNode.focus();
	},
	
	applyAccessKey : function(){
		if(this.accessKey){
			this.domNode.setAttribute('accessKey', this.accessKey);
		}
	},
	
	/**
	 * 
	 * hook method for location attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setLocationAttr : function(value){
		this.location = value;
		if (typeof(value)=="string" && value!="")
		{
			this.domNode.src = value;
		}
	},
	
	/**
	 * set alt text attribute
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 */
	_setAltAttr: function(value){
		this.alt = value;
		this.domNode.alt = StringUtil.removeWarp(this.getI18NString(value));
	},
	
	/**
	 * 
	 * override default onclick method to block default click when link is disabled
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onClick : function(e){
		if (this.disabled || this.onClick(e) === false) {
			e.preventDefault();
		}else{
			if(this.url !== "#"){
				window.open(this.url,this.target);
			}
		}
	},
	
	onClick : function(e){
		//leave onClick event for customer to use.
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
	}
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.Label"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.Label"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Label"); 


 
 
 

dojo.declare("com.ibm.btt.dijit.Label",[dijit._Widget,dijit._Templated,com.ibm.btt.dijit.AbstractWidgetMixin,com.ibm.btt.dijit.CellWidgetMixin] ,{ 

	templateString : "<label class='dijitLabelBase' dojoAttachPoint='labelContainer' ${nameAttrSetting} ></label>",
	
	text : "",
	
	name: "",
	
	"for" : "",
	
	width : "",
	
	height : "",
	
	textWrap : false,
	
	isNotSubmitted : true,
	
	fieldReference : "",
	
	postMixInProperties: function(){

		this.nameAttrSetting = this.name ? ("name='" + this.name + "'") : "";
		this.inherited(arguments);
	},
	
	attributeMap : dojo.delegate(dijit._Widget.prototype.attributeMap, {
		text : {
			node : "domNode",
			type : "innerHTML"
		},
//		visibility : {
//			node : "domNode"
//		},
		"for" : {
			node : "domNode"
		}
	}),
	
//	postCreate : function() {
//		this.inherited(arguments);
//		if (this.hint == undefined || this.hint == null || this.hint == "") {
//			this.set('hint', this.text);
//		}
//	},
	
	/**
	 * 
	 * hook method for text attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextAttr : function(value){
		this.text = value;
		this.domNode.innerHTML = StringUtil.escapeEnterWrap(this.getI18NString(value));
	},
	
	/**
	 * 
	 * hook method for textWrap attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextWrapAttr : function(value) {
		this.textWrap = value;
		if (this.textWrap) {
			dojo.addClass(this.domNode, "dijitLabelWrap");
		} else {
			dojo.removeClass(this.domNode, "dijitLabelWrap");
		}
	},
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setValueAttr : function(value){
		this.set("text", value);
	},
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getValueArrt : function(name){
		return this.get("text");
	},
	
	/**
	 * 
	 * hook method for for attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setForAttr : function(value){
		this.domNode.htmlFor = value;
	},
	
	/**
	 * 
	 * hook method for width attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setWidthAttr : function(value){
		if(this.width != ""){
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
	_setHeightAttr : function(value){
		if(this.height != ""){
			this.height = value;
			dojo.style(this.domNode, "height", this.handleLenUint(this.height));
		}
	}
}); 

}

if(!dojo._hasResource["com.ibm.btt.dijit.RadioButton"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.RadioButton"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.dijit.RadioButton");




dojo.declare("com.ibm.btt.dijit.RadioButton", [ dijit.form.RadioButton, com.ibm.btt.dijit.AbstractWidgetMixin], {

	isChecked : false,

	text : "",

//	visibility : "visible",
	
	width : "",
	
	height : "",
	
	textWrap : false,

	attributeMap : dojo.delegate(dijit.form.RadioButton.prototype.attributeMap,{

		text : {
			node : "labelNode"
		},
		
//		visibility : {
//			node : "domNode"
//		},

		isChecked : {
			node : "domNode"
		}
	}),

	postMixInProperties: function(){
		if(this.isChecked==true){
			this.checked = "checked";
			this.params.checked = "checked";
		}
		this.inherited(arguments);
	},
	
	create : function() {
		this.labelNode = dojo.create("label", {'class':'dijitLabelBase'}, this.domNode, "after");
		this.inherited(arguments);
		this.labelNode.htmlFor = this.id;
		dojo.place(this.labelNode, this.domNode, "after");
		

		if (this.width && this.width != "") {
			this.set("width", this.width);
		}
		
		if (this.height && this.height != "") {
			this.set("height", this.height);
		}
		
		if (this.visibility && this.visibility != "") {
			this.set("visibility", this.visibility);
		}
		
	},

	/**
	 * 
	 * hook method for isChecked attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setIsCheckedAttr : function(value){
		this.set("checked", value);
	},
	
	/**
	 * 
	 * hook method for checked attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setCheckedAttr : function(value){
		if (value == false || value == "false" || value == "") {
			this.isChecked = false;
		}else {
			this.isChecked = true;
		}
		this.inherited(arguments);
	},
	
	/**
	 * 
	 * hook method for text attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextAttr : function(value){
		this.text = value;
		this.labelNode.innerHTML = StringUtil.escapeEnterWrap(this.getI18NString(value));
	},
	
	/**
	 * 
	 * hook method for style attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setStyleAttr : function(value){
		dojo.attr(this.labelNode, "style", value);
	},
	
	/**
	 * 
	 * hook method for class attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setClassAttr : function(value){
		dojo.attr(this.labelNode, "class", value);
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
		var tmpVal = StringUtil.removeWarp(this.getI18NString(value));
		var node = this.textbox || this.focusNode || this.domNode;
		node.title = tmpVal;
		this.labelNode.title = tmpVal;
	},
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setVisibilityAttr : function(value){
		var d = "";
		var v = "inherit";
		switch (value){
		case "gone":
			d = "none";
			v = "inherit";
			break;
		case "hidden":
			d = "";
			v = "hidden";
			break;
//		case "visible": // strongly recommend not using this value directly
//			d = "";
//			v = "visible";
//			break;
		default:
//			value = "inherit";
			d = "";
			v = "inherit";
		}
		
		this.visibility = value;
		
		dojo.style(this.domNode, "display", d);
		dojo.style(this.domNode, "visibility", v);
		dojo.style(this.labelNode, "display", d);
		dojo.style(this.labelNode, "visibility", v);
	},
	
	/**
	 * 
	 * hook method for readOnly attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setReadOnlyAttr: function(/*Boolean*/ value){
		this.inherited(arguments);
		if (value === "true" || value === true) {
			this.labelNode.htmlFor = "";
		}
		else{
			this.labelNode.htmlFor = this.id;
		}
	},
	
	/**
	 * 
	 * override default onclick method to fix read only bug for IE6/7/8
	 * this mathod will be removed after dojo fixed this defect
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onClick : function(e) {
		this.inherited(arguments);
		if (dojo.isIE && this.readOnly && this.focusNode.form) {
			dojo.stopEvent(e);
			dojo.query("INPUT[type=radio]", this.focusNode.form).forEach(
				dojo.hitch(this, function(inputNode) {
					if (inputNode.name == this.name && inputNode.form == this.focusNode.form) {
						var widget = dijit.getEnclosingWidget(inputNode);
						if (widget && "checked" in widget) {
							widget.set('checked', widget.checked);
						}
					}
			}));
		}
	},
	
	/**
	 * 
	 * hook method for textWrap attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextWrapAttr : function(value) {
		this.textWrap = value;
		if (this.textWrap) {
			dojo.addClass(this.labelNode, "dijitLabelWrap");
		} else {
			dojo.removeClass(this.labelNode, "dijitLabelWrap");
		}
	},
	
	/**
	 * 
	 * hook method for width attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setWidthAttr : function(value){
		if(this.width != ""){
			this.width = value;
			
			var width = value.replace(new RegExp("px", "gm"), "");
			try{
				width = Number(width);
			} catch(e) {
				console.error("Illegal input argument. Can not convert input width:"+ value +" to number.");
				return;
			}
			var box = dojo.marginBox(this.domNode);
			var labelWidth = width - box.w;
			if(labelWidth<0){
				labelWidth = 0;
			}
			dojo.style(this.labelNode, "width", labelWidth + "px");
		}
	},
	
	/**
	 * 
	 * hook method for height attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHeightAttr : function(value){
		if(this.height != ""){
			this.height = value;
			var height = value.replace(new RegExp("px", "gm"), "");
			/*try{
				height = Number(height);
			} catch(e) {
				console.error("Illegal input argument. Can not convert input height:"+ value +" to number.");
				return;
			}
			var box = dojo.marginBox(this.domNode);
			var labelHeight = height - box.h;
			if(labelHeight<0){
				labelHeight = 0;
			}*/
			dojo.style(this.labelNode, "height", height + "px");
		}
	},
	
	/**
	 * 
	 * hook method for focus event
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	// fix for JR41901, remove focused style for empty label
	_onFocus: function(){
		this.inherited(arguments);
		if(!this.text || this.text === "" || this.text === null ){
			dojo.query("label[for='"+this.id+"']").removeClass("dijitFocusedLabel");
		}
	},
	
	destroy : function(){
		this.inherited(arguments);
		dojo.destroy(this.labelNode);
		this.labelNode = null;
	}
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.RichTextEditor"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.RichTextEditor"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.RichTextEditor");




dojo.declare("com.ibm.btt.dijit.RichTextEditor", [ dijit.Editor,
        com.ibm.btt.dijit.AbstractWidgetMixin ], {
	
	width:"",
	
	readOnly : false,
	
	attributeMap: dojo.delegate(dijit.Editor.prototype.attributeMap, {
		
//		visibility : {
//			node : "domNode"
//		},
		
		width : {
			node : "domNode"
		},
		
		readOnly : {
			node : "domNode"
		}
		
	}),

	/**
	 * 
	 * hook method for readOnly attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setReadOnlyAttr : function(value) {
		this.set("disabled", value);
	},

	/**
	 * 
	 * hook method for readOnly attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getReadOnlyAttr : function() {
		return this.get("disabled");
	},
	
	postCreate: function(){
		
		var tmpName = this.name;
		
    	this.inherited(arguments);
		this._setWidthAttr(this.width);
		this._setHintAttr(this.hint);
		this._setVisibilityAttr(this.visibility);
		this.resetContent = this.get("savedContent");
		
		if(tmpName == "" || tmpName == null || tmpName == undefined){
			this.name = null;
		}
		
		var initialValue = this.value;
		var _this = this;
		setTimeout(function(){
			_this._setValueAttr(initialValue);
		}, 0);
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
	 * hook method for hint attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHintAttr : function(value){
		this.hint = value;
		if (typeof (this.editingArea) != "undefined" && this.editingArea != null) {
			this.editingArea.parentNode.title = StringUtil.removeWarp(this.getI18NString(value));
		}
	},
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	
	_getValueAttr : function(){
		var value = this.inherited(arguments);
		if(dojo.isFF && (value == "<br _moz_editor_bogus_node=\"TRUE\" />" || value == '<br />')){
			return "";
		} else {
			return value;
		}
	},
	
	reset : function(e){
		this.set("value", this.resetContent);
	},
	
	//fix for memory leak issue in IE browser
	onFormSubmit : function(){
		
		if(this.name){
			var submitValue = this.get("value");
			this._tmpInput = dojo.create("input", {
				'type' : 'hidden',
				'name' : this.name,
				'value' : submitValue
			}, this.domNode, "after");
		}

	},
	
	destroy : function() {
		if(this.resetContent){
			delete this.resetContent;
		}
		if (this._tmpInput) {
			dojo.destroy(this._tmpInput);
			delete this._tmpInput;
		}
		this.inherited(arguments);
	}


});

}

if(!dojo._hasResource["com.ibm.btt.dijit.Select"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.Select"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.dijit.Select");





 
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

}

if(!dojo._hasResource["com.ibm.btt.dijit.StringTextBox"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.StringTextBox"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.StringTextBox"); 



dojo.requireLocalization("com.ibm.btt.dijit", "TextBox", null, "ROOT");

dojo.declare("com.ibm.btt.dijit.StringTextBox",[com.ibm.btt.dijit.ValidationTextBox],{
	
	maximumLength : NaN,
	minimumLength : NaN,
	validCharacters : "",
	password : false,
	
	postMixInProperties : function(){
		this.inherited(arguments);	
		if(this.password){
			this.type = "password";
		}
	},
	
	postCreate : function(){
		this.inherited(arguments);
		this.set('value', this.get('value'));
		
		// IBK maxLength
		var gcu = com.ibm.btt.util.GlobalConfigurationUtil;
		var isAuto = gcu && (gcu.getValue("com.ibm.btt.stringtextbox.maxlength")=="auto");
		var max = 65535;
		var mlc = parseInt(this.maximumLength) || max;
		var mli = parseInt(this.maxLength) || max;
		var ml = mlc>mli? mli:mlc;
		if (ml>0 && ml < max){
			this.maximumLength = ml;
			if (isAuto){// update the maxLength only when com.ibm.btt.stringtextbox.maxlength=="auto"
				this.maxLength = ml;
				dojo.attr(this.focusNode, "maxLength", ml);
			}
		}
	},
	
	validator: function(/*anything*/value, /*dijit.form.ValidationTextBox.__Constraints*/constraints){	
		var bundle = new com.ibm.btt.util.I18nBundle("com.ibm.btt.dijit", "TextBox");
		if(!isNaN(this.minimumLength) && this.attr('value').length < this.minimumLength){	
			this.invalidMessage = bundle.getMessage("stringMinMessage",{value:this.minimumLength});
			return false;
		}
		else if(!isNaN(this.maximumLength) && this.attr('value').length > this.maximumLength){
			this.invalidMessage = bundle.getMessage("stringMaxMessage",{value:this.maximumLength});
			return false;
		}
		else{
			return this.inherited(arguments);
		}
	},
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setValueAttr : function(value){
		if (value != null && value != undefined) {
			value = this.getI18NString(value);
			value = value.replace(/&amp;/g, '&').replace(/&lt;/g, '<')
		}else{
			value = "";
		}
		this.value = value;
		this.inherited(arguments);
	}
	
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.TextArea"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.TextArea"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/


dojo.provide("com.ibm.btt.dijit.TextArea");





dojo.declare("com.ibm.btt.dijit.TextArea", [com.ibm.btt.dijit.StringTextBox, 
		dijit.form.SimpleTextarea], {
	
	width : "",
	
	height : "",
	
	// to enable \r and \n for text area
	regExp : "[\\s\\S]*",
	
	attributeMap: dojo.delegate(dijit.form.SimpleTextarea.prototype.attributeMap, {
		
//		visibility : {
//			node : "domNode"
//		},
		
		width : {
			node : "domNode"
		},
		
		height : {
			node : "domNode"
		}
		
	}),
//  same as StringTextBox	
//	validator: function(/*anything*/value, /*dijit.form.ValidationTextBox.__Constraints*/constraints){
//		if(! (!this.required || !this._isEmpty(value))){
//			//this.promptMessage = dojo.i18n.getLocalization("com.ibm.btt.dijit", "TextBox").requiredFieldMessage;
//			return false;
//		}
//		/*if(!(new RegExp("^(?:" + this.regExpGen(constraints) + ")"+(this.required?"":"?")+"$")).test(value)){
//			this.invalidMessage = dojo.i18n.getLocalization("com.ibm.btt.dijit", "TextBox").regularExpressionMessage;
//			return false;
//		}*/
//		return true;
//	},

	_isValidSubset: function(){
		// Overrides `dijit.form.ValidationTextBox._isValidSubset` to show ERROR message on typing
		return false;
	},
	
	/**
	 * 
	 * hook method for Visibility attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
//	_setVisibilityAttr : function(value){
//		this.visibility = value;
//		if (value == "gone") {
//			dojo.style(this.domNode, "visibility", "visible");
//			dojo.style(this.domNode, "display", "none");
//		} else if (value == "hidden") {
//			dojo.style(this.domNode, "display", "");
//			dojo.style(this.domNode, "visibility", "hidden");
//		} else {
//			dojo.style(this.domNode, "display", "");
//			dojo.style(this.domNode, "visibility", "visible");
//		}
//	},
	
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
	}

	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
// same as StringTextBox
//	_setValueAttr : function(value){
//		value = this.getI18NString(value);
//		this.value = value;
//		this.inherited(arguments);
//	}
	,
	
	/**
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 */
	_setIsMandatoryAttr : function(value) {
		this.isMandatory = value;
		this.required = value;  // defect 29580
	}
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.Tree"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.Tree"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.dijit.Tree");






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
	
	templateString: dojo.cache("com.ibm.btt.dijit", "templates/Tree.html", "<div class=\"dijitTree dijitTreeContainer\" waiRole=\"tree\" style=\"overflow:auto\"\r\n\tdojoAttachEvent=\"onkeypress:_onKeyPress\">\r\n\t<div class=\"dijitInline dijitTreeIndent\" style=\"position: absolute; top: -9999px\" dojoAttachPoint=\"indentDetector\"></div>\r\n\t<input type=\"hidden\" dojoAttachPoint=\"formNode\"/>\r\n</div>\r\n"),
	
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

}

if(!dojo._hasResource["com.ibm.btt.dijit.GridDijit"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.GridDijit"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.GridDijit"); 











/**
 * BTT base cell widget
 * - hooks the validate related logic for form submit button validation.
 */
dojo.declare("dojox.btt.grid.cells.BaseCellWidget",dojox.grid.cells._Widget,{
	
	widgetClass: null,
	
	rowCSS: null,
	
	defaultValue: "\x1E ",
	
	constructor : function(c){
		if(!this.widget && this.widgetClass) {
			this.widget = this.createWidget(dojo.create('div'), "");
		}
	},
	
	createWidget: function(inNode, inDatum, inRowIndex){
		var widget = this.inherited(arguments);
		if (!this.grid.cwsl)
		{
			this.grid.cwsl = [];
		}
		this.grid.cwsl.push(widget);
		var _this = this;
		widget.watch("state", function(attr, oldVal, newVal){
			_this.grid._set("state", _this.grid._getState());
			
		});
		return widget;
	},
	
	/** private, for internal use only, should NOT be overridden **/
	formatter : function(inData, inRowIndex, cell){
		if (this.hidden) return "";
		var ccss = cell.grid.computeCCSS(inRowIndex, cell, inRowIndex%2<1?'E':'O');
		for(var ci in ccss){			
			this.customClasses.push(ccss[ci]);
		}
		try{
			return this.bttformatter(inData, inRowIndex, cell);
		}catch(e){
			console.error("failed to invoke bttformatter method to format cell content in grid.");
			return "";
		}
	},
	/** Stub function. Override to implement custom format **/
	bttformatter : function(inData, inRowIndex, cell){
		return inData;
	},
	
	setValue: function(inRowIndex, inValue){
		if(this.widget&&this.widget.set){
			//Look for lazy-loading editor and handle it via its deferred.
			if(this.widget.onLoadDeferred){
				var self = this;
				this.widget.onLoadDeferred.addCallback(function(){
					self.widget._lastValueReported = inValue;
					self.widget.set("value", inValue===null?"":inValue);
				});
			}else{
				this.widget._lastValueReported = inValue;
				this.widget.set("value", inValue, inValue);
			}
		}else{
			this.inherited(arguments);
		}
	},
	
	getWidget : function(){
		return this.widget;
	},
	
	handleNewLine : function(data) {
		if (typeof(data)=="string"){
			// defect 29566
			data = data.split('\\n').join('\n');
			data = data.split('\\r').join('\r');
			// defect 29566
			
			data = data.split('\n').join('<br/>');
			data = data.split('\r').join('<br/>');
		}
		return data;
	},
	
	/*
	 * Overwrite
	 * Under some circumstance, eg. the column is just before a horizontal scroll lock, 
	 * the cell node width was calculated wrongly. 
	 */
	sizeWidget: function(inNode, inDatum, inRowIndex){
		var p = this.getNode(inRowIndex), box = dojo.contentBox(p);
		var w = this.width.replace(/px/g,'').replace(/\%/g, '');
		box.w = box.w > w ? w : box.w;
		dojo.marginBox(this.widget.domNode, {w: box.w});
	}
});


dojo.declare("dojox.btt.grid.cells.Label", dojox.btt.grid.cells.BaseCellWidget, {

	bttformatter : function(inData) {
		
		return this.handleNewLine(I18nUtil.getI18nString(inData));
	}	
	
});

dojo.declare("dojox.btt.grid.cells.DateTextBox", dojox.btt.grid.cells.BaseCellWidget, {

	widgetClass: com.ibm.btt.dijit.DateTextBox,

	bttformatter : function(inData) {
		
		if(inData == undefined || inData == null || inData == "" || inData == "null"){
			return "";
		}

		/*if(this.widget == null) {
			this.widget = this.createWidget(dojo.create('div'), "");
			//this.widget.set("value", null);
		}*/

		var date;

		if(typeof inData == 'string') {
			if(this.widget && this.widget.pattern){
				date = this.widget.parse(inData, this.widget.constraints);
			} else {
				var constraints = this.widget.constraints;
				constraints["datePattern"] = "yyyy-MM-dd";
				date = this.widget.parse(inData, constraints);
			}
		} else {
			date = inData;
		}
		return this.widget.format(date, this.widget.constraints);
	},


	getWidgetProps: function(inDatum){
		return dojo.mixin(this.inherited(arguments), {
			value: new Date(inDatum)
		});
	},

	setValue: function(inRowIndex, inValue){

		if(inValue == undefined || inValue == null || inValue == "" || inValue == "null"){
			this.widget._lastValueReported = null;
			this.widget.set('value', null);
			return;
		}

		if(this.widget){
			if(typeof inValue == "string") {
				if(this.widget && this.widget.pattern){
					var date = this.widget.parse(inValue, this.widget.constraints);
					this.widget._lastValueReported = date;
					this.widget.set('value', date);
				} else {
					this.widget._lastValueReported = new Date(inValue);
					this.widget.set('value', new Date(inValue));
				}
			} else {
				this.widget._lastValueReported = inValue;
				this.widget.set('value', inValue);
			}
		}else{
			this.inherited(arguments);
		}
	},

	getValue: function(inRowIndex){
		if(this.widget.isValid()){
			var value = this.widget.get('value');
			if(value){
				return value;
			} else {
				return "";
			}
		}else{
			this.widget.displayMessage(this.widget.getErrorMessage(true));		//DISPLAY THE ERROR MESSAGE TO GIVE END USER FEEDBACK
			return undefined;
		}
	}

//	formatNode : function(inRowIndex, inValue){
//		this.inherited(arguments);
//		//this.widget.set("value", null);
//		this.setValue(inRowIndex, inValue);
//	}

});


dojo.declare("dojox.btt.grid.cells.CurrencyTextBox", dojox.btt.grid.cells.BaseCellWidget, {
	
	widgetClass: com.ibm.btt.dijit.CurrencyTextBox,
	
	bttformatter : function(inData) {
		
		/*if(this.widget == null) {
			this.widget = this.createWidget(dojo.create('div'), "");
		}*/
		
		//deal with null value
		if(inData === null){
			return "";
		}
		
		if(typeof inData == 'string') {
			inData = Number(inData);
		}
		this.widget._lastValueReported = inData;
		this.widget.set('value', inData);
		
		return dojo.number.format(inData, this.widget.constraints);
	},
	
	getWidgetProps: function(inDatum){
		return dojo.mixin(this.inherited(arguments), {
			value: new Number(inDatum)
		});
	},
	
	getValue: function(inRowIndex){
		if(this.widget.isValid()){
			return this.widget.get('value'); 
		}else{
			this.widget.displayMessage(this.widget.getErrorMessage(true));		//DISPLAY THE ERROR MESSAGE TO GIVE END USER FEEDBACK
			return undefined;
		}
	},

	setValue : function(inRowIndex, inValue) {
		if (inValue && typeof inValue == 'string') {
			inData = Number(inValue);
		}
		this.inherited(arguments);
	}
	
});

dojo.declare("dojox.btt.grid.cells.NumberTextBox", dojox.btt.grid.cells.BaseCellWidget, {
	
	widgetClass: com.ibm.btt.dijit.NumberTextBox,
	
	bttformatter : function(inData) {
		
		/*if(this.widget == null) {
			this.widget = this.createWidget(dojo.create('div'), "");
		}*/
		
		//deal with null value
		if(inData === null || inData === ""){
			return "";
		}
		
		this.widget.set('value', inData);
		
		if(typeof inData == 'string') {
			var tmpData = this.widget.parse(inData, this.widget.constraints);;			//FIXME, error handling for not a valid number?
			if(isNaN(tmpData)){
				tmpData = Number(inData);
			}
			if(isNaN(tmpData)){
				return inData;
			}else{
				return this.widget.format(tmpData, this.widget.constraints);
			}
		} else {
			return this.widget.format(inData, this.widget.constraints);
		}
		
	},
	
	getWidgetProps: function(inDatum){
		return dojo.mixin(this.inherited(arguments), {
			value: new Number(inDatum)
		});
	},
	
	getValue: function(inRowIndex) {
		if(this.widget.isValid()){
			var value = this.widget.get('value');
			if(isNaN(value)){
				return "";
			} else {
				return value;
			}
		}else{
			this.widget.displayMessage(this.widget.getErrorMessage(true));		//DISPLAY THE ERROR MESSAGE TO GIVE END USER FEEDBACK
			return undefined;
		}
	}
	
});


dojo.declare("dojox.btt.grid.cells.CheckBox", dojox.btt.grid.cells.BaseCellWidget, {
	widgetClass: com.ibm.btt.dijit.CheckBox,
	
	getValue: function(){
		return this.widget.get('value');//isChecked ? this.widget.checkedValue : this.widget.unCheckedValue;//this.widget.checked;
	},
	setValue: function(inRowIndex, inValue){
		if(this.widget){
			if( (inValue + "") == (this.widget.checkedValue + "") ) {
				this.widget._lastValueReported = true;
				this.widget.set("isChecked", true);
			} else {
				this.widget._lastValueReported = false;
				this.widget.set("isChecked", false);
			} 
		}else{
			this.inherited(arguments);
		}
		
	},
	
	sizeWidget: function(inNode, inDatum, inRowIndex){
		return;
	},
	
	formatEditing: function(inDatum, inRowIndex){
		if(!this.grid.colWidget){
			this.grid.colWidget = [];
		}
		var col = this.index;
		if(!this.grid.colWidget[col]){
			this.grid.colWidget[col] = this.widget;
		}
		if(this.alwaysEditing){
			return this._alwaysEditFormatNode(inDatum, inRowIndex);
		}else{
			return this.inherited(arguments);
		}
	},
	
	_alwaysEditFormat: function(inDatum, inRowIndex){
		this.whenIdle(this, "_alwaysEditFormatNode", inDatum, inRowIndex);
		return "<div></div>";
	}, 
	
	_alwaysEditFormatNode: function(inDatum, inRowIndex){
		if(!this.grid.aew){
			this.grid.aew = [];
		}
		var col = this.index;
		var row = inRowIndex;
		if(!this.grid.aew[col]){
			this.grid.aew[col] = [];
		}
		
		var w = null;
		if(! this.grid.aew[col][row]){
			w = this.createWidget(this.getEditNode(inRowIndex), inDatum, inRowIndex);
			this.grid.aew[col][row] = w;
		}else{
			w = this.grid.aew[col][row];
		}
		w.set("checked", inDatum);
		w["col"] = col
		w["row"] = row;
		w["field"] = this.field;
		var html = w.domNode.outerHTML;
		
		this._updateHeaderCheckBox(col);
		
		if(w.isChecked){

		}else{
			// sometimes the widget dom is not updated 
			// we have to manually remove the checked class
			// to reflect the real state
			var temp = html.split("dijitCheckBoxChecked").join("");
			html = temp.split("dijitChecked").join("");
			temp = undefined;
		}
		return html;
	},
	
	_updateHeaderCheckBox: function(col){
		if(this.grid.aew && this.grid.aew[col]){
			var uncheckedBoxes = dojo.filter(this.grid.aew[col], function(box){
				return box.isChecked == false || box.isChecked == "false";
			});
			if(this.grid.aewh && this.grid.aewh[col]){
				var hw = this.grid.aewh[col];
				hw["preserve"] = true;
				hw.set("checked", uncheckedBoxes.length == 0);
			}
		}
	},
	
	doclick: function(e){
		if(e.target.tagName == 'INPUT'){
			if(this.alwaysEditing) {
				this.applyStaticValue(e.rowIndex);
				dojo.stopEvent(e);
			}
		}
	},
	applyStaticValue: function(inRowIndex){
		var e = this.grid.edit;
		var col = this.index;
		var row = inRowIndex;
		var w = this.grid.aew && this.grid.aew[col] && this.grid.aew[col][row] ? this.grid.aew[col][row] : undefined;
		if(w){
			this.widget = w;
			if(w.isChecked){
				w.set("checked", false);
				var inputnode = dojo.byId(w.id);
				inputnode.checked = false;
				var parent = inputnode.parentNode;
				dojo.removeClass(parent, "dijitCheckBoxChecked");
				dojo.removeClass(parent, "dijitChecked");
			}else{
				w.set("checked", true);
			}
			this._updateHeaderCheckBox(col);
			var v =  w.get("value");
			e.applyCellEdit(v, this, inRowIndex);
		}
	}
});

dojo.declare("com.ibm.btt.dijit.GridRadioButton", [ com.ibm.btt.dijit.RadioButton], {
	_getValueAttr : function(){
		if(this.isChecked){
			return this.checkedValue;
		}else{
			return this.unCheckedValue;
		}
	}
	
	
});

dojo.declare("dojox.btt.grid.cells.Radio", dojox.btt.grid.cells.BaseCellWidget, {
	widgetClass: com.ibm.btt.dijit.GridRadioButton,
	
	getValue: function(inRowIndex){
		var col = this.index;
		var row = inRowIndex;
		var w = this.grid.aew && this.grid.aew[col] && this.grid.aew[col][row] ? this.grid.aew[col][row] : undefined;
		if(w){
			this.widget = w;
		}
		var v = this.widget.isChecked ? this.widget.checkedValue : this.widget.unCheckedValue;
		this._uncheckOthers(col, inRowIndex);
		return v;
	},
	setValue: function(inRowIndex, inValue){
		if(inValue && this.widget){
			if( inValue.toString() == this.widget.checkedValue.toString() ) {
				this.widget._lastValueReported = true;
				this.widget.set("checked", true);
				this._uncheckOthers(rol, inRowIndex);
			} else {
				this.widget._lastValueReported = false;
				this.widget.set("checked", false);
			} 
		}else{
			this.inherited(arguments);
		}
		
	},
	
	_uncheckOthers: function(col, row){
		var field = this.field;
		var rows = this.grid.get("rowCount");
		for(var i=0; i< rows; i++){
			if(i != row){
				var item = this.grid.getItem(i);
				if (item){
					this.grid.store.setValue(item, field, this.widget.unCheckedValue);
					if(this.grid.aew && this.grid.aew[col] && this.grid.aew[col][i]){
						var w = this.grid.aew[col][i];
						var inputnode = dojo.byId(w.id);
						if(inputnode){
							var parent = inputnode.parentNode;
							if(parent){
								dojo.removeClass(parent, "dijitRadioChecked");
								dojo.removeClass(parent, "dijitChecked");
							}
						}
					}
				}	
			}
		}
	},
	
	sizeWidget: function(inNode, inDatum, inRowIndex){
		return;
	},
	
	bttformatter : function(inData) {
		
		if(typeof inData == "string") {
			return inData;
		} else if(typeof inData == "boolean") {
			return inData.toString();
		} else {
			this.inherited(arguments);
		}
	},
	formatEditing: function(inDatum, inRowIndex){
		if(!this.grid.colWidget){
			this.grid.colWidget = [];
		}
		var col = this.index;
		if(!this.grid.colWidget[col]){
			this.grid.colWidget[col] = this.widget;
		}
		if(this.alwaysEditing){
			return this._alwaysEditFormatNode(inDatum, inRowIndex);
		}else{
			return this.inherited(arguments);
		}
	},
	
	_alwaysEditFormatNode: function(inDatum, inRowIndex){
		if(!this.grid.aew){
			this.grid.aew = [];
		}
		var col = this.index;
		var row = inRowIndex;
		if(!this.grid.aew[col]){
			this.grid.aew[col] = [];
		}
		
		var w = null;
		if(! this.grid.aew[col][row]){
			if(!this.widgetProps){ this.widgetProps = {}; }
			this.widgetProps["name"] = "REMOVEBEFORESUBMIT_" + this.grid.id + "_radio_" + col;
			w = this.createWidget(this.getEditNode(inRowIndex), inDatum, inRowIndex);
			this.grid.aew[col][row] = w;
		}else{
			w = this.grid.aew[col][row];
		}
		
		if(String(inDatum) == String(w.checkedValue)){
			if(!this.grid.currentCheckedRadio){
				this.grid.currentCheckedRadio = [];
			}
			if(this.grid.currentCheckedRadio[col] == undefined){
				this.grid.currentCheckedRadio[col] = w.id;
				w.set("checked", true);
			}else{
				w.set("checked", true);
				this.grid.currentCheckedRadio[col] == w.id
			}
			this._uncheckOthers(col, row);
		}else{
			w.set("checked", false);
		}
//		var item = this.grid.getItem(inRowIndex);
//		if (item){
//			this.grid.store.setValue(item, this.field, w.get("value"));
//		}
		
		var html = w.domNode.outerHTML;
		if(w.isChecked){

		}else{
			// sometimes the widget dom is not updated 
			// we have to manually remove the checked class
			// to reflect the real state
			var temp = html.split("dijitRadioChecked").join("");
			html = temp.split("dijitChecked").join("");
			temp = undefined;
		}
		return html;
	},
	
	doclick: function(e){
		if(e.target.tagName == 'INPUT'){
			if(this.alwaysEditing) {
				this.applyStaticValue(e.rowIndex);
			}
		}
	},
	applyStaticValue: function(inRowIndex){
		var e = this.grid.edit;
		var col = this.index;
		var row = inRowIndex;
		var w = this.grid.aew && this.grid.aew[col] && this.grid.aew[col][row] ? this.grid.aew[col][row] : undefined;
		if(w){
			this.widget = w;
			w.set("checked", true);
			var v =  w.get("value");
			e.applyCellEdit(v, this, inRowIndex);
			this._uncheckOthers(col, row);
			if(!this.grid.currentCheckedRadio){
				this.grid.currentCheckedRadio = [];
			}
			if(this.grid.currentCheckedRadio[col] != undefined){
				if(w.id != this.grid.currentCheckedRadio[col]){
					var inputnode = dojo.byId(this.grid.currentCheckedRadio[col]);
					var parent = inputnode.parentNode;
					dojo.removeClass(parent, "dijitRadioChecked");
					dojo.removeClass(parent, "dijitChecked");
				}
			}
			var inputnode = dojo.byId(w.id);
			var parent = inputnode.parentNode;
			dojo.addClass(parent, "dijitRadioChecked");
			dojo.addClass(parent, "dijitChecked");
			this.grid.currentCheckedRadio[col] = w.id;
		}
	}
});

dojo.declare("dojox.btt.grid.cells.StringTextBox", dojox.btt.grid.cells.BaseCellWidget, {
	
	widgetClass: com.ibm.btt.dijit.StringTextBox,
	
	getValue: function(inRowIndex){
		if(this.widget.isValid()){
			return this.widget.get('value'); 
		}else{
			this.widget.displayMessage(this.widget.getErrorMessage(true));		//DISPLAY THE ERROR MESSAGE TO GIVE END USER FEEDBACK
			return undefined;
		}
	},
	
	bttformatter : function(inData) {
		
		return this.handleNewLine(I18nUtil.getI18nString(inData));
	},
	
	// defect 29566
	formatEditing: function(inDatum, inRowIndex){
		inDatum = inDatum.replace(/\r/g, "\\r");
		inDatum = inDatum.replace(/\n/g, "\\n");
		return this.inherited(arguments);
	}
	
});

dojo.declare("dojox.btt.grid.cells.ComboBox", dojox.btt.grid.cells.BaseCellWidget, {

	widgetClass: com.ibm.btt.dijit.ComboBox,

	getValue: function(){
		var e = this.widget;
		// make sure to apply the displayed value
		e.attr('displayedValue', e.attr('displayedValue'));
		return e.attr('value');
	},
	
	bttformatter : function(inData) {
		
		return this.handleNewLine(inData);
	}
	
});


dojo.declare("dojox.btt.grid.cells.Select", dojox.btt.grid.cells.BaseCellWidget, {

	widgetClass: com.ibm.btt.dijit.Select,
	
	/**
	 * Custom comparator to sort the values in a Select column
	 * Sorting by label
	 * @param field1
	 * @param field2
	 * @returns {Number}
	 */
	comparator: function(field1, field2){
		var store = this.widget.store;
		
		//var item1 = store.fetchItemByIdentity({"identity":field1});
		var item1 = store._itemsByIdentity[field1];
		var v1 = item1 ? item1.label[0]:field1;
		
		//var item2 = store.fetchItemByIdentity({"identity":field2});
		var item2 = store._itemsByIdentity[field2];
		var v2 = item2 ? item2.label[0]:field2;
		
		if(v1 > v2){
			return 1;
		} else if(v1 < v2){
			return -1;
		} else {
			return 0;
		}
	},

	bttformatter : function(inData) {
		
		/*if(this.widget == null) {
			this.widget = this.createWidget(dojo.create('div'), "");
		}*/
		
		if((inData === null) || (inData === "")){
			return "";
		}
		
		// if the cell value is in Select, then display its label, 
		// otherwise, display the original value.
		var store = this.widget.store;
		//var item = store.fetchItemByIdentity({"identity":inData});
		var item = store._itemsByIdentity[inData];
		if(item){
			//this.widget.set('value', inData);
			return this.handleNewLine(item.label[0]);
		}else{
			return this.handleNewLine(inData);
		}
	}
});

dojo.declare("dojox.btt.grid.cells.Image", dojox.btt.grid.cells.BaseCellWidget, {
	
	widgetClass: com.ibm.btt.dijit.Image,
	
	bttformatter : function(inData) {
		
		if(inData) {
			var html = '<img src="' + inData + '"';
		} else {
			var html = '<img ';
		}
		
		if (this.widgetProps && this.widgetProps.imageWidth) {
			html += ' width="'+ this.grid.handleLenUint(this.widgetProps.imageWidth) +'"'; 
		}
		
		if (this.widgetProps && this.widgetProps.imageHeight) {
			html += ' height="'+ this.grid.handleLenUint(this.widgetProps.imageHeight) +'"'; 
		}
		
		html += '/>';
		
		return html;
	}
	
});


dojo.declare("dojox.btt.grid.cells.LabelFromList", dojox.btt.grid.cells.BaseCellWidget,{
	constructor : function(prop){
		var _this = this;
		if(prop.storeData){
			_this.storeData = prop.storeData;
		}else{
			var storeURL = prop.storeURL ? prop.storeURL : prop.widgetProps.storeURL;
			if(storeURL){
				var xhrArgs = {
					url : storeURL,
					handleAs : "json",
					sync : true,
					load : function(arg) {
						_this.storeData = arg;
					},
					error: function(e){
						console.error("dojox.btt.grid.cells.LabelFromList: Failed to get the list file from " + storeURL);
					}
				};
				dojo.xhrGet(xhrArgs);
			}else{
				_this.storeData = {};
			}
		}
		if(_this.storeData){
			var tempData = {};
			for(var key in _this.storeData){
				if (_this.storeData[key] != null
						&& typeof (_this.storeData[key]) != "undefined") {
					tempData[_this.storeData[key]] = key;
				}
			}
			_this.storeData = tempData;
		}
	},
	
	bttformatter : function(inData) {
		
		if (this.storeData && this.storeData[inData]) {
			return '<label>' + this.handleNewLine(I18nUtil.getI18nString(this.storeData[inData])) + '</label>';
		} else if (inData && inData === null && inData === "null") {
			return "";
		} else {
			return '<label>' + this.handleNewLine(inData) + '</label>';
		}
	}
	/*, defect 27138
	comparator : function(a, b){
		var a = this.storeData[a];
		var b = this.storeData[b];
		var r = -1;
		if(a === null){
			a = undefined;
		}
		if(b === null){
			b = undefined;
		}
		if(a == b){
			r = 0;
		}else if(a > b || a == null){
			r = 1;
		}
		return r; //int {-1,0,1}
	}
	*/
	
});

dojo.declare("dojox.btt.grid.cells._LinkMixin", null, {
	
	
	_onClick : function(e){
		if (!e.target.tagName || (! this._tagartTagName[e.target.tagName.toUpperCase()])) 
		{
			return;
		}

		e.defaultPrevented = true;
		dojo.stopEvent(e);
		var rowd = this.grid.getItem(e.rowIndex);

		var clickable = false;
		if(this.widgetProps) {
			if((!this.widgetProps.dataNameForClickable  || this.grid.store.getValue(rowd, this.widgetProps.dataNameForClickable)) && ((this.widgetProps.dataNameForLink && this.grid.store.getValue(rowd, this.widgetProps.dataNameForLink)) || this.widgetProps.flowEvent)) {
				clickable = true;
			}
		}
	
		if(!clickable) 
			return;
		
		if (this.onClick(e) === false)
		{
			return;
		}

		// select this row for validation
		if (this.grid.selectionMode === "single" || this.grid.selectionMode === "extended") {
			if(!this.grid.selection.isSelected(e.rowIndex)){
				this.grid.selection.setSelected(e.rowIndex, true);
			}
		} 
		
		var rowData = {};
		for (var key in rowd) 
		{
			if (key.charAt(0)!='_' && rowd[key])
			{
				rowData[key] = rowd[key][0];
			}
		}

		// calculate the action
		// dataNameForLink
		if (this.widgetProps && this.widgetProps.dataNameForLink)
		{
			var url =  this.grid.store.getValue(rowd, this.widgetProps.dataNameForLink); 
			if (url && url!="")
			{
				return this._openLink(url, rowData);
			}
		}
		
		// -href
		if (this.widgetProps && this.widgetProps.href){
			var url = this.widgetProps.href;
			if (url && url!="")
			{
				return this._openLink(url, rowData);
			}
		}

		// flowEvent --> dse_nextEventName
		if (this.widgetProps && this.widgetProps.flowEvent && this.widgetProps.flowEvent != "")
		{
			var form = this.grid._getParentForm();
			if (!form)
			{
				console.error("can't find form to submit");
				return;
			}
			var pd = dojo.fromJson(this.grid.bttParam4Link);
			pd['dse_nextEventName'] = this.widgetProps.flowEvent;
			if (this.widgetProps.dataNameForRow)
			{
				pd[this.widgetProps.dataNameForRow] = e.rowIndex;
			}
			if (this.widgetProps.dataNameForColumn)
			{
				pd[this.widgetProps.dataNameForColumn] = this.field;
			}
			
			form.bttParams = dojo.toJson(pd);
			form.submit();
			return;
		}
		
		console.error("find nothing, something is wrong!");
	},
	
	_openLink : function(url, extParam){
		var params = [];
		for (var key in extParam) {
			if (extParam[key] != null) {
				params.push(key);
				params.push("=");
				params.push(extParam[key]);
				params.push("&");
			}
		}
		if (this.widgetProps.dataNameForRow)
		{
			params.push(this.widgetProps.dataNameForRow + "=" + this.index);
			params.push("&");
		}
		if (this.widgetProps.dataNameForColumn)
		{
			params.push(this.widgetProps.dataNameForColumn + "=" + this.field);
			params.push("&");
		}
		params.pop();
		
		if (url.toString().indexOf("?")>0)
		{
			url += '&' + params.join('');
		}else{
			url += '?' + params.join('');
		}
		
		var target;
		if (this.widgetProps && this.widgetProps.target)
		{
			target = this.widgetProps.target;
		}else if (this.widgetProps && this.widgetProps.newWindow){
			if (this.widgetProps.newWindow.toString() == "true")
			{
				target = "_blank";
			}
		}

		if (target)
		{
			window.open(url, target);
		}else{
			window.open(url, "_self");
		}
	},
	
	onClick : function(e){
		//leave onClick event for customer to use.
		return true;
	}
});


dojo.declare("dojox.btt.grid.cells.Link", [dojox.btt.grid.cells.BaseCellWidget, dojox.btt.grid.cells._LinkMixin], {
	
	_tagartTagName : {"A":true, "IMG":true},
	
	bttformatter : function(inData, rowIndex) {
		var rowd = this.grid.getItem(rowIndex);
		if(rowd){
		}else{
			return "";
		}
		
		var atag = {'tn':'a', 'attr':{}, ih:""};
		atag.ih = "";
		
		// calculate the text
		var text;
		if(this.field && inData) {
			text = inData;
		} else if(this.widgetProps && this.widgetProps.linkText){
			text = this.widgetProps.linkText;
		}
		atag.ih = text ? I18nUtil.getI18nString(text) : atag.ih;
		
		
		// calculate target
		if (this.widgetProps && this.widgetProps.target){
			atag.attr.target = this.widgetProps.target;
		}else if (this.widgetProps && this.widgetProps.newWindow ){
			if (this.widgetProps.newWindow.toString() == "true")
			{
				atag.attr.target = "_blank";
			}
		}

//		var rowd = this.grid.getItem(rowIndex);

		// calculate the tooltip
		if (this.widgetProps){
			var title;
			if(this.widgetProps.dataNameForTooltip) {
				title = this.grid.store.getValue(rowd, this.widgetProps.dataNameForTooltip); 
			}
			if(!title) {
				title = this.widgetProps.tooltip;
			}
			if(title) {
				title = I18nUtil.getI18nString(title);
				atag.attr.title = title;
			}
		}
		
		atag.attr.href = "#";

		//calculate the clickable
		var clickable = false;
		if(this.widgetProps) {
			if((!this.widgetProps.dataNameForClickable  || this.grid.store.getValue(rowd, this.widgetProps.dataNameForClickable)) && ((this.widgetProps.dataNameForLink && this.grid.store.getValue(rowd, this.widgetProps.dataNameForLink)) || this.widgetProps.flowEvent)) {
				clickable = true; 
			} 
		}

		// write the tag
		if(this.widgetProps.renderMode == "image") {
			var titleAttr = title ? "title=\"" + title + "\"" : "";
			if(inData) {
				var srcAttr = inData ? "src=\"" + inData + "\"" : "";
				var cellWidgetIdAttr = this.id ? " cellWidgetId" + '="' + this.id + '" ' : "";
				return "<img " + srcAttr + (clickable ? "":" style = \"filter:Alpha(opacity=10);-moz-opacity:.1;opacity:0.1;\" " ) + titleAttr + cellWidgetIdAttr + " />";
			} else {
				return "";
			}
		} else {
			if(clickable) {
				atag.tn = "a";
			} else {
				atag.tn = "span";
			}
			var os = "<" + atag.tn + " ";
			for (var key in atag.attr)
			{
				os += key + '="' + atag.attr[key] + '" ';
			} 
			if(this.id) {
				os += "cellWidgetId" + '="' + this.id + '"';
			}
			os += ">" + this.handleNewLine(atag.ih) + "</" + atag.tn + ">";		
			return os;
		}
	}
});

dojo.declare("dojox.btt.grid.cells.Button", [dojox.btt.grid.cells.BaseCellWidget, dojox.btt.grid.cells._LinkMixin], {

	_tagartTagName : "SPAN",
	
	_tagartTagName : {"SPAN":true},
	
	bttformatter : function(inData, rowIndex) {
		var rowd = this.grid.getItem(rowIndex);
		if(rowd){
		}else{
			return "";
		}
		
		// calculate the text
		var text;
		if(this.field && inData) {
			text = inData;
		} else if(this.widgetProps && this.widgetProps.linkText){
			text = this.widgetProps.linkText;
		}
		text = text ? I18nUtil.getI18nString(text) : "";
		
//		var rowd = this.grid.getItem(rowIndex);

		// calculate the tooltip
		var title;
		if (this.widgetProps){
			var title;
			if(this.widgetProps.dataNameForTooltip) {
				title = this.grid.store.getValue(rowd, this.widgetProps.dataNameForTooltip); 
			}
			if(!title) {
				title = this.widgetProps.tooltip;
			}
			if(title) {
				title =  I18nUtil.getI18nString(title);
			}
		}
		
		//calculate the clickable
		var clickable = false;
		if(this.widgetProps) {
			if((!this.widgetProps.dataNameForClickable  || this.grid.store.getValue(rowd, this.widgetProps.dataNameForClickable)) && ((this.widgetProps.dataNameForLink && this.grid.store.getValue(rowd, this.widgetProps.dataNameForLink)) || this.widgetProps.flowEvent)) {
				clickable = true;
			}
		}
		
		var titleAttr = title ? "title=\"" + title + "\"" : "";
		var clickableClassStr = clickable ? "" : " dijitButtonDisabled dijitDisabled ";
		var cellWidgetIdAttr = this.id ? " cellWidgetId" + '="' + this.id + '" ' : "";
		if(text)
			return "<span tabIndex=\"0\" class=\"dijit dijitReset dijitInline dijitButton" + clickableClassStr + "\"" + titleAttr + cellWidgetIdAttr +" ><span class=\"dijitReset dijitInline dijitButtonNode\">"
			+ "<div style=\"background: none repeat scroll 0% 0% transparent; -moz-user-select: none;\" class=\"dijitReset dijitStretch dijitButtonContents focusNode\">"
			+ "<span class=\"dijitReset dijitInline dijitButtonText\">"
			+ this.handleNewLine(text) + "</span></div></span></span>";
		else
			return "";

	}
	
});

dojo.declare("dojox.btt.grid.cells.Content", [dojox.btt.grid.cells.BaseCellWidget], {

	bttformatter : function(inData, idx) {
		
		if(this.widgetProps) {
			if(this.widgetProps.formatterStr){
				if(this._getBTTParamsStrForFmt == null)
					this._getBTTParamsStrForFmt = dojo.hitch(this, this._getBTTParamsStr);
				//bind event
				if(this._addEventForFmt == null) 
					this._addEventForFmt =  dojo.hitch(this, function(rowIndex, wId, eventName, func ){
						var item = this.grid.getItem(rowIndex);
						var identity = this.grid.store.getIdentity(item);
						var tempId = identity != null ? identity : rowIndex;
						this.grid.eventArray[tempId] = this.grid.eventArray[tempId] || {};
						this.grid.eventArray[tempId][wId] = this.grid.eventArray[tempId][wId] || {};
						this.grid.eventArray[tempId][wId][eventName] = func;
					});
				//set state
				if(this._setStateForFmt == null)
					this._setStateForFmt = dojo.hitch(this, function(rowIndex, wId, key, value) {
						var item = this.grid.getItem(rowIndex);
						var identity = this.grid.store.getIdentity(item);
						var tempId = identity != null ? identity : rowIndex;
						this.grid.stateArray[tempId] = this.grid.stateArray[tempId] || {};
						this.grid.stateArray[tempId][wId] = this.grid.stateArray[tempId][wId] || {};
						this.grid.stateArray[tempId][wId]['state'] = this.grid.stateArray[tempId][wId]['state'] || {};
						this.grid.stateArray[tempId][wId]['state'][key] = value;
					});
				
				//setStateInitializer
				if(this._addStateInitForFmt == null)
					this._addStateInitForFmt = dojo.hitch(this,  function(rowIndex, wId, func) {
						var item = this.grid.getItem(rowIndex);
						var identity = this.grid.store.getIdentity(item);
						var tempId = identity != null ? identity : rowIndex;
						this.grid.stateArray[tempId] = this.grid.stateArray[tempId] || {};
						this.grid.stateArray[tempId][wId] = this.grid.stateArray[tempId][wId] || {};
						this.grid.stateArray[tempId][wId]['state'] = this.grid.stateArray[tempId][wId]['state'] || {};
						this.grid.stateArray[tempId][wId]['stateInit'] = func;
					});
				
				eval("var getBTTParamsStr = this._getBTTParamsStrForFmt;" + 
					 "var addEvent = this._addEventForFmt;" + 
					 "var setState = this._setStateForFmt;" + 
					 "var addStateInit = this._addStateInitForFmt;" +
					 "var f = " + this.widgetProps.formatterStr);
				var v;
				try {
					v = f(inData, idx, this.grid);
				} catch(e) {
					console.error("Exception caught when running formatter, please check your formatter content of column \"" +
							this.id + "\" in table \"" + this.grid.id + "\"." + " Detail message:\n" + e);
					v = "";
				}
				delete getBTTParamsStr;
				delete addEvent;
				delete setState;
				delete addStateInit;
				delete f;
				return v;
			}else if(this.widgetProps.content) {
				if(typeof this.widgetProps.content == "object") {
					var tempValue = "";
					for(var j = 0; j < this.widgetProps.content.length; j++) {
						var widgetConf = this.widgetProps.content[j];
						var widgetStr = "<div ";
						for (var p in widgetConf ){
							widgetStr += p + "=\"" +  widgetConf[p] + "\" ";
						}
						widgetStr += "></div>"
						tempValue += widgetStr;	
					}
					return tempValue;
				} else if(inData) {
					return this.widgetProps.content.replace("{value}", I18nUtil.getI18nString(inData));
				} else {
					return this.widgetProps.content ;
				}
			}
		} 
		
		return "";
	},
	
	_getBTTParams : function(param) {
		if(param.type == "submit" || param.type == "save" || param.type == "cancel" || param.type == "linkin") {
			var bttParams = dojo.fromJson(this.grid.bttParam4Link);
			if(param.flowId) {
				bttParams['dse_nextEventName']  = param.flowEvent ? param.flowEvent : 'start';
				bttParams['dse_operationName'] = param.flowId;
				bttParams['dse_processorState'] = 'initial';
				delete bttParams['dse_processorId'];
			} else if (param.flowEvent){
				bttParams['dse_nextEventName']  = param.flowEvent;
			} else if (param.operationId){
				bttParams['dse_operationName'] = param.operationId;
				bttParams['dse_processorState'] = 'initial';
				delete bttParams['dse_processorId'];	
				delete bttParams['dse_nextEventName'];
			}
			return bttParams;
		} 
	},
	
	_getBTTParamsStr : function(param) {
		var bttParams = this._getBTTParams(param);
		var pStr = dojo.toJson(bttParams);
		return pStr.replace(/\"/g, "&#039;");;
	},
	
	_onClick : function(e){},
	
	_getBTTParamsStrForFmt : null,
	
	_addEventForFmt : null,
	
	_setStateForFmt : null,
	
	_addStateInitForFmt : null
	
});


dojo.declare("dojox.btt.grid.cells.MultiCellWidget", null, {
	
	widgetClass : null,
	
	constructor : function(){
		if(!dojox.btt.grid.cells.MultiCellWidget.classMap) {
			dojox.btt.grid.cells.MultiCellWidget.classMap = {};
		}
		
		if(this.widgetClass) {
			dojox.btt.grid.cells.MultiCellWidget.classMap[this.widgetClass.prototype.declaredClass] = dojo.hitch(this, this.init);
		}
		
	},
	
	init : function() {}
});

new dojox.btt.grid.cells.MultiCellWidget();


dojo.declare("dojox.btt.grid.cells.MultiCellLabel", dojox.btt.grid.cells.MultiCellWidget, {
	
	widgetClass : com.ibm.btt.dijit.Label,
	
	init : function(widget, dataStore, item) {
		if(item && widget["cellWidgetDataName"]) {
			var value = dataStore.getValue(item, widget["cellWidgetDataName"]);
			if(value) {
				widget.set("text", value);
			}
		}
	}
});

new dojox.btt.grid.cells.MultiCellLabel();


dojo.declare("dojox.btt.grid.cells.MultiCellImage", dojox.btt.grid.cells.MultiCellWidget, {
	
	widgetClass : com.ibm.btt.dijit.Image,
	
	init : function(widget, dataStore, item) {
		if(item && widget["cellWidgetDataName"]) {
			var location = dataStore.getValue(item, widget["cellWidgetDataName"]);
			if(location) {
				widget.set("location", location);
			}
		}
	}
});

new dojox.btt.grid.cells.MultiCellImage();
	





}

if(!dojo._hasResource["com.ibm.btt.dijit.QueryReadStore"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.QueryReadStore"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2011 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.dijit.QueryReadStore"); 



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

}

if(!dojo._hasResource["com.ibm.btt.util.BTTTooltip"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.util.BTTTooltip"] = true;
dojo.provide("com.ibm.btt.util.BTTTooltip");
dojo.getObject("com.ibm.btt.util.BTTTooltip", true); 

dojo.declare(
		"com.ibm.btt.util.BTTTooltip",
		[dijit._MasterTooltip],
		{
			show: function(/*String*/ innerHTML, /*DomNode*/ aroundNode, /*String[]?*/ position, /*Boolean*/ rtl, /*Event*/e){
				// summary:
				//		Display tooltip w/specified contents to right of specified node
				//		(To left if there's no space on the right, or if rtl == true)

				if(this.aroundNode && this.aroundNode === aroundNode){
					return;
				}

				// reset width; it may have been set by orient() on a previous tooltip show()
				this.domNode.width = "auto";

				if(this.fadeOut.status() == "playing"){
					// previous tooltip is being hidden; wait until the hide completes then show new one
					this._onDeck=arguments;
					return;
				}
				this.containerNode.innerHTML=innerHTML;

				var aroundNodePos = dojo.position(aroundNode, true);
				if(dojo.isIE<9 && ("mousePoint"==position || "textEnd"==position)){ // IE8 doesn't support "mousePoint" and "textEnd"
					position = dijit.Tooltip.defaultPosition;
				}
				// place the node around the calculated rectangle
				if("mousePoint" == position){
					dijit._placeOnScreenAroundRect(this.domNode,e.clientX, aroundNodePos.y, 0, aroundNodePos.h, dijit.getPopupAroundAlignment(dijit.Tooltip.defaultPosition, !rtl), dojo.hitch(this, "orient"));
				}else if("textEnd" == position){
					var xPosition = aroundNodePos.x + aroundNodePos.w/2;
					var textWidth = aroundNode.childNodes[0].offsetWidth;
					if(dojo.query(".dojoxEllipsis",aroundNode)[0]){
						textWidth = dojo.query(".dojoxEllipsis",aroundNode)[0].childNodes[0].offsetWidth;
					}
					if(textWidth < aroundNodePos.w && textWidth != 0){
						if(textWidth < aroundNodePos.w)
							xPosition = aroundNodePos.x + textWidth;
					}
					dijit._placeOnScreenAroundRect(this.domNode,xPosition, aroundNodePos.y, 0, aroundNodePos.h, dijit.getPopupAroundAlignment(dijit.Tooltip.defaultPosition, !rtl), dojo.hitch(this, "orient"));
				}else{
					dijit.placeOnScreenAroundElement(this.domNode, aroundNode, dijit.getPopupAroundAlignment((position && position.length) ? position : dijit.Tooltip.defaultPosition, !rtl), dojo.hitch(this, "orient"));
				}
				// show it
				dojo.style(this.domNode, "opacity", 0);
				this.fadeIn.play();
				this.isShowingNow = true;
				this.aroundNode = aroundNode;
			}

		}
	);

dijit.showBTTTooltip = function(/*String*/ innerHTML, /*DomNode*/ aroundNode, /*String[]?*/ position, /*Boolean*/ rtl, /*Event*/e){
		if(!dijit._masterTT_BTT){ dijit._masterTT_BTT = new com.ibm.btt.util.BTTTooltip(); }
		return dijit._masterTT_BTT.show(innerHTML, aroundNode, position, rtl, e);
};

dijit.hiddenBTTTooltip = function(/*DomNode*/ aroundNode){
	if(dijit._masterTT_BTT){
		return dijit._masterTT_BTT.hide(aroundNode);
	}
};

}

if(!dojo._hasResource["com.ibm.btt.dijit.Grid"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.Grid"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure 
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Grid"); 


 












dojo.declare("com.ibm.btt.dijit.CloseMenuItem", dijit.MenuItem, {
	templateString: dojo.cache("com.ibm.btt.dijit", "templates/CloseMenuItem.html", "<tr class=\"dijitReset dijitMenuItem\" dojoAttachPoint=\"focusNode\" waiRole=\"menuitem\" tabIndex=\"-1\"\r\n\t\tdojoAttachEvent=\"onmouseenter:_onHover,onmouseleave:_onUnhover,ondijitclick:_onClick\">\r\n\t<td class=\"dijitReset dijitMenuItemIconCell\" waiRole=\"presentation\">\r\n\t\t<img src=\"${_blankGif}\" alt=\"\" class=\"dijitIcon dijitMenuItemIcon\" dojoAttachPoint=\"iconNode\"/>\r\n\t</td>\r\n\t<td class=\"dijitReset dijitMenuItemLabel\" colspan=\"2\" dojoAttachPoint=\"containerNode\"></td>\r\n\t<td class=\"dijitReset dijitMenuItemAccelKey\" style=\"display: none\" dojoAttachPoint=\"accelKeyNode\"></td>\r\n\t<td class=\"dijitReset dijitMenuArrowCell\" waiRole=\"presentation\">\r\n\t\t<div dojoAttachPoint=\"closeButton\" dojoAttachEvent=\"onclick:_onCloseButtonClick\" >X</div>\r\n\t</td>\r\n</tr>\r\n"),
	
	_onCloseButtonClick: function(evt){
		// summary:
		//		Internal handler for click events on MenuItem.
		// tags:
		//		private
		this.getParent()._onBlur();
		//this.getParent().onItemClick(this, evt);
		dojo.stopEvent(evt);
	}

});


dojo.declare("com.ibm.btt.dijit.Menu", dijit.Menu, {
	
	position : "",
	
	grid : null,
	
	_scheduleOpen: function(/*DomNode?*/ target, /*DomNode?*/ iframe, /*Object?*/ coords){
		if(coords != null && (coords.x == 0 || coords.y == 0)) {
			this.inherited(arguments,[target, iframe]);
		}
		else {
			this.inherited(arguments);
		}
	},
	
	_openMyself: function(args){
		// summary:
		//		Internal function for opening myself when the user does a right-click or something similar.
		// args:
		//		This is an Object containing:
		//		* target:
		//			The node that is being clicked
		//		* iframe:
		//			If an <iframe> is being clicked, iframe points to that iframe
		//		* coords:
		//			Put menu at specified x/y position in viewport, or if iframe is
		//			specified, then relative to iframe.
		//
		//		_openMyself() formerly took the event object, and since various code references
		//		evt.target (after connecting to _openMyself()), using an Object for parameters
		//		(so that old code still works).

		var target = args.target,
			iframe = args.iframe,
			coords = args.coords;
		
		var rowNode = target;
		while(!(rowNode.tagName && rowNode.tagName.toLowerCase() == "div") || !dojo.hasClass(rowNode, "dojoxGridRow")) {
			rowNode = rowNode.parentNode;
		}
		
		var temp = target;
		if(!iframe) {
			while(!dojo.attr(temp, "cellWidgetId") && !dojo.attr(temp, "widgetId")) {
				temp = temp.parentNode;
			}
		}
		target = temp;
	
		var orgHeight = dojo.position(rowNode, true).h;
		// Get coordinates to open menu, either at specified (mouse) position or (if triggered via keyboard)
		// then near the node the menu is assigned to.
		if(this.position == "below") {
			coords = null;
			coords = dojo.position(target, true);
			var wrapper = dijit.popup._createWrapper(this);
			dojo.style(wrapper, "display", "block");
			menuCoords = dojo.position(wrapper, true);
			dojo.style(wrapper, "display", "none");
			coords.y += coords.h + 5;
			coords.x = coords.x - (menuCoords.w - coords.w)/2;
			
		} else
		
		if(coords){
			if(iframe){
				// Specified coordinates are on <body> node of an <iframe>, convert to match main document
				var od = target.ownerDocument,
					ifc = dojo.position(iframe, true),
					win = this._iframeContentWindow(iframe),
					scroll = dojo.withGlobal(win, "_docScroll", dojo);
	
				var cs = dojo.getComputedStyle(iframe),
					tp = dojo._toPixelValue,
					left = (dojo.isIE && dojo.isQuirks ? 0 : tp(iframe, cs.paddingLeft)) + (dojo.isIE && dojo.isQuirks ? tp(iframe, cs.borderLeftWidth) : 0),
					top = (dojo.isIE && dojo.isQuirks ? 0 : tp(iframe, cs.paddingTop)) + (dojo.isIE && dojo.isQuirks ? tp(iframe, cs.borderTopWidth) : 0);

				coords.x += ifc.x + left - scroll.x;
				coords.y += ifc.y + top - scroll.y;
			}
		}else{
			coords = dojo.position(target, true);
			coords.x += 10;
			coords.y += 10;
		}
		
		if(this.grid && this.grid.edit) {
			this.grid.edit.apply();
		}
		var newHeight = dojo.position(rowNode, true).h;
		if(this.position == "below") {
			coords.y += (newHeight - orgHeight)/2;
		}

		var self=this;
		var savedFocus = dijit.getFocus(this);
		function closeAndRestoreFocus(){
			// user has clicked on a menu or popup
			if(self.refocus){
				dijit.focus(savedFocus);
			}
			dijit.popup.close(self);
		}
		dijit.popup.open({
			popup: this,
			x: coords.x,
			y: coords.y,
			onExecute: closeAndRestoreFocus,
			onCancel: closeAndRestoreFocus,
			orient: this.isLeftToRight() ? 'L' : 'R'
		});
		
		this.focus();

		this._onBlur = function(){
			this.inherited('_onBlur', arguments);
			// Usually the parent closes the child widget but if this is a context
			// menu then there is no parent
			dijit.popup.close(this);
			// don't try to restore focus; user has clicked another part of the screen
			// and set focus there
		};
	}

});
/**
 * BTT extended GRID, it supports 
 * 1. Data submit in a form
 * 2. Bind table data to a BTT context variable
 * 3. Edit table data and submit back to BTT Server
 * 4. BTT widget common property support like visibility etc.
 */
dojo.declare("com.ibm.btt.dijit.Grid",[ dojox.grid.EnhancedGrid,
						com.ibm.btt.dijit.AbstractWidgetMixin ],{
	
	storeDataName : "",
	
	templateString: dojo.cache("com.ibm.btt.dijit", "templates/Grid.html", "<div hidefocus=\"hidefocus\" role=\"grid\" dojoAttachEvent=\"onmouseout:_mouseOut\">\r\n\t\r\n\t<div class=\"dojoxGridMasterHeader\" dojoAttachPoint=\"viewsHeaderNode\" role=\"presentation\"></div>\r\n\t<div class=\"dojoxGridErroressages\" style=\"display: none;\" dojoAttachPoint=\"errorMessageNode\"></div>\r\n\t<div class=\"dojoxGridMasterView\" dojoAttachPoint=\"viewsNode\" role=\"presentation\"></div>\r\n\t<div class=\"dojoxGridMasterMessages\" style=\"display: none;\" dojoAttachPoint=\"messagesNode\"></div>\r\n\t<span dojoAttachPoint=\"lastFocusNode\" tabindex=\"0\"></span>\r\n\t\r\n</div>\r\n"),
	
	name : "",
	
	width:"",
	
	storeData : "",
	
	comparatorMap : "",
	
	height : "300",
	
	//editable : false,
	
	sortEnabled: false,
	
	rows_append : false,
	
	/**
	 * 
	 * flag to identify whether this grid is loaded for the first time
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_firstTimeLoaded:true, 
	
	SELECTION_VALID_STATE: true,
	
	selectionMode : "none",
	
	selectionRequired : false,
	
	selectable : false,
	
	launchNew : false,
	/**
	 * 
	 * internal nls bundle
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_bundle : new com.ibm.btt.util.I18nBundle("com.ibm.btt.dijit", "Grid"),
	
	/**
	 * readOnly, default value is false
	 */
	readOnly: false, 
	
	/**
	 * disable, default value is false
	 */
	disabled: false,
	
	isActionable : false,
	
	bttParams : "",
	
	bttParam4Link : "",
	
	columnIndex : -1,
	
	rowIndex : -1,
	
	noDataMessage: "",

	clickedMenuItemId : "",
	
	clickedWidgetId : "",
	
	contextMenus:{},
	
	_bindingMenuMap:{},
	
	_submitButtonForContextMenu:null,
	
	_saveCancelButtonForContextMenu:null,

	summary : "",

	cellOverflow:"ellipsis",//option["whole","ellipsis"]
	
	// for ibk
	eventArray : {},
	
	stateArray : {},
	
	headerRows : 1,
	
	create : function(){
	
		this._eventHandlers = [];
		this.inherited(arguments);
		
	},
	
	postCreate : function() {
	
		this.inherited(arguments);
			
		if(this.selectable){
//			console.debug("grid", this);
			this._eventHandlers.push(dojo.connect(this, "postrender", this, function(){
				//this.checkSelectionNum();
				if(this.aew != undefined){
					for(var i = 0; i< this.aew.length; i++){
						if(this.aew[i]){
							var unchecks = dojo.filter(this.aew[i], function(cell){
								return cell.get("isChecked") == false;
							});
							if(unchecks.length == 0){
								if(this.aewh != undefined && this.aewh[i]){
									this.aewh[i].set("isChecked", true);
								}
							}
						}
					}
				}
				if(this.pagination){
					this._eventHandlers.push(dojo.connect(this.pagination.plugin, "gotoPage", this, function(){
						console.debug("the selection before", this.selection);
						this.selection.deselectAll();
						console.debug("the selection after", this.selection);
					}));			
				}
			}));
			this._eventHandlers.push(dojo.connect(this, "onSelectionChanged", this, this.checkSelectionNum));
		}
// for X070, this is necessary in any case
//		if(this.sortEnabled)
		{
			this._eventHandlers.push(dojo.connect(this, "onHeaderCellClick", this, function(e){
				if(dojo.hasClass(e.target, 'dojoxGridSortBtnSingle') || dojo.hasClass(e.target, 'dojoxGridSortBtnNested')){
					console.debug("the selection before", this.selection);
					this.selection.deselectAll();
					console.debug("the selection after", this.selection);
				}
			}));
		}
		
		this._eventHandlers.push(dojo.connect(this, "_onFetchComplete", this, function(){
			this.checkSelectionNum();
		}));
		
		//Fix defect 25178
		this._eventHandlers.push(dojo.connect(this, "onKeyDown", this, function(e){
			if(e.cell){
				if(e.rowIndex < 0 ){
					// header
					if(e.cell.alwaysEditing){
						if(e.keyCode == dojo.keys.SPACE){
							this.focus.currentArea("header", true);
							if(this.aewh && this.aewh[e.cellIndex]){
								var w = this.aewh[e.cellIndex];
								if(w.get("checked") == true){
									w.set("checked", false);
								}else{
									w.set("checked", true);
								}
								w["preserve"] = false;
							}
							setTimeout(dojo.hitch(this, function(){
								this.focus.currentArea("header", true);
								this.focus._delayedHeaderFocus();
								e.cellNode.focus();
							}), 500);
							
							dojo.stopEvent(e);
						}
					}
				}else{
					// content
					if(e.cell.alwaysEditing){
						if(e.keyCode == dojo.keys.SPACE){
							var fake = {};
							fake.target = {};
							fake.target.tagName = "INPUT";
							fake.dispatch = "doclick";
							fake.cell = e.cell;
							fake.rowIndex = e.rowIndex;
							this.edit.dispatchEvent(fake);
							this.edit.apply();
							this.focus.currentArea("content", true);
							dojo.stopEvent(e);
						}
					} else if(e.shiftKey && e.keyCode == dojo.keys.F9) {
						var node = e.cell.getNode(e.rowIndex);
						var nodes = dojo.query('[widgetId]', node);
						if(this.focusWidgetId) {
							var index = -1;
							for(var j = 0; j < nodes.length; j++) {
								if( dojo.attr(nodes[j],"widgetId") == this.focusWidgetId) {
									index = j;
									break;
								}
							}
							if(index >= 0) {
								var nextIndex = index == nodes.length - 1 ? 0 : index + 1;
								dijit.byNode(nodes[nextIndex]).focus();
								this.focusWidgetId = dojo.attr(nodes[nextIndex], "widgetId");
							}
						}
					} 
				}
			}
			
			this._set("state", this._getState());
		}));
		
		this._eventHandlers.push(dojo.connect(this, "onCellFocus", this, function(inCell, inRowIndex){
			var node = inCell.getNode(inRowIndex);
			var nodes = dojo.query('[cellWidgetId]', node);
			if(nodes.length > 0) {
				nodes[0].focus();
			} else {
				var nodes = dojo.query('[widgetId]', node);
				if(nodes.length > 0) {
					dijit.byNode(nodes[0]).focus();
					this.focusWidgetId = dojo.attr(nodes[0],"widgetId");
				}
			}
		}));
		
//		if (!this.selectionRequired) 
		{
			this._eventHandlers.push(dojo.connect(this.domNode, "onkeyup", this, function(e){
				if (e.keyCode==dojo.keys.ESCAPE)
				{
					this.selection.deselectAll();
				}
			}));
		}

//		//Fix defect 25203
//		if (this.selectionMode === "single") {
//			this._eventHandlers.push(dojo.connect(this.selection, "addToSelection", this, function(inIndex) {
//				if (this._lastSelectedIndex === inIndex) {
//					this.selection.deselectAll();
//					this._lastSelectedIndex = undefined;
//				} else {
//					this._lastSelectedIndex = inIndex;
//				}
//			}));
//		}
		// re-Fix defect 25203 for keyboard support
		if (this.selectionMode=="single" 
//			&& !this.selectionRequired
			){
			this.selection.select = dojo.hitch(this.selection, function(inIndex) {
				if(this.isSelected(inIndex))
				{
					this.deselect(inIndex);
				}else{
					this.deselectAll(inIndex);
					this.addToSelection(inIndex);
				}
			});
			
			this.selection.clickSelectEvent = dojo.hitch(this.selection, function(e) {
				if (e.type == "keydown") return;
				this.clickSelect(e.rowIndex, dojo.isCopyKey(e), e.shiftKey);
			});
		}
		
		this.errorMessageIcon = dojo.create("div", {"class":"errorMessageIcon", "style":"display:none;"}, this.viewsHeaderNode, "last");
		
		//Add listener to listen cell widget click event 
		//and then to notify cell widget itself was clicked
		this._eventHandlers.push(dojo.connect(this, "onCellClick", this, this._onCellWidgetClick));
		//PMR31194
		//check each cell to see if there is a defined in the cell widget.
		//if there is one, add it into the store comparatorMap
		this._setComparatorForColunm();
		
		
		this._eventHandlers.push(dojo.connect(this, "onRowDblClick", this, this._onRowDblClick));
		
		this._eventHandlers.push(dojo.connect(this, "onRowClick", this, this._onRowClick));
		this._eventHandlers.push(dojo.connect(this.domNode, "onkeydown", this, this._onKeyEvent));
		this._eventHandlers.push(dojo.connect(this.domNode, "onkeyup", this, this._onKeyEvent));
		this._eventHandlers.push(dojo.connect(this.edit, "setEditCell", this, this._onCellEdit));
		// G003
		var _t = this;
		dojo.forEach(this.views.views, function(view){
			_t._eventHandlers.push(dojo.connect(view, 'onAfterRow', function(idx, cells, inRowNode){
				if(idx < 0){
					var cols = cells[0];
					for(var i = 0;i <cols.length; i++){
						if(cols[i] && cols[i].alwaysEditing && cols[i].titleStyle){
							switch (cols[i].titleStyle){
								case "text":
									//col.name = "HAHAHA";
									break;
								case "checkbox":
									var w = null;
									if(! _t.aewh)_t.aewh = [];
									try{
										if(_t.aewh[i]){
											if(_t.aewh[i].destroy) _t.aewh[i].destroy();
										}
										_t.aewh[i] = w = new com.ibm.btt.dijit.CheckBox({});
										w.placeAt(inRowNode.firstChild.rows[0].cells[i].firstChild, "only");
									}catch(e){
										
									}
									w.set("text", " ");
									w["col"] = i;
									_t._eventHandlers.push(dojo.connect(w, "onChange", w, function(value){
										if(this.preserve != undefined && this.preserve == true){ return;}
										dojo.forEach(_t.aew[w.col], function(widget){
											widget.set("isChecked", value);
											_t.setCellValueByName(widget.field, widget.row, value);
										});
									}));
									_t._eventHandlers.push(dojo.connect(w, "onClick", w, function(value){
										this["preserve"] = false;
									}));
									break;
								case "both":
									var w = null;
									if(! _t.aewh)_t.aewh = [];
									try{
										if(_t.aewh[i]){
											if(_t.aewh[i].destroy) _t.aewh[i].destroy();
										}
										_t.aewh[i] = w = new com.ibm.btt.dijit.CheckBox({});
										w.placeAt(inRowNode.firstChild.rows[0].cells[i].firstChild, "only");
									}catch(e){
										
									}
									w.set("text", cols[i].name);
									dojo.place(w.labelNode,w.domNode,"after");
									w["col"] = i;
									_t._eventHandlers.push(dojo.connect(w, "onChange", w, function(value){
										if(this.preserve != undefined && this.preserve == true){ return;}
										dojo.forEach(_t.aew[w.col], function(widget){
											widget.set("isChecked", value);
											_t.setCellValueByName(widget.field, widget.row, value);
										});
									}));
									_t._eventHandlers.push(dojo.connect(w, "onClick", w, function(value){
										this["preserve"] = false;
									}));
									break;
							}
						}
					}
				}
			}));
		});
		// Setting checked for a RadioButton inside a Radio column, must set others to unchecked.
		this._eventHandlers.push(dojo.connect(this, "_onSet", this, function(item, attribute, oldValue, newValue){
			var cols = dojo.filter(this.layout.cells, function(col){
				return col.field == attribute;
			});
			var col = cols.length > 0 ? cols[0]: undefined;
			if(col && col.alwaysEditing){
				if(col && col.widget && col.widget instanceof com.ibm.btt.dijit.RadioButton){
					if(String(newValue) == col.widget.checkedValue){
						var idx = this.getItemIndex(item);
						if(idx > -1 ){
							var count = this.get("rowCount");
							for(var i=0; i< count; i++){
								if(i != idx){
									var item = this.getItem(i);
									if(item){
										this.store.setValue(item, attribute, col.widget.unCheckedValue);
									}
								}
							}
						}
					}
					if(String(oldValue) != String(newValue)){
						if(this.colWidget && this.colWidget[col.index]){
							this.colWidget[col.index].onChange(newValue);
						}
					}
					if(this.invalidated != undefined) this.invalidated.all = true;
				}else if(col && col.widget && col.widget instanceof com.ibm.btt.dijit.CheckBox){
					if(String(oldValue) != String(newValue)){
						if(this.colWidget && this.colWidget[col.index]){
							this.colWidget[col.index].onChange(newValue);
						}
					}
					if(this.invalidated != undefined) this.invalidated.all = true;
				}
			}
		}));
		// G003
		
		this._eventHandlers.push(dojo.connect(this, "onCellMouseOver", this, this._onCellMouseOver));//IBK4-7
		this._eventHandlers.push(dojo.connect(this, "onCellMouseOut", this, this._onCellMouseOut));//IBK4-7
				
		if (dojo.isIE<8 || (dojo.isIE && this.headerRows > 1))
		{	
			var ps = this.plugin("nestedSorting");
			if (ps)
			{
				ps._doSort_IE7 = ps._doSort;
				ps._doSort = dojo.hitch(ps, function(cellIdx){
					this._doSort_IE7(cellIdx);
					this.grid._render();
				});
			}
		}
		
		var updateTriger = dojo.connect(this, "render", this, function() {
			var v = this.views.views[0];
			if(v) {
				var rowNode = v.getRowNode(0);
				if(rowNode) {
					var _this = this;
					dojo.query("img:first-of-type", rowNode).forEach(function(node){
						var imgSrc = dojo.attr(node, "src");
						if(imgSrc) {
							var request = {};
							if(imgSrc && imgSrc != "/") {
								if(imgSrc.indexOf("?") < 0) {
									request.url = imgSrc + "?" + "randomId=" + Math.random();
								} else {
									request.url = imgSrc + "&" + "randomId=" + Math.random();
								}
								request.load = function() {
									_this.resize();
								}
								dojo.xhrGet(request);
							}
						}
					});
				} 
			}
			dojo.disconnect(updateTriger);
		});
		this._eventHandlers.push(updateTriger);
		
		var _this = this;
		//added for context menu
		function addMenuItems(menu, items, closeMark ) {
			for(var j = 0; j < items.length; j ++) {
				if(items[j].menuItems) {
					var subMenu = new dijit.Menu({parentMenu:menu});
					menu.addChild(new dijit.PopupMenuItem({label:StringUtil.escapeEnterWrap(_this.getI18NString(items[j].text)), popup:subMenu}));
					addMenuItems(subMenu, items[j].menuItems, false);
				} else {
					if(closeMark && j == 0) {
						var menuItem = new com.ibm.btt.dijit.CloseMenuItem({label:StringUtil.escapeEnterWrap(_this.getI18NString(items[j].text))});
					} else {
						var menuItem = new dijit.MenuItem({label:StringUtil.escapeEnterWrap(_this.getI18NString(items[j].text))});
					}
					
					menu.addChild(menuItem);
					if(items[j].id)
						menuItem.itemId = items[j].id;
					if(items[j].type)
						menuItem.type= items[j].type;
					if(items[j].flowEvent)
						menuItem.flowEvent = items[j].flowEvent;
					if(items[j].flowId)
						menuItem.flowId = items[j].flowId;
					if(items[j].operationId)
						menuItem.operationId = items[j].operationId;
					if(items[j].newWindow == "true" || items[j].newWindow === true)
						menuItem.newWindow = true;
					else 
						menuItem.newWindow = false;
					if(items[j].url) 
						menuItem.url = items[j].url;
					dojo.connect(menuItem, "onClick", dojo.hitch(_this, _this._onMenuItemClick, menuItem));
					
				}
				
			}
		}
		
		for(var i = 0; i < this.contextMenus.length; i ++) {
			var mn = new com.ibm.btt.dijit.Menu({contextMenuForWindow:false, leftClickToOpen:this.contextMenus[i].leftClickToOpen == "true", position:this.contextMenus[i].position, grid:this });
			addMenuItems(mn, this.contextMenus[i].menuItems, this.contextMenus[i].hasCloseButton == "true");
			var cwName = this.contextMenus[i].bindingCellWidgetId;
			if(cwName) {
				if(!this._bindingMenuMap[cwName]) {
					this._bindingMenuMap[cwName] = [];
				}
				this._bindingMenuMap[cwName].push(mn);
			}
			
		}
		
		if(this.contextMenus.length) {
			this._submitButtonForContextMenu = new com.ibm.btt.dijit.Button({type:"submit", bttParams:{}, visibility:"gone"});
			this._submitButtonForContextMenu.placeAt(this.domNode);
			this._saveCancelButtonForContextMenu = new com.ibm.btt.dijit.Button({type:"save", bttParams:{}, visibility:"gone"});
			this._saveCancelButtonForContextMenu.placeAt(this.domNode);
		}
		
		//end added for context menu
		
		//mark frozen scroll bar //defect 29136
		/*dojo.query('.dojoxGridScrollbox', this.id).forEach(function(node, index, arr){
 			if("hidden" == dojo.style(node, "overflow")){
 				dojo.attr(node, "isFrozenScrollBar", true);
 			}
 		});*/ //defect 29275
		
		// BP33688, too many negative impact, should be re-fixed
//		this.focus._delayedCellFocus = function(e){
//			// summary:
//			//		Overwritten
//			this.currentArea("content", false);
//			_this.focus._isNavigating = true;
//			this.focusArea(this._currentAreaIdx);
//		};
		// BP33688

		var gcu = com.ibm.btt.util.GlobalConfigurationUtil;
		if (gcu && (gcu.getValue("kwcag.grid.role.presentation")===false || gcu.getValue("kwcag.grid.th.scope")))
		this._eventHandlers.push(dojo.connect(this, "postrender", this, function() {
			// remove the role=presentation in data grid for KWCAG
			if(gcu && gcu.getValue("kwcag.grid.role.presentation") === false){
				console.warn("kwcag.grid.role.presentation===false");
				console.warn("remove the role=presentation in data grid for KWCAG");
				dojo.query("[role=presentation]", this.domNode).forEach(function(node, index, arr){
					dojo.removeAttr(node, "role");
				});
			}
			// add the scope=col in the <th> of data grid for KWCAG
			if(gcu && gcu.getValue("kwcag.grid.th.scope")){
				console.warn("kwcag.grid.th.scope===col");
				console.warn("add the scope=col in the <th> of data grid for KWCAG");
				dojo.query("th[role=columnheader]", this.headerNodeContainer).forEach(function(node, index, arr){
					dojo.attr(node, "scope", "col");
				});
			}			
		}));
	},
	
	sizeChange : function() {
		this.inherited(arguments);
//		if(dojo.style(this.domNode, "visibility") == 'hidden') {
		if(this.isVisible()==false){
			dojo.query("a.dojoxGridSortBtn", this.headerNodeContainer).forEach(function(node, index, array){ 
				dojo.style(node, "visibility", "hidden");
			}); 
		}
	},

	_onMenuItemClick : function(mItem, ev) {
		this.clickedMenuItemId = mItem.itemId;
		this.onMenuItemClick();

		if(mItem.type == "submit" || mItem.type == "save" || mItem.type == "cancel") {
			var button;
			if (mItem.type == "submit") {
				button = this._submitButtonForContextMenu;
			} else {
				button = this._saveCancelButtonForContextMenu;
			}
			button.set('type', mItem.type);
			var bttParams = dojo.fromJson(this.bttParam4Link);
			if(mItem.flowId) {
				bttParams['dse_nextEventName']  = mItem.flowEvent ? mItem.flowEvent : 'start';
				bttParams['dse_operationName'] = mItem.flowId;
				bttParams['dse_processorState'] = 'initial';
				delete bttParams['dse_processorId'];
			} else if (mItem.flowEvent){
				bttParams['dse_nextEventName']  = mItem.flowEvent;
			} else if (mItem.operationId){
				bttParams['dse_operationName'] = mItem.operationId;
				bttParams['dse_processorState'] = 'initial';
				delete bttParams['dse_processorId'];	
				delete bttParams['dse_nextEventName'];
			}
			button.bttParams = bttParams;
			button._onButtonClick(ev);
		}  else if(mItem.type=="link") {
			var rowItem = this.getItem(this.rowIndex);
			var attArray = this.store.getAttributes(rowItem);
			var params = [];
			for(var i = 0; i < attArray.length; i ++) {
				var itemValue = this.store.getValue(rowItem, attArray[i]); 
				if(itemValue) {
					if(params.length > 0) {
						params.push("&");
					}
					params.push(attArray[i]);
					params.push("=");
					params.push(itemValue);
				}	
			}
			var url = mItem.url;
			if (url.toString().indexOf("?")>0) {
				url += '&' + params.join('');
			} else {
				url += '?' + params.join('');
			}
			var target = "_self";
			if(mItem.newWindow) {
				target = "_blank";
			}
			window.open(url, target);
		}

	},
	
	_onOneCellWidgetClick : function(widget) {
		this.onCellWidgetClick();
	},
	
	onMenuItemClick : function(){},
	
	onCellWidgetClick : function() {},
	
	updateRow: function(inRowIndex){
		inRowIndex = Number(inRowIndex);
		if(this.updating){
			this.invalidated[inRowIndex]=true;
		}else{
			this.views.updateRow(inRowIndex);
			var rowNodes = [];
			for(var i=0, v; v=this.views.views[i]; i++){
				var rowNode = v.getRowNode(inRowIndex);
				if(rowNode) {
					rowNodes.push(rowNode);
				}
			}
			this.bindWidgetAndContextMenu(inRowIndex, rowNodes);
			this.scroller.rowHeightChanged(inRowIndex);
		}
	},
	
	
	bindWidgetAndContextMenu : function(inRowIndex, rowNodes) {
		// do not do this to editing cell
		if(!(this.edit && this.edit.info && this.edit.info.rowIndex && this.edit.info.rowIndex == inRowIndex && this.edit.info.cell && this.edit.info.cell.editable == true)){
			if(this.cellOverflow == "ellipsis"){
				for(var i = 0,n; n = rowNodes[i]; i ++){
					dojo.query('.dojoxGridCell', n).forEach(function(node, index, arr){
						// do not do this to cell containing input widgets
						if(node.innerHTML.indexOf("<input") < 0 && node.innerHTML.indexOf("cellwidgetid") < 0 && dojo.query("> div.dijitCheckBox", node) == 0 && dojo.query("> div.dijitRadio", node) == 0){
							if("TD" === node.tagName){
								var ellpsisArray = dojo.query('.dojoxEllipsis', node);
								if(!ellpsisArray || ellpsisArray.length == 0){
									var nodeInnerHTML = node.innerHTML;
									node.innerHTML = "";
									var newNode = dojo.create("div",{ innerHTML: "<span>"+nodeInnerHTML+"</span>"},node);
									dojo.addClass(newNode, "dojoxEllipsis");
								}
							}
						}
				 	});
				}
			}else{
				for(var i = 0,n; n = rowNodes[i]; i ++){
					dojo.query('.dojoxGridCell', n).forEach(function(node, index, arr){
						// do not do this to cell containing input widgets
						if(node.innerHTML.indexOf("<input") < 0 && node.innerHTML.indexOf("cellwidgetid") < 0 && dojo.query("> div.dijitCheckBox", node) == 0 && dojo.query("> div.dijitRadio", node) == 0){
							if(!(node.innerHTML.indexOf("<span>") >=0 )){
								if("TD" === node.tagName){
									node.innerHTML = "<span>"+node.innerHTML+"</span>";
								}
							}
						}
			 		});
				}
			}
		}
		
		
		for(var i = 0,n; n = rowNodes[i]; i ++){
			dojo.parser.parse(n);
		}
		
		for(var k = 0; k < rowNodes.length; k ++) {
			var nodes = dojo.query('[cellWidgetId]', rowNodes[k]);
			for(var j = 0; j < nodes.length; j ++) {
				var cwId = dojo.attr(nodes[j], "cellWidgetId");
				if(cwId) {
					if(!this._eventHandlers) this._eventHandlers = [];
					var clickHanlder = dojo.hitch(this, function(rowIndex, widgetId) { this.rowIndex = rowIndex ; this.clickedWidgetId = widgetId; }, inRowIndex,  cwId);
					this._eventHandlers.push(dojo.connect(nodes[j], "click", clickHanlder));
					this._eventHandlers.push(dojo.connect(nodes[j], "contextmenu", clickHanlder));
					
					if(this._bindingMenuMap[cwId]) {
						for(var m = 0; m < this._bindingMenuMap[cwId].length; m ++) {
							this._bindingMenuMap[cwId][m].bindDomNode(nodes[j]);
						}
					}
				}
			}
			
			var widgets = dojo.query('[widgetId]', rowNodes[k]).map(dijit.byNode);
			for(var j = 0; j < widgets.length; j ++) {
				var cwId = widgets[j].get('cellWidgetId');
				var widget = widgets[j];
				if(cwId) {
					if(dojox.btt.grid.cells.MultiCellWidget.classMap[widget.declaredClass]) {
						dojox.btt.grid.cells.MultiCellWidget.classMap[widget.declaredClass](widget, this.store, this.getItem(inRowIndex));
					}
					var tmpItem = this.getItem(inRowIndex);
					var tempId = null;
					if(tmpItem){
						tempId = this.store.getIdentity(tmpItem);
					} 
					tempId = tempId != null ? tempId : inRowIndex;
					if(this.stateArray[tempId] && this.stateArray[tempId][cwId] && this.stateArray[tempId][cwId]['stateInit']) {
						this.stateArray[tempId][cwId]['stateInit'](inRowIndex, cwId, widget, widgets, this.stateArray[tempId][cwId]['state']);
					}
					if(!this._eventHandlers) this._eventHandlers = [];
					if(Engine.getInstance() instanceof com.ibm.btt.event.NavigationEngine) {
						if(widget.type != "undefined" && (
								widget.type == "save" || widget.type == "cancel")){
							var btnClick = widget._onButtonClick;
							widget._onButtonClick = dojo.hitch(Engine.getInstance(), Engine.getInstance()._onButtonClick, widget, btnClick);
							widget.hasEventBundle = true;
						}
						
						if(widget.domNode.nodeName === "A" ){
							widget.hasEventBundle = true;
							var linkClick = widget.onClick;
							widget.onClick = dojo.hitch(this, function(rowIndex, widget, e) {
								this.rowIndex = rowIndex;
								this.launchNew=true;
								var bttParams = !widget.bttParams ? null : (typeof widget.bttParams == "string"  ? dojo.fromJson(widget.bttParams) : widget.bttParams) ;
								this.launchNew = bttParams && bttParams['dse_processorId'] ? false : true;
								var values = this._getSelectedValue(false, true);
								var oldBTTParams = widget.bttParams;
								widget.domNode.href = widget.targetURL ? widget.targetURL : widget.domNode.href;
								if(widget.domNode.href && dojo.trim(widget.domNode.href) && (!bttParams || this.name) && values) {
									var isArray = dojo.isArray(values);
									tempObj = isArray ? values[0] : values;
									href = widget.domNode.href;
									var index = 0;
									for(var p in tempObj) {
										if(p) {
											var keyValue = (bttParams && this.name ? (isArray ? this.name + ".0." + p :(this.launchNew ? this.name : 'dse_tableSelectedRows' )+ "." + p) : p) + "=" + tempObj[p];
											href += (index == 0 && href.indexOf("?") < 0 ? "?":"&") + keyValue;
											index ++;
										}
									}
									widget.targetURL = widget.domNode.href;
									widget.domNode.href = href;
								}
								if(bttParams && this.name && values) {
									var obj = {};
									var _convertValueToString = function(vobj) {
										
										if(vobj === null) {
											return null;
										} 
										if(typeof vobj === "string") {
											return vobj;
										} else if(typeof vobj === "number" || typeof vobj === "boolean") {
											return String(vobj);
										} else if(typeof vobj === "object") {
											if(dojo.isArray(vobj)) {
												for(var i = 0; i < vobj.length; i++) {
													vobj[i] = arguments.callee(vobj[i]);
												}
											} else {
												for(var p in vobj) {
													if(p.indexOf("_") != 0){
														vobj[p] = arguments.callee(vobj[p]);
													}
												}
											}
											return vobj;
										} else {
											return null;
										}
										
									};
									if(this.launchNew) {
										obj[this.name] = _convertValueToString(values);
									} else {
										obj['dse_tableSelectedRows'] = _convertValueToString(values);
									}
									dojo.mixin(obj, bttParams);
									widget.bttParams = obj;
								} 
								Engine.getInstance()._onLinkClick(widget,linkClick, e);
								widget.bttParams  = oldBTTParams;
							}, inRowIndex, widget);
						}
					}
					this._eventHandlers.push(dojo.connect(widget, "onClick", dojo.hitch(this, function(rowIndex, widgetId, clickedWidget, rowWidgets) { 
						var tempId = this.store.getIdentity(this.getItem(rowIndex));
						tempId = tempId != null ? tempId : rowIndex;
						if(this.eventArray[tempId] && this.eventArray[tempId][widgetId] && this.eventArray[tempId][widgetId]['onClick']) {
							this.eventArray[tempId][widgetId]['onClick'](rowIndex, widgetId, widget, rowWidgets);
						}
						this.rowIndex = rowIndex ; 
						this.clickedWidgetId = widgetId;
						this._onOneCellWidgetClick(clickedWidget);
					}, inRowIndex,  cwId, widget, widgets)));
					this._eventHandlers.push(dojo.connect(widget.domNode, "contextmenu", dojo.hitch(this, function(rowIndex, widgetId, clickedWidget) { this.rowIndex = rowIndex ; this.clickedWidgetId = widgetId;}, inRowIndex,  cwId)));
					if(this._bindingMenuMap[cwId]) {
						for(var m = 0; m < this._bindingMenuMap[cwId].length; m ++) {
							this._bindingMenuMap[cwId][m].bindDomNode(widget.domNode);
						}
					}
				}
				
			}
		}
	} ,
	
	renderRow: function(inRowIndex, inNodes){
		this.inherited(arguments);
		var nodeArrayRd = [];
		var nodeArrayNotRd = [];
		for(var i = 0,n; n = inNodes[i]; i ++) {
			if(dojo.query('[cellWidgetId]', n.lastChild).length != 0) {
				nodeArrayRd.push(n.lastChild);
			} else {
				nodeArrayNotRd.push(n.lastChild);
			}
		}
		if(nodeArrayRd.length > 0) 
			this.bindWidgetAndContextMenu(inRowIndex, nodeArrayRd);
		if(nodeArrayNotRd.length > 0) 
			setTimeout(dojo.hitch(this, this.bindWidgetAndContextMenu, inRowIndex, nodeArrayNotRd), 10);
	}, 
	
	_setStructureAttr: function(structure){
		var s = structure;
		if(s && dojo.isString(s)){
			dojo.deprecated("dojox.grid._Grid.set('structure', 'objVar')", "use dojox.grid._Grid.set('structure', objVar) instead", "2.0");
			s=dojo.getObject(s);
		}
		this.structure = s;
		
		if(this.structure){
			for(var i = 0; i< structure.length; i++){
				for(var j = 0;j< structure[i].length; j++){
					if(structure[i][j].formatter){
						structure[i][j].formatter = function(data){ 
							if(!dojo.isString(data)) return data;
							data = data.split('\n').join('<br/>'); 
							data = data.split('\r').join('<br/>'); 
							return data; };
					}
				}
				
			}
		}
		this.inherited(arguments);
	},
	
	/**
	 * 
	 * hook method to notify celle widget this cell is clicked when this cell is not in edit mode
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onCellWidgetClick : function(e){
		if(e.cell.isRowSelector) return;
		// console.log("_onCellWidgetClick");
		if(e.cell._onClick){
			e.cell._onClick(e);
		}
	},
	
	_onKeyEvent : function(e){
		this._isCtrlPressed = e.ctrlKey;
		
		/*
		if(e.keyCode === dojo.keys.ENTER){
			var isEditing = this.edit.isEditing();
			this.edit.apply();
			if(!isEditing){
				this.edit.setEditCell(this.focus.cell, this.focus.rowIndex);
			}
		}
		*/
		
		// show/hide tooltips via keyboard for A11Y req.
		if (e.cell && e.cell._props && e.cell._props.isShowTooltip){	// test show/hide tooltip
			if(e.keyCode==dojo.keys.CTRL && e.type=="keydown"){
				// show tooltip for focused cell on pressing "CTRL" key
				var attrName = e.cell._props.tooltip;
				var tooltipPosition = e.cell._props.position;
//				var item = this.getItem(e.rowIndex);
//				var tooltipValue = item[attrName];
				var tooltipValue = this.getCellValueByName(attrName, e.rowIndex);
				var positionArray = tooltipPosition.split(";");
				dijit.showBTTTooltip(tooltipValue, e.cellNode, positionArray, false, e);
			}else if (e.keyCode==dojo.keys.CTRL && e.type=="keyup"){
				// hide tooltip on releasing the "CTRL" key
				dijit.hiddenBTTTooltip(e.cellNode);
				if(dijit._masterTT_BTT){
					dijit._masterTT_BTT._onDeck=null;
				}
			}
		}
	},
	
	_onCellEdit : function(inCell, inRowIndex){
		for ( var i = 0; i < this.layout.cells.length; i++) {
			if (this.layout.cells[i] == inCell) {
				this.columnIndex = i;
				break;
			}
		}
		this.rowIndex = inRowIndex;
		this.onCellEdit(this.columnIndex, this.rowIndex);
	},
	
	onCellEdit : function(){
		
	},
	
	_onCellMouseOver: function(e){//IBK4-7
		var isShowTooltip = e.cell._props.isShowTooltip;
		if(isShowTooltip){
			var attrName = e.cell._props.tooltip;
			var tooltipPosition = e.cell._props.position;
//			var item = this.getItem(e.rowIndex);
//			var tooltipValue = item[attrName];
			var tooltipValue = this.getCellValueByName(attrName, e.rowIndex);
			var positionArray = tooltipPosition.split(";");
//			dijit.showTooltip(tooltipValue, e.cellNode, positionArray);
			dijit.showBTTTooltip(tooltipValue, e.cellNode, positionArray, false, e);
		}
	},
	_onCellMouseOut: function(e){
		var cellPosition = dojo.position(e.cellNode,true);
		if(e.clientX > cellPosition.x && e.clientX < cellPosition.x + cellPosition.w && e.clientY > cellPosition.y && e.clientY < cellPosition.y + cellPosition.h){
			return;
		}
		var isShowTooltip = e.cell._props.isShowTooltip;
		if(isShowTooltip){
//			dijit.hideTooltip(e.cellNode);
			dijit.hiddenBTTTooltip(e.cellNode);
			// FIXME: make sure that pesky tooltip doesn't reappear!
			// would be nice if there were a way to hide tooltip without regard to aroundNode.
//			dijit._masterTT._onDeck=null;
			if(dijit._masterTT_BTT){
				dijit._masterTT_BTT._onDeck=null;
			}
		}
	},
	
	_onRowDblClick : function(e){
		
		for ( var i = 0; i < this.layout.cells.length; i++) {
			if (this.layout.cells[i] == e.cell) {
				this.columnIndex = i;
				break;
			}
		}
		this.rowIndex = e.rowIndex;
		
		
		if (this.selectionMode === "single") {
			if(!this.selection.isSelected(e.rowIndex)){
				this.selection.setSelected(e.rowIndex, true);			
			}
		} else if(this.selectionMode === "extended"){
			if (dojo.isIE <= 8 && this._isCtrlPressed) {
				this.selection.toggleSelect(e.rowIndex);
			}
		} else {
			
		}
		
		if(this.isActionable){
			if(this.readOnly === true || e.cell.editable === false){
				var form = this._getParentForm();
				if (this.bttParams != "" && form) {
					form.bttParams = this.bttParams;
					form.submit();
				}
			}
		}
		
	},
	
	_onRowClick : function(e){
		// console.log("_onRowClick");
		/*this._lastClickedRow = e.rowIndex;*/
		for ( var i = 0; i < this.layout.cells.length; i++) {
			if (this.layout.cells[i] == e.cell) {
				this.columnIndex = i;
				break;
			}
		}
		this.rowIndex = e.rowIndex;
		
		if((e.keyCode==dojo.keys.ENTER || e.keyCode==dojo.keys.SPACE) && e.cell._onClick){
			if(dojo.attr(e.target, "cellWidgetId") != null) {
				e.target.click();
				return;
			} 
			else 
			{
				dojo.query("[cellWidgetId]" ,e.target).forEach(function(node, index, arr){
					node.click();
					return;
				});
				
				var node = e.target;
				while(node && !dojo.hasClass(node, "dojoxGridCell")){
					var id = node.getAttribute && node.getAttribute("widgetId");
					if(id){
						e.target.click();
						return;
					}
					node = node.parentNode;
				}
			}
		} 
	},
	
	/*getLastClickedRowIndex : function(){
		if (this._lastClickedRow != undefined && this._lastClickedRow != null) {
			return this._lastClickedRow;
		} else {
			return -1;
		}
	},*/
	
	setCellValueByIndex: function(inColumnIndex, inRowIndex, inValue){
		console.warn("setCellValueByIndex() has been deprecated, please use setCellValueByName() instead!");
		var cell = this.layout.cells[inColumnIndex];
		var inAttrName;
		if (cell && cell.field) {
			inAttrName = cell.field;
		} else {
			return;
		}
		if(this.edit && this.edit.apply){
			this.edit.apply();
		}
		this.store.fetchItemByIdentity({
			identity : this._by_idx[inRowIndex].idty,
			onItem : dojo.hitch(this, function(item) {
				var oldValue = this.store.getValue(item, inAttrName);
				if (typeof oldValue == 'number') {
					inValue = isNaN(inValue) ? inValue : parseFloat(inValue);
				} else if (typeof oldValue == 'boolean') {
					inValue = inValue == 'true' ? true : inValue == 'false' ? false : inValue;
				} else if (oldValue instanceof Date) {
					var asDate = new Date(inValue);
					inValue = isNaN(asDate.getTime()) ? inValue : asDate;
				}
				this.store.setValue(item, inAttrName, inValue);
				var _this = this;
				setTimeout(function(){
					_this.focus.findAndFocusGridCell();
				}, 50);
			})
		});
	}, 
	
	getCellValueByIndex: function(inColumnIndex, inRowIndex){
		console.warn("getCellValueByIndex() has been deprecated, please use getCellValueByName() instead!");
		var cell = this.layout.cells[inColumnIndex];
		var inAttrName;
		if (cell && cell.field) {
			inAttrName = cell.field;
		} else {
			return undefined;
		}
		var oldValue;
		this.store.fetchItemByIdentity({
			identity: this._by_idx[inRowIndex].idty,
			onItem: dojo.hitch(this, function(item){
				oldValue = this.store.getValue(item, inAttrName);
			})
		});
		return oldValue;
	}, 
	
	setCellValueByName: function(name, inRowIndex, inValue){
		if(this.edit && this.edit.apply){
			this.edit.apply();
		}
		
		var item = this.getItem(inRowIndex);
		if (!item) return;
		
		var cell = null;
		for ( var i = 0; i < this.layout.cells.length; i++) 
		{
			if(name == this.layout.cells[i].field)
			{
				cell = this.layout.cells[i];
				break;
			}
		}
		// process label cell
		if (cell && !cell.widget)
		{			
			inValue = this._toString_CellValue(name, inValue);
		}

		this.store.setValue(item, name, inValue);
		
		var _this = this;
		setTimeout(function(){
			_this.focus.findAndFocusGridCell();
		}, 50);
	}, 
	
	getCellValueByName: function(name, inRowIndex){
		var value = this.store.getValue(this.getItem(inRowIndex), name);
		return this._toString_CellValue(name, value);
	}, 
	
	getCellObjectByName: function(name, inRowIndex){
		var value = this.store.getValue(this.getItem(inRowIndex), name);
		return this._parseObject_CellValue(name, value);
	}, 
	
	_getParentForm : function(){
		for(var node = this.domNode; node.parentNode/*#5935*/; node=node.parentNode){
			var widget=dijit.byNode(node);
			if (widget && typeof widget._onSubmit == "function") {
				return widget;
			}
		}
	},
	
	_setIsActionableAttr : function(value){
		if(value == "true"){
			this.isActionable = true;
		} else if(value == "false"){
			this.isActionable = false;
		} else {
			this.isActionable = value;
		}
	},
	
	/**
	 * 
	 * Compute what this.state should be based on state of children
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getState: function(){	
		var widgets = [];
		var cells = this.layout.cells;
		for (var i = 0; i < cells.length; i ++ ) {
			// just check the status of editing cell/widget which domNode is attached to cellNode
			if(cells[i].editable && cells[i].widget && (dojo.isIE?cells[i].widget.domNode.parentElement : cells[i].widget.domNode.parentNode)) {
				//this.editable = true;
				widgets.push(cells[i].widget);
			}
		}
		var states = dojo.map(widgets, function(w){
			return w.get("state") || "";
		});

		return dojo.indexOf(states, "Error") >= 0 || !this.SELECTION_VALID_STATE ? "Error" :
			dojo.indexOf(states, "Incomplete") >= 0 ? "Incomplete" : "";
	},
		
	postMixInProperties : function() {
		this.inherited(arguments);
		var scope = this;
		var hasCellWidget = false;
		(function(obj) {
			if(dojo.isArray(obj)) {
				for(var i = 0; i < obj.length; i++) {
					arguments.callee(obj[i]);
				}
			} else if (dojo.isObject(obj)) {
				if(obj.type && obj.type == dojox.btt.grid.cells.Content) {
					hasCellWidget = true;
				}
				if(obj.name) {
					obj.name = scope.getI18NString(obj.name);
				} else if(obj.cells) {
					arguments.callee(obj.cells);
				}
			} 
		})(this.structure);
		console.log(hasCellWidget);
		if(this.params && !this.params.rowsPerPage && hasCellWidget) {
			if(this.params.storeData.length > 5000) {
				this.rowsPerPage = 2 * this.params.storeData.length;
			} else {
				this.rowsPerPage = 10000;
			}
		}
		
	},
	
	setStoreData: function(newRows /* array of objects */) {

		var oldStore = this.store;
		
		if (this.rows_append==true){			
			var  oldRows=this.store._getItemsArray();
			var  len=oldRows.length;
			for (var i=0; i<newRows.length;i++){
				oldRows[len+i]=newRows[i];
			}
			newRows=oldRows;
			this.rows_append=false;
		}
		
		this.setStore(new dojo.data.ItemFileWriteStore({data: {items: newRows }, hierarchical : false}));			

		if (dojo.isIE && dojo.isIE<9){
			setTimeout(dojo.hitch(this, function(){
				try{
					this._refresh(true);
				}catch(e){
					try{						
						this._refresh();
					}catch(e){}
				}
			}), 400);
		}
		
		if(oldStore){
			this._setComparatorForColunm();
			oldStore.close();
			oldStore = null;
		}
	},
	
	/**
	 * 
	 * hook method for storeData attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setStoreDataAttr : function(value){
		if(!this.store){
			this.store = new dojo.data.ItemFileWriteStore({data: {items: dojo.fromJson(value) }, hierarchical : false});
		}
	},
	
	/**
	 * 
	 * hook method for comparatorMap attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setComparatorForColunm : function(){
		
		var comparatorMap
		if(this.comparatorMap != ""){
			comparatorMap = dojo.fromJson(this.comparatorMap);
		} else {
			comparatorMap = {};
		}
		//G001 
		var structure = null;
		if (this.structure[0]) {
			structure = this.structure[0];
		} else if (this.structure.cells[0]) {
			structure = this.structure.cells[0];
		}
		for ( var i = 0; structure && i < structure.length; i++) {
			if(structure[i].type){
				var cell = this.getCellByField(structure[i].field);
				if(cell.comparator){
					comparatorMap[structure[i].field] = dojo.hitch(cell, cell.comparator);
				}
			}
		}
		this.store.comparatorMap = comparatorMap;
			
	},
	
	getEditableStroeData: function() {
		if(this.storeDataName) {
			var cells = this.layout.cells;
			var store = this.store;	
			var selectable = this.selectable;
			var editableStoreData = [];
			this.store.fetch({
				onComplete: function(items, request){
					for(var m = 0; m < items.length; m ++) {
						var tempObj = {};
						var flag = false;
						for (var i = 0; i < cells.length; i ++ ) {
							if(cells[i].editable) {
								var name = cells[i].field;
								var value = store.getValue(items[m] , cells[i].field);			
								
								if (value && value !== "" && typeof value != "string") {
						    		if(cells[i].editable && cells[i].widget && cells[i].widget.serialize) {
						    			value = cells[i].widget.serialize(value, cells[i].widget.constraints);
						    		} 
						    	}							
								tempObj[name] = (value === null || value === "null" ? "" : value);
								flag = true;
							}
						}
						if(flag){
							editableStoreData.push(tempObj);
						}
					}
			}});
			if(editableStoreData.length>0){
				return editableStoreData;
			}else{
				return;
			}
		} else return;
	},
	
	
	_createInputNodesForObj : function(containerNode, obj, preName) {
		for(var p in obj) {
			if(obj[p] != null && typeof obj[p] == "object") {
				this._createInputNodesForObj(containerNode, obj[p], preName + "." + p);
			} else {
				var tempName = preName + "." + p;
				var value = obj[p] === null || typeof obj[p] == "undefined" ? "" : obj[p];
				var nodeList = dojo.query("input[type='hidden',name='" + tempName + "']", containerNode);
				if(nodeList.length > 0) {
					nodeList.attr("value", value);
				} else {
					var tempObj = {};
					tempObj.type = 'hidden';
					tempObj.name = tempName;
					tempObj.value = value;
					dojo.create("input", tempObj, containerNode, "last");
				}
				
			}
		}
	},	
	
	onFormSubmit : function() {
		// Do NOT submit any data if this grid is disabled
		if(this.disabled){
			return;
		}
		if(this.edit && this.edit.apply){
			this.edit.apply();
		}
		if(this.storeDataName) {
			var cells = this.layout.cells;
			var store = this.store;
			var preName = this.storeDataName;
			var node = this.domNode;
			var selectable = this.selectable;
			dojo.query("> input[type=hidden]", node).forEach(function(node, index, array){ 
			    dojo.destroy(node);
			 }); 
			
			var _this = this;
			
			if ( ! (this.store instanceof dojox.data.QueryReadStore) ){
				
				this.store.fetch({
					onComplete: function(items, request){
						for(var m = 0; m < items.length; m ++) {
							for (var i = 0; i < cells.length; i ++ ) {
								if(store.getValue(items[m] , cells[i].field) != null) {
									break;
								}
							}
							if(i == cells.length) continue;
							for (var i = 0; i < cells.length; i ++ ) {
								if(cells[i].editable) {
									var tempObj = {};
									tempObj.type = 'hidden';
									tempObj.name = preName + "." + m + "." + cells[i].field;
									tempObj.value = store.getValue(items[m] , cells[i].field);
									if (tempObj.value && tempObj.value !== "" && typeof tempObj.value != "string") {
							    		if(cells[i].editable && cells[i].widget && cells[i].widget.serialize) {
							    			tempObj.value = cells[i].widget.serialize(tempObj.value, cells[i].widget.constraints);
							    		} 
							    	}
									if(tempObj.value !== null && typeof tempObj.value == "object") {
										_this._createInputNodesForObj(node, tempObj.value, tempObj.name);
									} else {
										tempObj.value = tempObj.value === null? "" : tempObj.value;
										dojo.create("input", tempObj, node, "last");
									}									
								}
							}
						}
				}});
			}
			
			var contextMenuClick = this._submitButtonForContextMenu && (this._getParentForm()._clickedButton == this._submitButtonForContextMenu || this._getParentForm()._clickedButton == this._saveCancelButtonForContextMenu);
			var cellWidgetClick =  !!(this._getParentForm()._clickedButton && this._getParentForm()._clickedButton.get("cellWidgetId"));
			if(this.name && (this.selectable ||contextMenuClick || cellWidgetClick)) {
				var cells = this.layout.cells;
				var name = this.name;
				var store = this.store;
				var node = this.domNode;
				if(contextMenuClick || cellWidgetClick) 
				{
					var selections = [];
					selections.push(this.getItem(this.rowIndex));
				  
				} else {
					var selections = this.selection.getSelected();
				}
				var rowsIndexes=[];
				var isSingleSelect = this.selectionMode == "single" || (!this.selectable && this.selectionMode == 'none' && (contextMenuClick || cellWidgetClick));
				for (var m = 0; m < selections.length; m ++ ) {
					
					if((isSingleSelect || contextMenuClick || cellWidgetClick) && m == 1) break;
					var selection = selections[m];
					
					//* ***** G028 submit selected row index instead of content
					if (this.launchNew) {
						dojo.forEach(store.getAttributes(selection), function(attribute) {
							var tempObj = {};
							tempObj.type = 'hidden';
							if(isSingleSelect ) {
								tempObj.name = name + "." + attribute;
							} else {
								tempObj.name = name + "." + m + "." + attribute;
							}
							tempObj.value = store.getValue(selection, attribute);
							for(var i = 0; i < cells.length; i ++ ) {
						       if(cells[i].field == attribute) {
						    	   if (tempObj.value && tempObj.value !== "" && typeof tempObj.value != "string") {
						    		   if(cells[i].editable && cells[i].widget && cells[i].widget.serialize) {
						    			   tempObj.value = cells[i].widget.serialize(tempObj.value, cells[i].widget.constraints);
						    		   } 
						    	   }
						    	   if(tempObj.value !== null & typeof tempObj.value == "object") {
						    		   _this._createInputNodesForObj(node, tempObj.value, tempObj.name);
						    	   } else {
						    		   tempObj.value = tempObj.value === null? "" : tempObj.value;
						    		   dojo.create("input", tempObj, node, "last");
						    	   }
						    	   break;
						       } 
						    }
						    console.debug("tempObj", tempObj);
					    }); 
				    }
					 //*/
					rowsIndexes[m]=store.getIdentity(selection);
					if(isSingleSelect )
						break;
				 } 
				// ***** G028 submit selected row index instead of content
				
				var tempObj = {};
				tempObj.type = 'hidden';
				tempObj.name ="dse_tableSelectedRows.isSingleSelect";
				tempObj.value=isSingleSelect;				
				dojo.create("input", tempObj, node, "last");
				
				var tempObj1 = {};
				tempObj1.type = 'hidden';
				tempObj1.name ="dse_tableSelectedRows.table_dataName";
				tempObj1.value=this.name;;				
				dojo.create("input", tempObj1, node, "last");
				
				var tempObj2 = {};
				tempObj2.type = 'hidden';
				tempObj2.name ="dse_tableSelectedRows.table_dataNameForList";
				tempObj2.value=this.storeDataName;				
				dojo.create("input", tempObj2, node, "last");
				
				var tempObj4 = {};
				tempObj4.type = 'hidden';
				tempObj4.name ="dse_tableSelectedRows.tableId";
				tempObj4.value=this.id;				
				dojo.create("input", tempObj4, node, "last");
				
				for (var i = 0; i < rowsIndexes.length; i ++ ){
					var tempObj3 = {};
					tempObj3.type = 'hidden';
					tempObj3.name ="dse_tableSelectedRows.rowsIndexes."+i;
					tempObj3.value=rowsIndexes[i];				
					dojo.create("input", tempObj3, node, "last");
				}
			}
		}
		
	},
	
	/**
	 * 
	 * hook method for value attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getValueAttr : function() {
		var contextMenuClick = this._submitButtonForContextMenu && (this._getParentForm()._clickedButton == this._submitButtonForContextMenu || this._getParentForm()._clickedButton == this._saveCancelButtonForContextMenu);
		var cellWidgetClick = !!this._getParentForm()._clickedButton && !!this._getParentForm()._clickedButton.get("cellWidgetId");
		return this._getSelectedValue(contextMenuClick, cellWidgetClick);
	},
	
	_getSelectedValue : function(contextMenuClick, cellWidgetClick) {
		
		if(this.selectable || contextMenuClick || cellWidgetClick) {
			//enable multi-selection
			if(contextMenuClick || cellWidgetClick) 
			{
				var selections = [];
				selections.push(this.getItem(this.rowIndex));
			} else {
				var selections = this.selection.getSelected();
			}
			var cells = this.layout.cells;
			var store = this.store; 
			var tempObjects = [];
			var rowsIndexes=[];
			if(selections.length > 0){
				var isSingleSelect = this.selectionMode == "single" || (!this.selectable && this.selectionMode == 'none' && (contextMenuClick || cellWidgetClick));
				for (var m = 0; m < selections.length; m ++ ) {
					var selection = selections[m];
					
					//* ***** G028 submit selected row index instead of content
					if (this.launchNew) {
						var tempObj = {};
						dojo.forEach(store.getAttributes(selection), function(attribute) {
							for (var i = 0; i < cells.length; i ++ ) {
								if(cells[i].field == attribute) {
									tempObj[attribute] = store.getValue(selection, attribute);
									if (tempObj[attribute] && tempObj[attribute] !== "" && typeof tempObj[attribute] != "string") {
										if(cells[i].editable && cells[i].widget && (cells[i].widget instanceof com.ibm.btt.dijit.DateTextBox || cells[i].widget instanceof com.ibm.btt.dijit.NumberTextBox) && cells[i].formatter) {
											tempObj[attribute] = cells[i].widget.serialize(tempObj[attribute], cells[i].widget.constraints);
										 } 
									}
							    	tempObj[attribute] = tempObj[attribute] === null? "" : tempObj[attribute];
									break;
								}
							}
				   	 	});
						console.debug("tempObj", tempObj);
						if(isSingleSelect) {
							return tempObj;
						}
						if(tempObj && tempObj !== ""){
							tempObjects.push(tempObj);
						}
						if(contextMenuClick || cellWidgetClick) {
							return tempObjects;
						}
					}
					//*/
					 
					rowsIndexes[m]=store.getIdentity(selection);
					if(isSingleSelect) 						
						break;
					
				}
				
				if (this.launchNew) 
					return tempObjects;  
				
				//G028 start
				var tableInfo = {};
				tableInfo.table_dataName=this.name;
				tableInfo.table_dataNameForList=this.storeDataName;
				tableInfo.rowsIndexes=rowsIndexes;
				tableInfo.isSingleSelect=isSingleSelect;
				tableInfo.tableId=this.id;
				console.debug("###########  dse_tableSelectedRows info :"+tableInfo.toString() );
				return tableInfo;
			} else {
				return null;
			}
		} else if(this._cellEventRowData){
			return this._cellEventRowData;
		}else {
			return undefined;
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
		if (value == "gone") {
			
			var rows = this.get("rowCount");
	 		for ( var i = 0; i < rows; i++) {
				this.doCancelEdit(i);
			}
			
			if(this._firstTimeLoaded){
				this._eventHandlers.push(dojo.connect(this,"startup",dojo.hitch(this,function(){
					dojo.style(this.domNode, "display", "none");
					dojo.style(this.domNode, "visibility", "inherit");
				})));	
			}else{
				dojo.style(this.domNode, "display", "none");
				dojo.style(this.domNode, "visibility", "inherit");
			}
			
		} else if (value == "hidden") {
			
			/*
			var rows = this.get("rowCount");
	 		for ( var i = 0; i < rows; i++) {
				this.doCancelEdit(i);
			}
			*/
			dojo.query("a.dojoxGridSortBtn", this.headerNodeContainer).forEach(function(node, index, array){ 
				dojo.style(node, "visibility", "hidden");
			}); 
			
			dojo.style(this.domNode, "display", "");
			dojo.style(this.domNode, "visibility", "hidden");
			
		} else {
//			value = "inherit";
			dojo.style(this.domNode, "display", "");
			dojo.style(this.domNode, "visibility", "inherit");
			dojo.query("a.dojoxGridSortBtn", this.headerNodeContainer).forEach(function(node, index, array){ 
				dojo.style(node, "visibility", "");
			}); 
			
			this.update();
		}
		
		this.visibility = value;
		this._firstTimeLoaded = false;
	},
	
	/* Deprecated in BTT7.1 release, please use getValueInFirstSelectedItem instead. */
	getValueInSelectedItem : function(attName) {
		console.warn("getValueInSelectedItem() has been deprecated, please use getValueInFirstSelectedItem() instead!");
		return this.getValueInFirstSelectedItem(attName);
	},
	
	getValueInFirstSelectedItem : function(attName) {
		var firstSelectedItem = this.selection.getFirstSelected();
		
		if(!firstSelectedItem) 	return null;
		
		var value = this.store.getValue(firstSelectedItem, attName);
		
		return this._toString_CellValue(attName, value);
	},

	_toString_CellValue : function(attName, value) {
//		if (value === undefined) return undefined;
		
		if ((typeof(value)=="string") || (value instanceof String)) 
		{
			return value;
		}
		
		var cell = null;
		for ( var i = 0; i < this.layout.cells.length; i++) 
		{
			if(attName == this.layout.cells[i].field)
			{
				cell = this.layout.cells[i];
				break;
			}
		}
		if(cell == null)
		{
			return value;
		}
		
		if(cell.widget){
			return cell.widget.format(value, cell.widget.constraints);
		}

		// for label
		// String, Date, Number, Currency
		try{			
			switch(cell.widgetProps.dataType){
	//			case "String":
	//				break;
				case "Date":
					value = dojo.date.locale.format(value, {
								selector : "date",
								datePattern : cell.widgetProps.pattern
							});
					break;
				case "Number":
				case "Currency":
					var cons = {};
					if(cell.widgetProps.pattern)
					{
						cons["pattern"] = cell.widgetProps.pattern;
					}
					var places = parseInt(cell.widgetProps.decimalPlaces);
					if(!isNaN(places))
					{
						cons["places"] = places;
					}
					value = dojo.number.format(value, cons);
					break;
			}
		}catch(e){
			console.warn("Can't convert [" + value + "] to String.");
		}
		return value;
	},
	
	_parseObject_CellValue : function(dfName, value) {
		if ((typeof(value)!="string") && !(value instanceof String)) 
		{
			return value;
		}
		
		var cell = null;
		for ( var i = 0; i < this.layout.cells.length; i++) 
		{
			if(dfName == this.layout.cells[i].field)
			{
				cell = this.layout.cells[i];
				break;
			}
		}
		if(cell==null)
		{
			return value;
		}
		// String, Date, Number, Currency
		try{
			switch(cell.widgetProps.dataType){
	//			case "String":
	//				break;
				case "Date":
					value = dojo.date.locale.parse(value, {
								selector : "date",
								datePattern : cell.widgetProps.pattern
							});
					break;
				case "Number":
				case "Currency":
					var cons = {};
					if(cell.widgetProps.pattern)
					{
						cons["pattern"] = cell.widgetProps.pattern;
					}
					value = dojo.number.parse(value, cons);
					break;
			}
		}catch(e){
			console.warn("Can't convert [" + value + "] to " + cell.widgetProps.dataType);
		}
		return value;
	},
	
	getObjectInFirstSelectedItem : function(attName) {
		var firstSelectedItem = this.selection.getFirstSelected();
		
		if(!firstSelectedItem) 	return undefined;
		
		if(this.edit && this.edit.apply){
			this.edit.apply();
		}
		var value = this.store.getValue(firstSelectedItem, attName);
		return this._parseObject_CellValue(attName, value);
	},
	
	getLengthOfSelectedRows: function(){
		return this.selection.getSelected().length;
	},
	
	getSelectedItem : function(){
		return this.attr("value");
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
			this.width = this.handleLenUint(value);
			dojo.style(this.domNode, "width", this.width);
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
			this.height = this.handleLenUint(value);
		}	
	},
	
	
	_forceSort : false,
	canSort : function(colIndex, field){		
		var cell = this.layout.cells[colIndex];	
		var colSortable = (this.disabled==false) && cell && 
						  ((this.sortEnabled && !(cell.canSort==false || cell.canSort=="false"))
								  || (cell.canSort===true));
		if(this._forceSort || colSortable){
			return this.inherited(arguments);
		}else{
			return false;
		}
	},
	
	
	setSortableColumn : function(/**String**/ id, /**boolean**/ sortable){		
		var index = this._findColumn(id);
		var cell = this.layout.cells[index];
		if (cell.canSort!=sortable && this.plugins.nestedSorting){
			cell.canSort = sortable;
//			var ps = this.plugin("nestedSorting");
////			if (!sortable){
////				try{					
////					ps.removeSortData(index);
////					ps._updateSortDef();
////				}catch(e){}
////			}
//			this.sort();
//			ps._initSort(true);
			this.render();
		}
	},
	

	sortColumn : function(/**String**/ dataName, /**boolean**/ ascending){
		if (dataName == undefined) return;
		
		// align the arguments	
		// sortFields: [{attribute: 'col4', descending: false},...]
		var sortFields = [];
		for (var i=0; i<arguments.length;i++){
			if (typeof (arguments[i]) == "boolean"){
				continue;
			}
			var cs = {
					attribute : arguments[i],
					descending: arguments[i+1]==false
			};
			sortFields.push(cs);
		}
		if (sortFields.length <1) return;
		
		this._forceSort = true;
		this.setSortIndex(sortFields);
		this._forceSort = false;
		
		// re-render the header node
		this.render();
//		this.sort();
//		var ps = this.plugin("nestedSorting");
//		ps._initSort(true);
	},
	
	
	/**
	 * This function is reserved because the form require that the monitored widget must have validate function.
	 */
	
	validate:function(inValue, inRowIndex, inAttrName){
	},	
	

	checkSelectionNum: function(){
		this.showErrorIcon("");
		var selectNum = this.selection.getSelected().length;
		var msg = "";
		console.debug("this.selectionRequired", this.selectionRequired);
		console.debug("selectNum", selectNum);
		if(this.selectionRequired && selectNum < 1){
			if(this.selectionMode === "single"){
				msg = this._bundle.getMessage("rangeSingleMessage");
				this.SELECTION_VALID_STATE = false;	
			} else if(this.selectionMode === "extended"){
				msg = this._bundle.getMessage("rangeMultiMessage");
				this.SELECTION_VALID_STATE = false;
			} else {
				this.SELECTION_VALID_STATE = true;
			}
		} else {
			this.SELECTION_VALID_STATE = true;
		}
		this.showErrorIcon(msg);
		this._set("state", this._getState());
		
	},
	
	showErrorIcon: function(message){
		if (this.errorMessageIcon) {
			if(message){
				this.errorMessageIcon.title = message;
				this.errorMessageIcon.style.display = "";
				var hint = this.get('hint');
				if (hint != undefined && hint != null && hint != "") {
					this._hint = hint;
					this.set('hint', message);
				} 
			}else{
				this.errorMessageIcon.title = "";
				this.errorMessageIcon.style.display = "none";
				if(this._hint){
					this.set('hint', this._hint);
					delete this._hint;
				}
			}
		}
	},
	
	/**
	 * If not valid, return false; otherwise return true;
	 * return the valid status of this widget
	 */
	isValid:function(){
		var isValid = this._getState() == "";	
		console.debug("isValid", isValid);
		return isValid;
	},
	
	/**
	 * RESET table data , this means the user editted cell values will be lost, the store will be roll back
	 * Currently, only support ItemFileWriteStore 
	 */
	 reset:function(){
	 	//remove the selected rows? if readOnly or disabled?
	 	if( (this.readOnly === true) || (this.disabled === true)){
	 		this.removeSelectedRows();
	 		return;
	 	}
	 	//only necessary to reset table data when user edit the table cell data
	 	if (this.store instanceof dojo.data.ItemFileReadStore){
	 		var rows = this.get("rowCount");
	 		for ( var i = 0; i < rows; i++) {
				this.doCancelEdit(i);
			}
	 		this.store.revert();
	 	}	
	 },
	 
	 /**
		 * 
		 * hook method for readOnly attribute
		 * 
		 * @tag private this is a internal method, may be changed or removed in later version
		 *              please do not use this method in customer code.
		 * */
	 _setReadOnlyAttr:function(value){
	 	console.debug("_setReadOnlyAttr",value);
	 	this.readOnly = value;
	 	//this.goToUneditableState();
	 },
	 
	 /**
		 * 
		 * hook method for disabled attribute
		 * 
		 * @tag private this is a internal method, may be changed or removed in later version
		 *              please do not use this method in customer code.
		 * */
	 _setDisabledAttr:function(value){
	 	console.debug("_setDisabledAttr",value);
	 	this.disabled = value;
	 	
	 	//this.goToUneditableState();
	 	if(this.disabled){
	 		//define a variable to save the current state of table
	 		
	 		//check if the selection is enabled and disable the selection
	 		if(this.selectionMode != "none"){
				if (!this._disableCache) {
	 				this._disableCache = {};
	 			}
	 			this._disableCache.selectionMode = this.selectionMode;
	 			this.selectionMode = "none";
	 			this.selection.setMode(this.selectionMode);			
	 		}
	 		
	 		//check if columnReordering is enabled
	 		if(this.columnReordering){
				if (!this._disableCache) {
	 				this._disableCache = {};
	 			}
	 			this._disableCache.columnReordering = this.columnReordering;
	 			this.columnReordering = false;
	 			//refresh the table otherwise columnReordering will 
	 			//also work for the fist time you reordering the column
	 			
	 			//IE seems have a problem to refresh the table when first loading
	 			//the view is not successfully loaded, there is a temporary
	 			if (this._pending_requests) {
	 				this._refresh(true);
	 			}else{
	 				setTimeout(dojo.hitch(this, function(){ //FIXME need to take more consideration on this case
	 					this._refresh(true);
	 				}),1000);
	 			}
	 			
	 		}
	 		
	 		// Hide scrollbars
	 		/*console.log("Grid attached events : ", this._attachEvents);
	 		dojo.query('.dojoxGridScrollbox', this.id).forEach(function(node, index, arr){
	 			dojo.style(node, "overflow", "hidden");
	 		});*///defect 29275
	 		
	 		// add overlay to prevent events as much as possible
	 		if(!dojo.query(".disabledGrid", this.id).length)
	 	    {
	 	        var mask = dojo.create("div", {"class": "disabledGrid"}, this.domNode);
	 	        
	 	        mask.onclick = dojo.stopEvents;
	 	        mask.onDblClick = dojo.stopEvents;
	 	        mask.onmouseover = dojo.stopEvents;
	 	        mask.onmousemove = dojo.stopEvents;
	 	        mask.onmouseout = dojo.stopEvents;
	 	        mask.onmouseleave = dojo.stopEvents;
	 	        mask.onmouseenter = dojo.stopEvents;
	 	        mask.onmouseup = dojo.stopEvents;
	 	        mask.onmousedown = dojo.stopEvents;
	 	        mask.onfocus = dojo.stopEvents;
	 	        mask.onkeydown = dojo.stopEvents;
	 	        mask.onkeyup = dojo.stopEvents;
	 	        mask.onkeypress = dojo.stopEvents;
	 	        mask.onblur = dojo.stopEvents;
	 	        mask.onkeypress = dojo.stopEvents;
	 	    }
	 		
	 		dojo.addClass(this.domNode, "dijitDisabled");
	 	}
	 	else{
	 		
	 		//restore the selectionMode if find in cache
	 		if(this._disableCache && this._disableCache.selectionMode){
	 			this.selectionMode = this._disableCache.selectionMode;
	 			this.selection.setMode(this.selectionMode);	
	 			delete this._disableCache.selectionMode;
	 		}
	 		
	 		//restore columnReordering if find in cache
	 		if(this._disableCache && this._disableCache.columnReordering){
	 			this.columnReordering = this._disableCache.columnReordering;
	 			delete this._disableCache.columnReordering;
	 			//refresh table to make the columnReordering work
	 			if (dojo.isIE && dojo.isIE<9)
	 			{
					var _this = this;
					setTimeout(function(){
						try{
							_this._refresh(true);
							_this._refresh(true);
						}catch(e){
							_this._refresh(true);
						}
					}, 10);
	 			}else{
	 				this._refresh(true);
	 			}
	 		}
	 		
	 		// Show scrollbars
	 		/*dojo.query('.dojoxGridScrollbox', this.id).forEach(function(node, index, arr){
	 			if(!dojo.attr(node, "isFrozenScrollBar"))//defect 29136
	 				dojo.style(node, "overflow", "auto");
	 		});*///defect 29275
	 		
	 		// remove overlay
	 		dojo.query(".disabledGrid", this.id).forEach(function(node){
	 			dojo.destroy(node);
	 		});
	 		
	 		if(this._disableCache){
	 			delete this._disableCache;
	 		}
	 		
	 		dojo.removeClass(this.domNode, "dijitDisabled");
	 		
	 	}
	 	
	 	this.checkSelectionNum();
	 	
	 },
	 
	/**
	 * BTT provided function , supports focus on grid
	 */
	focusOn:function(){
		 if(!this.isFocusable()){
			 console.info("can't focus on grid, because it's not focusable");
			 return;
		 }

		 var isEmpty = (this.rowCount === 0); // If grid is empty this.grid.rowCount == 0
		 if (!isEmpty){
			 var cellIdx = 0;
			 var cell = this.getCell(cellIdx);
			 if (cell.hidden) {
				 // if first cell isn't visible, use _colHeadFocusIdx
				 // could also use a while loop to find first visible cell - not sure that is worth it
				 cellIdx = this.focus.isNavHeader() ? this.focus._colHeadFocusIdx : 0;
			 }
			 this.focus.setFocusIndex(0, cellIdx);
		 } else {
			 this.focus.focusHeader();
		 }
	},
	
	/**
	 * Override the canEdit, to support readOnly and disable property
	 */
	canEdit: function(inCell, inRowIndex){
		if((this.readOnly === true)||(this.disabled === true)){
			return false;			
		}else{
			return this.inherited(arguments);
		}
	},
	
//	rowCSS : "[{name:'c1', forr:['H','R','A','O','E']}, {name:'c2', forr:['H','R']}]",
	rowCSS: null,
	
	computeCCSS : function (rowIndex, cell, oddeven){
		var grid = cell.grid;
		var ccss = [];
		
		if (typeof(grid.rowCSS)=="string"){
			grid.rowCSS = dojo.fromJson(grid.rowCSS);
		}		
		for (var ci in grid.rowCSS){
			var c = grid.rowCSS[ci];
			for (var ri in c.forr){
				if (c.forr[ri]==rowIndex || c.forr[ri]==oddeven){
					ccss.push(c.name);
					break;
				}
			}
		}
		
		if (typeof(cell.rowCSS)=="string"){
			cell.rowCSS = dojo.fromJson(cell.rowCSS);
		}		
		for (var ci in cell.rowCSS){
			var c = cell.rowCSS[ci];
			for (var ri in c.forr){
				if (c.forr[ri]==rowIndex || c.forr[ri]==oddeven){
					ccss.push(c.name);
					break;
				}
			}
		}
		
		return ccss;
	},
	
	buildViews : function() {
		var cells = this.layout.cells;
		for (var i = 0; i < cells.length; i ++ ) {
			// compute the headerClasses, cellClasses and classes for every cell
			cells[i].headerClasses = (cells[i].headerClasses||"") + " " + this.computeCCSS('H' ,cells[i]).join(' ');
			cells[i].cellClasses = (cells[i].cellClasses||"") + " " +  this.computeCCSS('R' ,cells[i]).join(' ');
			cells[i].classes = (cells[i].classes||"") + " " + this.computeCCSS('A' ,cells[i]).join(' ');
			
			// special style for ellipsis
			if(this.cellOverflow == "ellipsis" 
				&& cells[i].styles.indexOf("white-space") < 0)
			{
				cells[i].styles += "white-space:nowrap;";
			}			
		}

		// cell merge && filter the EMPTY line
		var grid = this;
		for(var i=0, vs; (vs=this.layout.structure[i]); i++){
			vs.raw_onBeforeRow = vs.onBeforeRow;
			vs.onBeforeRow = dojo.hitch(vs, function(inRowIndex, rowCells) {
				// add for support IBK header cell merge
				if(this.raw_onBeforeRow){
					this.raw_onBeforeRow(inRowIndex, rowCells);
				}
				
				// filter the EMPTY line
				if(inRowIndex < 0){	// ignore the header
					rowCells[0].hidden = false;
					return;
				}
				var item = grid.getItem(inRowIndex);
				if(!item){ return; }
				var cells = grid.layout.cells;
				for (var i = 0; i < cells.length; i ++ ) {
					if(cells[i].field && grid.store.getValue(item , cells[i].field) !== null) {
						rowCells[0].hidden = false;
						return;
					}
				}
				rowCells[0].hidden = true;
			});
		}
		
		this.inherited(arguments);
	}, 
	
	onFetchError : function(err, req) {
		if(err.responseText) {
			(new dijit.Dialog({
	            title: this._bundle.getMessage("errorDialogTitle"),
	            content : err.responseText
	        })).show();
		}
	},
	
	getWidget : function(arg){
		var cells = this.layout.cells;
		for ( var i = 0; i < cells.length; i++) {
			if (cells[i].id == arg && cells[i].getWidget) {
				return cells[i].getWidget();
			}
		}
		return undefined;
	},
	
	_findColumn : function(id_index){	
		var index = -1;
		var cells = this.layout.cells;
		for ( var i = 0; i < cells.length; i++) {
			if (cells[i].id==id_index) {
				index = i;
				break;
			}
		}
		
		if (index<0 && /^\d+$/.test(""+id_index))
		{
			console.warn("Can't find any column by ID[" + id_index + "], try to use the ID as the column index");
			index = parseInt(id_index);
		}
		
		return index;
	},
	
	showColumn : function(id_index){
		var index = this._findColumn(id_index);
		
		if (index > -1 && index < this.layout.cells.length && this.disabled === false) {
			this.layout.setColumnVisibility(index, true);
			if(dojo.isIE){
				var _this = this;
				setTimeout(function(){
					try{
						_this._refresh();
						_this._refresh();
					}catch(e){
						_this._refresh();
					}
				}, 0);
			}
			window.setTimeout(dojo.hitch(this, function(){
				this.focusOn();
			}), 100);
		}else{
			console.error("showColumn(id) can't find any column by ID: '" + id + "'");
		}
	},
	
	hideColumn : function(id_index){
		var index = this._findColumn(id_index);
		
		if (index > -1 && index < this.layout.cells.length && this.disabled === false) {
			this.layout.setColumnVisibility(index, false);
			if(dojo.isIE){
				var _this = this;
				setTimeout(function(){
					try{
						_this._refresh();
						_this._refresh();
					}catch(e){
						_this._refresh();
					}
				}, 0);
			}
			window.setTimeout(dojo.hitch(this, function(){
				this.focusOn();
			}), 100);
		}else{
			console.error("hideColumn(id) can't find any column by ID: '" + id + "'");
		}
	},
	
	isColumnVisible : function(id_index){
		var index = this._findColumn(id_index);
		
		if (index > -1 && index < this.layout.cells.length) {
			return !this.layout.cells[index].hidden;
		} else {
			console.error("isColumnVisible(id) can't find any column by ID: '" + id + "'");
			return undefined;
		}
	},
	
	destroy : function(){
		if(window[this.id]){
			window[this.id] = undefined;
		}
		
		while(this._eventHandlers && this._eventHandlers.length>0){
			try{				
				dojo.disconnect(this._eventHandlers.pop());
			}catch(e){}
		}
		this._eventHandlers = undefined;
		
		this.inherited(arguments);
		
		while(this.cwsl && this.cwsl.length>0){
			try{
				this.cwsl.pop().destroy();
			}catch(e){}
		}
		this.cwsl = undefined;

		// G003
		if(this.aew){
			for(var i = 0; i< this.aew.length; i++){
				if(this.aew[i]){
					for(var j = 0; j< this.aew[i].length; j++){
						try{
							this.aew[i][j].destroy();
						}catch(e){}
					}
				}
			}
			this.aew = undefined;
		}
		
		if(this.aewh){
			for(var i = 0; i< this.aewh.length; i++){
				try{
					this.cwsl[i].destroy();
				}catch(e){}
			}
			this.aewh = undefined;
		}
		// G003
		
		if(this.store && this.store.destroy){
			this.store.destroy();
		}		
	},
	
	/**
	 * @Tag private, this is to deal with class change when
	 * this grid is disabled.
	 */
	_setClassAttr: function(arg){
		if(this.disabled){
			return;
		}else{
			this.inherited(arguments);
			this.textSizeChanged();
		}
	},
	
	_setSummaryAttr : function(summary) {
		this.summary = summary;
		dojo.attr(this.domNode, "summary", summary);
	},
	
	/**
	 * @Tag private, this is to set the message to be displayed when
	 * there is no data to show.
	 */
	_setNoDataMessageAttr: function(msg){
		if(msg){
			this.noDataMessage = "<span class=\"dojoxGridNoData\">" + msg + "</span>";
		}
	},
	
	/**
	 * Function used to publish Ajax timeout event when pagination.
	 */	
	onAsyncTimeOut : function() {
		
	},
	
	/**
	 * Function used to publish Ajax successful event when pagination.
	 */
	onAsyncOK : function() {
		
	},

	/**
	 * Function used to pubish Ajax error event when pagination.
	 * 
	 */
	onAsyncError : function() {
		
	}, 
	
	/**
	 * Overwritten, for G003, bypass double click on alwaysEditing cell
	 */
	dodblclick: function(e){
		if(e.cell && e.cell.alwaysEditing != undefined && e.cell.alwaysEditing == true) { 
			return;
		}else{
			this.inherited(arguments);
		}
	}
}); 


}

if(!dojo._hasResource["com.ibm.btt.dijit.Message"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.Message"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Message"); 


 
 


dojo.requireLocalization("com.ibm.btt.dijit", "Message", null, "ROOT,zh-cn");




/**
 * The widget for "component manage error and warning messages".
 * 
 * Alpha developer can customize the style of the level of messages by convention. The css file is css/dijit/message.css.
 */
dojo.declare("com.ibm.btt.dijit.Message",[dijit._Widget,dijit._Templated,com.ibm.btt.dijit.AbstractWidgetMixin] ,{ 
	
	templateString : "<div><div dojoAttachPoint='staticHolder'><span dojoAttachPoint='staticMessageHolder' class='dijitLabelBase' role='alert'></span><span role='button' dojoAttachPoint='closeHandler' style='margin:0 0 0 5px;text-decoration:underline;cursor:pointer' tabIndex='0'></span></div><div dojoAttachPoint='dialogHolder'><span dojoAttachPoint='popupMessageHolder' class='dijitLabelBase'></span></div></div>",	//TODO , 1) add a close icon 2) add a label icon, to make it more beautifil
	
	level : "ERROR",		// get the default level from server-side. It should be generated by tooling base on user's configuration.
	text : "",				// the value of binding of dataName in current BTTContext, it's text.
	styleClass : "",		// style of the level of messages
	name : "",				// binded dataName
	messageArray : "",
	_popupDialog : null,		// popup dijit object
	isNotSubmitted : true,
	displayMode : "STATIC",	//default is static mode display, not popup
	width : "",
	height : "",
	textWrap : false,
	
	attributeMap: dojo.delegate(dijit._Widget.prototype.attributeMap, {
	}),
	
	postMixInProperties : function(){
		this.inherited(arguments);
		this.bundle = new com.ibm.btt.util.I18nBundle("com.ibm.btt.dijit", "Message");
	},
	
	postCreate:function(){
		this._init();
		this._showHideCloseHandler(false);
		if(this.text) {
			this.display(this.text, this.level);
		} else if (this.messageArray) {
			try {
				var tempArray = dojo.fromJson(this.messageArray);
				this.displayMessageArray(tempArray);
			} catch (e) {
				
			}
		}
	},
	
	_init:function(){
		this.closeHandler.innerHTML = this.bundle.getMessage("closeMessage");
		this.styleClass = {
			"ERROR":"errorMessage",
			"WARN":"warnMessage",
			"INFO":"infoMessage"
		};
		this.connect(this.closeHandler, "ondijitclick", "closeMessage");
//		dojo.connect(this.closeHandler, "onclick", this,"closeMessage");
//		dojo.connect(this.closeHandler, "onkeydown", this, function(e){
//			if (e.keyCode==dojo.keys.SPACE || e.keyCode==dojo.keys.ENTER)
//			{
//				dojo.stopEvent(e);
//				this.closeMessage();
//				return false;
//			}	
//		});
	},
	
	/**
	 * Display the message at xx level . API for beta developer. text should be NLS aware
	 * 
	 * For dynamic values, the message should be a template like this : TRANSFER_ERROR:Your {account} doesn't can't transfer value exceeds {amount}.
	 * Alpha developer can invoke the API like message1.display("TRANSFER_ERROR","ERROR", accountTextbox1.value, amounTextbox1.value);
	 * 
	 * When the text is NLS key , whose value is template, user need pass in both the level and the value array.
	 * 
	 * @param text the message content 
	 * @param level level including ERROR, WARN , INFO. it's optional
	 */
	display:function(text, level){	//FIXME, the API define. We can't support both display(text, dynamic attributes ) and display(text, level ) etc.
		if ((text  === ""  )||(text === null) || (text === undefined)){	//empty , or null, don't display it at null
			console.info("[display] Need text message for displaying");
			this._showHideCloseHandler(false);
			return; 
		}
			
		var message = this._getMessageValue.apply(this, arguments);		//1. get message value
		this.staticMessageHolder.innerHTML = message;	//display it
		
		if(level === undefined){
			level = this.level; 	//use the default level
		}
		
		this._switchModeAndStyles("STATIC", level);
		this._showHideCloseHandler(true);
		this.set("visibility", "inherit");
	},
	
	displayMessageArray : function(mesArray) {
		if(mesArray.length > 0) {
			var strArray = [];
			for(var i = 0; i < mesArray.length; i ++) {
				strArray.push((i + 1) + " ");
				strArray.push(this._getMessageValue(mesArray[i]));
				if(i != mesArray.length - 1) 
					strArray.push("<br>");
			}
			
			var message = strArray.join("");
			if(this.displayMode === "STATIC") {
				this.display(message);
			} else {
				this.displayPopup(message);
			}
		}
	}, 

	/**
	 * 
	 * Flag is true, then show ; else hide closeHanlder node
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_showHideCloseHandler:function(flag){
		if(flag){
			dojo.style(this.closeHandler,{
				"display" : ""
			});
		}else{
			dojo.style(this.closeHandler,{
				"display" : "none"
			});
		}
		
	},
	
	/**
	 * Display the message at xx level in popup way
	 * 
	 * For dynamic values, the message should be a template like this : TRANSFER_ERROR:Your {account} doesn't can't transfer value exceeds {amount}.
	 * Alpha developer can invoke the API like message1.display("TRANSFER_ERROR","ERROR", accountTextbox1.value, amounTextbox1.value);
	 * 
	 * When the text is NLS key , whose value is template, user need pass in both the level and the value array.
	 * 
	 * @text message content
	 * @level level including ERROR, WARN , INFO. level is optional
	 */
	displayPopup:function(text, level){ //FIXME, the API define. We can't support both display(text, dynamic attributes ) and display(text, level ) etc.
	
		if ((text  === ""  )||(text === null) || (text === undefined)){	//empty , or null, don't display it at null
			console.info("[displayPopup] Need text message for displaying")
			return; 
		}
		var message = this._getMessageValue.apply(this,arguments);		//1. get message value
		this.popupMessageHolder.innerHTML = message;	//display it
		if(level === undefined){
			level = this.level; 	//use the default level
		}
		this._switchModeAndStyles("POPUP",level);
		if (this._popupDialog === null) {
			var dialogId = this.id + "messagePopup";
			this._popupDialog = new dijit.Dialog( {
				id : dialogId,
				style : "min-width:300px;",
				title : this.bundle.getMessage("popupTitle") // i18n for this.
			}, this.dialogHolder);
		}
		// this._popupDialog.show();
		this.set("visibility", "inherit");
	},
	
	/**
	 * public method, developer can invoke this api to close the displayed mesage. Either static label or popup messages
	 */
	closeMessage:function(){
		this.set("visibility", "gone");
//		if(this.displayMode === "STATIC"){
//			dojo.style(this.staticHolder,{
//				"display":"none"
//			});
//		}else {
//			if(this._popupDialog !== null){
//				this._popupDialog.hide();
//			}
//		}
	},
	
	_setVisibilityAttr : function(value){
		this.inherited(arguments);

		if(this.displayMode !== "STATIC" && this._popupDialog){
			if (value=="gone" || value=="hidden"){
				if (this._popupDialog.open){
					this._popupDialog.hide();
				}
			}else{
				if (!this._popupDialog.open){
					this._popupDialog.show();
				}
			}
		}
	},
	
	_setTextWrapAttr : function(value){
		this.textWrap = value;
		this._setTextLabelStyle();
	},
	
	/**
	 * 
	 * hook method for width method
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	
	_setWidthAttr : function(value) {
		if (value != "" && value != null) {
			this.width = value;
			dojo.style(this.staticMessageHolder, "width", this.handleLenUint(this.width));
			dojo.style(this.popupMessageHolder, "width", this.handleLenUint(this.width));
		}
	},
	
	/**
	 * 
	 * hook method for height method
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	
	_setHeightAttr : function(value) {
		if (value != "" && value != null) {
			this.height = value;
			dojo.style(this.staticMessageHolder, "height", this.handleLenUint(this.height));
			dojo.style(this.popupMessageHolder, "height", this.handleLenUint(this.height));
		}
	},
	
	/**
	 * 
	 * internal method to set the mode and style for widget
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_switchModeAndStyles : function(mode, level) {
		this.displayMode = mode;
		
		if(this.displayMode === "STATIC"){
			dojo.style(this.staticHolder,{
				"display" : ""
			});
			dojo.style(this.dialogHolder,{
				"display" : "none"
			});
			if(this._popupDialog !== null){
				this._popupDialog.hide();
			}
			dojo.removeClass(this.staticMessageHolder);
			dojo.addClass(this.staticMessageHolder,this.styleClass[level]);	//apply the style class of the level...
		} else {
			dojo.style(this.dialogHolder,{
				"display" : ""
			});
			dojo.style(this.staticHolder,{
				"display" : "none"
			});
			dojo.removeClass(this.popupMessageHolder);
			dojo.addClass(this.popupMessageHolder, this.styleClass[level]);	//apply the style class of the level...
		}
		this._setTextLabelStyle();
	},
	
	_setTextLabelStyle : function(){
		dojo.addClass(this.popupMessageHolder, "dijitLabelBase");
		if (this.textWrap == true) {
			dojo.addClass(this.popupMessageHolder, "dijitLabelWrap");
		} else {
			dojo.removeClass(this.popupMessageHolder, "dijitLabelWrap");
		}
		dojo.addClass(this.staticMessageHolder, "dijitLabelBase");
		if (this.textWrap == true) {
			dojo.addClass(this.staticMessageHolder, "dijitLabelWrap");
		} else {
			dojo.removeClass(this.staticMessageHolder, "dijitLabelWrap");
		}
	},
	
	/**
	 * 
	 * hook method for message attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getMessageValue:function(text,level){
		//1) get i18n value   2) if it's a template, Message1.display(��ERROR��, ��CROSS_FILED_VALIDATION_ERROR��,��{ xx : cbcrossbank.value, xx:xxx});
		var message = ""; 
		if(arguments.length  === 1 ){	//only one argument, it's text
			message = StringUtil.escapeEnterWrap(this.getI18NString(text)); 	//geti18n value...	
		}else if(arguments.length === 2){	 // text, level ,
			message = StringUtil.escapeEnterWrap(this.getI18NString(text)); 	//geti18n value...
		}else if(arguments.length > 2){		//text, level, dynamic attributes...
			var values = [];
			for(var i= 2; i< arguments.length; i++){
				values.push(arguments[i]);
			}
			console.debug("display,dynamic attributes values",values);
			message = StringUtil.escapeEnterWrap(this.getI18NString(text,values,true));
		}
		
		return message;
	},

	/**
	 * 
	 * hook method for value attribute
	 * For AJAX response error scenario, it will use the name,value pairs to reset all the widget's values
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setValueAttr:function(value){
		this.text = value;
	},
	
	destroy : function() {
		this.inherited(arguments);
		if(this._popupDialog !== null){
			this._popupDialog.destroyRecursive();		//set free the dijit dialog	
		}
	}
	
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.FileUpload"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.FileUpload"] = true;
/*
* Licensed Materials - Property of IBM
* Restricted Materials of IBM
* 5724-H82
* (C) Copyright IBM Corp.2010 All Rights Reserved.
* US Government Users Restricted Rights - Use, duplication or disclosure
* restricted by GSA ADP Schedule Contract with IBM Corp
*/
 
dojo.provide("com.ibm.btt.dijit.FileUpload");








 
/**
* Declare a widget to provide client side AJAX file upload function, contains:
*  1. Text Box
* 2. Browse Button
* 3. Upload Button
* 4. Cancel Button
* 5. Upload Status
* 6. Error Message
*
* Basic Function:
*  	 User can use Browse Button to select a file from local file system, then click Upload Button to upload it to server side,
*  	 or click Cancel Button to clear the selection.
*  	 During the upload process, user can click Cancel button to terminate the upload process.
*  	 When file successfully uploaded, user can delete the uploaded file using Cancel Button.
*
* Implement based on dojox.form.FileUpload, extends it to enable Cancel function.
*
*/
dojo.declare("com.ibm.btt.dijit.FileUpload",
 [dijit._Widget, dijit._Templated, com.ibm.btt.dijit.AbstractWidgetMixin],{
 
 templateString: dojo.cache("com.ibm.btt.dijit", "templates/FileUpload.html", "<div dojoAttachPoint=\"fileuploader\" class = \"fileupload_pane\">\r\n<!--\r\n/* \r\n *------------------------------------------------------------------- \r\n * Licensed Materials - Property of IBM\r\n * Restricted Materials of IBM\r\n * 5724-H82\r\n * (C) Copyright IBM Corp.2010 All Rights Reserved.\r\n * US Government Users Restricted Rights - Use, duplication or disclosure\r\n * restricted by GSA ADP Schedule Contract with IBM Corp\r\n -------------------------------------------------------------------\r\n */\r\n-->\r\n\t<span dojoAttachPoint=\"inputBox\"></span>\r\n\t<span dojoAttachPoint=\"browseBtn\"></span>\r\n\t<div dojoAttachPoint=\"uploadBtn\"></div>\r\n\t<span dojoAttachPoint=\"statusMessage\" class=\"loadingMsg\"></span>\r\n\t<div dojoAttachPoint=\"clearBtn\"></div>\r\n\t<span dojoAttachPoint=\"errorMessage\" class=\"errorMsg\"></span>\r\n</div>\r\n\r\n\r\n"),
 
 state : "Incomplete", //Normal, Incomplete, or Error
 
 /**
  * UI properties: visibility, disable, required, width
  *  	 tabIndex = -1, user can not access a file upload widget using tab
  */
 required : false,
 disabled: false,
 _visibilityHolder: [],
 _isDisabled_uploadButton : false,
 tabIndex : "-1",
 width : "",
 _browse_width: null,
 
 /**
  * contained dijit: Text Box, Browse Button, Upload Button, Cancel Button
  */
 inputText : null,
 f0 : null,
 uploadButton: null,
 cancelButton: null,
 
 //name: "uploadFile",
 /**
  * _state: validation checking:
  *  	 none - no file uploaded,
  *  	 done - file uploaded successfully,
  *  	 uploading - file is uploading
  *  	 error - error occurs during uploading
  *  	 canceling - file upload progress is cancelling
  *  	 uploading and error state will prevent form submit
  */
 _state : "none",
 
 /**
  * Uploaded file name, can load from context in jsp tag
  * If value isn't null, render the widget as "done" state
  */
 value : "",
 currentFileInfo : null,
 
 /**
  * Functional properties:
  *  	 fileExtension: user can define their file extension limitation
  *  	 fileSize: user can define the max size of file allow to upload, change to configure in server side
  */
 fileExtension : "",
 //fileSize : null,
 
 /**
  * Internal properties:
  *  	 uploadUrl: the server side location to handle file upload request
  *  	 storeDataName: the bound context data to store the file info
  *  	 bttParams: BTT params generated from JSP tag, used to get session ID and processor ID
  *  	 _bundle: NLS support i18n
  *  	 error message for file size&mask limitation, showed as dojo hint
  */
 uploadUrl: "",
 storeDataName: "",
 bttParams: "",
 _bttParamJSON : null,
 _accessByKey : false,
 
 _bundle : new com.ibm.btt.util.I18nBundle("com.ibm.btt.dijit", "FileUpload"),
 _mods : [],
 
 _eventHandlers : [],
 /**
  * Create widget UE:
  *  	 0. parse BTT params
  *  	 1. create inner dijit
  *  	 2. render inner dijit
  *  	 3. connect events
  *  	 4. fire onShow event to make dojox.form.FileUploader create a form inner node
  */
 postCreate: function(){
 	 //parse the bttParam as json
 	 this._bttParamJSON = dojo.fromJson(this.bttParams);
 	 //create inner dijit
 	 this.createInsideWidgets();
 	 //render inner dijit
 	 this.renderItems();
 	 
 	 //connect events
 	 this.connectEvents();
 
 	 //fire onShow event to make dojox.form.FileUploader create a form inner node.
 	 this.onShow();
 	 
 	 this._tabSupport(true);
 	 
 	 this.inherited(arguments);
 },
 
 /**
  * Create inner dijit in the right DOM node
  */
 createInsideWidgets : function(){
 	 //create input box: set as readOnly
 	 this.inputText = new dijit.form.TextBox({}, this.inputBox);
 	 dojo.addClass(this.inputText.domNode, "inputBox");
 	 this.setReadOnly(this.inputText, true);
 	 
 	 //hack: remove reset method of input text in order to prevent value reset when file uploading.
 	 this.inputText.reset = null;
 	 
 	 //create upload button
 	 this.uploadButton = new dijit.form.Button({label: this._bundle.getMessage("UPLOAD_BUTTON_LABEL")}, this.uploadBtn);
 	 
 	 //create cancel button
 	 this.cancelButton = new dijit.form.Button({label: this._bundle.getMessage("CANCEL_BUTTON_LABEL")}, this.clearBtn);
 	 
 	 //create browse button
 	 this.browseBtn.innerHTML = this._bundle.getMessage("BROWSE_BUTTON_LABEL");
 	 
 	 //format the POST URL format, parameters: processId, sessionId, dataName, filesize
 	 var parameters = this._buildParameter();
//	 	 if(this.fileSize){
//	 	 	 //if fileSize is null, use server side default size limitation
//	 	 	 parameters+="&filesize="+this.fileSize*1024;
//	 	 };
 	 
 	 //create a file uploader
 	 //ajust IE style problem
 	 var styleClasses;
 	 if(dojo.isIE){
 	 	 dojo.addClass(this.uploadButton.domNode, "commonButton");
 	 	 dojo.addClass(this.cancelButton.domNode, "commonButton");	 
 	 }
 	 this.f0 = new com.ibm.btt.dijit.FileUploader(dojo.mixin({
 	 	 	 force:"html",
 	 	 	 uploadUrl:this.uploadUrl+parameters,
 	 	 	 showProgress:false,
 	 	 	 selectMultipleFiles:false,
 	 	 	 uploadOnChange:false,
 	 	 	 tabIndex: -1
 	 	 }, styleClasses), this.browseBtn);
 	 
 	 //hack for alignment problem: set the width of f0.insideNode in order to don't let the label of the browse button move out
 	 dojo.style(this.f0.insideNode, {
 	 	 "width":"0px"
 	 });
 	 //calculate a suitable width for the widget
 	 this._calculateWidth();
 },
 
 _buildParameter : function(){
 	 var parameters = "?dataName="+this.storeDataName;
 	 if(this._bttParamJSON.dse_processorId){
 	 	 parameters+="&processId="+this._bttParamJSON.dse_processorId;
 	 }
 	 if(this._bttParamJSON.dse_sessionId){
 	 	 parameters+="&sessionId="+this._bttParamJSON.dse_sessionId;
 	 }
 	 return parameters;
 },
 
 /**
  * adjust the width of the file upload widget:
  *	 //	 1. if the width is larger than min width, set to domNode, and adjust the width of input box, and
  *	 //	 	 all the button display align right.
  *	 //	 2. if the width is set smaller than min width, ignore it, since file upload widget will break into two lines.
  *	 //	 3. default min width is set in CSS file based on different theme.	 
  *
  */
 _calculateWidth : function(){
 	 //adjust the width of the file upload widget:
 	 //	 1. if the width is larger than min width, set to domNode, and adjust the width of input box, and
 	 //	 	 all the button display align right.
 	 //	 2. if the width is set smaller than min width, ignore it, since file upload widget will break into two lines.
 	 //	 3. default min width is set in CSS file based on different theme.
 	 var input_width = dojo.style(this.inputText.domNode, "width");
 	 var upload_button_width = dojo.style(this.uploadButton.domNode, "width");
 	 var browse_button_width = dojo.style(this.f0.domNode, "width");
 	 var cancel_button_width = dojo.style(this.cancelButton.domNode, "width");
 	 var blank = 35;
 	 var button_width = upload_button_width + browse_button_width + cancel_button_width + blank;
 	 var minWidth = input_width + button_width;
 	 if(this.width){
 	 	 //console.debug("this.width", this.width);
 	 	 var assignedWidth = this.width.substr(0, this.width.lastIndexOf("px"));
 	 	 //console.debug("assignedWidth", assignedWidth);
 	 	 if(assignedWidth && assignedWidth > minWidth){
 	 	 	 if(this.width && assignedWidth > minWidth){
 	 	 	 	 dojo.style(this.fileuploader, "width", this.width);
 	 	 	 	 dojo.style(this.inputText.domNode, "width", (assignedWidth - button_width)+"px");
 	 	 	 } else {
 	 	 	 	 dojo.style(this.fileuploader, "width", minWidth+"px");
 	 	 	 }
 	 	 }
 	 }
 	 
 	 
 	 
 	 //get default width of browse button
 	 this._browse_width = dojo.style(this.f0.domNode, "width");
 },
 
 /**
  * Control whether this widget will support tab access.
  * Default is "false": this._tabSupport(false) is called in createInsideWidgets
  *  	 
  * @value boolean value, true for support, false for not support
  */
 _tabSupport : function(value){
 	 if(value){
 	 	 this.inputText.set('tabIndex', "-1");
 	 	 //wairole="presentation" role="presentation"
 	 	 this.f0.domNode.setAttribute('wairole','presentation');
 	 	 this.f0.domNode.setAttribute('role','presentation');
 	 	 this.f0.insideNode.setAttribute('wairole','presentation');
 	 	 this.f0.insideNode.setAttribute('role','presentation');
//	 	 	 dojo.style(this.f0._fileInput, {
//	 	 	 	 opacity:0
//	 	 	 });
//	 	 	 if(dojo.isIE){
 	 	 	 this.f0.domNode.setAttribute("tabIndex", "0");
 	 	 	 this.f0._fileInput.setAttribute('tabIndex', "-1");
 	 	 	 this._eventHandlers.push(dojo.connect(this.f0.domNode, "onkeyup", dojo.hitch(this, function(e){
 	 	 	 	 if (e.keyCode == dojo.keys.ENTER || e.keyCode == dojo.keys.SPACE){
 	 	 	 	 	 this.f0._fileInput.click(e);
 	 	 	 	 	 dojo.stopEvent(e);
 	 	 	 	 }
 	 	 	 })));
 	 	 	 
 	 	 	 // defect 29975, add a new listener, this should not be necessary, but have to do this here
 	 	 	 this._eventHandlers.push(dojo.connect(this.f0.insideNode, "onclick", dojo.hitch(this, function(e){
 	 	 		 // BP34260
	 	 	 	 if(!this.disabled) {
	 	 	 		 this.f0._fileInput.click(e);	 	 	 		 
	 	 	 	 }
	 	 	 	 dojo.stopEvent(e);
	 	 	 })));
//	 	 	 }else{
//	 	 	 	 this.f0.domNode.setAttribute('tabIndex', "-1");	 
//	 	 	 	 this.f0._fileInput.setAttribute('tabIndex', "0");
//	 	 	 }
 	 }
 },
 
 /**
  * Render inner dijit based on the value of the widget
  *  	 
  */
 renderItems : function(){
 	 console.debug("this.value", this.value)
 	 if(this.value){
 	 	 //file context have data, render widget as "done" state
 	 	 this._state = "done";
 	 	 this._set("state","");
 	 	 
 	 	 try{
 	 	 	 this.currentFileInfo = dojo.fromJson(this.value);
 	 	 } catch (e) {
 	 	 	 //invalid file info
 	 	 	 console.debug("error occurs", e);
 	 	 	 this._state = "none";
 	 	 	 if(this.required){
 	 	 	 	 this._set("state", "Incomplete");
 	 	 	 }else{
 	 	 	 	 this._set("state", "");
 	 	 	 }
 	 	 	 this.value = "";
 	 	 }
 	 	 
 	 } else {
 	 	 //file context have no data, render widget as "none" state
 	 	 this._state = "none";
 	 	 if(this.required){
 	 	 	 this._set("state", "Incomplete");
 	 	 }else{
 	 	 	 this._set("state", "");
 	 	 }
 	 }
 	 //init inner widget visibility
 	 this._initRenderItems();
 	 //init inner widget properties
 	 this._initUIProperties();
 },
 
 /**
  * Init inner widget visibility
  *  	 
  */
 _initRenderItems : function(){
 	 //reset the input text value
 	 this.inputText.set("value", "");
 	 //clear message and error
 	 this._clearMessage();
 	 //if the state is done, file is successfully uploaded
 	 if(this._state == "done"){
 	 	 console.debug("this.currentFileInfo", this.currentFileInfo);
 	 	 //hide input textbox, browse, upload button
 	 	 dojo.style(this.f0.domNode, "visibility", "hidden");
 	 	 dojo.style(this.f0.insideNode, "visibility", "inherit");
 	 	 dojo.style(this.f0.domNode, "width", "0px");
 	 	 this.setVisibility(this.inputText.domNode, false, true);
 	 	 this.setVisibility(this.uploadButton.domNode, false, true);
 	 	 //show cancel button
 	 	 this.setVisibility(this.cancelButton.domNode, true);
 	 	 //show file name in message section
 	 	 this.statusMessage.innerHTML = this.currentFileInfo.name;
 	 } else {
 	 	 //the state isn't "done", reset the UE as "none"
 	 	 //show input textbox, browse button
 	 	 dojo.style(this.f0.domNode, "visibility", "inherit");
 	 	 dojo.style(this.f0.insideNode, "visibility", "inherit");
 	 	 dojo.style(this.f0.domNode, "width", this._browse_width+"px");
 	 	 dojo.fadeIn({ node: this.f0.domNode, duration:275 }).play();
 	 	 this.setVisibility(this.inputText.domNode, true);
 	 	 
 	 	 //hide upload button, cancelButton
 	 	 this.setVisibility(this.uploadButton.domNode, false, false);
 	 	 this.setVisibility(this.cancelButton.domNode, false, false);
 	 }
 	 
 },
 
 /**
  * Init inner widget properties: visibility
  *  	 
  */
 _initUIProperties : function(){
 	 this._visibilityHolder = [];
 	 //if the widget is set as "hidden" or "gone", store the properties and hide it
 	 if(this.visibility == "hidden" || this.visibility == "gone"){
 	 	 if(this._state == "none"){
 	 	 	 this._visibilityHolder.push({dijit: this.inputText.domNode, visibility: "inherit"});
 	 	 	 this._visibilityHolder.push({dijit: this.f0.domNode, visibility: "inherit"});
 	 	 	 this._visibilityHolder.push({dijit: this.f0.insideNode, visibility: "inherit"});
 	 	 	 this.setVisibility(this.inputText.domNode, false, false);
 	 	 	 dojo.style(this.f0.domNode, "visibility", "hidden");
 	 	 	 dojo.style(this.f0.insideNode, "visibility", "inherit");
 	 	 } else {
 	 	 	 this._visibilityHolder.push({dijit: this.cancelButton.domNode, visibility: "inherit"});
 	 	 	 this.setVisibility(this.cancelButton.domNode, false, true);
 	 	 	 this._visibilityHolder.push({dijit: this.statusMessage, visibility: "inherit"});
 	 	 	 dojo.style(this.statusMessage, "visibility", "hidden");
 	 	 }
 	 }
 	 
 	 //this._setDisabledAttr(this.disabled);
 },
 
 /**
  * Clear the message sections: uploading message, file info, and error message.
  *  	 
  */
 _clearMessage : function(){
 	 //clear message and error
 	 this.statusMessage.innerHTML = "";
 	 this.errorMessage.innerHTML = "";
 	 dojo.style(this.errorMessage, "display", "none");
 	 this._showErrorInputBox(false);
 },
 
 /**
  * Connect all the event to perform the basic function of FileUpload
  */
 connectEvents: function(){
 	 //when user select a file
 	 this._eventHandlers.push(dojo.connect(this.f0, "onChange", this, this._handleSelect));
 	 
 	 //when user click upload button, upload file to server side
 	 this._eventHandlers.push(dojo.connect(this.uploadButton, "onClick", this, this._handleUpload));
 	 
 	 //when upload process complete
 	 this._eventHandlers.push(dojo.connect(this.f0, "onComplete", this, function(dataArray){
 	 	 //check response json object: name, errorcode	 	 
 	 	 var response = dataArray[0];
 	 	 console.debug("response", response);
 	 	 var message = response.name;
 	 	 var errorCode = response.errorCode;
 	 	 //here add a "TypeError" check, since parse error in iframe will not call onError
 	 	 if(message == "TypeError" || errorCode){
 	 	 	 this.handleError(errorCode);
 	 	 } else {
 	 	 	 this.handleSuccess(response);
 	 	 }
 	 }));
 	 
 	 //when user click browse, but don't select one file
 	 this._eventHandlers.push(dojo.connect(this.f0, "onCancel", this, function(){
 	 	 //if the field is required, and currently no file uploaded and no file selected,
 	 	 //give a error hint: change the color of input text as yellow
 	 	 if(this.required){
 	 	 	 if(this._state == "none" && (!this.f0._fileInput.value)){
 	 	 	 	 this._showErrorInputBox(true);	 
 	 	 	 	 this.displayMessage(this._bundle.getMessage("UPLOAD_REQUIRED"));
 	 	 	 }
 	 	 }
 	 }));
 	 
 	 //when upload process complete
 	 this._eventHandlers.push(dojo.connect(this.f0, "onError", this, function(){
 	 	 console.debug("onError", this._state);
 	 	 if(this._state == "canceling"){
 	 	 	 //the error fired by cancel should not be plaude.
 	 	 }else{
 	 	 	 this.handleError();
 	 	 }
 	 }));
 	 
 	 //handle cancel during uploading
 	 this._eventHandlers.push(dojo.connect(this.cancelButton, "onClick", this, function(){
 	 	 this.reset();
 	 }));
 },
 
 /**
  * Handle user select one file
  *  @data: the info of user selected file, contains: name and size (size is not supported here)
  */
 _handleSelect : function(data){
 	 //show clear button
 	 this.setVisibility(this.cancelButton.domNode, true);
 	 //show upload button and disable it
 	 this.setVisibility(this.uploadButton.domNode, true);
 	 this._clearMessage();
 	 //get file info
 	 var fileinfo = data[0];
 	 //show file name in input text.
 	 this.inputText.set("value", fileinfo.name);
 
 	 //check file mask
 	 var mask = fileinfo.name.substr(fileinfo.name.lastIndexOf(".") + 1).toLowerCase();
 	 if(this.fileExtension != "" && this.fileExtension.indexOf(mask) == -1){
 	 	 //error file mask
 	 	 //disable upload button
 	 	 this.setDisabled(this.uploadButton, true);
 	 	 this._isDisabled_uploadButton = true;
 	 	 //show error dojo hint and error input box
 	 	 this.displayMessage(this._bundle.getMessage("UPLOAD_ERRORFILEMASK", {value:this.fileExtension}));
 	 	 this._showErrorInputBox(true);
 	 	 //change state into error and prevent form submit
 	 	 this._state = "error";
 	 	 this._set("state","Error");
 	 	 this.validate();
 	 	 
 	 } else {
 	 	 //acceptable file mask
 	 	 //enable upload button
 	 	 this.setDisabled(this.uploadButton, false);
 	 	 this._isDisabled_uploadButton = false;
 	 	 //change state into none and fire form submit check
 	 	 this._state = "none";
 	 	 if(this.required){
 	 	 	 this._set("state", "Incomplete");
 	 	 }else{
 	 	 	 this._set("state", "");
 	 	 }
 	 	 this.validate();
 	 }
 },
 
 /**
  * Handle file upload action when user click upload button
  */
 _handleUpload : function(){
 	 //change the widget state to uploading, block form submit.
 	 this._state = "uploading";
 	 this._set("state", "Incomplete");
 	 //hide browse and upload button
 	 this.setVisibility(this.uploadButton.domNode, false, true);
 	 dojo.style(this.f0.domNode, "visibility", "hidden");
 	 dojo.style(this.f0.domNode, "width", "0px");
 	 dojo.fadeOut({ node: this.f0.domNode, duration:275 }).play();
 	 
//	 	 //show clear button - not supported in this iteration
 	 this.setVisibility(this.cancelButton.domNode, true);
 	 
 	 //show upload status message
 	 this.statusMessage.innerHTML = "";
 	 var uploadingImages = document.createElement("img");
 	 this._mods.push(uploadingImages);
 	 var imgPath = dojo.moduleUrl("com.ibm.btt.dijit", "images/loading.gif");
 	 uploadingImages.setAttribute("src", imgPath.path);
 	 this.statusMessage.appendChild(uploadingImages);
 	 var uploadingMsg = document.createElement("span");
 	this._mods.push(uploadingMsg);
 	 uploadingMsg.innerHTML = " " + this._bundle.getMessage("UPLOAD_UPLOADING");
 	 this.statusMessage.appendChild(uploadingMsg);
 	 
 	 console.debug("before f0.upload");
 	 var uuid = this.getUUID();
 	 this.f0.fileUploadUUID = uuid;
 	 //upload the file
 	 this.f0.upload();
 	 console.debug("after f0.upload");
 	 setTimeout(dojo.hitch(this, this._queryFileSizeFromServer),3000);  
 	 //fire onUpload event;
 	 this.onUpload();
 	 
 	 
 },
 
 getUUID : function() {
 	 return dojox.uuid.generateRandomUuid();
 },
 
 _queryFileSizeFromServer: function() {
 	 
 	 if(this._state == "uploading" && this.f0.fileUploadUUID) {
 	 	 var xhrArgs = {
 	 	 	 url: this.f0.uploadUrl + "&uuid=" + this.f0.fileUploadUUID + "&fileUpLoadAction=querySize",
 	 	 	 handleAs: "json",
 	 	 	 load: dojo.hitch(this, function(data){
 	 	 	 	 if(data && this._state == "uploading") {
 	 	 	 	 	 if(data.errorCode == "7") {
 	 	 	 	 	 	 this.f0.cancel();
 	 	 	 	 	 }
 	 	 	 	 }
 	 	 	 } ),
 	 	 	 error: dojo.hitch(this, function(error){
 	 	 	 	 if(this._state == "uploading") {
 	 	 	 	 	 this.reset();	 
 	 	 	 	 }
 	 	 	 } )
 	  };
 	 	 dojo.xhrGet(xhrArgs);
 	 }
 	 
 },
 
 _clearFizeSizePendingOnServer : function() {
 	 if(this.f0.fileUploadUUID) {
 	 	 var xhrArgs = {
 	 	 	 url: this.f0.uploadUrl + "&uuid=" + this.f0.fileUploadUUID + "&fileUpLoadAction=cancelPending",
 	 	 	 handleAs: "json",
 	 	 	 load: dojo.hitch(this, function(data){
 	 	 	 	 console.debug("Cancel the file uploading pending on server successfully");
 	 	 	 } ),
 	 	 	 error: dojo.hitch(this, function(error){
 	 	 	 	 console.debug("Error when canceling the file uploading pending on server");
 	 	 	 } )
 	  };
 	 	 dojo.xhrGet(xhrArgs);
 	 }
 },
 
 
 
 /**
  * Reset the widget's value to what it was at initialization time
  *   when the state is "done", delete upload files
  *   when the state is not done, cancel the upload
  */
 reset: function(){
 	 if(this._state == "done"){
 	 	 this._handleDelete();
 	 } else {
 	 	 this._handleCancel();
 	 }
 },
 
 /**
  * Handle user's cancel action in uploading process or in "none" or "error"
  */
 _handleCancel : function(){
 	 if(this._state == "none" || this._state == "error"){
 	 	 //user didn't click upload button, just clear user's selection
 	 	 this._resetUIforCancel();
 	 	 //fire onCancel event
 	 	 this.onCancel();
 	 } else if(this._state == "uploading"){
 	 	 this._state = "canceling";
 	 	 this._set("state", "Incomplete");
 	 	 //cancel the upload
 	 	 this.f0.cancel();
 	 	 
 	 	 //FIXME: HACK FOR SERVER SIDE INTEGRATION
 	 	 this._resetUIforCancel();
 	 	 //hack dojox.form.FileUploader issues, FileUploader will be disabled when error occurs.
 	 	 this.setDisabled(this.f0, false);
 	 	 //fire onCancel event
 	 	 this.onCancel();
 	 	 
 	 	 //call DELETE API to clear context and delete files if already saved in server side
 	 	 var successCallback = function(response,args){
 	 	 	 this._resetUIforCancel();
 	 	 	 //hack dojox.form.FileUploader issues, FileUploader will be disabled when error occurs.
 	 	 	 this.setDisabled(this.f0, false);
 	 	 	 //fire onCancel event
 	 	 	 this.onCancel();
 	 	 };
 	 	 var errorCallback = function(response,args){
 	 	 	 //show error message when error occurs during canceling
 	 	 	 this.displayMessage(this._bundle.getMessage("CANCEL_FAILSURE_MESSAGE"));
 	 	 	 this._state = "error";
 	 	 	 this._set("state", "Error");
 	 	 };
 	 	 this._clearFizeSizePendingOnServer();
 	 	 this._deleteFile(successCallback, errorCallback);
 	 }
 },
 /**
  * Reset UI when user click Cancel button
  */
 _resetUIforCancel : function(){
 	 //change the widget state to none, no file uploaded
 	 this._state = "none";
 	 if(this.required){
 	 	 this._set("state", "Incomplete");
 	 }else{
 	 	 this._set("state", "");
 	 }
 
 	 //clean user's previous selection
 	 this.f0._clearUserSelection();
 	 
 	 //show the init style of file upload widget
 	 this._initRenderItems();
 	 
 	 
 },
 /**
  * Handle user's cancel action in
  */
 _handleDelete : function(){
 	 //change state into none, no file uploaded
 	 this._state = "none";
 	 if(this.required){
 	 	 this._set("state", "Incomplete");
 	 }else{
 	 	 this._set("state", "");
 	 }
 	 //show the init style of file upload widget
 	 this._initRenderItems();
 	 
 	 //call DELETE API to clear context and delete files already saved in server side
 	 var successCallback = function(response,args){
 	 	 console.debug("sucess delete");
 	 	 //change state into none, no file uploaded
 	 	 this._state = "none";
 	 	 if(this.required){
 	 	 	 this._set("state", "Incomplete");
 	 	 }else{
 	 	 	 this._set("state", "");
 	 	 }
 	 	 //show the init style of file upload widget
 	 	 this._initRenderItems();
 	 	 //fire onDelete event
 	 	 this.onDelete();
 	 };
 	 var errorCallback = function(response,args){
 	 	 console.debug("error delete")
 	 	 //show error message when error occurs during delete file
 	 	 this.displayMessage(this._bundle.getMessage("DELETE_FAILSURE_MESSAGE"));
 	 	 this._state = "error";
 	 	 this._set("state","Error");
 	 };
 	 
 	 this._deleteFile(successCallback, errorCallback);
 },
 /**
  * Handle error occurs in uploading
  *  @errorcode: the error code responsed from server side.
  */
 handleError : function(errorcode){
 	 //change state into error.
 	 this._state = "error";
 	 this._set("state","Error");
 	 //hide uploading message
 	 this.statusMessage.innerHTML = "";
 	 //show input text, browse button, upload button and cancel button
 	 this.setVisibility(this.inputText.domNode, true);
 	 this._showErrorInputBox(true);
 	 dojo.style(this.f0.domNode, "visibility", "inherit");
 	 dojo.style(this.f0.domNode, "width", this._browse_width+"px");
 	 dojo.fadeIn({ node: this.f0.domNode, duration:275 }).play();
 	 this.setVisibility(this.uploadButton.domNode, true);
 	 //hack dojox.form.FileUploader issues, FileUploader will be disabled when error occurs.
 	 this.setDisabled(this.f0, false);	 
 	 //disable upload button
 	 this.setDisabled(this.uploadButton, true);
 	 this._isDisabled_uploadButton = true;
 	 //show clear button
 	 this.setVisibility(this.cancelButton.domNode, true);
 	 //check error message
 	 if(errorcode == "7"){
 	 	 //if the file size too large
 	 	 //show file size error
 	 	 this.displayMessage(this._bundle.getMessage("UPLOAD_FAILSURE_MESSAGE_FILESIZE"));	 
 	 } else {
 	 	 //create server error message
 	 	 this.displayMessage(this._bundle.getMessage("UPLOAD_FAILSURE_MESSAGE"));	 
 	 }
 	 //fire onError event
 	 this._clearFizeSizePendingOnServer();
 	 this.onError();
 },
 /**
  * Handle success for file upload widget
  *  @fileinfo: the file info responsed from server side.
  */
 handleSuccess : function(fileinfo){
 	 //change state into done, file is uploaded successfully
 	 this._state = "done";
 	 this._set("state", "");
 	 //show file name in message section
 	 this.statusMessage.innerHTML = fileinfo.name;
 	 this.value = fileinfo.name;
 	 this.currentFileInfo = fileinfo;
 	 console.debug("currentFileInfo", this.currentFileInfo);
 	 //hide input text box
 	 this.setVisibility(this.inputText.domNode, false, true);
 
 	 //fire onComplete event
 	 this.onComplete();
 },
 
 /**
  * Set the style of input box: normal or error
  *  	 @isError: if show as error style
  */
 _showErrorInputBox : function(/*Boolean*/ isError){
 	 if(isError){
 	 	 dojo.removeClass(this.inputText.domNode, "inputBox");
 	 	 dojo.addClass(this.inputText.domNode, "errInputBox");
 	 } else {
 	 	 dojo.removeClass(this.inputText.domNode, "errInputBox");
 	 	 dojo.addClass(this.inputText.domNode, "inputBox");
 	 }
 },
 
 _deleteFile: function(successCallback, errorCallback){
 	 if(this._bttParamJSON && this.currentFileInfo){
 	 	 console.debug("currentFileInfo", this.currentFileInfo)
 	 	 var parameters = this._buildParameter();
 	 	 parameters+="&fileId="+this.currentFileInfo.fileId;
 	 	 dojo.xhrDelete({
  
            url: this.uploadUrl+parameters,
  
            preventCache: true,
  
            error: dojo.hitch(this, function(response, args) {
//	 	 	 	 	 console.debug("response", response);
//	 	 	 	 	 console.debug("args", args);
//	 	 	 	  	 console.debug("Error occurs when delete file");
 	 	 	  	 dojo.hitch(this, errorCallback)(response, args);
  
            }),
  
            load: dojo.hitch(this, function(response, args) {
//	  
	 console.debug("response", response);
//	  
	 console.debug("args", args);
//	  
	 console.debug("File is successfully deleted");
  
	 if(response.errorCode){
 	 	 	 	 	 dojo.hitch(this, errorCallback)(response, args);
 	 	 	 	 } else {
 	 	 	 	 	 this.currentFileInfo = null;
 	 	 	 	 	 dojo.hitch(this, successCallback)(response, args);
 	 	 	 	 }
  
            })          
 	 	 });
 	 }
 },
 
 /*************************
  *	  Public Events	  *
  *************************/
 
 /**
  * The following events are inherited from _Widget and still may be connected:
  *  	 onClick
  * onMouseUp
  * onMouseDown
  * onMouseOver
  * onMouseOut
  */
 
 /**
  * stub to connect: Fires when user click upload button.
  */
 onUpload: function(){
 	 // trigger form validation test
 	 this.validate();
 },
 
 /**
  * stub to connect: Fires when file is uploaded.
  */
 onComplete: function(){
 	 // trigger form validation test
 	 this.validate();
 },
 
 /**
  * stub to connect: Fires when user cancel the upload process.
  */
 onCancel: function(){
 	 // trigger form validation test
 	 this.validate();	  
 },
 
 /**
  * stub to connect: Fires when upload process occurs some error.
  */
 onError: function(){
 	 // trigger form validation test
 	 this.validate();
 },
 
 /**
  * stub to connect: Fires when user delete current uploaded file and want to reupload files.
  */
 onDelete: function(){
 	 // trigger form validation test
 	 this.validate();
 },
 
 validate: function(){
 
 },
 
 /*************************
  *	  Public Functions	  *
  *************************/
 getFileInfo : function(){
 	 return this.currentFileInfo;
 },
 
 reload : function(){
 	 this.value = "";
 	 this.currentFileInfo = null;
 	 this._resetUIforCancel();
 },
 
 /**
  * enable set visibility properties.
  *  @value: String variable: gone, hidden and visible
  */
 _setVisibilityAttr : function(value){
 	 //need handle contained dijits.
 	 if (value == "gone") {
 	 	 this._allDisappear();
 	 	 dojo.style(this.domNode, "visibility", "hidden");
 	 	 dojo.style(this.domNode, "display", "none");
 	 } else if (value == "hidden") {
 	 	 this._allDisappear();
 	 	 dojo.style(this.domNode, "display", "");
 	 	 dojo.style(this.domNode, "visibility", "hidden");	 
 	 } else {
 	 	 this._allShowUp();
 	 	 dojo.style(this.domNode, "display", "");
 	 	 dojo.style(this.domNode, "visibility", "inherit");
 	 	 value = "inherit";
 	 }
 	 this.visibility = value;
 },
 
 /**
  * when set visibility is visible, recover the old state
  */
 _allShowUp : function(){
 	 //old state is saved in this._visibilityHolder
 	 dojo.forEach(this._visibilityHolder, function(v){
 	 	 dojo.style(v.dijit, "visibility", v.visibility);
 	 });
 	 //clear the old states
 	 this._visibilityHolder = [];
 },
 
 /**
  * hold the visibility states util method
  *  @domNode: the domNode which visibility state need to store
  */
 _holdVisibilityFeatures : function(/*DomNode*/domNode){
 	 this._visibilityHolder.push({dijit: domNode, visibility: "inherit"});
 },
 
 /**
  * when set visibility is hidden or gone,
  * save the current state (only visibile dijit) and set visibility as hidden
  */
 _allDisappear : function(){
 	 if(this.inputText){
 	 	 if(this._isVisible(this.inputText.domNode)){
 	 	 	 this._holdVisibilityFeatures(this.inputText.domNode);
 	 	 }
 	 	 dojo.style(this.inputText.domNode, "visibility", "hidden");
 	 }
 	 if(this.f0){
 	 	 if(this._isVisible(this.f0.domNode)){
 	 	 	 this._visibilityHolder.push({dijit: this.f0.domNode, visibility: "inherit"});
 	 	 	 this._visibilityHolder.push({dijit: this.f0.insideNode, visibility: "inherit"});
 	 	 }
 	 	 dojo.style(this.f0.domNode, "visibility", "hidden");
 	 	 dojo.style(this.f0.insideNode, "visibility", "inherit");
 	 }
 	 if(this.uploadButton){
 	 	 if(this._isVisible(this.uploadButton.domNode)){
 	 	 	 this._holdVisibilityFeatures(this.uploadButton.domNode);
 	 	 }
 	 	 dojo.style(this.uploadButton.domNode, "visibility", "hidden");
 	 }
 	 if(this.cancelButton){
 	 	 if(this._isVisible(this.cancelButton.domNode)){
 	 	 	 this._holdVisibilityFeatures(this.cancelButton.domNode);
 	 	 }
 	 	 dojo.style(this.cancelButton.domNode, "visibility", "hidden");
 	 	 //dijit.hideTooltip(this.cancelButton.domNode);
 	 }
 },
 
 
 /**
  * show dojo hint
  *  
  */
 displayMessage: function(message){
 	 dojo.style(this.errorMessage, "display", "");
 	 if(message){
 	 	 this.errorMessage.innerHTML = message;
 	 }
 },
 
 /**
  * set visibility of dom node
  *  @domNode: the domNode which visibility need to be set
  * @visibility: boolean variable, false for hidden, true for visible
  * @isHidden: boolean variable, false for display="", true for display="none"
  */
 setVisibility : function(/*DomNode*/ domNode, /*Boolean*/ visibility, isHidden){
 	 if(visibility){
 	 	 dojo.style(domNode, "visibility", "inherit");
 	 	 dojo.style(domNode, "display", "");
 	 	 //dojo.fadeIn({ node: domNode, duration:275 }).play();
 	 } else {
 	 	 dojo.style(domNode, "visibility", "hidden");
 	 	 //dojo.fadeOut({ node: domNode, duration:275 }).play();
 	 	 if(isHidden){
 	 	 	 dojo.style(domNode, "display", "none");
 	 	 }
 	 }
 	 
 },
 
 /**
  * check the dom node is visible or hidden
  *  @domNode: the domNode which visibility need to be checked
  */
 _isVisible : function(/*DomNode*/ node){
// 	 var visibility = dojo.style(node, "visibility");
// 	 if( visibility == "visible"){
// 	 	 return true;
// 	 } else if(visibility == "inherit" && dojo.style(this.domNode, "visibility") == "visible"){
// 	 	 //hack IE problem, in IE, visibility maybe inherit parent node.
// 	 	 return true;
// 	 }else {
// 	 	 return false;
// 	 }
 	 
 	 var isV = false;
 	 if (node.offsetWidth<1 || node.offsetHeight<1 || dojo.style(node, "display")=="none"){
 		 isV = false;
 	 }else{ 		 
 		 isV = dojo.style(node, "visibility")!="hidden";
 	 }
 	 return isV;
 },
 
 /**
  * set disable of the dijit
  *  @dijit: the dijit which will be disable
  *  @value: boolean value: true for disabled, false for undisabled.
  */
 setDisabled : function(/*Dijit*/ dijit, /*Boolean*/ value){
 	 if(dijit){
 	 	 dijit.set('disabled', value);
 	 }
 },
 
 /**
  * set readOnly of the dijit
  *  @dijit: the dijit which readOnly will be set
  *  @value: boolean value: true for readOnly, false for non-readOnly.
  */
 setReadOnly : function(/*Dijit*/ dijit, /*Boolean*/ value){
 	 if(dijit){
 	 	 dijit.set('readOnly', value);
 	 }
 },
 
 /**
  * action need perform when form submit
  *  hack form submit with "uploadedfile" input in dojox.form.FileUploader,
  *  destory inner form node when form submit
  */
 onFormSubmit : function(){
 	 //hack form submit with "uploadedfile" input in dojox.form.FileUploader, destory inner form node when form submit
 	 if(dojo.isIE){
 	 	 this.f0._formNode.innerHTML = "";
 	 }
 },
 
 /**
  * enable disabled properties
  *  @value: boolean value: true for disabled, false for undisabled.
  */
 _setDisabledAttr : function(value){
 	 this.disabled = value;
 	 this.inherited(arguments);
 	 this.setDisabled(this.f0, value);
 	 //handle upload button seperately, upload button will be disabled when error occurs,
 	 //it should not be set to enable when enable the widget
 	 if(!value){
 	 	 this.setDisabled(this.uploadButton, this._isDisabled_uploadButton);
 	 } else {
 	 	 this.setDisabled(this.uploadButton, value);
 	 }
 	 
 	 this.setDisabled(this.cancelButton, value);
 },
 
 destroy: function(){
 	 if(window[this.id]){
 	 	 window[this.id] = undefined;
 	 }
 	 
 	 while(this._eventHandlers.length>0){
 	 	 try{	 	 	 	 
 	 	 	 dojo.disconnect(this._eventHandlers.pop());
 	 	 }catch(e){}
 	 }
 	 this._eventHandlers = undefined;
 	 if(this._mods){
 		while (this._mods.length > 0) {
 			try {
 				dojo.destroy(this._mods.pop());
 			} catch (e) {
 			}
 		}
 		this._mods = undefined;
 	 }
 	 if(this.inputText && this.inputText.destroy) this.inputText.destroy();
 	 if(this.uploadButton && this.uploadButton.destroy) this.uploadButton.destroy();
 	 if(this.cancelButton && this.cancelButton.destroy) this.cancelButton.destroy();
 	 if(this.browseBtn && this.browseBtn.destroy) this.browseBtn.destroy();
 	 if(this.f0 && this.f0.destroy) this.f0.destroy();
 	 this.inherited(arguments);
 }
});
 
dojo.declare("com.ibm.btt.dijit.FileUploader",
 	 [dojox.form.FileUploader],{
 /**
  * the Defered object created by iframe.send,
  * it will be canceled when user cancel the upload process
  */
 dfd : null,
 //templateString:'<div dojoAttachPoint="containerNode"><div dojoAttachPoint="progNode"><div dojoAttachPoint="progTextNode"></div></div><div dojoAttachPoint="insideNode" class="uploaderInsideNode"></div></div>',
 trueFocus : false,
 isShowDialog : false,
 fileUploadUUID : "",
 _cons: [],
 /**
  * cancel the upload process
  *  1. cancel the Deferred object
  * 2. abort the request
  */
 cancel: function(){
 	 	 if(this.dfd){
 	 	 	 //cancel the Deferred object
 	 	 	 this.dfd.cancel();
 	 	 	 if(dojo.isIE){
 	 	 	 	 //reset the iframe location
 	 	 	 	 dojo.io.iframe._frame.contentWindow.document.location.replace("about:blank");
 	 	 	 } else {
 	 	 	 	 //stop the iframe window
 	 	 	 	 dojo.io.iframe._frame.contentWindow.stop();
 	 	 	 }
 	 	 	 
 	 	 }
 },
 
 /**
  * override the uploadHTML method of dojox.form.FileUploader
  * save the iframe.send method created Defered object as the object attribute
  */
 uploadHTML: function(){
 	 if(this.selectMultipleFiles){
 	 	 dojo.destroy(this._fileInput);
 	 }
 	 this._setHtmlPostData();
 	 if(this.showProgress){
 	 	 this._animateProgress();
 	 }
 	 if(this.dfd){
 	 	 dojo.destroy(this.dfd);
 	 }
 	 
 	 //save the iframe.send method created Defered object as the object attribute
 	 this.dfd = dojo.io.iframe.send({
 	 	 url: this.fileUploadUUID ? (this.uploadUrl + "&uuid=" + this.fileUploadUUID) : this.uploadUrl,
 	 	 form: this._formNode,
 	 	 handleAs: "json",
 	 	 error: dojo.hitch(this, function(err){
 	 	 	 console.debug("error", err.message);
 	 	 	 this._error("HTML Upload Error:" + err.message);
 	 	 }),
 	 	 load: dojo.hitch(this, function(data, ioArgs, widgetRef){
 	 	 	 this._complete(data);
 	 	 })
 	 });
 	 
 	 console.debug("dfd", this.dfd);
 },
 
 
 
 _clearUserSelection : function(){
 	 this.fileInputs = [];
 	 if(dojo.isIE){
 	 	 //value of input(type=file) is readOnly, need rebuild the input.
 	 	 if(this._fileInput){
 	 	 	 this._disconnect();
 	 	 	 this._formNode.removeChild(this._fileInput);
 	 	 }
 	 	 this._fileInput = document.createElement('input');
 	 	 this.fileInputs.push(this._fileInput);
 	 	 var nm = this.htmlFieldName;
 	 	 var _id = this.id;
 	 	 if(this.selectMultipleFiles){
 	 	 	 nm += this.fileCount;
 	 	 	 _id += this.fileCount;
 	 	 	 this.fileCount++;
 	 	 }
 	 	 dojo.attr(this._fileInput, {
 	 	 	 id:this.id,
 	 	 	 name:nm,
 	 	 	 type:"file",
 	 	 	 onKeyPress: function (){
 	 	 	 	 return !(window.event && window.event.keyCode == 13);
 	 	 	 }()
 	 	 });
 	 	 dojo.addClass(this._fileInput, "dijitFileInputReal");
 	 	 this._formNode.appendChild(this._fileInput);
 	 	 var real = dojo.marginBox(this._fileInput);
 	 	 dojo.style(this._fileInput, {
 	 	 	 position:"relative",
 	 	 	 left:(this.fhtml.nr.w - real.w) + "px",
 	 	 	 opacity:0
 	 	 });
 	 	 this._connectInput();
 	 } else {
 	 	 this._fileInput.value = "";
 	 }
 	 
 },
 
 attributeMap: dojo.delegate(dijit._Widget.prototype.attributeMap, {
 	 tabIndex: "insideNode"
 }),
 
 onFocusOnInputText : function(){
 	 
 },
 
 _connectInput: function(){
 	 //this.inherited(arguments);
 	 //When migrate to dojo1.6.1, this part of code can be removed.
 	 this._disconnect();
 	 this._cons.push(dojo.connect(this._fileInput, "mouseover", this, function(evt){
 	 	 dojo.addClass(this.domNode, this.hoverClass);
 	 	 this.onMouseOver(evt);
 	 }));
 	 this._cons.push(dojo.connect(this._fileInput, "mouseout", this, function(evt){
 	 	 
 	 	 setTimeout(dojo.hitch(this, function(){
 	 	 	 dojo.removeClass(this.domNode, this.activeClass);
 	 	 	 dojo.removeClass(this.domNode, this.hoverClass);
 	 	 	 this.onMouseOut(evt);
 	 	 	 this._checkHtmlCancel("off");
 	 	 }), 0);
 	 }));
 	 this._cons.push(dojo.connect(this._fileInput, "mousedown", this, function(evt){
 	 	 dojo.addClass(this.domNode, this.activeClass);
 	 	 dojo.removeClass(this.domNode, this.hoverClass);
 	 	 this.onMouseDown(evt);
 	 }));
 	 this._cons.push(dojo.connect(this._fileInput, "mouseup", this, function(evt){
 	 	 dojo.removeClass(this.domNode, this.activeClass);
 	 	 this.onMouseUp(evt);
 	 	 this.onClick(evt);
 	 	 this._checkHtmlCancel("up");
 	 }));
 	 this._cons.push(dojo.connect(this._fileInput, "change", this, function(){
 	 	 this._checkHtmlCancel("change");
 	 	 this._change([{
 	 	 	 name: this._fileInput.value,
 	 	 	 type: "",
 	 	 	 size: 0
 	 	 }]);
 	 }));
 	 if(this.tabIndex>=0){
 	 	 dojo.attr(this.domNode, "tabIndex", this.tabIndex);
 	 }
 	 //
 	 
 	 this._cons.push(dojo.connect(this._fileInput, "focus", this, function(){
 	 	 //console.debug("focus on fileInput");
 	 	 if(!dojo.isIE){
 	 	 	 dojo.addClass(this.domNode, this.activeClass);
 	 	 } else {
 	 	 	 this.trueFocus = true;	 
 	 	 }
 	 	 if(this.dialogIsOpen){
 	 	 	 if(dojo.isIE){
 	 	 	 	 dojo.addClass(this.domNode, this.activeClass);
 	 	 	 }
 	 	 	 this.onCancel();
 	 	 }
 	 	 this.dialogIsOpen = false;
 	 }));
 	 
 	 if(dojo.isIE){
 	 	 this._cons.push(dojo.connect(this._fileInput, "keypress", this, function(evt){
 	 	 	 //console.debug("keypress on fileInput", evt.keyCode)
 	 	 	 //console.debug("trueFocus", this.trueFocus)
 	 	 	 if(evt.keyCode==dojo.keys.TAB && this.trueFocus){
//	 	 	 	 	 console.debug("press TAB");
 	 	 	 	 dojo.addClass(this.domNode, this.activeClass);
 	 	 	 } else if(evt.charCode==dojo.keys.SPACE && this.trueFocus){
 	 	 	 	 //console.debug("press SPACE");
 	 	 	 	 this.dialogIsOpen = true;
 	 	 	 } else if (evt.keyCode == dojo.keys.ENTER){
 	 	 	 	 dojo.stopEvent(evt);
 	 	 	 }
 	 	 }));
 	 } else {
 	 	 this._cons.push(dojo.connect(this._fileInput, "keypress", this, function(evt){
 	 	 	 //console.debug("keypress on fileInput", evt)
 	 	 	 //SPACE: charCode=32, keyCode=0
 	 	 	 if(evt.charCode==dojo.keys.SPACE){
 	 	 	 	 //console.debug("press SPACE");
 	 	 	 	 this.dialogIsOpen = true;
 	 	 	 }
 	 	 }));
 	 }
 	 
 	 
 	 this._cons.push(dojo.connect(this._fileInput, "blur", this, function(evt){
 	 	 //console.debug("lose focus on fileInput", evt)
 	 	 dojo.removeClass(this.domNode, this.activeClass);
 	 	 if(dojo.isIE){
 	 	 	 this.trueFocus = false;
 	 	 }
 	 }));
 	 
 },
 
 applyAccessKey : function(){
 	 if(this.f0._fileInput && this.accessKey){
 	 	 this.f0._fileInput.setAttribute('accessKey', this.accessKey);
 	 }
 },
 
 destroy: function(){
 	 if(window[this.id]){
 	 	 window[this.id] = undefined;
 	 }
 	 if(this._cons){
 		while(this._cons.length>0){
 	 	 	 try{	 	 	 	 
 	 	 	 	 dojo.disconnect(this._cons.pop());
 	 	 	 }catch(e){}
 	 	 }
 	 	 this._cons = undefined;
 	 }
 	 this.inherited(arguments);
 }
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.Group"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.Group"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Group");

 
 




dojo.declare("com.ibm.btt.dijit.Group", [dijit._Widget,
                                         dijit._Templated,
                                         dijit._Container,
                                         dijit.layout._ContentPaneResizeMixin,
                                         com.ibm.btt.dijit.AbstractWidgetMixin], {
	
	text : "",

	parseOnLoad: true,
	
	isContainer: true,
	
	width : "",
	
	height : "",
	
	templateString : "<fieldset dojoAttachPoint='domNode' class='dijitGroupBase'><legend dojoAttachPoint='textNode'></legend><div dojoAttachPoint='containerNode'></div></fieldset>",
	
	attributeMap: dojo.delegate(dijit._Widget.prototype.attributeMap, {
//		text : {
//			node : "textNode"
//		},
//		width : {
//			node : "containerNode"
//		},
//		height : {
//			node : "containerNode"
//		}
	}),
	
	postCreate: function(){
		this.inherited(arguments);
//		dojo.style(this.domNode, "overflow", "hidden"); // Firefox Bug 261037
		dojo.style(this.containerNode, "overflow", "auto");
	},
	
	startup: function(){
		try{			
			if (new RegExp("\\s*\\d+\\s*px\\s*","i").test(this.height)){
				var th = dojo.contentBox(this.textNode).h;
				var fh = parseInt(this.height);
				var ch = Math.ceil(fh - th/2);
				dojo.style(this.containerNode, "height", ch + "px");
				dojo.style(this.domNode, "height", this.handleLenUint(this.height));
			}
		}catch(e){
			console.error("error @ Group.startup : " + e);
		}
		this.inherited(arguments);
	},

	/**
	 * 
	 * hook method for text attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextAttr : function(value) {
		this.text = value;
		this.textNode.innerHTML = StringUtil.escapeHTML(this.getI18NString(value));
	},
	
	/**
	 * 
	 * hook method for width attribute
	 * 
	 * For Group, the container node must inherite the size of widget
	 * and set the inside elements overflow to hidden, otherwise the
	 * inside elements may break the size
	 *
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setWidthAttr : function(value) {
		if (value != "") {
			this.width = value;
			dojo.style(this.domNode, "width", this.handleLenUint(this.width));
			dojo.style(this.containerNode, "width", this.handleLenUint(this.width));
		}
	},
	
	/**
	 * 
	 * hook method for height attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setHeightAttr : function(value){
		if (value != "") {
			this.height = value;
			dojo.style(this.containerNode, "height", this.handleLenUint(this.height));
//			dojo.style(this.domNode, "height", this.handleLenUint(this.height));//defect 29333, 29102
		}
	}
	
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.TabbedPane"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.TabbedPane"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.TabbedPane");






dojo.declare("com.ibm.btt.dijit.TabbedPane", [dijit.layout.TabContainer,
                                              com.ibm.btt.dijit.AbstractWidgetMixin],{
	width : "800",
	
	height : "600",

	constructor: function(){
    	this._disableWatch = {};
    },
	
	postMixInProperties : function() {
		this.inherited(arguments);
		this.controllerWidget = (this.tabPosition == "top" || this.tabPosition == "bottom")
			&& !this.nested ? "com.ibm.btt.dijit.ScrollingTabController" : "com.ibm.btt.dijit.TabController";
	},
	
	startup : function(){
		this.inherited(arguments);
		this.set("visibility",this.visibility);
		
		//watch disabled attribute of all children,
		//if one child is disabled and this child is current selected
		//then select another enabled child
		var children = this.getChildren();
		dojo.forEach(children, function(child){
			this._disableWatch[child.id] = child.watch("disabled", dojo.hitch(this, this._checkDisabedPane, child));
		}, this);
		this._setInitialTabSelection();
		
		this.resize();
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
		if(typeof(this.tablist)!=="undefined"){
			if (value == "hidden") {
				dojo.style(this.tablist.domNode, "visibility", "hidden");
			} else {
				dojo.style(this.tablist.domNode, "visibility", "inherit");
			}
		}
	},
	
	/**
	 * 
	 * close the tab by tab index
	 * 
	 * @tag public 
	 * 
	 * @param 
	 * */
	closeChildByIndex : function(i){
		var children = this.getChildren();
		this.closeChild(children[i]);
	},
	
	closeChildById : function(id){
		var children = this.getChildren();
		for(var i=0;i<children.length;i++){
			if(id===children[i].id){
				this.closeChild(children[i]);
			}
		}
	},
	
	selectChildByIndex : function(i){
		var children = this.getChildren();
		this.selectChild(children[i]);
	},
	
	selectChildById : function(id){
		var children = this.getChildren();
		for ( var i = 0; i < children.length; i++) {
			if (id === children[i].id) {
				this.selectChild(children[i]);
				break;
			}
		}
	},
	
	closeChild : function(child){
		if (child.get("disabled") != true) {
			this.inherited(arguments);
		}
	},
	
	selectChild : function(child){
		if (child.get("disabled") != true) {
			this.inherited(arguments);
			dijit.registry.forEach(function(w){
//				if(w.isInstanceOf(com.ibm.btt.dijit.Form)){
				if(w._hideXHint){
					w._hideXHint();
				}
			});
		}
	},
	
	hideTabByIndex : function(index){
		var children = this.getChildren();
		//check if the input index is a valid number of current tabs
		if (index > -1 && index < children.length) {
			
			//check and save all visible tabs
			var visibleTabs = this._getCurrentVisibleTabs();
			
			//check if there is only one visible tab shown
			//we do nothing, just ignore the hide action
			if (visibleTabs.length > 1) {
				//find the child specified by index
				var child = children[index];
				//find and hide the related tab
				var button = this.tablist.pane2button[child.id];
				dojo.style(button.domNode, "display", "none");
				button._displayMark = "hidden";
				
				//if there are still visible tabs and current tab is just the tab to be hide
				//we need to select the next one tab, and if it is the last tab, we select the previous one.
				if (child.selected) {
					var i;
					for (i = 0; i < visibleTabs.length; i++) {
						if (visibleTabs[i].id == child.id) {
							break;
						}
					}
					if (i + 1 < visibleTabs.length) {
						//If this tab is not the last visible one, we select the next one
						this.selectChildById(visibleTabs[i + 1].id);
					} else {
						//If this tab is the last one, we select the previous one
						this.selectChildById(visibleTabs[i - 1].id);
					}
				}
			} 
		}
		
	},
	
	showTabByIndex : function(index){
		var children = this.getChildren();
		if (index > -1 && index < children.length) {
			var child = this.getChildren()[index];
			this.showTabById(child.id);
		}
	},
	
	hideTabById : function(id){
		var children = this.getChildren();
		for ( var i = 0; i < children.length; i++) {
			if (id === children[i].id) {
				this.hideTabByIndex(i);
				break;
			}
		}
	},
	
	showTabById : function(id){
		//set the specified tab to be visible
		var button = this.tablist.pane2button[id];
		dojo.style(button.domNode, "display", "");
		button._displayMark = "visible"; // add a mark to tab to record this one is visible
		
	},
	
	removeChild: function(/*dijit._Widget*/ child){
		this.inherited(arguments);
		//override removeChild to remove the listener of disabled property when child is removed
		this._disableWatch[child.id].unwatch();
		delete this._disableWatch[child.id];
	},
		
	addChild: function(/*dijit._Widget*/ child, /*Integer?*/ insertIndex){
		this.inherited(arguments);
		//override addChild method to add listener child pane's disabled property when there is a new child add into this container
		this._disableWatch[child.id] = child.watch("disabled", dojo.hitch(this, this._checkDisabedPane, child));
	},
	
	/**
	 * 
	 * This method is used to listen and check child pane
	 * when child pane's disabled attribute changed
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_checkDisabedPane : function(child, name, oldValue, value){
		//set corresponding the style class to tab depends on 
		//the tab is disabled or not
		if (value == true) {
			var button = this.tablist.pane2button[child.id];
			button.set("disabled", true);
			//dojo.addClass(button.domNode, "dijitDisabled");
		} else {
			var button = this.tablist.pane2button[child.id];
			button.set("disabled", false);
			if (dojo.isIE) {
				dojo.removeAttr(child.domNode, "disabled");
			}
			//dojo.removeClass(button.domNode, "dijitDisabled");
		}
		
		//Check If user try to disable the current select tab,
		//find and set the next enabled tab to be selected. If there is no enabled 
		//button after current one, try to find one before current one.
		//If all tabs are disabled, then do nothing, all tabs can not be selected or changed
		this._setTabSelection();
	},
	
	_setInitialTabSelection: function(){
		var visibleTabs = this._getCurrentVisibleTabs();
		var count = 0;
		for (var i = 0; i < visibleTabs.length; i++) {
			if (visibleTabs[i].get("disbaled") == true) {
				count++;
			}
		}
		
		if (visibleTabs.length > 0 && count == visibleTabs.length) {
			visibleTabs[0].disable = false;
			this.selectChildByIndex(0);
			visibleTabs[0].disable = true;
		} else {
			this._setTabSelection();
		}
		
		var children = this.getChildren();
		for(var i=0;i<children.length;i++){
			this._checkDisabedPane(children[i], children[i].title, null, children[i].disabled);
		}
		
	},
	
	_setTabSelection : function(){
		var visibleTabs = this._getCurrentVisibleTabs();
		var selectedTabId = -1;
		for (var i = 0; i < visibleTabs.length; i++) {
			if (visibleTabs[i].selected) {
				selectedTabId = i;
				break;
			}
		}
		if (selectedTabId > -1 && visibleTabs[selectedTabId].get("disabled") == true) {
			// check and save all visible tabs
			for ( var m = selectedTabId + 1; m < visibleTabs.length; m++) {
				if (visibleTabs[m].get("disabled") == false) {
					this.selectChildById(visibleTabs[m].id);
					return;
				}
			}
			for ( var m = selectedTabId - 1; m >= 0; m--) {
				if (visibleTabs[m].get("disabled") == false) {
					this.selectChildById(visibleTabs[m].id);
					return;
				}
			}
		}
		
		if (selectedTabId > -1 && visibleTabs[selectedTabId].get("disabled") == false) {
			var button = this.tablist.pane2button[visibleTabs[selectedTabId].id];
			dojo.attr(button.focusNode, "tabIndex", "0");
		}
	},
	
	/**
	 * An internal method to get the contentPane instances who's tab is still visible
	 * 
	 * @tag private 
	 * */
	_getCurrentVisibleTabs : function(){
		var children = this.getChildren();
		var visibleTabs = [];
		for ( var i = 0; i < children.length; i++) {
			var button = this.tablist.pane2button[children[i].id];
			if (!button._displayMark || button._displayMark == "visible") {
				visibleTabs.push(children[i]);
			}
		}
		return visibleTabs;
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
	}
	

});

dojo.declare("com.ibm.btt.dijit.ScrollingTabController", [dijit.layout.ScrollingTabController,com.ibm.btt.dijit.AbstractWidgetMixin],{
	
});

dojo.declare("com.ibm.btt.dijit.TabController", [dijit.layout.TabController,com.ibm.btt.dijit.AbstractWidgetMixin],{
	
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.ContentPane"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.ContentPane"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.ContentPane"); 





dojo.declare("com.ibm.btt.dijit.ContentPane", [dijit.layout.ContentPane, 
                                               com.ibm.btt.dijit.AbstractWidgetMixin,
                                               com.ibm.btt.dijit.AbstractAjaxMixin],{
	
	
	disabled : false,
	
	isFlowContainer : false,
	
	postCreate : function(){
		this.inherited(arguments);
		if (dojo.isIE && dojo.hasAttr(this.domNode, "disabled")) {
			dojo.removeAttr(this.domNode, "disabled");
		}
	},
	
	
	/**
	 * 
	 * hook set method for disabled attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setDisabledAttr : function(value){
		this._set("disabled", value);
	},
	
	/**
	 * 
	 * hook set method for title attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTitleAttr : function(value){
		this.titleKey = value;
		var _title = this.getI18NString(value);
		this._set("title", _title);
	},
	
	/**
	 * 
	 * hook get method for title attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getTitleAttr : function() {
		return this.titleKey;
	},

	_setIsFlowContainer : function(value) {
		this.isFlowContainer = value;
		if (value === true || value === "true") {
			dojo.addClass(this.containerNode, "divFlowContainer");
		} else {
			dojo.removeClass(this.containerNode, "divFlowContainer");
		}
	}
	
}); 
	

}

if(!dojo._hasResource["com.ibm.btt.dijit.Hidden"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.Hidden"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.dijit.Hidden");



dojo.declare("com.ibm.btt.dijit.Hidden", [dijit._Widget, dijit._Templated ], {

	value : "",

	name : "",
	
	state : "",
	
	type : "hidden",

	isNumeric : false,
	
	templateString : "<input type='${type}'/>",

	attributeMap : dojo.delegate(dijit._Widget.prototype.attributeMap, {
		
		value : {
			node : "domNode"
		},
		
		name : {
			node : "domNode"
		}

	}),	
	
	postMixInProperties: function(){
		// for BP34400
		if(this.isNumeric==true){
			this.value = Number(this.value);
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
	_setValueAttr : function(value) {
		this.value = value;
		this.domNode.value = value;
	},
	
	serialize: function(/*anything*/val){
		return isNaN(val) ? "" : (val.toString ? val.toString() : "");
	}
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.GridComparer"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.GridComparer"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/
dojo.provide("com.ibm.btt.dijit.GridComparer");

/**
 * Generate the comparer for BTT type to enable client side sorting.
 *   All the compare function have two parameters @str1 and @str2, which is the two object need to compare.
 *   The function will return 1 when @str1 is larger then @str2
 *   				   return -1 when @str1 is smaller then @str2
 *   				   return 0 when @str is equals to @str2
 *   
 *   Every function have a parameter @attrs, which hold all the parameters of the comparer in JSON format 
 *   which defined in the grid column tag, such as "pattern" for Date. 
 * 
 *   The class is designed as a singleton, get the instance using com.ibm.btt.dijit.GridComparer.instance.
 *   
 */
dojo.declare("com.ibm.btt.dijit.GridComparer", null, {
	/**
	 * generate the compare function for BTT Type Number.
	 * @attrs: which hold all the parameters of the comparer in JSON format which defined in the grid column tag. 
	 * 
	 */
	compareNumber : function(attrs){
	
		var cons = {};
		if (attrs['pattern']) {
				cons['pattern'] = attrs['pattern'];
		}

		return function(str1, str2){
			var num1;
			if(typeof str1 == "string"){
				num1 = dojo.number.parse(str1, cons);
			} else {
				num1 = str1;
			}
			if(isNaN(num1)){
				num1 = Number(str1);
			}
			var num2;
			if(typeof str2 == "string"){
				num2 = dojo.number.parse(str2, cons);
			} else {
				num2 = str2;
			}
			if(isNaN(num2)){
				num2 = Number(str1);
			}
			if(num1 > num2){
				return 1;
			} else if(num1 < num2){
				return -1;
			} else {
				return 0;
			}
		};
	},
	
	/**
	 * generate the compare function for BTT Type Currency.
	 * @attrs: which hold all the parameters of the comparer in JSON format which defined in the grid column tag. 
	 * 
	 */
	compareCurrency : function(attrs){
		return function(str1, str2){
			var num1 = parseFloat(str1);
			var num2 = parseFloat(str2);
			if(num1 > num2){
				return 1;
			} else if(num1 < num2){
				return -1;
			} else {
				return 0;
			}
		};
	},
	
	/**
	 * generate the compare function for BTT Type String.
	 * @attrs: which hold all the parameters of the comparer in JSON format which defined in the grid column tag. 
	 * 
	 */
	compareString : function(attrs){
		return function(str1, str2){
			if(str1 > str2){
				return 1;
			} else if(str1 < str2){
				return -1;
			} else {
				return 0;
			}
		};
	},
	
	/**
	 * generate the compare function for BTT Date Currency.
	 * @attrs: which hold all the parameters of the comparer in JSON format which defined in the grid column tag. 
	 * 
	 */
	compareDate : function(attrs){
		return function(str1, str2){
			var pattern = "yyyy-MM-dd";
			if(attrs){
				var config_pattern = attrs["pattern"];
				if(config_pattern){
					pattern = config_pattern;
				}
			}
			var option = {
				selector:"date",
				datePattern:pattern,
				fullYear:true
			};
			var _date1;
			var _date2;
			if (typeof str1 == "string") {
				_date1 = dojo.date.locale.parse(str1, option);
			} else {
				_date1 = str1;
			}
			if (typeof str2 == "string") {
				_date2 = dojo.date.locale.parse(str2, option);
			} else {
				_date2 = str2;
			}
			
//			var date1 = _date1 ? _date1 : str1;
//			var date2 = _date2 ? _date2 : str2;

			if(!_date1 && !_date2) return 0;
			if(!_date1)	return -1;
			if(!_date2)	return 1;
			
			return dojo.date.compare(_date1, _date2);
		};
	}
});
(function(){
	if( com.ibm.btt.dijit.GridComparer.instance == undefined ){
		com.ibm.btt.dijit.GridComparer.instance = new com.ibm.btt.dijit.GridComparer();	
	}
})();

}

if(!dojo._hasResource["com.ibm.btt.dijit.AbstractWidgetSizeMixin"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.AbstractWidgetSizeMixin"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.AbstractWidgetSizeMixin"); 

dojo.declare("com.ibm.btt.dijit.AbstractWidgetSizeMixin", null,{
	
	width:"",
	
	height:"",
	
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
	
	handleLenUint : function(value) {
		var endWith = function(src, oString) {
			var reg = new RegExp(oString + "$");
			return reg.test(src);
		};
		if(endWith(value, "px") || endWith(value, "%") || endWith(value, "em")){
			return value;
		}else{
			return value + "px";
		}
	}
	
}); 
	

}

if(!dojo._hasResource["com.ibm.btt.dijit.plugins.Pagination"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.plugins.Pagination"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.plugins.Pagination");



dojo.declare("com.ibm.btt.dijit.plugins.Pagination", dojox.grid.enhanced._Plugin, {
	
	name : "bttpagination",
		
	mode : "simple",
	
	//requestURL : "Ajax",
	
	timeout : 500,
	
	keepSingleSelection : false,
	
	_paginateable : true,
	
	init: function(){
		this._initParams();
		this._createPaginators(this.option);
		this._regApis();
		if (this.initialMode == "client") {
			if (this.mode == "simple") {
				this._requestFirstPage();
			} else {
				this.gotoPage("initial");
			}
		}
	},
	
	_initParams : function(){
		
		var _this = this;
		var fetchParam = function(paramName, defaultValue){
			return _this.option[paramName] != undefined ? _this.option[paramName]
					: (_this.grid[paramName]  != undefined ? _this.grid[paramName] : defaultValue);
		};
		var convertToNumber = function(arg, defaultValue){
			var tmp = Number(arg);
			if(isNaN(tmp)){
				return defaultValue;
			}else{
				return tmp;
			}
		};
		this.mode = fetchParam("mode", this.mode);
		this.timeout = convertToNumber(fetchParam("timeout", this.timeout), this.timeout);
		this.initialMode = fetchParam("initialMode", "server");
		this.totalRowNumber = fetchParam("totalRowNumber", this.totalRowNumber);
		this.rowsPerPage = fetchParam("rowsPerPage", this.rowsPerPage);
		//this.requestURL = fetchParam("requestURL", this.requestURL);
		this.bttParams = fetchParam("bttParams", {});
		if (this.mode == "simple") {
			this._setPageSize(this.totalRowNumber);
			this.defaultRows = fetchParam("defaultRows", 25);
			this._currentPage = 0;
			this.nls = dojo.i18n.getLocalization("dojox.grid.enhanced", "Pagination");
		}
		
		if (this.mode == "nonePageSize") {
			var parseBool = function(arg){
				if (arg == "false") {
					return false;
				} else if (arg == "true") {
					return true;
				} else {
					return arg;
				}
			};
			this.prevBtnEnabled = fetchParam("enablePrevious", false);
			this.prevBtnEnabled = parseBool(this.prevBtnEnabled);
			this.nextBtnEnabled = fetchParam("enableNext", true);
			this.nextBtnEnabled = parseBool(this.nextBtnEnabled);
		}
		
	},
	
	_setPageSize : function(totalRowNum){
		if(typeof(totalRowNum)!= "defined" && totalRowNum != null && totalRowNum!="null"){
			this.totalRowNumber = totalRowNum;
			this._maxSize = this.totalRowNumber;
			this.pageSize = this.rowsPerPage;
			this.totalPageSize = Math.ceil(this.totalRowNumber / this.rowsPerPage);
		}
	},
	
	_createPaginators: function(paginationArgs){
		// summary:
		//		Function to create the pagination control bar.
		this.paginators = [];
		if (this.mode == "simple") {
			if(paginationArgs.position === "both"){
				this.paginators = [
					new com.ibm.btt.dijit.plugins.SimplePaginator(dojo.mixin(paginationArgs, {position: "bottom", plugin: this})),
					new com.ibm.btt.dijit.plugins.SimplePaginator(dojo.mixin(paginationArgs, {position: "top", plugin: this}))
				];
			}else{
				this.paginators = [new com.ibm.btt.dijit.plugins.SimplePaginator(dojo.mixin(paginationArgs, {plugin: this}))];
			}
		} else if (this.mode == "nonePageSize") {
			if(paginationArgs.position === "both"){
				this.paginators = [
					new com.ibm.btt.dijit.plugins.NonePageSizePaginator(dojo.mixin(paginationArgs, {position: "bottom", plugin: this})),
					new com.ibm.btt.dijit.plugins.NonePageSizePaginator(dojo.mixin(paginationArgs, {position: "top", plugin: this}))
				];
			}else{
				this.paginators = [new com.ibm.btt.dijit.plugins.NonePageSizePaginator(dojo.mixin(paginationArgs, {plugin: this}))];
			}
		} else {
			console.error("Unsupport pagination mode, please check the parameter definition.");
		}
		
		
		dojo.forEach(this.paginators, function(f){
			f.update();
		});
	},
	 
	_stopEvent: function(event){
		try{
			dojo.stopEvent(event);
		}catch(e){}
	},
	
	_regApis: function(){
		var g = this.grid;
		g.gotoPage = dojo.hitch(this, this.gotoPage);
		g.nextPage = dojo.hitch(this, this.nextPage);
		g.prevPage = dojo.hitch(this, this.prevPage);
		g.gotoFirstPage = dojo.hitch(this, this.gotoFirstPage);
		g.gotoLastPage = dojo.hitch(this, this.gotoLastPage);
		g.getTotalRowCount = dojo.hitch(this, this.getTotalRowCount);
	},
	
	destroy: function(){
		this.inherited(arguments);
		var g = this.grid;
		try{
			dojo.forEach(this.paginators, function(p){
				p.destroy();
			});
			this.paginators = null;
		}catch(e){
			console.warn("Pagination.destroy() error: ", e);
		}
	},
		
	nextPage : function(e){
		if(this.mode == "simple"){
			this.gotoPage(this._currentPage + 2);
		}
		if(this.mode == "nonePageSize"){
			this.gotoPage("next");
		}
	},
	
	prevPage : function(e){
		if(this.mode == "simple"){
			this.gotoPage(this._currentPage);
		}
		if(this.mode == "nonePageSize"){
			this.gotoPage("prev");
		}
	},
	
	gotoFirstPage : function(e){
		this.gotoPage(1);
	},
	
	gotoLastPage : function(e){
		this.gotoPage(this.totalPageSize);
	},
	
	gotoPage : function(e){
		if(this.grid.edit)  this.grid.edit.apply();
		this.grid.selection.deselectAll();
		if (this._paginateable == true) {
			if (this.mode == "simple" && e >= 1 && e <= this.totalPageSize && e != (this._currentPage + 1)) {
				this._requestPageByNum(e);
				this._paginateable = false;
				dojo.forEach(this.paginators, function(p){
					p.disableBtns();
				});
			} 
			if (this.mode == "nonePageSize"
				&& ((e == "initial") || (e == "next" && this.nextBtnEnabled) || (e == "prev" && this.prevBtnEnabled)) && e != (this._currentPage + 1)) {
				this._fetchData({
					"pageRequest.pageEvent" : e,
					"mode" : this.mode
				});
				this._paginateable = false;
				dojo.forEach(this.paginators, function(p){
					p.disableBtns();
				});
			}
		}
	},
	
	_requestPageByNum : function(e){
		this._fetchData({
			"pageRequest.pageEvent" : "page",
			"pageRequest.pageNumber" : e,
			"mode" : this.mode
		});
		this._currentPage = e-1 ;
	},
	
	_requestFirstPage : function(){
		this._fetchData({
			"pageRequest.pageEvent" : "initial",
			"pageRequest.pageNumber" : 1,
			"mode" : this.mode
		});
		this._currentPage = 0 ;
	},
	
	_fetchData : function(arg){
		console.log(this.bttParams);
		/*var xhrParams = {
			url : this.requestURL,
			handleAs : "json",
			postData : dojo.toJson(dojo.mixin(this.bttParams, arg)),
			timeout : this.timeout,
			load : dojo.hitch(this, this._handleResponse),
			error : this._handleError
		};
		dojo.xhrPost(xhrParams);*/
		
		var data = this.bttParams;
		if (!data[AjaxUtil.constants.BTT_TIMEZONE]) {
			data[AjaxUtil.constants.BTT_TIMEZONE] = AjaxUtil.getTimzone();
		}
		AjaxUtil.xhrPost({
			//url : this.requestURL,
			handleAs : "text",
			timeout : this.timeout,
			success : dojo.hitch(this, this._handleResponse),
			error : dojo.hitch(this, this._handleError)
		}, dojo.mixin(data, arg));
	},
	
	_handleResponse : function(arg){
		try{
			var data = dojo.fromJson(arg);
			if(data.items){
				// for defect 28283 - start
				if(!dojo.isIE) {
					for(var i=0; i<this.grid.layout.cells.length; i++) {
						var cell = this.grid.layout.cells[i];
						if(cell.type && cell.type.prototype && cell.type.prototype.declaredClass == "dojox.btt.grid.cells.Image") {
							var resizeTrigger = dojo.connect(this.grid,"_onFetchComplete", this.grid, function(){
								setTimeout(dojo.hitch(this,
										function(){
											this._refresh();
										}), 500);
								dojo.disconnect(resizeTrigger);
							});
							break;
						}
					}
				}
				// for defect 28283 - end
// refixed in grid.setStoreData()
//				if(this.grid.get("store")){
//					var tmpStore = this.grid.get("store");
//					tmpStore.close();
//				}
				this.grid.setStoreData(data.items);
//				this.grid._refresh();
//				try {
//					this.grid._refresh();
//				} catch (e) {
//					console.warn('refresh failed');
//				}
				
				if (this.mode == "simple") {
					this._setPageSize(data.totalRowNumber);
				}
				if (this.mode == "nonePageSize") {
					if (typeof (data.enableNext) != "undefined") {

					}
					this.nextBtnEnabled = this._setBtnState(data.enableNext);
					this.prevBtnEnabled = this._setBtnState(data.enablePrevious);
				}
				dojo.forEach(this.paginators, function(p){
					p.update();
				});
			}
			// do not keep selection for single selection mode grid
			if(this.grid.selection.mode === "single" && !this.keepSingleSelection){
				this.grid.selection.deselectAll();
			}
			
			dijit.focus(this.grid.domNode);
			
			if(data && data.errMsg) this.grid.showErrorIcon(data.errMsg);
			this.grid.onAsyncOK(arguments);
		}catch(e){
			this.grid.onAsyncError(arguments);
			this.handleResponseError(arg);
		}
		this._paginateable = true;
		// for defect 30425 - start
		if(dojo.isIE == 9 && this.grid.autoHeight == true && this.initialMode == "client") {
			setTimeout(dojo.hitch(this.grid, function(){
					this._refresh();
				}), 500);
		}
		// for defect 30425 - end
	},
	
	handleResponseError : function(arg){
		(new dijit.Dialog({
	        title: "",
	        content : arg
	    })).show();
	},
	
	_setBtnState : function(state) {
		if (typeof (state) != "undefined" && state != "null"
				&& state != null) {
			if (state == true || state == "true") {
				return true;
			} else {
				return false;
			}
		}
		return false;
	},
	
	_handleError : function(arg){
		console.error("An error occured when loading pagination data from " + AjaxUtil.ajaxOperationUrl);
		this._paginateable = true;
		if(arg.dojoType === "timeout") {
			this.grid.onAsyncTimeOut(arguments);
		} else if(arg.status !== undefined) {
			this.grid.onAsyncError(arguments);
		}
	},
	
	getTotalRowCount: function(){
		// summary:
		//		Function for get total row count
		return this._maxSize;
	}
});


dojo.declare("com.ibm.btt.dijit.plugins.SimplePaginator", [dojox.grid.enhanced.plugins._Paginator], {
	
	pageSizes : undefined,
	
	showAll : true,
	
	_updateDescription: function(){
		// summary:
		//		Update size information.
		/*if(this.description && this.descriptionDiv){
			this.descriptionDiv.innerHTML = this._maxItemSize > 0 ? dojo.string.substitute(this.descTemplate, [this.itemTitle, this._maxItemSize, 1, this.plugin.pageSize]) : "0 " + this.itemTitle;
		}
		if(this.descriptionWidth){
			dojo.style(this.descriptionTd, "width", this.descriptionWidth);
		}*/
	},
	
	_onKeyDown: function(event, isBubble){
		if(event.ctrlKey || event.altKey || event.metaKey) return;
		return this.inherited(arguments);
	},
	
	_onFocusPaginator: function(event, step){
		if(this._currentFocusNode){
			dijit.focus(this._currentFocusNode);
			this.focusArea = "pageStep";
			this.plugin._stopEvent(event);
			return true;
		}else{
			return this._onFocusPageStepNode(event);
		}
	},
	
	disableBtns: function(){
		// summary:
		//		Update the style of the page step nodes
		var value = null,
			curPage = this._getCurrentPageNo(),
			pageCount = this._getPageCount(),
			visibleNodeLen = 0;
			
		var updateClass = function(node, isWardBtn, status){
			var value = node.value,
				enableClass = isWardBtn ? "dojoxGrid" + value + "Btn" : "dojoxGridNumBtnDisabled",
				disableClass = isWardBtn ? "dojoxGrid" + value + "BtnDisable" : "dojoxGridNumBtnDisabled";
			if(status){
				dojo.addClass(node, disableClass);
				dojo.attr(node, "tabindex", "-1");
			}else{
				dojo.addClass(node, enableClass);
				dojo.attr(node, "tabindex", "0");
			}
		};
		dojo.forEach(this.pageStepperDiv.childNodes, function(node){
			dojo.removeClass(node);
			if(isNaN(parseInt(node.value, 10))){
				dojo.addClass(node, "dojoxGridWardButton");
				var disablePageNum = node.value == "prevPage" || node.value == "firstPage" ? 1 : pageCount;
				updateClass(node, true, true);
			}else{
				value = parseInt(node.value, 10);
				updateClass(node, false, true);
			}
		}, this);
	}
	
});


dojo.declare("com.ibm.btt.dijit.plugins.NonePageSizePaginator", [dijit._Widget,dijit._Templated], {
	templateString:"<div dojoAttachPoint=\"paginatorBar\">\r\n\t<table cellpadding=\"0\" cellspacing=\"0\"  class=\"dojoxGridPaginator\">\r\n\t\t<tr>\r\n\t\t\t<td dojoAttachPoint=\"descriptionTd\" class=\"dojoxGridDescriptionTd\">\r\n\t\t\t\t<div dojoAttachPoint=\"descriptionDiv\" class=\"dojoxGridDescription\" />\r\n\t\t\t</td>\r\n\t\t\t<td dojoAttachPoint=\"sizeSwitchTd\"></td>\r\n\t\t\t<td dojoAttachPoint=\"pageStepperTd\" class=\"dojoxGridPaginatorFastStep\">\r\n\t\t\t\t<div dojoAttachPoint=\"pageStepperDiv\" class=\"dojoxGridPaginatorStep\"></div>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</table>\r\n</div>\r\n",
		
	// pagination bar position - "bottom"|"top"
	position: "bottom",
	
	// max data item size
	_maxItemSize: 10,
	
	// description message status params
	description: true,
	
	// fast step page status params
	pageStepper: "30em",
	
	constructor: function(params){
		dojo.mixin(this, params);
		this.grid = this.plugin.grid;
	},
	
	postCreate: function(){
		this.inherited(arguments);
		this._setWidthValue();
		var self = this;
		var g = this.grid;
		this.plugin.connect(g, "_resize", dojo.hitch(this, "_resetGridHeight"));
		this._originalResize = dojo.hitch(g, "resize");
		g.resize = function(changeSize, resultSize){
			self._changeSize = g._pendingChangeSize = changeSize;
			self._resultSize = g._pendingResultSize = resultSize;
			g.sizeChange();
		};
		this._placeSelf();
	},
	
	destroy: function(){
		this.inherited(arguments);
		this.grid.focus.removeArea("pagination" + this.position.toLowerCase());
		this.grid.resize = this._originalResize;
		this.pageSizes = null;
	},
	
	update: function(){
		this.nextBtnEnabled = this.plugin.nextBtnEnabled ? this.plugin.nextBtnEnabled : this.grid.nextBtnEnabled;
		this.prevBtnEnabled = this.plugin.prevBtnEnabled ? this.plugin.prevBtnEnabled : this.grid.prevBtnEnabled;
		this._updatePageStepper();
	},
	
	disableBtns : function(){
		var updateClass = function(node, isWardBtn, status){
			var value = node.value,
				enableClass = isWardBtn ? "dojoxGrid" + value + "Btn" : "dojoxGridInactived",
				disableClass = isWardBtn ? "dojoxGrid" + value + "BtnDisable" : "dojoxGridActived";
			if(status){
				dojo.addClass(node, disableClass);
				dojo.attr(node, "tabindex", "-1");
			}else{
				dojo.addClass(node, enableClass);
				dojo.attr(node, "tabindex", "0");
			}
		};
		dojo.forEach(this.pageStepperDiv.childNodes, function(node){
			dojo.removeClass(node);
			if(node.value=="prevPage"){
				dojo.addClass(node, "dojoxGridWardButton");
				updateClass(node, true, true);
			}
			if(node.value=="nextPage"){
				dojo.addClass(node, "dojoxGridWardButton");
				updateClass(node, true, true);
			}			
		}, this);
	},
	
	_setWidthValue: function(){
		var type = ["description", "sizeSwitch", "pageStepper"];
		var endWith = function(str1, str2){
			var reg = new RegExp(str2+"$");
			return reg.test(str1);
		};
		dojo.forEach(type, function(t){
			var width, flag = this[t];
			if(flag === undefined || typeof flag == "boolean"){
				return;
			}
			if(dojo.isString(flag)){
				width = endWith(flag, "px") || endWith(flag, "%") || endWith(flag, "em") ? flag : parseInt(flag, 10) > 0 ? parseInt(flag, 10) + "px" : null;
			}else if(typeof flag === "number" && flag > 0){
				width = flag + "px";
			}
			this[t] = width ? true : false;
			this[t + "Width"] = width;
		}, this);
	},
	
	_regFocusMgr: function(position){
		// summary:
		//		Function to register pagination bar to focus manager.
		this.grid.focus.addArea({
			name: "pagination" + position,
			onFocus: dojo.hitch(this, this._onFocusPaginator),
			onBlur: dojo.hitch(this, this._onBlurPaginator),
			onMove: dojo.hitch(this, this._moveFocus),
			onKeyDown: dojo.hitch(this, this._onKeyDown)
		});
		switch(position){
			case "top":
				this.grid.focus.placeArea("pagination" + position, "before", "header");
				break;
			case "bottom":
			default:
				this.grid.focus.placeArea("pagination" + position, "after", "content");
				break;
		}
	},
	
	_placeSelf: function(){
		// summary:
		//		Place pagination bar to a position.
		//		There are two options, top of the grid, bottom of the grid.
		var g = this.grid;
		var	position = dojo.trim(this.position.toLowerCase());
		switch(position){
			case "top":
				this.placeAt(g.viewsHeaderNode, "before");
				this._regFocusMgr("top");
				break;
			case "bottom":
			default:
				this.placeAt(g.viewsNode, "after");
				this._regFocusMgr("bottom");
				break;
		}
	},
	
	_resetGridHeight: function(changeSize, resultSize){
		// summary:
		//		Function of resize grid height to place this pagination bar.
		//		Since the grid would be able to add other element in its domNode, we have
		//		change the grid view size to place the pagination bar.
		//		This function will resize the grid viewsNode height, scorllboxNode height
		var g = this.grid;
		changeSize = changeSize || this._changeSize;
		resultSize = resultSize || this._resultSize;
		delete this._changeSize;
		delete this._resultSize;
		if(g._autoHeight){
			return;
		}
		var padBorder = g._getPadBorder().h;
		if(!this.plugin.gh){
			this.plugin.gh = (g.domNode.clientHeight || dojo.style(g.domNode, 'height')) + 2 * padBorder;
		}
		if(resultSize){
			changeSize = resultSize;
		}
		if(changeSize){
			this.plugin.gh = dojo.contentBox(g.domNode).h + 2 * padBorder;
		}
		var gh = this.plugin.gh,
			hh = g._getHeaderHeight(),
			ph = dojo.marginBox(this.domNode).h;
		ph = this.plugin.paginators[1] ? ph * 2 : ph;
		if(typeof g.autoHeight == "number"){
			var cgh = gh + ph - padBorder;
			dojo.style(g.domNode, "height", cgh + "px");
			dojo.style(g.viewsNode, "height", (cgh - ph - hh) + "px");
			
			this._styleMsgNode(hh, dojo.marginBox(g.viewsNode).w, cgh - ph - hh);
		}else{
			var h = gh - ph - hh - padBorder;
			dojo.style(g.viewsNode, "height", h + "px");
			var hasHScroller = dojo.some(g.views.views, function(v){
				return v.hasHScrollbar();
			});
			dojo.forEach(g.viewsNode.childNodes, function(c, idx){
				dojo.style(c, "height", h + "px");
			});
			dojo.forEach(g.views.views, function(v, idx){
				if(v.scrollboxNode){
					if(!v.hasHScrollbar() && hasHScroller){
						dojo.style(v.scrollboxNode, "height", (h - dojox.html.metrics.getScrollbar().h) + "px");
					}else{
						dojo.style(v.scrollboxNode, "height", h + "px");
					}
				}
			});
			this._styleMsgNode(hh, dojo.marginBox(g.viewsNode).w, h);
		}
	},
	
	_styleMsgNode: function(top, width, height){
		var messagesNode = this.grid.messagesNode;
		dojo.style(messagesNode, {"position": "absolute", "top": top + "px", "width": width + "px", "height": height + "px", "z-Index": "100"});
	},
	
	_updateDescription: function(){
		// summary:
		//		Update size information.
		/*var s = this.plugin.forcePageStoreLayer;
		if(this.description && this.descriptionDiv){
			this.descriptionDiv.innerHTML = this._maxItemSize > 0 ? dojo.string.substitute(this.descTemplate, [this.itemTitle, this._maxItemSize, s.startIdx + 1, s.endIdx + 1]) : "0 " + this.itemTitle;
		}
		if(this.descriptionWidth){
			dojo.style(this.descriptionTd, "width", this.descriptionWidth);
		}*/
	},
		
	_updatePageStepper: function(){
		// summary:
		//		Update the page step nodes
		if(!this.pageStepperTd){
			return;
		}
		if(this.pageStepperDiv.childNodes.length < 1){
			this._createWardBtns();
		}
		this._updatePageStepNodeClass();
	},
	
	_createWardBtns: function(){
		// summary:
		//		Create the previous/next/first/last button
		var self = this;
		var highContrastLabel = {prevPage: "&#60;", firstPage: "&#171;", nextPage: "&#62;", lastPage: "&#187;"};
		var createWardBtn = function(value, label, position){
			label = I18nUtil.getI18nString(label);
			var node = dojo.create("div", {value: value, title: label, tabindex: 1}, self.pageStepperDiv, position);
			self.plugin.connect(node, "onclick", dojo.hitch(self, "_onPageStep"));
			dijit.setWaiState(node, "label", label);
			// for high contrast
			var highConrastNode = dojo.create("span", {value: value, title: label, innerHTML: highContrastLabel[value]}, node, position);
			dojo.addClass(highConrastNode, "dojoxGridWardButtonInner");
		};
		createWardBtn("prevPage", "%com.ibm.btt.dijit.Grid/prevPageBtn", "first");
		createWardBtn("nextPage", "%com.ibm.btt.dijit.Grid/nextPageBtn", "last");
	},
	
	_updatePageStepNodeClass: function(){
		// summary:
		//		Update the style of the page step nodes
			
		var updateClass = function(node, isWardBtn, status){
			var value = node.value,
				enableClass = isWardBtn ? "dojoxGrid" + value + "Btn" : "dojoxGridInactived",
				disableClass = isWardBtn ? "dojoxGrid" + value + "BtnDisable" : "dojoxGridActived";
			if(status){
				dojo.addClass(node, disableClass);
				dojo.attr(node, "tabindex", "-1");
			}else{
				dojo.addClass(node, enableClass);
				dojo.attr(node, "tabindex", "0");
			}
		};
		dojo.forEach(this.pageStepperDiv.childNodes, function(node){
			dojo.removeClass(node);
			if(node.value=="prevPage"){
				dojo.addClass(node, "dojoxGridWardButton");
				if(this.prevBtnEnabled){
					updateClass(node, true, false);
				}else{
					updateClass(node, true, true);
				}
			}
			if(node.value=="nextPage"){
				dojo.addClass(node, "dojoxGridWardButton");
				if(this.nextBtnEnabled){
					updateClass(node, true, false);
				}else{
					updateClass(node, true, true);
				}
			}			
		}, this);
	},
		
	// ===== focus handlers ===== //
	_onFocusPaginator: function(event, step){
		// summary:
		//		Focus handler
		if(!this._currentFocusNode){
			if(step != 0){
				return this._onFocusPageStepNode(event);
			}else{
				return false;
			}
		}else{
			return false;
		}
	},
		
	_onFocusPageStepNode: function(event){
		// summary:
		//		Focus the page step area, if there is no focusable node, return false
		var pageStepNodes = this._getPageStepActivableNodes();
		if(event && event.type !== "click"){
			if(pageStepNodes[0]){
				dijit.focus(pageStepNodes[0]);
				this._currentFocusNode = pageStepNodes[0];
				this.focusArea = "pageStep";
				this.plugin._stopEvent(event);
				return true;
			}else{
				return false;
			}
		}
		if(event && event.type == "click"){
			if(dojo.indexOf(this._getPageStepActivableNodes(), event.target) > -1){
				this.focusArea = "pageStep";
				this.plugin._stopEvent(event);
				return true;
			}
		}
		return false;
	},
		
	_onBlurPaginator: function(event, step){
		var pageStepNodes = this._getPageStepActivableNodes();
		
		if(step > 0 && this.focusArea === "pageSize" && (pageStepNodes.length > 1 || this.gotoButton)){
			return false;
		}else if(step < 0 && this.focusArea === "pageStep"){
			return false;
		}
		this._currentFocusNode = null;
		this.focusArea = null;
		return true;
	},
	
	_onKeyDown: function(event, isBubble){
		// summary:
		//		Focus navigation
		if(isBubble){
			return;
		}
		if(event.altKey || event.metaKey){
			return;
		}
		var dk = dojo.keys;
		if(event.keyCode === dk.ENTER || event.keyCode === dk.SPACE){
			if(dojo.indexOf(this._getPageStepActivableNodes(), this._currentFocusNode) > -1){
				this._onPageStep(event);
			}
		}
		this.plugin._stopEvent(event);
	},
	
	_moveFocus: function(rowDelta, colDelta, evt){
		// summary:
		//		Move focus according row delta&column delta
		var nodes;
		if(this.focusArea == "pageStep"){
			nodes = this._getPageStepActivableNodes();
			if(this.gotoPageDiv){
				nodes.push(this.gotoPageDiv);
			}
		}
		if(nodes.length < 1){
			return;
		}
		var currentIdx = dojo.indexOf(nodes, this._currentFocusNode);
		var focusIdx = currentIdx + colDelta;
		if(focusIdx >= 0 && focusIdx < nodes.length){
			dijit.focus(nodes[focusIdx]);
			this._currentFocusNode = nodes[focusIdx];
		}
		this.plugin._stopEvent(evt);
	},
		
	_getPageStepActivableNodes: function(){
		return (dojo.query("div[tabindex='0']", this.pageStepperDiv));
	},
		
	_getAllPageStepNodes: function(){
		var nodeList = [];
		for(var i = 0, len = this.pageStepperDiv.childNodes.length; i < len; i++){
			nodeList.push(this.pageStepperDiv.childNodes[i]);
		}
		return nodeList;
	},
	
	_onPageStep: function(/*Event*/e){
		// summary:
		//		The handler jump page event
		var g = this.grid;
		
		if(!this._currentFocusNode){
			this.grid.focus.currentArea("pagination" + this.position);
		}
		if(this.focusArea != "pageStep"){
			this.focusArea = "pageStep";
		}
		
		switch(e.target.value){
			case "prevPage":
				if(e.target.className.indexOf("dojoxGridprevPageBtnDisable") <= 0 ) g.prevPage();
				break;
			case "nextPage":
				if(e.target.className.indexOf("dojoxGridnextPageBtnDisable") <= 0 )	g.nextPage();
				break;
		}
	}

});

dojox.grid.EnhancedGrid.registerPlugin(com.ibm.btt.dijit.plugins.Pagination/*name:'bttpagination'*/);

}

if(!dojo._hasResource["com.ibm.btt.dijit.Dialog"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.Dialog"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Dialog"); 


 

dojo.declare("com.ibm.btt.dijit.Dialog",[ dijit.Dialog,com.ibm.btt.dijit.AbstractWidgetMixin] ,{ 
	
	closable : false,
	
	/**
	 * 
	 * hook method for close attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setClosableAttr : function(value){
		this.closable = value;
		if(this.closable){
			dojo.style(this.closeButtonNode, "display", "");
		}else{
			dojo.style(this.closeButtonNode, "display", "none");
		}
	},
	
	_onKey: function(/*Event*/ evt){
		// summary:
		//		Handles the keyboard events for accessibility reasons
		// tags:
		//		private

		if(evt.charOrCode){
			var dk = dojo.keys;
			var node = evt.target;
			if(evt.charOrCode === dk.TAB){
				this._getFocusItems(this.domNode);
			}
			var singleFocusItem = (this._firstFocusItem == this._lastFocusItem);
			// see if we are shift-tabbing from first focusable item on dialog
			if(node == this._firstFocusItem && evt.shiftKey && evt.charOrCode === dk.TAB){
				if(!singleFocusItem){
					dijit.focus(this._lastFocusItem); // send focus to last item in dialog
				}
				dojo.stopEvent(evt);
			}else if(node == this._lastFocusItem && evt.charOrCode === dk.TAB && !evt.shiftKey){
				if(!singleFocusItem){
					dijit.focus(this._firstFocusItem); // send focus to first item in dialog
				}
				dojo.stopEvent(evt);
			}else{
				// see if the key is for the dialog
				while(node){
					if(node == this.domNode || dojo.hasClass(node, "dijitPopup")){
						if(evt.charOrCode == dk.ESCAPE && this.closable){
							this.onCancel();
						}else{
							return; // just let it go
						}
					}
					node = node.parentNode;
				}
				// this key is for the disabled document window
				if(evt.charOrCode !== dk.TAB){ // allow tabbing into the dialog for a11y
					dojo.stopEvent(evt);
				// opera won't tab to a div
				}else if(!dojo.isOpera){
					try{
						this._firstFocusItem.focus();
					}catch(e){ /*squelch*/ }
				}
			}
		}
	},
	
	/**
	 * Override, prevent dialog title section is dragged out of screen top side.
	 */
	_endDrag: function(e){
		// summary:
		//		Called after dragging the Dialog. Saves the position of the dialog in the viewport.
		// tags:
		//		private
		if(e && e.node && e.node === this.domNode){
			var pos = dojo.position(e.node);
			if(pos.y < 0) {
				pos.y = 0;
				dojo.style(this.domNode,{
					top: pos.y + "px"
				});
			}
			this._relativePosition = pos;
		}
	}

}); 

}

if(!dojo._hasResource["com.ibm.btt.dijit.ScreenCover"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.ScreenCover"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.dijit.ScreenCover");





dojo.declare("com.ibm.btt.dijit.ScreenCover", [ dijit._Widget,
		dijit._Templated, com.ibm.btt.dijit.AbstractWidgetMixin ], {

	templateString : "<div class='dijitScreenCover' style='display:none;' tabIndex='1'><div dojoAttachPoint='containerNode' class='dijitScreenCoverContainer'><div dojoAttachPoint='imageNode' class='dijitScreenCoverImage'></div><div dojoAttachPoint='textNode' class='dijitScreenCoverText'></div></div></div>",

	text : "%com.ibm.btt.dijit.ScreenCover/waitingText",
	
	postCreate : function(){
		this.inherited(arguments);
		dojo.body().appendChild(this.domNode);
		this.domNode.style.display = "none";
		this._events = [];
		this._events.push(dojo.connect(dojo.global, "onresize", this, this.layout));
		this._events.push(dojo.connect(document, "onkeydown", this, this.onKey));
	},
	
	onKey: function(evt){
		if(evt.keyCode && this.domNode.style.display === "block")
		{
			dojo.stopEvent(evt);
			return false;
		}
	},
	
	/**
	 * 
	 * Calculate the size and position of screen to make sure this widget will cover the whole screen 
	 * 
	 * @tag public
	 * 
	 * */
	layout : function() {
	
		var viewport = dojo.window.getBox();
		var bb = dojo._getBorderBox(this.containerNode);
		var l = Math.floor(viewport.l + (viewport.w - bb.w) / 2);
		var t = Math.floor(viewport.t + (viewport.h - bb.h) / 2);
		
		dojo.style(this.domNode,{
			top : viewport.t + "px",
			left : viewport.l + "px",
			width : viewport.w + "px",
			height : viewport.h + "px"
		});
		dojo.style(this.containerNode,{
			left: l + "px",
			top: t + "px"
		});

	},

	/**
	 * 
	 * hook method for text attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTextAttr : function(value){
		this.text = value;
		this.textNode.innerHTML = this.getI18NString(value);
	},
	
	/**
	 * 
	 * This method is used to show the screenCover to cover whole screen and block user operation 
	 * 
	 * @tag public
	 * 
	 * */
	show : function() {
		if(this.domNode.style.display == "block") return;
		this.domNode.style.display = "block";
		this.layout();
		try{			
			this.domNode.focus();
		}catch(e){
			console.error("ScreenCover.show: " + e);
			console.error("ScreenCover.show.domNode1: " + this.domNode);
			console.error("ScreenCover.show.domNode2: " + this.domNode.outerHTML);
			// change the "console.error" to "alert" if the console object is not accessible in your case
		}
	},

	/**
	 * 
	 * hide the shown cover
	 * 
	 * @tag public
	 * 
	 * */
	hide : function() {
		this.domNode.style.display = "none";
	},
	
	destroy : function(){
		while (this._events && this._events.length > 0) {
			dojo.disconnect(this._events.pop());
		}
		this._events = undefined;

		this.inherited(arguments);
	}
});

var ScreenCover = {};

ScreenCover.getInstance = function() {
	if(!ScreenCover._instance){
		ScreenCover._instance = new com.ibm.btt.dijit.ScreenCover();
	}
	return ScreenCover._instance;
};

}

if(!dojo._hasResource["com.ibm.btt.dijit.Script"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.Script"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Script"); 


 
 

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

}

if(!dojo._hasResource["com.ibm.btt.dijit.MultiSelect"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.MultiSelect"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/


dojo.provide("com.ibm.btt.dijit.MultiSelect");




dojo.declare("com.ibm.btt.dijit.MultiSelect", [com.ibm.btt.dijit.AbstractWidgetMixin,
		 dijit.form.MultiSelect], {
	
	//default value for submit
	labelFieldForSubmit : "label",
	valueFieldForSubmit : "value",
	width : "",
	baseClass : "bttMultiSelect",
	
	buildRendering: function(){
		this.inherited(arguments);
		dojo.query("option", this.containerNode).forEach(function(node){
			if(node){
				dojo.attr(node, "_disabled", node["disabled"]);
			}
		});
	},

	postCreate : function() {
		this.inherited(arguments);
	
		if(this.width != ""){
			dojo.style(this.domNode, "width", this.width);			
		}
	},
	
	_getValueAttr : function(){
		return this.getSelected().map(dojo.hitch(this, function(n){
			var result = {};
			result[this.labelFieldForSubmit] = n.label || n.innerText;
			result[this.valueFieldForSubmit] = n.value;
			return result;
		}));
	},
	
	_setDisabledAttr: function(value){
		var r = this.readOnly;
		dojo.query("option", this.containerNode).forEach(function(node){
			if(node){
				dojo.attr(node, "_disabled", value);
				node["disabled"] = value || r;
			}
//			if (value && node.selected){
//				node.selected = false;
//			}
		});
		this.inherited(arguments);
		dojo.toggleClass(this.domNode, "bttMultiSelectDisabled dijitDisabled", value);
		this.domNode.disabled = value || this.readOnly;
	},
	
	_setReadOnlyAttr: function(value){
		var d = this.disabled;
		dojo.query("option", this.containerNode).forEach(function(node){
			if(node){
				dojo.attr(node, "_readOnly", value);
				node["disabled"] = value || d || dojo.attr(node, "_disabled");
			}
		});
		this.inherited(arguments);
		dojo.toggleClass(this.domNode, "bttMultiSelectReadOnly dijitReadOnly", value);
		this.domNode.disabled = value || this.disabled;
	}

});

}

if(!dojo._hasResource["com.ibm.btt.dijit.CheckedMultiSelect"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.CheckedMultiSelect"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2012 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/


dojo.provide("com.ibm.btt.dijit.CheckedMultiSelect");



dojo.declare("com.ibm.btt.dijit.CheckedMultiSelect", [com.ibm.btt.dijit.AbstractWidgetMixin, dojox.form.CheckedMultiSelect], {
	//default value for submit
	labelFieldForSubmit : "label",
	valueFieldForSubmit : "value",
	width : "",
	_lastFocusedOption : null,
	
	postCreate : function() {
		this.inherited(arguments);
	
		if(this.width != ""){
			dojo.style(this.domNode, "width", this.width);
		}
	},

	_setDisabledAttr: function(value){
		dojo.forEach(this.getOptions(), function(node){
			if(node){
				node["disabled"] = value;
			}
		});
		this.inherited(arguments);
	}, 
	
	_setReadOnlyAttr: function(value){
		this.inherited(arguments);
		dojo.toggleClass(this.domNode, "dojoxMultiSelectReadOnly dijitReadOnly", value);
	},

	onAfterAddOptionItem: function(item, option){
		item.set("readOnly", this.readOnly);
		item.set("disabled", this.disabled);
		dojo.attr(item.checkBox.focusNode, "tabIndex", this.tabIndex);
		item.connect(item, "onFocus", dojo.hitch(this, function(){
			if (this._lastFocusedOption){
				dojo.style(this._lastFocusedOption, "border", "dotted 0px gray");
			}
			this._lastFocusedOption = item.labelNode;
			if(!(this.disabled || this.readOnly)){
				dojo.style(this._lastFocusedOption, "border", "dotted 1px gray");
			}
		}));
	},
	
	onBlur: function(){
		this.inherited(arguments);
		if (this._lastFocusedOption){
			dojo.style(this._lastFocusedOption, "border", "dotted 0px gray");
		}
	},
	
	_getValueAttr : function(){
		
		// summary:
		//		Returns the value of the widget by reading the options for
		//		the selected flag
		var opts = this.getOptions();
		
		var selection = dojo.filter(opts, function(n){
			return n.selected;
		});
		
		return dojo.map(selection, dojo.hitch(this, function(i){
			var result = {};
			result[ this.labelFieldForSubmit] = i.label || i.innerText;
			result[ this.valueFieldForSubmit] = i.value;
			return result;
		}));
	},
	
	// defect 30685
	_setHintAttr : function(value){
		this.hint = value;
		var node = this.domNode;
		node.title = StringUtil.removeWarp(this.getI18NString(value));
	}

});

}

if(!dojo._hasResource["com.ibm.btt.dijit.EnhancedMultiSelect"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.EnhancedMultiSelect"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2012 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/


dojo.provide("com.ibm.btt.dijit.EnhancedMultiSelect");




dojo.declare("com.ibm.btt.dijit.EnhancedMultiSelect", [dijit._Widget, dijit._Templated, com.ibm.btt.dijit.AbstractWidgetMixin], {
	
	 templateString: dojo.cache("com.ibm.btt.dijit", "templates/Ems.html", "<div class=\"enhancedMultiSelect\">\r\n\t\t<div><span dojoAttachPoint=\"labelNode\" class=\"enhancedMultiSelectLabel\">1 of 10 selected</span></div>\r\n\t\t<div dojoAttachPoint=\"buttonNode\" class=\"enhancedMultiSelectButton\"><span class=\"enhancedMultiSelectSelAll\" data-dojo-attach-event=\"ondijitclick:_selectAll\" tabindex=\"${tabIndex}\">Select All</span>\r\n\t\t\t <span class=\"enhancedMultiSelectUnSel\" data-dojo-attach-event=\"ondijitclick:_unselectAll\" tabindex=\"${tabIndex}\">UnSelect All</span>\r\n\t\t\t <span class=\"enhancedMultiSelectInvert\" data-dojo-attach-event=\"ondijitclick:_invertSelection\" tabindex=\"${tabIndex}\">Invert Selection</span></div>\r\n\t\t<div><div multiple=\"true\" name=\"${dataName}\" tabindex=\"${tabIndex}\" labelFieldForSubmit=\"${labelFieldForSubmit}\"  valueFieldForSubmit=\"${valueFieldForSubmit}\" dojoType=\"com.ibm.btt.dijit.CheckedMultiSelect\"  dojoAttachPoint=\"wrapperDiv\"></div></div>\r\n</div>\r\n"),
	 widgetsInTemplate : true,
	 width : "",
	 dataName:"",
	 value: null,

	 labelFieldForSubmit : "label",
	 valueFieldForSubmit : "value",
	 disabled : false,
	 readOnly : false,
	 tabIndex : 0,
	 
	 
	buildRendering: function(){
		this.inherited(arguments);
		this.wrapperDiv.set("disabled", this.disabled);
		this.wrapperDiv.set("readOnly", this.readOnly);
	},
	
	postCreate : function() {
		this.inherited(arguments);

		this.wrapperDiv.addOption(
				dojo.map(this.srcNodeRef.options, function(o){
					return {label: o.text, value: o.value,selected: o.selected, disabled: o.disabled};
				})
		);
		this.value = this.wrapperDiv.get("value");
		
		if(this.width != ""){
			dojo.style(this.domNode, "width", this.width);
			dojo.style(this.wrapperDiv.domNode, "width", this.width);
		}
		
		this.connect(this.wrapperDiv, "onChange", dojo.hitch(this, function(){
			this.onChange();
		}));

		this.connect(this.wrapperDiv, "_updateSelection", dojo.hitch(this, function(i){
			var fil = dojo.filter(this.wrapperDiv.getOptions(), function(item){
			    return item.selected === true;
			});
			this.labelNode.innerHTML = fil.length +" of "+ this.wrapperDiv.getOptions().length +" selected";
		}));
	},
	
	_setDisabledAttr: function(value){
		this.disabled = value;
		this.wrapperDiv.set("disabled", value);
		dojo.toggleClass(this.buttonNode, "enhancedMultiSelectButton", !(this.disabled || this.readOnly));
		dojo.toggleClass(this.buttonNode, "enhancedMultiSelectButtonDisabled",  this.disabled || this.readOnly);
	}, 
	
	_setReadOnlyAttr: function(value){
		this.readOnly = value;
		this.wrapperDiv.set("readOnly", value);
		dojo.toggleClass(this.buttonNode, "enhancedMultiSelectButton", !(this.disabled || this.readOnly));
		dojo.toggleClass(this.buttonNode, "enhancedMultiSelectButtonDisabled",  this.disabled || this.readOnly);
	}, 
	
	_selectAll : function (){
		if(!this.disabled && !this.readOnly) {
			dojo.forEach(
				this.wrapperDiv.getOptions(),
				function(option){
					if(!option.disabled){
						option.selected = true;
					}
				}
			);
			this.wrapperDiv._updateSelection();
		}
	},
	
	_unselectAll : function (){
		if(!this.disabled && !this.readOnly) {
			dojo.forEach(
					  this.wrapperDiv.getOptions(),
					  function(option){
						  if(!option.disabled){
							  option.selected = false;
						  }
					  }
					);
			this.wrapperDiv._updateSelection();
		}
	},
	
	_invertSelection : function (){
		if(!this.disabled && !this.readOnly) {
			dojo.forEach(
					  this.wrapperDiv.getOptions(),
					  function(option){
						  if(!option.disabled){							  
							  option.selected = !option.selected;
						  }
					  }
					);
			this.wrapperDiv._updateSelection();
		}
	},
	
	_getValueAttr: function() {
		this.value = this.wrapperDiv.get("value");
		return this.value;
	},
	
	/**
	 * Get the value of specified item from selected items.
	 * 
	 * @param index	the index of specified item in selected items array.
	 * @returns
	 */
	getValueByIndex: function(index) {
		var value = this.get("value");
		if(value && index < value.length) {
			return value[index][this.valueFieldForSubmit];
		}
	},
	
	/**
	 * Return the number of selected items.
	 * 
	 * @returns
	 */
	getValueLength: function() {
		var value = this.get("value");
		if(value) {
			return value.length;
		}
	},
	
	/**
	 * Callback when this widget's value is changed.
	 */
	onChange: function(){
	}
});

}

if(!dojo._hasResource["com.ibm.btt.util.GlobalConfigurationUtil"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.util.GlobalConfigurationUtil"] = true;
dojo.provide("com.ibm.btt.util.GlobalConfigurationUtil");
dojo.getObject("com.ibm.btt.util.GlobalConfigurationUtil", true); 

(function() {
	com.ibm.btt.util.GlobalConfigurationUtil = {
					
					/**
					 * This method is used to get the value string through the inputed key.
					 * 
					 * @key String
					 * @values String
					 */
					getValue: function(key, defaultValue){
						var v = this.values[key];
						v = (v!==undefined?v:defaultValue);
						return v;
					},
					
					/**
					 * This method is used to set the key string and value string .
					 * 
					 * @key String
					 * @values String
					 */
					setValue: function(key,value){
						this.values[key] = value;
					},
					
					
					values: {  

					}
			};
	
})();

}

if(!dojo._hasResource["com.ibm.btt.dijit.WebMessage"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.WebMessage"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.WebMessage"); 

 




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

}

if(!dojo._hasResource["com.ibm.btt.event._AccessKeyMixin"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.event._AccessKeyMixin"] = true;
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
		
		if (keymap && keymap.onKeyDown)
		{
			// execute the action
			if(keymap.onKeyDown(evt) === false)
			{
				// stop the event and cancel the default behavior when returnValue === false
				dojo.stopEvent(evt);
				if (dojo.isIE<9)
				{
					try{
						evt.keyCode = 0;
					}catch(e){
					}
				}
				return 0;
			}
		}
		
		return evt.keyCode;
	},
	
	_checkKeys : function(evt){
		for (var keyname in this._registeredKeyMaps) {
			var keymap = this._registeredKeyMaps[keyname];
			if (keymap.keys.keyCode==evt.keyCode &&
				((undefined==keymap.keys.ctrlKeymetaKey)  || (keymap.keys.ctrlKeymetaKey ==(evt.ctrlKey||evt.metaKey))) &&
				((undefined==keymap.keys.altKey)   		  || (keymap.keys.altKey  ==evt.altKey)) &&
				((undefined==keymap.keys.shiftKey)        || (keymap.keys.shiftKey==evt.shiftKey))){
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

}

if(!dojo._hasResource["com.ibm.btt.event._EventMixin"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.event._EventMixin"] = true;
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

}

if(!dojo._hasResource["com.ibm.btt.event.ECALoader"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.event.ECALoader"] = true;
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

}

if(!dojo._hasResource["com.ibm.btt.event._ConditionMixin"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.event._ConditionMixin"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2012 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.event._ConditionMixin"); 

/**
 * 
 * This is an internal class which is used to provide the condition reuse function
 * User can register conditions into engine instance from several different files with url
 * */
dojo.declare("com.ibm.btt.event._ConditionMixin", null,{
	
	/**
	 * 
	 * internal variable which is used to keep the all the conditions loaded form the js
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this property in customer code.
	 * */
	_conditionMap : {},
	
	
	/**
	 * 
	 * register the condition to engine instance from the specified url
	 * 
	 * @tag public 
	 * */
	registerCond : function(url) {
		if (url) {
			var xhrArgs = {
				'url' : url,
				handleAs : "json",
				sync : true,
				load : dojo.hitch(this, "_loadCond"),
				error : dojo.hitch(this, "_loadCondError", url)
			};
			dojo.xhrGet(xhrArgs);
		} else {
			console.error("The argument can not be null.");
		}
	},
	
	/**
	 * 
	 * internal method to load condition js from url
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this property in customer code.
	 * */
	_loadCond : function(cond){
		if(cond){
			for (var name in cond) {
				if (name && cond[name] && typeof (cond[name]) == 'function') {
					this._conditionMap[name] = cond[name];
				}
			}
		}
	},
	
	/**
	 * 
	 * internal method to handle the error when load condition js
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this property in customer code.
	 * */
	_loadCondError : function(url, error){
		console.error("Fail to load the condition on " + url + ", error : " + error);
	},
	
	/**
	 * 
	 * public method used to execute the condition with given name and arguments
	 * 
	 * @param this first argument is the condition name and the rest of arguments are condition execution arguments
	 * 
	 * @tag public 
	 * 
	 * */
	executeCond: function(){
		var name = arguments[0];
		var args = [];
		var length = Number(arguments.length);
		var i = 1;
		while (i < length) {
			args.push(arguments[i]);
			i++;
		}
		try{
			if(this._conditionMap[name]){
				return this._conditionMap[name].apply(this, args);
			} else {
				console.error("Condition with specified name is not found. condition=" + name);
			}
		}catch(e){
			console.error("An error occured while executing the condition " + name + ", error " + e);
		}
	},
	
	
	executeDeprecatedCond: function(){
		var name = arguments[0];
		console.warn("The condition [" + name +"] is deprecated.");
		this.executeCond(arguments);
	}
});

}

if(!dojo._hasResource["com.ibm.btt.event.Engine"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.event.Engine"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp. 2012 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp.
*/

dojo.provide("com.ibm.btt.event.Engine");







dojo.declare("com.ibm.btt.event.Engine", [com.ibm.btt.event._ConditionMixin, com.ibm.btt.event._AccessKeyMixin, com.ibm.btt.event._EventMixin], {

	monitor : null,
	
	/**
	 * 
	 * handler array for dojo connect method,
	 * used for unregister the event when clear the rules or destroy the engine
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this property in customer code.
	 * */
	_ruleEvents : {},
	
	/**
	 * 
	 * an object used to save the reference of registered rules
	 * 
	 * @tag private this is a internal property, may be changed or removed in later version
	 *              please do not use this property in customer code.
	 * */
	_ruleMaps : {},
	
	setMonitor : function(ecaMonitor){
		 this.monitor = ecaMonitor;
	},
	
	registerRules : function(rules, divId, handler) {
		this._formOnLoaded = [];
		for ( var i = 0; i < rules.length; i++){
			if (rules[i].evts) {
				for ( var j = 0; j < rules[i].evts.length; j++) {
					this._registerEvent(rules[i], rules[i].evts[j], divId, handler);
				}
			}
			if (rules[i].type && rules[i].type == "AG") {
				this._ruleMaps[rules[i].name] = rules[i];
			}
		}
		
		for ( var i = 0; i < this._formOnLoaded.length; i++) {
			if (this._formOnLoaded[i].onLoaded) {
				this._formOnLoaded[i].onLoaded();
			}
		}
		
		delete this._formOnLoaded;
		this._formOnLoaded = undefined;
	},

	_getWidget :function(id){
		if (id.lastIndexOf(".") == -1) {
			return dijit.byId(id);
		} else {
			var parentId = id.substring(0, id.indexOf("."));
			var childId = id.substring(id.indexOf(".") + 1, id.length);
			obj = dijit.byId(parentId);
			if(obj && obj.getWidget){
				return obj.getWidget(childId);
			} else {
				return null;
			}
		}
	},
	
	/**
	 *
	 * register single rule
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_registerEvent : function(rule, event, divId, handler) {
		
		var size = event.repeatAt ? dijit.byId(event.repeatAt).get("size") : 1;

		for(var i = 0; i < size; i ++) {
			if (event.id.lastIndexOf(".") == -1) {
				var widgetId = event.id + (event.repeatAt ? "_" + i : "");
			} else {
				var parentId = event.id.substring(0, event.id.indexOf("."));
				var childId = event.id.substring(event.id.indexOf("."), event.id.length);
				var widgetId = parentId + (event.repeatAt ? "_" + i : "") + childId;
			}
			var obj = this._getWidget(widgetId);
			if(!obj) {
				obj = dojo.byId(widgetId);
			}
			if (!obj) {
				console.error("Failed to register event[name=" + rule.name + "] because cannot find widget[id=" + widgetId + "]");
				console.warn("  parent widget must provide getWidget(id) to support subwidget function.");
				continue;
			}
			
			//use dojo connect to listen and trigger the event
			var _event = dojo.connect(obj, event.e, this, (function(innerIndex) {
				return function(evt) {
					this.idxPostfix = event.repeatAt ? "_" + innerIndex : null;
					if(event.repeatAt) {
						dijit.byId(event.repeatAt).setCurrentPanelIndex(innerIndex);
					} 
					if (this.monitor != null) {
						this.monitor.monitorStartRule(event, rule);
					}
					var conSize = !event.repeatAt && rule.repeatCondAt ? dijit.byId(rule.repeatCondAt).get("size") : 1;
					for(var j = 0; j < conSize; j ++){
						if(!event.repeatAt && rule.repeatCondAt) {
							this.idxPostfix = "_" + j;
							dijit.byId(rule.repeatCondAt).setCurrentPanelIndex(j);
						}
						var result = this._executeCondition(rule, evt);
						if (this.monitor != null) {
							this.monitor.monitorCondition(event, rule, result);
						}
						var actSize = !event.repeatAt && !rule.repeatCondAt && rule.repeatActionAt ? dijit.byId(rule.repeatActionAt).get("size") : 1;
						for (var m = 0; m < actSize; m ++) {
							if(!event.repeatAt && !rule.repeatCondAt && rule.repeatActionAt) {
								this.idxPostfix =   "_" + m ;
								dijit.byId(rule.repeatActionAt).setCurrentPanelIndex(m);
							}
							this._executeAction(result, rule, evt);
						}
					}
					if (this.monitor != null) {
						this.monitor.monitorEndRule(event,  rule);		
					}
				};
			})(i));
			
			if (event.e === "onLoaded") {
				var i;
				for ( i = 0; i < this._formOnLoaded.length; i++) {
					if (this._formOnLoaded[i] == obj) {
						break;
					}
				}
				if (i == this._formOnLoaded.length) {
					this._formOnLoaded.push(obj);
				}
			}
		}
		if (!divId) {
			divId = "pageDefaultDivId";
		}
		if (!this._ruleEvents[divId]) {
			this._ruleEvents[divId] = [];
		}

		if (handler) {
			handler.push(_event);
		} else {
			this._ruleEvents[divId].push(_event);
		}
	},
	
	/**
	 *
	 * execute the condition of single one rule and get the result
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_executeCondition : function(rule, evt) {
		var result = true;
		if (rule && rule.cond) {
			try{
				result = rule.cond.call(this, evt, rule);
				// test the result and convert the result to boolean
				if(result) {
					result = true;
				}else{
					result = false;
				}
			} catch (e) {
				result = undefined; // in this case, the following action will NOT be executed.
				console.error("An error occured while testing the ECA condition. Terminate this ECA." + e.toString());
			}
		}
		return result;
	},
	
	/**
	 *
	 * execute the action depends on the condition execution result
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_executeAction : function(result, rule, evt){
		if (result===true) {
			if (rule.onTrue) {
				try {
					rule.onTrue.call(this, evt, rule);
				} catch (e) {
					console.error("An error occured while ECA on true state excuting." + e.toString());
				}
			}
		} else if(result===false){
			if (rule.onFalse) {
				try {
					rule.onFalse.call(this, evt, rule);
				} catch (e) {
					console.error("An error occured while ECA on false state excuting." + e.toString());
				}
			}
		}
	},
	
	executeAG : function(name, evt) {
		if(name){
			var rule = this._ruleMaps[name];
			if (rule) {
				var inRepeat = !!this.idxPostfix;
				if(this.monitor && this.monitor.monitorStartAG){
					this.monitor.monitorStartAG(rule);
				}
				var conSize = !inRepeat && rule.repeatCondAt ? dijit.byId(rule.repeatCondAt).get("size") : 1;
				for(var j = 0; j < conSize; j ++){
					if(!inRepeat && rule.repeatCondAt) {
						this.idxPostfix =  "_" + j ;
						dijit.byId(rule.repeatCondAt).setCurrentPanelIndex(j);
					}
					var result = this._executeCondition(rule, evt);
					if(this.monitor && this.monitor.monitorAGCondition){
						this.monitor.monitorAGCondition(rule, result);
					}
					var actSize = !inRepeat && !rule.repeatCondAt && rule.repeatActionAt ? dijit.byId(rule.repeatActionAt).get("size") : 1;
					for (var m = 0; m < actSize; m ++) {
						if(!inRepeat && !rule.repeatCondAt && rule.repeatActionAt){
							this.idxPostfix =  "_" + m;
							dijit.byId(rule.repeatActionAt).setCurrentPanelIndex(m);
						}
						this._executeAction(result, rule, evt);
					}
				}
				if(this.monitor && this.monitor.monitorEndAG){
					this.monitor.monitorEndAG(rule);
				}
			} else {
				console.error("can not find corresponding action group with given name '" + name + "'");
			}
			
		} else {
			console.error("Input argument name to execute an action group can not be null or undefined or empty.");
		}
	},
	
	clearRules : function(divId) {
		if (!(divId && this._ruleEvents && this._ruleEvents[divId])) {
			return;
		}
		var tmpRules = this._ruleEvents[divId];
		while (tmpRules.length > 0) {
			try {				
				dojo.disconnect(tmpRules.pop());
			} catch (e) {
				console.error("exception @ Engine.clearRules :" + e);
			}
		}
	},
	
	clearAllRules : function() {
		for ( var name in this._ruleEvents) {
			if(name && this._ruleEvents[name]){
				while (this._ruleEvents[name].length > 0) {
					try {
						dojo.disconnect(this._ruleEvents[name].pop());
					} catch (e) {
						console.error("exception @ Engine.clearRules :" + e);
					}
				}
				this._ruleEvents[name] = undefined;
			}
		}
		this._ruleEvents = {};
		this._ruleMaps = {};
	},

	setPW : function(id, property, value) {
		if (this.monitor != null) {
			this.monitor.monitorSetPropertyAction(id, property, value);
		}
		var obj = this._getWidget(id);

		if("xValidations" == property && obj && typeof obj.idxPostfix != "undefined") {
			var newValue = [];
			for (var m = 0; m < value.length; m ++) {
				if (value[m].repeatCondAt && this.idxPostfix == null) {
					var rPanel = dijit.byId(value[m].repeatCondAt);
					for(var j = 0; j < rPanel.get('size'); j ++) {
						var valueItem = {};
						valueItem.name = value[m].name + "_" + j;
						valueItem.cond = (function(cIdxPf, condFunc){
							return function() {
								this.idxPostfix = cIdxPf;
								return condFunc.call(this);
							};
						})("_" + j, value[m].cond);
						valueItem.widgets = [];
						for(var i = 0; i < value[m].widgets.length; i++) {
							if(dojo.isArray(value[m].widgets[i])){
								var widgetId = value[m].widgets[i][0];
								if (widgetId.lastIndexOf(".") == -1) {
									var newWidgetId = widgetId + "_" + j;
								} else {
									var parentId = widgetId.substring(0, widgetId.indexOf("."));
									var childId = widgetId.substring(widgetId.indexOf("."), widgetId.length);
									var newWidgetId = parentId + "_" + j + childId;
								}
								valueItem.widgets.push(newWidgetId);
							} else {
								valueItem.widgets.push(value[m].widgets[i]);
							}
						}
						valueItem.hint = value[m].hint;
						valueItem.repeatCondAt = value[m].repeatCondAt;
						newValue.push(valueItem);
					}
								
				} else if (value[m].repeatCondAt && this.idxPostfix){
					obj.idxPostfix = this.idxPostfix;
					newValue.push(value[m]);
				} else {
					newValue.push(value[m]);
				}
			}
			for(var z = 0; z < newValue.length; z ++) {
				value[z] = newValue[z];
			}
		}
		
		var dn = undefined;
		if(!obj){
			dn = dojo.byId(id);
		}
		if (!obj && !dn) {
			console.error("Failed to set property[" + property + "] because cannot find the widget[id=" + id + "]");
			return undefined;
		}
		if (obj){
			return obj.set(property, value);
		}else if (dn){
			return dojo.attr(dn, property, value);
		}
	},

	getPW : function(id, property) {
		var obj = this._getWidget(id);
		var dn = undefined;
		if(!obj){
			dn = dojo.byId(id);
		}
		if (!obj && !dn) {
			if (this.monitor != null) {
				this.monitor.monitorGetPropertyAction(id, property, "ERROR[widget=null]");
			}
			console.error("Failed to get property[" + property + "] because cannot find the widget[id=" + id + "]");
			return undefined;
		}
		
		var value = undefined;
		if(obj){
			value = obj.get(property);
		}else if(dn){
			value = dojo.attr(dn, property);
		}
			
		if (this.monitor != null) {
			this.monitor.monitorGetPropertyAction(id, property, value);
		}
		return value;
	},

	getW : function(id) {
		var obj = this._getWidget(id);
		if (!obj) {
			console.error("Failed to find widget[id=" + id + "]");
			return undefined;
		}
		return obj;
	},
	
	runWF: function( id, functionName, parameter){		
		var targetObj = this._getWidget(id);
		if (!targetObj) {
			if (this.monitor != null) {
				this.monitor.monitorCallFunctionAction(id, functionName, args, "ERROR[widget=null]");
			}
			console.error("Failed to run function[" + functionName + "] because cannot find the widget[id=" + id + "]");
			return undefined;
		}
		var args = [];
		for ( var i = 2; i < arguments.length; i++) {
			args[i - 2] = arguments[i];
		}

		var result = undefined;
		var er = null;
		try{
			result = targetObj[functionName].apply(targetObj, args);
		}catch(e){
			er = "An error occured while running function[" + functionName + "]. " + e.toString();
		}

		if (this.monitor != null) {
			this.monitor.monitorCallFunctionAction(id, functionName, args, er?"ERROR[exception]":result);
		}
		if (er){
			console.error(er);
		}
		
		return result;
	},
	
	// inline-script-beging
	runFunction : function(obj, func, args)
	{
		return func.apply(obj, args);
	},
	
	runInlineScript : function(obj, func)
	{
		var result;
		try{			
			result = this.runFunction(obj, func, []);
		}catch(e){
			result = undefined;
			console.error("exception @ Engine.runInlineScript:" + e);
		}
		return result;
	},
	
	stopEvent : function(evt)
	{
		dojo.stopEvent(evt);
		return false;
	},
	// inline-script--end
	
	destroy : function() {
		this.clearRules();
		this._ruleEvents = undefined;
		this.monitor = undefined;
		this._ruleMaps = undefined;
	}

});

// register specific logic to dojo parser to process the div with ‘display:table’ in IE7 & IE6
(function(){
	
	function processDIV(node){

		var nl = node.children;
		for (var i=0; i<nl.length; i++)
		{
			processDIV(nl.item(i));
		}
		if (node.tagName != "DIV")
		{
			return;
		}
		if (dojo.hasClass(node, "BTTCellStyle"))
		{
			return processCell(node);
		}
		if (dojo.hasClass(node, "BTTRowStyle"))
		{
			return processRow(node);
		}
		if (dojo.hasClass(node, "BTTTableStyle"))
		{
			return processTable(node);
		}
	}
	
	// BTTTableStyle
	function processTable(node){
		var attrs = node.attributes;
		var nat = [];
		for (var i=0; i<attrs.length; i++)
		{
			var ar = attrs[i];
			if (ar.specified){
				nat[ar.nodeName] = ar.nodeValue;
			}
		}

		var table = dojo.create("table", nat);
		table.style.cssText = node.style.cssText;
		var tbody = dojo.doc.createElement('tbody');
		while (node.firstChild) {
			tbody.appendChild(node.firstChild);
		}
		table.appendChild(tbody);
		node.replaceNode(table);
	}
	
	// BTTRowStyle
	function processRow(node){
		replaceTag(node, "tr");
	}

	// BTTCellStyle
	function processCell(node){
		replaceTag(node, "td");
	}
	
	function replaceTag(node, tagName){
		var attrs = node.attributes;
		var nat = [];
		for (var i=0; i<attrs.length; i++)
		{
			var ar = attrs[i];
			if (ar.specified){
				nat[ar.nodeName] = ar.nodeValue;
			}
		}

		var nn = dojo.create(tagName, nat);
		nn.style.cssText = node.style.cssText;
		while (node.firstChild) {
			nn.appendChild(node.firstChild);
		}
		node.replaceNode(nn);
	}


	if (dojo.isIE && dojo.isIE<8)
	{
		dojo.parser.fp_dojo_parser_parse = dojo.parser.parse;
		dojo.parser.parse = function(rootNode, args){
			var root = (rootNode&&rootNode.rootNode)?rootNode.rootNode:rootNode;
			if (root==undefined)
			{
				root = dojo.body();
			}
			// console.debug("div-->table: " + root.nodeName);
			processDIV(root);
			
			return this.fp_dojo_parser_parse(rootNode, args);
		};
	}
})();



}

if(!dojo._hasResource["com.ibm.btt.event.NavigationEngine"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.event.NavigationEngine"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
 */

dojo.provide("com.ibm.btt.event.NavigationEngine");






dojo.declare("com.ibm.btt.event.NavigationEngine", [ com.ibm.btt.event.Engine ], {

	
	url : "Request",
	
	/**
	 * An object used to save the registered command type and handler
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_commandMap : {},

	/**
	 * reference of contentpane which is used to render the page return in ajax response
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	//_contentPane : null,
	_containerNode : null,
	
	_sessionId : "",

	/**
	 * reference dialog which is used to render the page return in ajax response
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_dialog : null,
	
	/**
	 * reference screen cover which is used to cover the screen and block user input during the ajax request
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	/*_cover : null,*/

	constructor : function() {
		var _this = this;
		
		if(dojo._postLoad){
			this.postCreate();
			this.onLoad();
		}else{
			dojo.addOnLoad(function() {
				_this.postCreate();
				_this.onLoad();
				dojo.query("script", dojo.body()).forEach(dojo.hitch(this, function(script) {
					if (script.src && dojo.attr(script, "data-btt-eca") === "true") {
						var urls = script.src.split("/");
						urls = urls[urls.length-1];
						urls = urls.substring(0, urls.indexOf("."));
						_this._registerECAEvent(urls, script.src);
					}
				}));
			});
		}
	},

	postCreate : function() {
		// Update page title with NLS
		var head = document.getElementsByTagName('head')[0].innerHTML;
		var titles = head.match(/<title>(.*)<\/title>/i);
		if(titles){
			var newtitle = StringUtil.escapeEnterWrap(I18nUtil.getI18nString(titles[1]));
			document.title = newtitle;
		}
		this.registerCommand("render_page", dojo.hitch(this, this.renderPageHandler));
		this.registerCommand("popup_page", dojo.hitch(this, this.popupPageHandler));
		this.registerCommand("redirect", dojo.hitch(this, this.redirectPage));
		this.registerCommand("remote_flow", dojo.hitch(this, this.remoteFlowHandler));
		this.registerCommand("print", dojo.hitch(this, this.printHandler));
		this.registerCommand("render_sub_page", dojo.hitch(this, this.renderSubPageHandler));
		this.registerCommand("do_nothing", function(){console.info("do nothing is returned from server side.");});
		
		// added for IBK start
		dojo.addOnLoad(dojo.hitch(this, function(){
			//this._initWidgets();
			this.onLoad();
		}));
		// added for IBK end
	},
	
	setRootContainer : function(nodeId){
		var tmpNode = this._getNodeByContainerId(nodeId);
		if (tmpNode) {
			this._containerNode = tmpNode;
		} 
	},
	
	launchNewFlow : function(/*FlowId/OperationId*/operationId, divId){
		if (!operationId) {
			return;
		}
		if (!this._sessionId) {
			this.sessionId = this._findSessionId();
			if(!this._sessionId) {
				return;
			}
		}
		var bttParams = {
			'dse_sessionId' : this._sessionId
		};
		if (operationId) {
			bttParams["dse_operationName"] = operationId;
		}
		bttParams["dse_nextEventName"] = "start";
		if (this._requestData && this._requestData.data["dse_pageId"]) {
			bttParams["dse_pageId"] = this._requestData.data["dse_pageId"];
		} else {
			bttParams["dse_pageId"] = "-1";
		}
		bttParams["dse_applicationId"] = "-1";
		this._submitData(bttParams, this._getNodeByContainerId(divId));
	},
	
	registerRules : function(rules, divId) {
		//override the ECA rule register method
		//remove the implementation to be compatible with older html mode ECA
		
		//for the new application with ajax mode, we should use new API registerECARules to load the eca rules
	},
	
	registerECARules : function(rules, divId, handler) {
		return com.ibm.btt.event.Engine.prototype.registerRules.call(this, rules, divId, handler);
	},
	
	_findSessionId : function(){
		var form = dojo.query('form[widgetId]', dojo.body()).map(dijit.byNode)[0];
		if(!form) {
			return undefined;
		}
		var bttParams = dojo.fromJson(form.bttParams);
		return bttParams["dse_sessionId"];
	},
	
	changeFlowEvent : function(event, container){
		if (!event) {
			return;
		}
		var node = this._getNodeByContainerId(container);
		if (!node) {
			node = this._containerNode;
		}
		var form = dojo.query('form[widgetId]', node).map(dijit.byNode)[0];
		if(!form) {
			return;
		}
		dojo.forEach(form.getDescendants(), function(widget){
			if(widget.onFormSubmit) {
				widget.onFormSubmit();
			}
		});	
		if (form.onFormSubmit) {
			form.onFormSubmit();
		}
		var bttParams = dojo.fromJson(form.bttParams);
		bttParams["dse_nextEventName"] = event;
		var data = form.get("value");
		this._submitData(dojo.mixin(data, bttParams), node);
	},

	_getNodeByContainerId : function(container){
		var node = null;
		if (container) {
			var tmpNode = dijit.byId(container);
			if (tmpNode && tmpNode.containerNode) {
				node = tmpNode.containerNode;
			} else {
				tmpNode = dojo.byId(container);
				if (tmpNode) {
					node = tmpNode;
				} 
			}
		}
		return node;
	},
	
	onLoad : function(e, node) {
		this._delegateAllFormSubmit(node);
		dojo.forEach(
			dojo.filter(dojo.query('form'), function(form){ 
				return form.title && form.title != ""; 
			} ),
			function(form){
				eval(form.title);
			}
		);
		this._getCover().hide();
	},

	setUrl : function(value){
		this.url = value;
	},
	
	registerCommand : function(type, handler) {
		this._commandMap[type] = handler;
	},

	/**
	 * get all widget under specified dome node
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_queryAllWidgets : function(node) {
		if (!node) {
			node = dojo.body();
		}
		return dojo.query('[widgetId]', node).map(dijit.byNode);
	},
	
	/**
	 * destroy all dijit instance in cuerrent page
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_disposeAllWidgets : function(container) {
		var node;
		var tmpNode = this._getNodeByContainerId(container);
		if (tmpNode) {
			node = tmpNode;
		} else {
			node = this._containerNode;
		}
		if (node) {
			//this._destroyContentPane();
			this._destroyDialog();
			dojo.forEach(this._queryAllWidgets(node), function(widget) {
				if(window[widget.id]){
					window[widget.id] = undefined;
				}
				try{
					widget.destroy();
				}catch(e){
					//do nothing, just in case there is a exception thrown out while destroying the widgets
					console.debug("An error occured while destroying the widget[id=" + widget.id + "]. Error:" + e);
				}
			});
			dojo.empty(node);
		} else {
			this._destroyDialog();
			this._destroyCover();

			dojo.forEach(this._queryAllWidgets(), function(widget) {
				if(window[widget.id]){
					window[widget.id] = undefined;
				}
				try{
					widget.destroy();
				}catch(e){
					//do nothing, just in case there is a exception thrown out while destroying the widgets
					console.error("An error occured, while destroying the widget. Error:" + e);
				}
			});
			dojo.empty(dojo.body());
			dijit._masterTT = undefined;
			this._containerNode = dojo.create("div", {style:"width:100%;height:100%"}, dojo.body(), "last");
		}

		if (com.ibm.btt.dijit.keyboards.instances) {
			var keyboards = com.ibm.btt.dijit.keyboards.instances;
			for ( var i = 0; i < keyboards.length; i++) {
				if (keyboards[i] && keyboards[i].destroy) {
					keyboards[i].destroy();
				}
			}
		}
		
	},

	/**
	 * release event handlers created by dojo.connect
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_unregisterEvents : function(arg, flag) {
		if (flag) {
			while (arg.length > 0) {
				dojo.disconnect(arg.pop());
			}
		} else {
			dojo.disconnect(arg);
		}
	},
	
	/**
	 * Take over all form submission request by engine
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_delegateAllFormSubmit : function(node) {
		var _this = this;
		
		dojo.forEach(this._queryAllWidgets(node), function(widget) {
				
			if(widget.type != "undefined" && (
					widget.type == "save" || widget.type == "cancel")){
				if(!widget.hasEventBundle) {
					var btnClick = widget._onButtonClick;
					widget._onButtonClick = dojo.hitch(_this, _this._onButtonClick, widget, btnClick);
				}
			}
			
			if(widget.domNode.nodeName === "A" ){
				if(!widget.hasEventBundle) {
					var linkClick = widget.onClick;
					widget.onClick = dojo.hitch(_this, _this._onLinkClick, widget, linkClick);
				}
			}
			
			if(widget.domNode.nodeName === "FORM"){
				widget._rawOnSubmit = widget.onSubmit;
				widget.onSubmit = dojo.hitch(widget, function(e) {
					if(e){
						if(e.preventDefault){
							e.preventDefault();
						}
						dojo.stopEvent(e);
					}
					if(widget.validateOnSubmit) {
						if(!widget.isValid() || !widget.xValid) return false;
					}
					var button = widget._querySubmitButton(e);
					dojo.forEach(widget.getDescendants(), function(widget){
						if(widget.onFormSubmit) {
							try{
								//G028  						
								widget.launchNew=false;
								if ( widget instanceof com.ibm.btt.dijit.Grid ){										
									var current_bttparams= dojo.fromJson(widget.bttParam4Link);
									var button_bttparams;
									if (button!=undefined) {
										if (button.bttParams['dse_operationName']!=undefined)
											button_bttparams=button.bttParams;
										else
											button_bttparams= dojo.fromJson(button.bttParams);
										if (current_bttparams['dse_operationName'] !=button_bttparams['dse_operationName'])
											widget.launchNew=true;		
									}
								}///
						
								widget.onFormSubmit();
								
							}catch(e){
								console.error("Error occured while excuting the onFormSubmit events before form submitted.");
							}
						}
					});	
					
					if (widget.onFormSubmit) {
						widget.onFormSubmit();
					}
					_this._submitFormData(widget, button);
					return false;
				});
			}
		});
		
	},
	
	//G028 , check if the button is launching new flow/op 
	_checkNewLaunch : function(form, button){
		
		dojo.forEach(form.getDescendants(), function(widget){
			if(widget.onFormSubmit) {				 					 
					if ( widget instanceof com.ibm.btt.dijit.Grid){	
						widget.launchNew=false;
						//var current_bttparams= dojo.fromJson(widget.bttParam4Link);
						//var button_bttparams= dojo.fromJson(button.bttParams);
						var current_bttparams= typeof widget.bttParam4Link == "string" ? dojo.fromJson(widget.bttParam4Link) : widget.bttParam4Link;
						var button_bttparams= typeof button.bttParams == "string" ? dojo.fromJson(button.bttParams) : button.bttParams;
						if (current_bttparams['dse_operationName'] !=button_bttparams['dse_operationName'])
							widget.launchNew=true;																			 
					}///			 									 
			}
		});	
		
		
		
			 
	},
	
	/**
	 * 
	 * handle the default like click behavior replace with ajax by engine 
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onLinkClick : function(link, linkClick, e){
		if (link.bttParams) {
			dojo.stopEvent(e);
			if (link.get("target") !== "_blank") {
				var node = this._checkParentContainer(link.domNode);
				this._submitData(typeof link.bttParams == "string" ? dojo.fromJson(link.bttParams) : link.bttParams, node);
			} else {
				window.open(link.domNode.href);
			}
			return false;
		} else if(link.action == "#" || !link.action){
			linkClick.apply(link, [e]);
		}
	},
	
	/**
	 * 
	 * override the default button click event to take over and submit the request 
	 * with ajax to support "save" and "cancel" type button
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onButtonClick : function(button, btnClickMethod, e){
		if(button.get("disabled") == false && (button.type == "submit" || button.type == "cancel" || button.type == "save") ) {
			var form = button._getParentForm();
			if(form)
				form._clickedButton = button;
		}
		else {
			var form = button._getParentForm();
			if(form)
				form._clickedButton = null;
		}
		if (button.type == "save" && button.get("disabled") == false) {
			button._onClick(e);
			e.preventDefault();
			var form = button._getParentForm();
			this._checkNewLaunch (form, button);
			if(form && button.bttParams){
				// Modified for PMR BP34446 - Start
				dojo.forEach(form.getDescendants(), function(widget){
					if(widget.onFormSubmit) {
						widget.onFormSubmit();
					}
				});
				// Modified for PMR BP34446 - End
				if (form.onFormSubmit) {
					form.onFormSubmit();
				}
				var node = this._checkParentContainer(button.domNode);
				this._submitData(dojo.mixin(form.get('validValue'), typeof button.bttParams == "string" ? dojo.fromJson(button.bttParams) : button.bttParams), node);
			}
		} else if (button.type == "cancel" && button.get("disabled") == false) {
			button._onClick(e);
			e.preventDefault();
			if(button.bttParams){
				var node = this._checkParentContainer(button.domNode);
				this._submitData(typeof button.bttParams == "string" ? dojo.fromJson(button.bttParams) : button.bttParams, node);
			}
		} else {
			btnClickMethod.apply(button, [e]);
		}
	},
	
	_checkParentContainer : function(node){
		var tmpNode = node;
		var resNode = null;
		while(tmpNode){
			if (dojo.hasClass(tmpNode, "divFlowContainer")) {
				resNode = tmpNode;
				break;
			}
			tmpNode = tmpNode.parentNode;
		}
		if(resNode && resNode.id) {
			resNode = this._getNodeByContainerId(resNode.id);
		}
		return resNode;
	},
	
	/**
	 * 
	 * submit for form request with ajax
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_submitFormData : function(form, button) {
		if(button && button.bttParams){
			var x = dojo.mixin(form.get('value'), typeof button.bttParams == "string" ? dojo.fromJson(button.bttParams) : button.bttParams);
			x.dse_errorPage = form.bttErrorPage? form.bttErrorPage : null;
			if(x['dse_nextEventName'])
				x[AjaxUtil.constants.BTT_SUBMITFORMID] = form.get("id");
			var node = this._checkParentContainer(button.domNode);
			this._submitData(x, node);
		}else if(form.bttParams){
			var x = dojo.mixin(form.get('value'), typeof form.bttParams == "string" ? dojo.fromJson(form.bttParams) : form.bttParams);
			x.dse_errorPage = form.bttErrorPage? form.bttErrorPage : null;
			if(x['dse_nextEventName'])
				x[AjaxUtil.constants.BTT_SUBMITFORMID] = form.get("id");
			var node;
			if (button) {
				node = this._checkParentContainer(button.domNode);
			} else {
				node = this._checkParentContainer(form.domNode);
			}
			
			this._submitData(x, node);
		}else{
			console.log("Do not find default BTT Params on form for user press enter operation.");
		}
	},

	/**
	 * send ajax request to btt service
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_submitData : function(data, node){
		if (!data[AjaxUtil.constants.BTT_TIMEZONE]) {
			data[AjaxUtil.constants.BTT_TIMEZONE] = AjaxUtil.getTimzone();
		}
		AjaxUtil.xhrPost( {
			headers : {
				'requesttype':'ajax'
			},
			url : this.url,
			handleAs : "json",
			success : dojo.hitch(this, this._handleFormResponse, node),
			error : dojo.hitch(this, this._handleError)
		}, data);
		this._getCover().show();
	},
	
	/**
	 * error handler if error occured
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleError : function(e, xhr){
		var displayMsg;
		if(xhr){
			//xhr is not null, this error comes from Ajax 
			//maybe it is a http 404 or 500 error 
			//need to check and display the error page if the there is an error page in the response JSON
			var response = xhr.xhr.responseText;
			if (response && response != "") {
				try{
					response = dojo.fromJson(response);
					if (response["page"]) {
						displayMsg = response["page"];
					} 
				}catch(e){
					displayMsg = response;
				}
			} 
		}
		
		if(!displayMsg){
			if (e.message) {
				displayMsg = e.message;
			} else {
				displayMsg = "An error occured. Messsage : " + e;
			}
		}
		
		this._disposeAllWidgets();

		dojo.body().innerHTML = displayMsg;
		
		this._getCover().hide();
	},
	
	/**
	 * 
	 * handler for form data request response
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_handleFormResponse : function(node, e) {
		var closeCover;
		if (this._commandMap[e["command"]]) {
			try{
				closeCover = this._commandMap[e["command"]](e, node);
			}catch(ee){
				this._handleError('An error occured while excuting the handler:'
					+ e["command"] + ' error:' + ee);
			}
		} else {
			this._handleError('Can not find corresponding command handler for command type=\''
									+ e["command"] + '\'');
		}
		
		/*if(e && e["command"] == "remote_flow"){
			// do nothing before remote flow loaded at onLoad().
		}else{*/
			
		/*}*/
		if (closeCover !== false) {
			this._getCover().hide();
		} 
	},

	/*createContentPane : function(){
		return new com.ibm.btt.dijit.ContentPane({'style':'padding:0px;overflow:auto;',refreshOnShow: false}, dojo.create("div", null, dojo.body(),"last"));
	},*/
	
	/**
	 * 
	 * singleton method to get a contentpane instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	/*_getContentPane : function(data){
		if(!this._contentPane){
			this._contentPane = this.createContentPane();
		}
		if(this._cpOnLoadEvt){
			this._unregisterEvents(this._cpOnLoadEvt);
		}
		if(this._cpOnErrorEvt){
			this._unregisterEvents(this._cpOnErrorEvt);
		}
		this._cpOnErrorEvt = dojo.connect(
			this._contentPane, 
			'onContentError',
			this, 
			dojo.hitch(this, this._afterPageLoaded, data, this._contentPane)
		);
		this._cpOnLoadEvt = dojo.connect(
			this._contentPane, 
			'onLoad',
			this, 
			dojo.hitch(this, this._afterPageLoaded, data, this._contentPane)
		);
		return this._contentPane;
	},*/
	
	/**
	 * 
	 * destroy the contentpane instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	/*_destroyContentPane : function(){
		if(this._contentPane){
			this._unregisterEvents(this._cpOnLoadEvt);
			this._cpOnLoadEvt = undefined;
			this._unregisterEvents(this._cpOnErrorEvt);
			this._cpOnErrorEvt = undefined;
			try{
				this._contentPane.destroyDescendants();
				this._contentPane.destroy();
			}catch(e){
				//do nothing just in case there is a exception thrown out when destroy the contentpane.
			}
			this._contentPane = undefined;
		}
	},*/
	
	createDialog : function(props) {
//		var viewport = dojo.window.getBox();
//		var mxwidth = viewport.w - 50;
//		var mxheight = viewport.h - 50;
		var dialog = new com.ibm.btt.dijit.Dialog(dojo.mixin({
			"title" : "",
//			style : "overflow:auto;max-width:"+mxwidth+"px;max-height:"+mxheight+"px;",
			"closable" : false
		}, props));
//		dojo.style(dialog.containerNode, "overflow", "auto");
		return dialog;
	},
	
	//added for IBK closable dialog event
//	_closeEvent: function( data ){
//		this._submitData( data.prop.bttParams );
//	},
	
	//added for dialog left and top adjustment
	_adjustDialogPosition: function (data){
		var viewport = dojo.window.getBox();
		var top = 0;
		var left = 0;
		var bb = dojo._getBorderBox(this._dialog.domNode);
		if(data.prop==undefined || data.prop.top==undefined){
			top = Math.floor(viewport.t + (viewport.h - bb.h) / 2);
		}else {
			top = data.prop.top;
		}
		if (top < 0){
			top = 0;
		}
		
		if(data.prop==undefined || data.prop.left==undefined){
			left = Math.floor(viewport.l + (viewport.w - bb.w) / 2);
		}else {
			left = data.prop.left;
		}
		if(left < 0){
			left = 0;
		}
		
		// this.set('style', 'left: '+ left +'px; top: '+ top +'px;');
		dojo.style(this._dialog.domNode,{
			left: left + "px",
			top: top + "px"
		});
	},
	
	/**
	 * singleton method to get the dialog instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getDialog : function(data){
		if (!this._dialog) {
			this._dialog = this.createDialog();
			// set top & left
			// this._dialog.connect(this._dialog, "onLoad", this._adjustDialogPosition);
			this._dialog._position = function(){};
			this._dialog.eng = this;
			this._dialog.connect(this._dialog, "onCancel", function(){
				if(this.bttParams){
					this.eng._submitData( this.bttParams );
				}
			});
			this._dialog.startup();
		}
//		else{
//			if (this._dialog.get('open')) {
//				this._dialog.hide();
//			}
//			this._dialog.destroyDescendants();
//		}
		
		var height = "auto";
		var width = "auto";
		var title = "";
		var closable = false;
		var bttParams = undefined;
		if( typeof(data.prop) != "undefined"){
			//set height and width
			// the minimum hieght is 50 px
			if(data.prop.height && data.prop.height>50){
				height = data.prop.height + "px";
			}
			// the minimum width is 100 px
			if(data.prop.width && data.prop.width>100){
				width = data.prop.width + "px";
			}
			
			// set title
			if(data.prop.title != undefined){
				title = data.prop.title;
			}

			// set closable & BTT params
			closable = data.prop.closable?true:false;
			if(closable && data.prop.bttParams != undefined){
				bttParams = data.prop.bttParams;
			}
		}
		data = undefined;
		
		dojo.style(this._dialog.containerNode, {"overflow":"auto", "height":height, "width":width});
		
		if((width+height).indexOf("px")>0)
		{
			this._dialog._size = function(){};
		}
		this._dialog.set("title", StringUtil.escapeEnterWrap(I18nUtil.getI18nString(title)));
		this._dialog.set("closable", closable);
		this._dialog.bttParams = bttParams;

//		if(this._dialogOnLoadEvt){
//			this._unregisterEvents(this._dialogOnLoadEvt);
//		}
//		this._dialogOnLoadEvt = dojo.connect(
//			this._dialog, 
//			'onLoad',
//			this, 
//			dojo.hitch(this, this._afterPageLoaded, data, this._dialog)
//		);
		
//		if(this._dialogOnCloseEvt){
//			this._unregisterEvents(this._dialogOnCloseEvt);
//		}
//		this._dialogOnCloseEvt = dojo.connect(
//			this._dialog, 
//			'onHide',
//			this,
//			dojo.hitch(this, this._closeEvent, data, this._dialog)
//		);

		return this._dialog;
	},
	
	
	/**
	 * 
	 * destroy the dialog instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_destroyDialog : function(){
		if (this._dialog) {
//			this._unregisterEvents(this._dialogOnLoadEvt);
//			this._dialogOnLoadEvt = undefined;
			delete this._dialog.eng;
			this._dialog.eng = undefined;
			delete this._dialog.bttParams;
			this._dialog.bttParams = undefined;
//			this._dialog.hide();
			try{
				this._dialog.destroyDescendants();
				this._dialog.destroy();
			}catch(e){
				console.debug("exception @ _destroyDialog: " + e);
				//do nothing just in case there is a exception thrown out when destroy the dialog.
			}
			this._dialog = undefined;
		}
	},
	
	/**
	 * 
	 * singleton method to get a cover instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getCover : function(){
		return ScreenCover.getInstance();
	},
	
	/**
	 * destroy the cover instance
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_destroyCover : function(){
		if(ScreenCover._instance){
			ScreenCover._instance.destroy();
			ScreenCover._instance = undefined;
		}
	},
	
	isECARuleFile : function(src, fileName) {
		var endWith = function(src, oString) {
			var reg = new RegExp(oString + "$");
			return reg.test(src);
		};
		return endWith(src, fileName + ".js");
	},
	
	/**
	 * 
	 * parse and load the ECA js after page is loaded
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_afterPageLoaded : function(data, container){
		
		if(data["page_name"]){
			// var _this = this;
			dojo.query("script", container.domNode).forEach(dojo.hitch(this, function(script) {
				// added for IBK start
				this._initWidgetsLite(script, container.domNode);
				// added for IBK end

				if (script.src && this.isECARuleFile(script.src, data["page_name"])) {
					this._registerECAEvent(data["page_name"], script.src);
				}
			}));
		}
		
		this.onLoad(data, container.domNode);
	},
	
	// added for IBK start
	_WCONFIGP : /^\s*window\["dse_widgetsConfig"\]/,
	_initWidgetsLite : function(script, domNode){
//		var content = dojo.trim(script.innerHTML);
//		var target = "window[\"dse_widgetsConfig\"]";
//		if(content.slice(0, target.length) == target){
//			dojo.eval(content);
		if (this._WCONFIGP.test(script.innerHTML)){
			dojo.eval(script.innerHTML);
			// instantiate widgets
			if(window.dse_widgetsConfig){
				for(var idx = window.dse_widgetsConfig.length -1; idx>=0; idx --){
					var config = window.dse_widgetsConfig[idx];
					if(config.id){
						try{
							var node = dojo.byId(config.id);
							if(node) {
								for(var p in config) {
									if(p && p!="id") {
										// dojo.attr(node, p, config[p]);
										// force to set everything to the node attributes rather than the dojo.attr() did
										// note that dojo.parser will ignore any property which is outside of the attributes list
										node.setAttribute(p, config[p]);
									}
								}
							}
							
						} catch(e) {
							console.error(e);
						}
					}
				}
				window.dse_widgetsConfig = undefined;
				dojo.parser.parse(domNode?domNode:dojo.body());
			}
		}
	},
	// added for IBK end
	
	/**
	 * get the ECA js file with ajax request
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_registerECAEvent : function(name, url, divId){
		var xhrArg = {
			url : url,
			handleAs : "text",
			load : dojo.hitch(this, function(e) {
				dojo.eval(e);
				if (window[name]) {
					this.registerECARules(window[name], divId);
					try{						
						delete window[name];
					}catch(e){// failed on IE8
					}
				}
			})
		};
		dojo.xhrGet(xhrArg);
	},
	
	/**
	 * parse and generate the next page url for option1
	 * 
	 * @tag private this is a internal attribute, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_parsenextPageUrl: function(e) {
		var data = dojo.fromJson(e.data);
		var url = [ "Request?dse_applicationId=" + data["dse_applicationId"] ];
		url.push("dse_processorId=" + data["dse_processorId"]);
		url.push("dse_sessionId=" + data["dse_sessionId"]);
		url.push("dse_processorState=" + data["dse_processorState"]);
		url.push("dse_nextEventName=" + data["dse_nextEventName"]);
		url.push("dse_operationName=" + data["dse_operationName"]);
		url.push("dse_pageId=" + data["dse_pageId"]);
		return url.join("&");
	},
	
	redirectPage : function(e){
		location.href = this._parsenextPageUrl(e);
	},

	popupPageHandler : function(data) {
		if(dijit._masterTT_BTT && dijit._masterTT_BTT.aroundNode)//defect 29891
			dijit.hiddenBTTTooltip(dijit._masterTT_BTT.aroundNode);
		this._getCover().show();
		this.clearRules();
		this._destroyDialog();

		if (dojo.isOpera)
		{
			dojo.query("*").attr("tabIndex", -1);
		}
		
		// fix for Firefox 3.6.*, the dojo in ContentPane breaks page rendering
		var page = dojo.isFF<4 ? data["page"].replace('src="js/dojo/dojo_BTT.js"', '') : data["page"];
		
		// Update locale for new page
		var test = page.match(/locale:'(.*)'/);
		if(test){
			var newlocale = test[1];
			if(newlocale.length >= 2){
				if(djConfig.locale != newlocale || dojo.locale != newlocale){
					var old1 = djConfig.locale;
					var old2 = dojo.locale;
					if(!this._loadedLocales){
						this._loadedLocales = [];
					}
					if(old1 != old2){
						this._loadedLocales.push(old1);
						this._loadedLocales.push(old2);
					}else{
						this._loadedLocales.push(old1);
					}

					djConfig.locale = newlocale;
					dojo.locale = newlocale;
					console.debug("djConfig.locale : " + old1);
					console.debug("dojo.locale : " + old2);
					console.debug("new locale : " + newlocale);
					
					for(var module in dojo._loadedModules){
						var modulename = "" + module;
						var ms = modulename.split(".nls.");
						if(ms && ms.length >= 2){
							if( !this._containsLocale(ms[1]) && newlocale != "ROOT"){
								// console.debug("Loading new bundle : " + modulename + " " + newlocale);
								try{									
									dojo.requireLocalization(ms[0], ms[1], newlocale, "", "", "");
								}catch(e){
									console.debug("Fail to load : " + modulename + " " + newlocale);
								}
							}
						}
					}
				}
			}
		}

		var dialog = this._getDialog(data);
		dialog.set('content', page)
			  .then(dojo.hitch(this, this._afterPageLoaded, data, dialog))
			  .then(dojo.hitch(this, function(){
				  dialog.show();
				  this._adjustDialogPosition(data);
			  }));
				
		return dialog;
	},

	renderPageHandler : function(data, node) {
		if(dijit._masterTT_BTT && dijit._masterTT_BTT.aroundNode)//defect 29891
			dijit.hiddenBTTTooltip(dijit._masterTT_BTT.aroundNode);
		
		this._getCover().show();

		var container;
		
		if (node) {
			this.clearRules(node.id);
			this._disposeAllWidgets(node);
			container = node;
		} else {
			this.clearAllRules();
			this._disposeAllWidgets();
			container = this._containerNode;
		}
		
		var page = dojo.isFF < 4?data["page"].replace('src="js/dojo/dojo_BTT.js"', ''): data["page"];
		
		// Update locale for new page
		var test = page.match(/locale:'(.*)'/);
		if(test){
			var newlocale = test[1];
			if(newlocale && newlocale.length > 1){
				if(djConfig.locale != newlocale || dojo.locale != newlocale){
					var old1 = djConfig.locale;
					var old2 = dojo.locale;
					if(!this._loadedLocales){
						this._loadedLocales = [];
					}
					if(old1 != old2){
						this._loadedLocales.push(old1);
						this._loadedLocales.push(old2);
					}else{
						this._loadedLocales.push(old1);
					}

					djConfig.locale = newlocale;
					dojo.locale = newlocale;
					console.debug("djConfig.locale : " + old1);
					console.debug("dojo.locale : " + old2);
					console.debug("new locale : " + newlocale);
					
					for(var module in dojo._loadedModules){
						var modulename = "" + module;
						var ms = modulename.split(".nls.");
						if(ms && ms.length >= 2){
							if( !this._containsLocale(ms[1]) && newlocale != "ROOT"){
								// console.debug("Loading new bundle : " + modulename + " " + newlocale);									
								try{									
									dojo.requireLocalization(ms[0], ms[1], newlocale, "", "", "");
								}catch(e){
									console.debug("Fail to load : " + modulename + " " + newlocale);
								}
							}
						}
					}
				}
				
				var localeValues = newlocale.split("-");
				if(localeValues && localeValues[0]) {
					var language = localeValues[0];
					var htmlTag = document.getElementsByTagName('html')[0];
					if(htmlTag.getAttribute('lang')) {
						htmlTag.setAttribute('lang', language);
					}
					
					if(htmlTag.getAttribute('xml:lang')) {
						htmlTag.setAttribute('xml:lang', language);
					}
				}
			}
		}
		
		//Update window title
		var titles = page.match(/<title>(.*)<\/title>/i);
		if(titles){
			var newtitle = StringUtil.escapeEnterWrap(I18nUtil.getI18nString(titles[1]));
			console.debug("New page title is " + newtitle);
			document.title = newtitle;
		}
		
		container.innerHTML = page;
		
		// defect 30648 -start
		if(!node) {
			dojo.parser.parse(container);
		} else { // if node is not null or undefined, the page is used for partial refresh(for Q009 Div flow)
			dojo.parser.parse(container, {noStart:true});
			dojo.query("[widgetid]", container).forEach(function(node){
				var widget = node.getAttribute && dijit.byId(node.getAttribute("widgetid"));
				if(widget && dojo.isFunction(widget.startup) && !widget._started) {
					widget.startup();
				}
			});
		}
		// defect 30648 -end
		
		this.updateHash();
		
		if(data["page_name"]){
			dojo.query("script", container).forEach(dojo.hitch(this, function(script) {
				this._initWidgetsLite(script, this._containerNode);
				if (script.src && this.isECARuleFile(script.src, data["page_name"])) {
					this._registerECAEvent(data["page_name"], script.src);
				}
			}));
		}
			
		this.onLoad(data, container);
	},
	
	/**
	 * Check if the modulename contain any previous locales
	 * Yes, return true
	 * None, return false
	 */
	_containsLocale: function(/*String*/ moduleName){
		if(this._loadedLocales){
			for(var i=0; i< this._loadedLocales.length; i++){
				var p1 = dojo.i18n.normalizeLocale(this._loadedLocales[i]);
				var p2 = p1.replace(/\-/g, '_');
				var p3 = p2.substring(0,2);
				var p4 = 'ROOT';
				
				if(moduleName.indexOf(p1) !==-1 || moduleName.indexOf(p2) !==-1 ||moduleName.indexOf(p3) !==-1 ||moduleName.indexOf(p4) !==-1){
					return true;
				}
			}
			return false;
		}
		return false;
	},
	
	remoteFlowHandler: function(data) {
		if(dijit._masterTT_BTT && dijit._masterTT_BTT.aroundNode)//defect 29891
			dijit.hiddenBTTTooltip(dijit._masterTT_BTT.aroundNode);
		this._getCover().show();
		
		var submit_data = dojo.fromJson(data["data"]);
		console.info("############ remoteFlowHandler : ",submit_data );
	 
		if (submit_data.dse_remoteFlowID) {
			this.url= submit_data.dse_RemoteRequest_URL ; // requst URL of remote flow transactions
			AjaxUtil.ajaxOperationUrl = submit_data.dse_RemoteAjaxOp_URL;
		}			
		else {
			this.url = submit_data.dse_RemoteSubFlow_URL;  //  requst URL parent flow transactions
			AjaxUtil.ajaxOperationUrl = submit_data.dse_remote_parent_AjaxURL;
		}
		
		//send the timezone information when remote flow
		if (!submit_data[AjaxUtil.constants.BTT_TIMEZONE]) {
			submit_data[AjaxUtil.constants.BTT_TIMEZONE] = AjaxUtil.getTimzone();
		}
		
		AjaxUtil.xhrPost( {
			headers : {
				'requesttype':'ajax'
			},
			url : submit_data.dse_RemoteSubFlow_URL,  // URL of starting remoteFlow or restoring parent flow
			handleAs : "json",
			success : dojo.hitch(this, this._handleFormResponse, undefined),
			error : dojo.hitch(this, this._handleError)
		}, submit_data);
		 
		return false;
	},

	renderSubPageHandler : function(data) {
		if(dijit._masterTT_BTT && dijit._masterTT_BTT.aroundNode)//defect 29891
			dijit.hiddenBTTTooltip(dijit._masterTT_BTT.aroundNode);
		this._getCover().show();

		for ( var i = 0; i < data.data.length; i++) {
			var divId = data.data[i].divId;
			var node = this._getNodeByContainerId(data.data[i].divId);
			if (!node) {
				return;
			}
			this.clearRules(data.data[i].divId);
			this._disposeAllWidgets(node);
			node.innerHTML = data.data[i].page;
			// defect 30648 -start
			dojo.parser.parse(node, {noStart:true});
			dojo.query("[widgetid]", node).forEach(function(node){
				var widget = node.getAttribute && dijit.byId(node.getAttribute("widgetid"));
				if(widget && dojo.isFunction(widget.startup) && !widget._started) {
					widget.startup();
				}
			});
			// defect 30648 -end
			if(data.data[i]["page_name"]){
				dojo.query("script", node).forEach(dojo.hitch(this, function(script) {
					if (script.src && this.isECARuleFile(script.src, data.data[i]["page_name"])) {
						this._registerECAEvent(data.data[i]["page_name"], script.src, data.data[i].divId);
					}
				}));
			}
			this.onLoad(data, node);
		}
	},
	
	//hanlder for print state
	printHandler : function(data){
		var tmpData = dojo.fromJson(data.page);
		var bttParam = dojo.fromJson(tmpData.bttParams);
		delete tmpData.bttParams;
		var result = document.printApplet.printToDevice(dojo.toJson(tmpData));
		if(result === true || result === "true"){
			bttParam["dse_nextEventName"] = "success";
		} else {
			//alert(result);
			bttParam["dse_nextEventName"] = "error";
		}
		this._submitData(bttParam);
	},
	
	destroy : function(){
		this.inherited(arguments);
		this._commandMap = undefined;
		// this._destroyContentPane();
		// this._destroyDialog();
		this._disposeAllWidgets();
		this._destroyCover();
	}
});

var Engine = {};

Engine.getInstance = function() {
	if(!Engine._instance){
		Engine._instance = new com.ibm.btt.event.NavigationEngine();
	}
	return Engine._instance;
};

Engine.setInstance = function(engine) {
	Engine._instance = engine;
};

}

if(!dojo._hasResource["com.ibm.btt.event.BaseMonitor"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.event.BaseMonitor"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.event.BaseMonitor");


dojo.declare("com.ibm.btt.event.BaseMonitor", null,{
	
	oldEvent : null,

	
	monitorEvent : function( event, rule){
	   
    },
    
	    
    monitorStartRule : function( event, rule){
    		  
    },
    
    monitorEndRule : function( event, rule){
    	
    },

	 
	monitorCondition : function (event, rule, result){
				
	},
	
	monitorStartAG : function (rule){
		  
    },
    
    monitorEndAG : function (rule){
    	
    },
	 
	monitorAGCondition : function (rule, result){
				
	},
	
	monitorCallFunctionAction: function(id, functionName, parameter){
		
	},
	
	monitorGetPropertyAction: function (id, property, value){
	  
	},
	
	monitorSetPropertyAction: function (id, property, value){
		
	}
	
	
});

}

if(!dojo._hasResource["com.ibm.btt.event.ConsoleMonitor"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.event.ConsoleMonitor"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.event.ConsoleMonitor");



dojo.declare("com.ibm.btt.event.ConsoleMonitor", com.ibm.btt.event.BaseMonitor,{
	 

   
    monitorStartRule : function( event, rule){
    	console.debug("Start Rule : " + (rule.name ? "[" +  rule.name + "]" : ""), rule,"  for event ", event.id+"."+event.e);
  	  
    },
    
    monitorEndRule : function( event, rule){
    	console.debug("End Rule : " + (rule.name ? "[" + rule.name + "]" : ""), rule,"  for event ", event.id+"."+event.e);
    },

	 
	monitorCondition : function (event, rule, result){
		console.debug("    Evaluated Condition : Condition =", rule.cond, ",  Result="+result );
		
	},
	
	monitorStartAG : function (rule){
		console.debug("Start Action Group : " + rule.name, rule);
    },
    
    monitorEndAG : function (rule){
    	console.debug("End Action Group : " + rule.name, rule);
    },
	 
	monitorAGCondition : function (rule, result){
    	console.debug("    Evaluated Condition : Condition =", rule.cond, ",  Result=" + result );		
	},
	
	monitorCallFunctionAction: function(id, functionName, args, result){
		if (typeof (result) != "undefined" && result != null)
			console.debug("    CallFunction Action : ", id+"."+functionName , " , args=",args, ", result=",result);
		else 
			console.debug("    CallFunction Action : ", id+"."+functionName , " , args=",args);
	},
	
	monitorGetPropertyAction: function (id, property, value){	   
		console.debug("    GetProperty Action : ", id+"."+property+"=="+value );
	},
	
	monitorSetPropertyAction: function (id, property, value){
		console.debug("    SetProperty Action : ", id+"."+property+"="+value );
	}
	
	
	
});

}

if(!dojo._hasResource["com.ibm.btt.store.DataSource"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.store.DataSource"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.store.DataSource"); 





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

}

if(!dojo._hasResource["com.ibm.btt.util.GlobalFunctions"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.util.GlobalFunctions"] = true;
dojo.provide("com.ibm.btt.util.GlobalFunctions");




/*
 * Licensed Materials - Property of IBM Restricted Materials of IBM 5724-H82 (C)
 * Copyright IBM Corp.2011 All Rights Reserved. US Government Users Restricted
 * Rights - Use, duplication or disclosure restricted by GSA ADP Schedule
 * Contract with IBM Corp
 */

(function() {

	/**
	 * Util Functions For Internal Use Only
	 */

	function isNull(obj) {
		return typeof (obj) == "undefined" || obj == null ? true : false;
	}

	function isNumber(obj) {
		if ((obj.constructor === Number && !isFinite(obj) && !isNaN(obj))
				|| /^[-+]?\d+$|^[-+]?\d+\.\d+$/.test(obj)) {
			return true;
		} else {
			return false;
		}
	}

	function toNumber(obj) {
		if (obj.constructor === Number) {
			return obj;
		} else {
			return Number(obj);
		}
	}

	function isDate(obj) {
		if (obj.constructor === Date) {
			return true;
		} else {
			return false;
		}
	}

	var bttString = {
		
		getI18NString : function(arg){
			return I18nUtil.getI18nString(arg);
		},	
			
		/**
		 * Functions for string type
		 */

		/*
		 * returns the length of a string
		 */
		length : function(str) {
			return isNull(str) ? undefined : str.toString().length;
		},

		/*
		 * returns a portion of a string
		 */
		subString : function(str, start, end) {
			if (!isNull(str) && isNumber(start) && isNumber(end)) {
				start = toNumber(start);
				end = toNumber(end);
				if (start > end || start < 0 || end > str.toString().length) {
					return undefined;
				} else {
					return str.toString().substring(start, end);
				}
			} else {
				return undefined;
			}
		},

		/*
		 * returns the position of a substring
		 */
		indexOf : function(str, substr) {
			return isNull(str) || isNull(substr) ? undefined : str.toString()
					.indexOf(substr.toString());
		},

		/*
		 * returns the position of a substring starting from the end
		 */
		lastIndexOf : function(str, substr) {
			return isNull(str) || isNull(substr) ? undefined : str.toString()
					.lastIndexOf(substr.toString());
		},

		/*
		 * returns whether a substring is part of a string
		 */
		contains : function(str, str2) {
			if (isNull(str) || isNull(str2)) {
				return false;
			} else {
				return this.indexOf(str.toString(), str2.toString()) > -1 ? true
						: false;
			}
		},

		/*
		 * replaces all occurrences of a substring in a string with a new value
		 */
		replace : function(source, str1, str2) {
			return !isNull(source) && !isNull(str1) && !isNull(str1) ? source
					.toString().replace(new RegExp(str1.toString(), "g"),
							str2.toString()) : source;
		},

		/*
		 * remove leading and trailing blanks
		 */
		trim : function(str) {
			return isNull(str) ? undefined : str.toString().replace(
					/^(\s|\u00A0)+/, '').replace(/(\s|\u00A0)+$/, '');
		},

		/*
		 * string concatenation
		 */
		concat : function(str1, str2) {
			if (isNull(str1) && isNull(str2)) {
				return undefined;
			} else if (isNull(str1)) {
				return str2.toString();
			} else if (isNull(str2)) {
				return str1.toString();
			} else {
				return str1.toString().concat(str2.toString());
			}
		},

		/*
		 * converts to upper case
		 */
		upperCase : function(str) {
			return isNull(str) ? undefined : str.toString().toUpperCase();
		},

		/*
		 * converts to lower case
		 */
		lowerCase : function(str) {
			return isNull(str) ? undefined : str.toString().toLowerCase();
		},

		/*
		 * compares two strings
		 */
		compare : function(str1, str2) {
			if (isNull(str1) || isNull(str2)) {
				return undefined;
			}
			if (str1.toString() > str2.toString()) {
				return 1;
			} else if (str1.toString() < str2.toString()) {
				return -1
			} else {
				return 0;
			}
		},

		/*
		 * compares ignoring case
		 */
		compareIgnoreCase : function(str1, str2) {
			return isNull(str1) || isNull(str2) ? undefined : str1.toString()
					.toUpperCase().localeCompare(str2.toString().toUpperCase());
		}
	};

	var bttDate = {
		/**
		 * functions for date type
		 */

		/*
		 * returns current date
		 */
		today : function() {
			return new Date();
		},

		/*
		 * adds days / months / years to a date
		 */
		after : function(date, days, months, years) {
			if (isNull(date) || !isDate(date)) {
				return undefined;
			}
			if (!isNull(days) && isNumber(days)) {
				date.setDate(date.getDate() + toNumber(days));
			}
			if (!isNull(months) && isNumber(months)) {
				date.setMonth(date.getMonth() + toNumber(months));
			}
			if (!isNull(years) && isNumber(years)) {
				date.setFullYear(date.getFullYear() + toNumber(years));
			}
			return date;
		},

		/*
		 * same as after, but substracting
		 */
		before : function(date, days, months, years) {
			if (isNull(date) || !isDate(date)) {
				return undefined;
			}
			if (!isNull(days) && isNumber(days)) {
				date.setDate(date.getDate() - toNumber(days));
			}
			if (!isNull(months) && isNumber(months)) {
				date.setMonth(date.getMonth() - toNumber(months));
			}
			if (!isNull(years) && isNumber(years)) {
				date.setFullYear(date.getFullYear() - toNumber(years));
			}
			return date;
		},

		/*
		 * compares two dates
		 */
		daysBetween : function(date1, date2) {
			if (isNull(date1) || isNull(date2) || !isDate(date1)
					|| !isDate(date2)) {
				return undefined;
			}
			var difference = Date.UTC(date1.getFullYear(), date1
					.getMonth(), date1.getDate(), date1.getHours(),
					date1.getMinutes(), date1.getSeconds(), date1
							.getMilliseconds())
					- Date.UTC(date2.getFullYear(), date2.getMonth(),
							date2.getDate(), date2.getHours(), date2
									.getMinutes(), date2.getSeconds(),
							date2.getMilliseconds());
			return difference / (1000 * 60 * 60 * 24);
		},

		naturalDaysBetween : function(date1, date2) {
			if (isNull(date1) || isNull(date2) || !isDate(date1)
					|| !isDate(date2)) {
				return undefined;
			}
			var difference = Date.UTC(date1.getFullYear(), date1
					.getMonth(), date1.getDate(), 0, 0, 0, 0)
					- Date.UTC(date2.getFullYear(), date2.getMonth(),
							date2.getDate(), 0, 0, 0, 0);
			return difference / (1000 * 60 * 60 * 24);
		},

		/*
		 * returns the week day of a date
		 */
		dayOfWeek : function(date) {
			if (isNull(date) || !isDate(date)) {
				return undefined;
			}
			return date.getDay();
		},

		/*
		 * returns the year of a date
		 */
		year : function(date) {
			if (isNull(date) || !isDate(date)) {
				return undefined;
			}
			return date.getFullYear();
		},

		/*
		 * returns the month of a date
		 */
		month : function(date) {
			if (isNull(date) || !isDate(date)) {
				return undefined;
			}
			return date.getMonth();
		},

		/*
		 * returns the day of the month
		 */
		day : function(date) {
			if (isNull(date) || !isDate(date)) {
				return undefined;
			}
			return date.getDate();
		},
		
		/*
		 * This function is used to convert this string data to an object. The second parameter is optional.
		 * If the second parameter is defined we will use this pattern to parse the data. If this pattern is not defined
		 * the format of the date should follow the ISO standard like 2011-12-15.
		 */
		parseDate : function(obj, pattern) {
			if(pattern){
				var options = {};
				options.formatLength = 'long';
				options.datePattern = pattern;
				options.selector = 'date';
				try{
					var tmpValue = dojo.date.locale.parse(obj, options);
					if(tmpValue != null){
						return tmpValue;
					}else{
						return undefined;
					}
				}catch(ee){
					return undefined;
				}
						
			}else{
				if (isNull(obj) || !(/^\d{4}-\d{2}-\d{2}$/.test(obj.toString()))) {
					return undefined;
				}
				return new Date(obj);	
			}
		},
		
		toString : function(obj) {
			if (isNull(obj) || !isDate(obj)) {
				return undefined;
			}
			var month = obj.getMonth() + 1;
			if (month < 10) {
				month = "0" + month;
			}
			var day = obj.getDate();
			if (day < 10) {
				day = "0" + day;
			}
			return obj.getFullYear() + "-" + month + "-" + day;
		}
		
	};

	var bttNumber = {
		/**
		 * Functions for number type
		 */

		/*
		 * returns the rounding of a decimal value
		 */
		round : function(num) {
			if (isNull(num) || !isNumber(num)) {
				return undefined;
			}
			return Math.round(num);
		},

		/*
		 * returns the truncation of a decimal value
		 */
		truncate : function(num, flag) {
			if (isNull(num) || !isNumber(num)) {
				return undefined;
			}
			if (flag) {
				return Math.ceil(num);
			} else {
				return Math.floor(num);
			}
		},

		/*
		 * returns the absolute value of a value
		 */
		absolute : function(num) {
			if (isNull(num) || !isNumber(num)) {
				return undefined;
			}
			return Math.abs(num);
		}
	};
	
	/**
	 * Functions for HTML Dom node
	 */
	var bttDomFuncs = {
			/**
			 * Function:
			 * 	add a class to a dom node or a widget by its ID
			 * Parameter:
			 * 	id , String, the ID of the dom node or widget
			 * 	cName, String, the class name
			 */
			addClass : function (id, cName) {
				var node = id;
				var wt = dijit.byId(id);
				if (wt){
					node = wt.domNode;
				}
				dojo.addClass(node, cName);
			},
			
			/**
			 * Function:
			 * 	remove a class from a dom node or a widget by its ID
			 * Parameter:
			 * 	id , String, the ID of the dom node or widget
			 * 	cName, String, the class name
			 */
			removeClass : function (id, cName) {
				var node = id;
				var wt = dijit.byId(id);
				if (wt){
					node = wt.domNode;
				}
				dojo.removeClass(node, cName);
			},
			
			/**
			 * Function:
			 * 	set the visibility for a dom node or a widget by its ID
			 * Parameter:
			 * 	id ,String, the ID of the dom node or widget
			 * 	value,String, the value of the visibility, its available value includes:
			 * 		gone: 	is equivalent to "display:none" in CSS
			 * 		hidden: is equivalent to "visibility:hidden" in CSS
			 * 		visible:is equivalent to "visibility:inherit" in CSS
			 */
			setVisibility : function (id, value) {
				var node = id;
				var wt = dijit.byId(id);
				if (wt){
					if (wt._setVisibilityAttr){
						return wt._setVisibilityAttr(value);
					}
					node = wt.domNode;
				}
				
				var d = "";
				var v = "inherit";
				switch (value){
				case "gone":
					d = "none";
					v = "inherit";
					break;
				case "hidden":
					d = "";
					v = "hidden";
					break;
//				case "visible": // strongly recommend not using this value directly
//					d = "";
//					v = "visible";
//					break;
				default:
					d = "";
					v = "inherit";
				}
				
				dojo.style(node, "display", d);
				dojo.style(node, "visibility", v);
			}
	};
	
	var bttUtil = {
			
		equals : function(arg1, arg2){
			if(arg1 && arg2 && arg1 instanceof Date && arg2 instanceof Date){
				return dojo.date.compare(arg1, arg2, "date") == 0;
			} else {
				return arg1 == arg2;
			}
		}
	
	};
	
	
	
	window.BTTStringFunctions = bttString;
	window.BTTDateFunctions = bttDate;
	window.BTTNumberFunctions = bttNumber;
	window.BTTDomFunctions = bttDomFuncs;
	window.BTTUtil = bttUtil;
	
})();

}

if(!dojo._hasResource["com.ibm.btt.dijit.RepetitivePanel"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.RepetitivePanel"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2013 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.RepetitivePanel"); 




dojo.declare("com.ibm.btt.dijit.RepetitivePanel", [dijit._Widget,com.ibm.btt.dijit.AbstractWidgetMixin,
                                                   com.ibm.btt.dijit.AbstractWidgetSizeMixin],{

	_panelDomList : null,
	
	_visibilityList : null,
	
	_currentPanelIndex : -1,
	
	dataNameForRow: "",
	
	selectionMode: "none",
	
	selectionRowIndex: -1,
	
	_events : [],
	
	postCreate : function(){
		this._panelDomList = [];
		this._visibilityList = [];
		this._events = [];
		var _this = this;
		dojo.query("> div.innerPane", this.domNode).forEach(function(node){
			// attach event handling for "onclick" and "onkeydonw" for each panel
			_this._events.push(dojo.connect(node, "onclick", dojo.hitch(_this, _this._onRowClick, node)));
			_this._events.push(dojo.connect(node, "onkeydown", dojo.hitch(_this, _this._onRowKeyDown, node)));
			// _this._visibilityList.push("visible");
			_this._visibilityList.push("inherit");
			 var tableNodeList = dojo.query("> table", node);
			 if(tableNodeList.length > 0) {
				 _this._panelDomList.push(tableNodeList[0]);
			 } else {
				 var divNodeList = dojo.query("> div.BTTTableStyle", node);
				 if(divNodeList.length > 0) {
					 _this._panelDomList.push(divNodeList[0]);
				 }
			 }
		});
		this.containerNode = this.domNode;
	},
	
	_getSizeAttr : function() {
		return this._panelDomList.length;
	}, 
	
	setVisibility : function(idx, vis) {
		if(this._panelDomList.length <= idx) 
			console.errer("Out of size of the repetitive panel");
		var d = "";
		var v = "inherit";
		switch (vis){
		case "gone":
			d = "none";
			v = "inherit";
			break;
		case "hidden":
			d = "";
			v = "hidden";
			break;
//		case "visible": // strongly recommend not using this value directly
//			d = "";
//			v = "visible";
//			break;
		default:
			vis = "inherit";
			d = "";
			v = "inherit";
		}
		
		this._visibilityList[idx] = vis;

		dojo.style(this._panelDomList[idx], "display", d);
		dojo.style(this._panelDomList[idx], "visibility", v);
	},
	
	getVisibility : function(idx) {
		if(this._panelDomList.length <= idx)
			console.errer("Out of size of the repetitive panel");
		
		var v = this._visibilityList[idx]; // gone, hidden, visible and inherit

		if (v == "inherit"){	// compute the inherited value
			var node = this._panelDomList[idx];
			if (node.offsetWidth<1 || node.offsetHeight<1){
				v = "gone";
			}else{
				v = dojo.style(node, "visibility")=="hidden"?"hidden":"visible";
			}
		}
		
		return v;
	},
	
	setStyleClass : function(idx, cls) {
		if(this._panelDomList.length <= idx)
			console.errer("Out of size of the repetitive panel");
		dojo.removeClass(this._panelDomList[idx]);
		dojo.addClass(this._panelDomList[idx], cls);
	},
	
	hasStyleClass : function(idx, cls) {
		if(this._panelDomList.length <= idx)
			console.errer("Out of size of the repetitive panel");
		return dojo.hasClass(this._panelDomList[idx], cls);
		
	},
	
	getCurrentPanelIndex : function() {
		return this._currentPanelIndex;
	},
	
	setCurrentPanelIndex : function(index) {
		this._currentPanelIndex = index;
	},
	
	/**
	 * Handle action when mouse click on panel:
	 * 	1. update selection style on panel
	 *  2. update selection row index
	 * @param node
	 * @param e
	 */
	_onRowClick : function(node, e) {
		if(this.selectionMode == "single") {
			this._updateSelection(node);
		}
	},
	
	/**
	 * Handle action when space key press on panel
	 * 	1. update selection style on panel
	 *  2. update selection row index
	 * @param node
	 * @param e
	 */
	_onRowKeyDown : function(node, e){
		if(this.selectionMode == "single" && (e.keyCode==dojo.keys.SPACE || e.keyCode==dojo.keys.ENTER)){
			this._updateSelection(node);
		}
	},
	
	/**
	 * Update selection row index
	 * Remove "BTTRepetitiveSelectedRow" from previous selected panel, and set it to current selected panel
	 * @param node
	 */
	_updateSelection : function(node) {
		var preSelection = this.selectionRowIndex;
		
		// update selected row index
		var restRowNodeList = dojo.query("~ div.innerPane", node);
		this.selectionRowIndex = this._panelDomList.length - restRowNodeList.length - 1;
		
		// update style
		if(preSelection != -1 && this.selectionRowIndex != preSelection) {
			var allPanelNodes = dojo.query("> div.innerPane", this.domNode);
				if(preSelection <= allPanelNodes.length) {
					dojo.removeClass(allPanelNodes[preSelection], "BTTRepePanelSelectedRow");
				}
		}
		if(this.selectionRowIndex != preSelection) {
			dojo.addClass(node, "BTTRepePanelSelectedRow");
		}
	},
	
	_findInitiator : function(){
		var src = null;
		var callee = arguments.callee;
		for (var c=0; callee && c++<50; callee=callee.caller){
			var evt = null;
			for(var i=0; i<callee.arguments.length && i<8; i++){
				evt = callee.arguments[i];
				if(evt && (evt.type=="submit" || evt.type=="click" || (evt.type=="keydown" && (evt.keyCode==dojo.keys.SPACE || evt.keyCode==dojo.keys.ENTER)))){
					src = evt.target;
					break;
				}
			}
		}
		var srcPanel = null;
		while(src){
			if(dojo.hasClass(src, "innerPane")){
				srcPanel = src;
				break;
			}
			src = src.parentNode;
		}
		return srcPanel;
	},

	/**
	 * When form submit, create a dynamic hidden widget to submit the selected row index to server
	 */
	onFormSubmit : function(){

		if(this.selectionMode == "single") {
			var node = this._findInitiator();
			if(node){
				this._updateSelection(node);
			}
		}

		if(this.dataNameForRow && this.selectionMode == "single"){
			this._tmpInput = com.ibm.btt.dijit.Hidden({
				name : this.dataNameForRow,
				value : this.selectionRowIndex
			});
			dojo.place(this._tmpInput.domNode, this.domNode, "after");
		}
	},
	
	destroy: function(/*Boolean*/ preserveDom){
		this._beingDestroyed = true;
		
		//release all connections
		while (this._events && this._events.length > 0) {
			try{
				dojo.disconnect(this._events.pop());
			}catch(e){}
		}
		this._events = undefined;
		
		// Recursively destroy the children of this widget and their descendants
		// this.containerNode = this.domNode;
		this.destroyDescendants(preserveDom);
		
		this.inherited(arguments);
	}
	
});

}

if(!dojo._hasResource["com.ibm.btt.dijit.Keyboard"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.Keyboard"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Keyboard"); 
dojo.getObject("com.ibm.btt.dijit.keyboards", true); 


 
 

dojo.declare("com.ibm.btt.dijit.Keyboard",[dijit._Widget,dijit._Templated,com.ibm.btt.dijit.AbstractWidgetMixin] ,{ 
	
	templateString: dojo.cache("com.ibm.btt.dijit", "templates/Keyboard.html", "<table class=\"dijit keyboard\" style=\"display:none;\" cellspacing=\"5\" cellpadding=\"0\">\r\n\t<tr>\r\n\t\t<td><div class=\"cell\" dojoAttachPoint=\"key0\">7</div></td>\r\n\t\t<td><div class=\"cell\" dojoAttachPoint=\"key1\">8</div></td>\r\n\t\t<td><div class=\"cell\" dojoAttachPoint=\"key2\">9</div></td>\r\n\t\t<td><div class=\"cell\" dojoAttachPoint=\"key3\">+</div></td>\r\n\t</tr>\r\n\t<tr>\r\n\t\t<td><div class=\"cell\" dojoAttachPoint=\"key4\">4</div></td>\r\n\t\t<td><div class=\"cell\" dojoAttachPoint=\"key5\">5</div></td>\r\n\t\t<td><div class=\"cell\" dojoAttachPoint=\"key6\">6</div></td>\r\n\t\t<td><div class=\"cell \" dojoAttachPoint=\"key7\">-</div></td>\r\n\t</tr>\r\n\t<tr>\r\n\t\t<td><div class=\"cell\" class=\"cell\" dojoAttachPoint=\"key8\">1</div></td>\r\n\t\t<td><div class=\"cell\" class=\"cell\" dojoAttachPoint=\"key9\">2</div></td>\r\n\t\t<td><div class=\"cell\" class=\"cell\" dojoAttachPoint=\"key10\">3</div></td>\r\n\t\t<td><div class=\"cell\" class=\"cell\" dojoAttachPoint=\"key11\">Back</div></td>\r\n\t</tr>\r\n\t<tr>\r\n\t\t<td><div class=\"cell\" dojoAttachPoint=\"key12\">*</div></td>\r\n\t\t<td><div class=\"cell\" dojoAttachPoint=\"key13\">0</div></td>\r\n\t\t<td><div class=\"cell\" dojoAttachPoint=\"key14\">.</div></td>\r\n\t\t<td><div class=\"cell enterKey\" dojoAttachPoint=\"key15\">Enter</div></td>\r\n\t</tr>\r\n</table>\r\n"),
	
	_keys : null,
	
	_evts : [],
	
	dynamicKeys : false,
	
	postCreate : function() {

		this._initKeys();

		if (!com.ibm.btt.dijit.keyboards.instances) {
			com.ibm.btt.dijit.keyboards.instances = [];
		}
		com.ibm.btt.dijit.keyboards.instances.push(this);
		
	},
	
	refWidget : "",
	
	_getRefWidgetAttr : function(value){
		this.refWidget = value;
		//logic
	},
	
	_initKeys : function(){
		
		this._keys = ["7", "8", "9", "+", "4", "5", "6", "-", "1", "2", "3", "*", "0", "."];
		
		for ( var i = 0; i < 16; i++) {
			this._evts.push(dojo.connect(this["key"+i], "onmousedown", this, dojo.hitch(this, this._onMouseDown, this["key"+i])));
			this._evts.push(dojo.connect(this["key"+i], "onmouseup", this, dojo.hitch(this, this._onMouseUp, this["key"+i])));
			this._evts.push(dojo.connect(this["key"+i], "onmouseover", this, dojo.hitch(this, this._onMouseOver, this["key"+i])));
			this._evts.push(dojo.connect(this["key"+i], "onmouseout", this, dojo.hitch(this, this._onMouseOut, this["key"+i])));
		}
		
		for ( var i = 0; i < 15; i++) {
			if (i == 11) {
				continue;
			}
			var num;
			if (this.dynamicKeys) {
				num = parseInt(Math.random() * this._keys.length); 
			} else {
				num = 0;
			}
			this["key" + i].innerHTML = this._keys[num];
			this._evts.push(dojo.connect(this["key" + i], "onclick", this, dojo.hitch(this, this._onCellClick, this._keys[num], this["key" + i])));
			this._keys.splice(num, 1);
		}
		
		this._evts.push(dojo.connect(this["key11"], "onclick", this, dojo.hitch(this, this._onBackClicked, this["key"+i])));
		this._evts.push(dojo.connect(this["key15"], "onclick", this, dojo.hitch(this, this._onEnterClicked, this["key"+i])));

		this._evts.push(dojo.connect(this.domNode, "onclick", this, this._onKeyboardClicked));
		
	},
	
	_onCellClick : function(key, node){
		if (this.refWidget) {
			var refWidget = dijit.byId(this.refWidget);
			refWidget.set("value", refWidget.get("value") + key);
		}
	},
	
	_onBackClicked : function(node){
		
		if (this.refWidget) {
			var refWidget = dijit.byId(this.refWidget);
			var value = refWidget.get("value").toString();
			refWidget.set("value",  value.substr(0, value.length-1));
		}
	},
	
	_onEnterClicked : function(node){
		this.hide();
	},
	
	show : function(){
		if (!this.refWidget) {
			return;
		}
		var refWidget = dijit.byId(this.refWidget);
		var aroundNode = refWidget.domNode;
		var pos = dijit.placeOnScreenAroundElement(this.domNode, aroundNode, dijit.getPopupAroundAlignment(dijit.Tooltip.defaultPosition));
		dojo.style(this.domNode, "display", "");
		this._focusRefWidget();
	},
	
	hide : function(){
		dojo.style(this.domNode, "display", "none");
		this._focusRefWidget();
	},
	
	_onKeyboardClicked : function(){
		this._focusRefWidget();
	},
	
	_focusRefWidget : function(){
		if (this.refWidget) {
			var refWidget = dijit.byId(this.refWidget);
			refWidget.focus();
		}
	},
	
	_onMouseDown : function(node){
		dojo.addClass(node, "active");
	},
	
	_onMouseUp : function(node){
		dojo.removeClass(node, "active");
	},
	
	_onMouseOver : function(node){
		if (!dojo.hasClass(node, "hovered")) {
			dojo.addClass(node, "hovered");
		}
	},
	
	_onMouseOut : function(node){
		dojo.removeClass(node, "hovered");
	}
	
}); 

}

if(!dojo._hasResource["com.ibm.btt.dijit.TitlePane"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["com.ibm.btt.dijit.TitlePane"] = true;
/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.TitlePane"); 




dojo.declare("com.ibm.btt.dijit.TitlePane", [dijit.TitlePane, 
                                               com.ibm.btt.dijit.AbstractWidgetMixin],{
	
	/**
	 * 
	 * hook set method for title attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setTitleAttr : function(value){
		this.titleKey = value;
		var _title = this.getI18NString(value);
		this._set("title", _title);
		this.titleNode.innerHTML = _title;
	},
	
	/**
	 * 
	 * hook get method for title attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_getTitleAttr : function() {
		return this.titleKey;
	}
	
}); 
	

}

