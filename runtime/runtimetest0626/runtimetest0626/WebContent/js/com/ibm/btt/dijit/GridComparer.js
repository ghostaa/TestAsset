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
			var date1 = _date1 ? _date1 : str1;
			var date2 = _date2 ? _date2 : str2;
			return dojo.date.compare(date1, date2);
		};
	}
});
(function(){
	if( com.ibm.btt.dijit.GridComparer.instance == undefined ){
		com.ibm.btt.dijit.GridComparer.instance = new com.ibm.btt.dijit.GridComparer();	
	}
})();
