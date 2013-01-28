dojo.provide("com.ibm.btt.util.GlobalFunctions");

dojo.require("dojo.date.locale");
dojo.require("com.ibm.btt.util.AjaxUtil");

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

	window.BTTStringFunctions = bttString;
	window.BTTDateFunctions = bttDate;
	window.BTTNumberFunctions = bttNumber;

})();
