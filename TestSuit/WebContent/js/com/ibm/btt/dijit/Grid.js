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
dojo.require("dojox.html.ellipsis");
dojo.require("com.ibm.btt.util.BTTTooltip");



dojo.declare("com.ibm.btt.dijit.CloseMenuItem", dijit.MenuItem, {
	templateString: dojo.cache("com.ibm.btt.dijit", "templates/CloseMenuItem.html"),
	
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
	
	templateString: dojo.cache("com.ibm.btt.dijit","templates/Grid.html"),
	
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

