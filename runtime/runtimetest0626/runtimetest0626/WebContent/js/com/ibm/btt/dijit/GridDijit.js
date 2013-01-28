/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.GridDijit"); 

dojo.require("dojox.grid.cells.dijit");
dojo.require("com.ibm.btt.dijit.DateTextBox");
dojo.require("com.ibm.btt.dijit.CurrencyTextBox");
dojo.require("com.ibm.btt.dijit.NumberTextBox");
dojo.require("com.ibm.btt.dijit.CheckBox");
dojo.require("com.ibm.btt.dijit.StringTextBox");
dojo.require("com.ibm.btt.dijit.ComboBox");
dojo.require("com.ibm.btt.dijit.Select");

/**
 * BTT base cell widget
 * - hooks the validate related logic for form submit button validation.
 */
dojo.declare("dojox.btt.grid.cells.BaseCellWidget",dojox.grid.cells._Widget,{
		

	constructor : function(){
		if(!this.widget) {
			this.widget = this.createWidget(dojo.create('div'), "");
		}
	},
	
	createWidget: function(inNode, inDatum, inRowIndex){
		var widget = this.inherited(arguments);
		var _this = this;
		widget.watch("state", function(attr, oldVal, newVal){
			_this.grid._set("state", _this.grid._getState());
			
		});
		return widget;
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
	}
	
});


dojo.declare("dojox.btt.grid.cells.Label", dojox.btt.grid.cells.BaseCellWidget, {

	formatter : function(inData) {
		return I18nUtil.getI18nString(inData);
	}	
	
});

dojo.declare("dojox.btt.grid.cells.DateTextBox", dojox.btt.grid.cells.BaseCellWidget, {

	widgetClass: com.ibm.btt.dijit.DateTextBox,

	formatter : function(inData) {

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
	},

	formatNode : function(inRowIndex, inValue){
		this.inherited(arguments);
		//this.widget.set("value", null);
		this.setValue(inRowIndex, inValue);
	}

});


dojo.declare("dojox.btt.grid.cells.CurrencyTextBox", dojox.btt.grid.cells.BaseCellWidget, {
	
	widgetClass: com.ibm.btt.dijit.CurrencyTextBox,
	
	formatter : function(inData) {
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
	
	formatter : function(inData) {
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

		if(inValue && this.widget){
			if( inValue.toString() == this.widget.checkedValue.toString() ) {
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
	
	formatter : function(inData) {
		return I18nUtil.getI18nString(inData);
	}
	
});

dojo.declare("dojox.btt.grid.cells.ComboBox", dojox.btt.grid.cells.BaseCellWidget, {

	widgetClass: com.ibm.btt.dijit.ComboBox,

	getValue: function(){
		var e = this.widget;
		// make sure to apply the displayed value
		e.attr('displayedValue', e.attr('displayedValue'));
		return e.attr('value');
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

	formatter : function(inData) {
		
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
			return item.label[0];
		}else{
			return inData;
		}
	}
});

dojo.declare("dojox.btt.grid.cells.Image", dojox.btt.grid.cells.BaseCellWidget, {
	
	widgetClass: com.ibm.btt.dijit.Image,
	
	formatter : function(inData) {
		var html = '<img src="' + inData + '"';
		
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
	
	formatter : function(inData) {
		if (this.storeData && this.storeData[inData]) {
			return '<label>' + I18nUtil.getI18nString(this.storeData[inData]) + '</label>';
		} else if (inData && inData === null && inData === "null") {
			return "";
		} else {
			return '<label>' + inData + '</label>';
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
	
	_openLink : function(url, extParam)
	{
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
	
	formatter : function(inData, rowIndex) {
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

		var rowd = this.grid.getItem(rowIndex);

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
				return "<img " + srcAttr + (clickable ? "":" style = \"filter:Alpha(opacity=10);-moz-opacity:.1;opacity:0.1;\" " ) + titleAttr + " />";
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
			os += ">" + atag.ih + "</" + atag.tn + ">";		
			return os;
		}
	}
});

dojo.declare("dojox.btt.grid.cells.Button", [dojox.btt.grid.cells.BaseCellWidget, dojox.btt.grid.cells._LinkMixin], {

	_tagartTagName : "SPAN",
	
	_tagartTagName : {"SPAN":true},
	
	formatter : function(inData, rowIndex) {
	
		// calculate the text
		var text;
		if(this.field && inData) {
			text = inData;
		} else if(this.widgetProps && this.widgetProps.linkText){
			text = this.widgetProps.linkText;
		}
		text = text ? I18nUtil.getI18nString(text) : "";
		
		var rowd = this.grid.getItem(rowIndex);

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
		if(text)
			return "<span class=\"dijit dijitReset dijitInline dijitButton" + clickableClassStr + "\"" + titleAttr +" ><span class=\"dijitReset dijitInline dijitButtonNode\">"
			+ "<div style=\"background: none repeat scroll 0% 0% transparent; -moz-user-select: none;\" class=\"dijitReset dijitStretch dijitButtonContents\">"
			+ "<span class=\"dijitReset dijitInline dijitButtonText\">"
			+ text + "</span></div></span></span>";
		else
			return "";

	}
	
});
