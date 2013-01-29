/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure 
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Grid"); 

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("com.ibm.btt.dijit.GridDijit"); 
dojo.require("com.ibm.btt.dijit.QueryReadStore");
dojo.require("dojox.grid.EnhancedGrid");
dojo.require("dojo.data.ItemFileWriteStore");
dojo.require("dojox.grid.enhanced.plugins.Selector");
dojo.require("dojox.grid.enhanced.plugins.IndirectSelection");
dojo.require("dojox.grid.enhanced.plugins.NestedSorting");
dojo.require("dijit.Dialog");


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
	
	templateString: dojo.cache("com.ibm.btt.dijit","templates/Grid.html"),
	
	name : "",
	
	width:"",
	
	storeData : "",
	
	comparatorMap : "",
	
	height : "300",
	
	//editable : false,
	
	sortEnabled: false,
	
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
		
	create : function(){
	
		this._eventHandlers = [];
		this.inherited(arguments);
		
	},
	
	postCreate : function() {
	
		this.inherited(arguments);
			
		if(this.selectable){
			this._eventHandlers.push(dojo.connect(this, "postrender", this, function(){
				//this.checkSelectionNum();
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

		if(this.sortEnabled){
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
			this._set("state", this._getState());
		}));
		
		if (!this.selectionRequired) {
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
		if (this.selectionMode=="single" && !this.selectionRequired) {
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
				
		if (dojo.isIE && dojo.isIE<8)
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
		
		setTimeout(dojo.hitch(this, "render"), 500);
	},
	
	/**
	 * 
	 * hook method to notify celle widget this cell is clicked when this cell is not in edit mode
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_onCellWidgetClick : function(e){
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
			dojo.query(":first-child" ,e.target).forEach(function(node, index, arr){
				node.click();
				return;
			});
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
		var cell;
		for ( var i = 0; i < this.layout.cells.length; i++) {
			if(name == this.layout.cells[i].field){
				var inAttrName;
				cell = this.layout.cells[i];
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
			}
		}
	}, 
	
	getCellValueByName: function(name, inRowIndex){
		var cell;
		for ( var i = 0; i < this.layout.cells.length; i++) {
			if(name == this.layout.cells[i].field){
				cell = this.layout.cells[i];
			}
		}
		if(!cell){
			return undefined;
		}
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
			
			if(cells[i].editable && cells[i].widget) {
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
		(function(obj) {
			if(dojo.isArray(obj)) {
				for(var i = 0; i < obj.length; i++) {
					arguments.callee(obj[i]);
				}
			} else if (dojo.isObject(obj)) {
				if(obj.name) {
					obj.name = scope.getI18NString(obj.name);
				} else if(obj.cells) {
					arguments.callee(obj.cells);
				}
			} 
		})(this.structure);
	},
	
	setStoreData: function(newRows /* array of objects */) {
		var flag = this.store != null;
		this.setStore(new dojo.data.ItemFileWriteStore({data: {items: newRows }, hierarchical : false}));
		if(flag){
			this._setComparatorForColunm();
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
		for ( var i = 0; i < this.structure[0].length; i++) {
			if(this.structure[0][i].type){
				var cell = this.getCellByField(this.structure[0][i].field);
				if(cell.comparator){
					comparatorMap[this.structure[0][i].field] = dojo.hitch(cell, cell.comparator);
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
			
			if(this.name && this.selectable) {
				var cells = this.layout.cells;
				var name = this.name;
				var store = this.store;
				var node = this.domNode;
				var selections = this.selection.getSelected();
				for (var m = 0; m < selections.length; m ++ ) {
					var isSingleSelect = this.selectionMode == "single";
					if(isSingleSelect && m == 1) break;
					var selection = selections[m];
					dojo.forEach(store.getAttributes(selection), function(attribute) {
						var tempObj = {};
						tempObj.type = 'hidden';
						if(isSingleSelect) {
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
	_getValueAttr : function(value) {
		if(this.selectable) {
			//enable multi-selection
			var selections = this.selection.getSelected();
			var cells = this.layout.cells;
			var store = this.store; 
			var tempObjects = [];
			if(selections.length > 0){
				for (var m = 0; m < selections.length; m ++ ) {
					var selection = selections[m];
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
					if(this.selectionMode == "single") {
						return tempObj;
					}
					if(tempObj && tempObj !== ""){
						tempObjects.push(tempObj);
					}
				}
				return tempObjects;
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
		this.visibility = value;
		if (value == "gone") {
			
			var rows = this.get("rowCount");
	 		for ( var i = 0; i < rows; i++) {
				this.doCancelEdit(i);
			}
			
			if(this._firstTimeLoaded){
				this._eventHandlers.push(dojo.connect(this,"startup",dojo.hitch(this,function(){
					dojo.style(this.domNode, "visibility", "visible");
					dojo.style(this.domNode, "display", "none");
				})));	
			}else{
					dojo.style(this.domNode, "visibility", "visible");
					dojo.style(this.domNode, "display", "none");
			}
			
		} else if (value == "hidden") {
			
			var rows = this.get("rowCount");
	 		for ( var i = 0; i < rows; i++) {
				this.doCancelEdit(i);
			}
			
			dojo.style(this.domNode, "display", "");
			dojo.style(this.domNode, "visibility", "hidden");
			
		} else {
			dojo.style(this.domNode, "display", "");
			dojo.style(this.domNode, "visibility", "visible");
			this.update();
		}
		
		this._firstTimeLoaded = false;
	},
	
	/* Deprecated in BTT7.1 release, please use getValueInFirstSelectedItem instead. */
	getValueInSelectedItem : function(attName) {
		return this.getValueInFirstSelectedItem(attName);
	},
	
	getValueInFirstSelectedItem : function(attName) {
		var firstSelectedItem = this.selection.getFirstSelected();
		if(firstSelectedItem) {
			return this.store.getValue(firstSelectedItem, attName);
		} else {
			return null;
		}
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
		
	canSort:function(){
		
		if(this.sortEnabled  && this.disabled == false){			
			return this.inherited(arguments);
			
		}else{			
			return false;
		}
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
	 		console.log("Grid attached events : ", this._attachEvents);
	 		dojo.query('.dojoxGridScrollbox', this.id).forEach(function(node, index, arr){
	 			dojo.style(node, "overflow", "hidden");
	 		});
	 		
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
	 		dojo.query('.dojoxGridScrollbox', this.id).forEach(function(node, index, arr){
	 			dojo.style(node, "overflow", "auto");
	 		});
	 		
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
	
	/**
	 * Override the buildViews function to filter the null rows.
	 */	
	buildViews : function() {
		for(var i=0, vs; (vs=this.layout.structure[i]); i++){
			vs.onBeforeRow = function(inRowIndex, rowCells) {
				if(inRowIndex < 0){
					rowCells[0].hidden = false;
					return;
				}
				var item = this.grid.getItem(inRowIndex);
				if(!item){ return; }
				var cells = this.grid.layout.cells;
				for (var i = 0; i < cells.length; i ++ ) {
					if(this.grid.store.getValue(item , cells[i].field) !== null) {
						rowCells[0].hidden = false;
						return;
					}	
				}
				rowCells[0].hidden = true;
			};
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
	
	showColumn : function(index){
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
		}
		window.setTimeout(dojo.hitch(this, function(){
			this.focusOn();
		}), 100);
	},
	
	hideColumn : function(index){
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
		}
		window.setTimeout(dojo.hitch(this, function(){
			this.focusOn();
		}), 100);
	},
	
	isColumnVisible : function(index){
		if (index > -1 && index < this.layout.cells.length) {
			return !this.layout.cells[index].hidden;
		} else {
			undefined;
		}
	},
	
	destroy : function(){
		
		dojo.forEach(this._eventHandlers, dojo.disconnect);
		
		this._eventHandlers = undefined;
		
		this.inherited(arguments);
		
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
		}
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
		
	}
}); 

