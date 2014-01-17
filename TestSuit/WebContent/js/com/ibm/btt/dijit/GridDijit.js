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
dojo.require("com.ibm.btt.dijit.Label");

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
	




