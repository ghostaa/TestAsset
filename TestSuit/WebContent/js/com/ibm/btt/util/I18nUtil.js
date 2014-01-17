/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.util.I18nUtil");
dojo.require("com.ibm.btt.util.I18nBundle");

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
					//dojo.requireLocalization(packageName, bundleName);
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