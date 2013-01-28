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
			 * @key String
			 * @values Object or Array or multiple parameters
			 */
			getI18nString : function(key,values) {
				//assert for "",null,undefined value
				if( ( key === null) || (key === undefined) || ( key === "")){
					return key;
				} 
				var sc1 = "%";
				var sc2 = "/";
				key = key.toString();
				var temp = key.substring(0, 1);
				if (key.substring(0, 1) != sc1) {
					return key;
				} else {
					var sKey = key.replace(sc1, "");
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
			}	
	};
})();