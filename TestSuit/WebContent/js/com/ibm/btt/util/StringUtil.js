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