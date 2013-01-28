/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.DateTextBox");

dojo.require("dijit.form.DateTextBox");
dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("com.ibm.btt.dijit.ValidationTextBox");

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
			if(srcNodeRef.value!=null && srcNodeRef.value!="" &&  params.pattern!=null && params.pattern!=""){
				try{
					var option = {
						selector:"date",
						datePattern:params.pattern,
						fullYear:true
					};
					var val = dojo.date.locale.parse(srcNodeRef.value,option);
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