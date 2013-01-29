/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.plugins.Pagination");

dojo.require("dojox.grid.enhanced.plugins.Pagination");

dojo.declare("com.ibm.btt.dijit.plugins.Pagination", dojox.grid.enhanced._Plugin, {
	
	name : "bttpagination",
		
	mode : "simple",
	
	//requestURL : "Ajax",
	
	timeout : 500,
	
	keepSingleSelection : false,
	
	_paginateable : true,
	
	init: function(){
		this._initParams();
		this._createPaginators(this.option);
		this._regApis();
		if (this.initialMode == "client") {
			if (this.mode == "simple") {
				this._requestFirstPage();
			} else {
				this.gotoPage("initial");
			}
		}
	},
	
	_initParams : function(){
		
		var _this = this;
		var fetchParam = function(paramName, defaultValue){
			return _this.option[paramName] != undefined ? _this.option[paramName]
					: (_this.grid[paramName]  != undefined ? _this.grid[paramName] : defaultValue);
		};
		var convertToNumber = function(arg, defaultValue){
			var tmp = Number(arg);
			if(isNaN(tmp)){
				return defaultValue;
			}else{
				return tmp;
			}
		};
		this.mode = fetchParam("mode", this.mode);
		this.timeout = convertToNumber(fetchParam("timeout", this.timeout), this.timeout);
		this.initialMode = fetchParam("initialMode", "server");
		this.totalRowNumber = fetchParam("totalRowNumber", this.totalRowNumber);
		this.rowsPerPage = fetchParam("rowsPerPage", this.rowsPerPage);
		//this.requestURL = fetchParam("requestURL", this.requestURL);
		this.bttParams = fetchParam("bttParams", {});
		if (this.mode == "simple") {
			this._setPageSize(this.totalRowNumber);
			this.defaultRows = fetchParam("defaultRows", 25);
			this._currentPage = 0;
			this.nls = dojo.i18n.getLocalization("dojox.grid.enhanced", "Pagination");
		}
		
		if (this.mode == "nonePageSize") {
			var parseBool = function(arg){
				if (arg == "false") {
					return false;
				} else if (arg == "true") {
					return true;
				} else {
					return arg;
				}
			};
			this.prevBtnEnabled = fetchParam("enablePrevious", false);
			this.prevBtnEnabled = parseBool(this.prevBtnEnabled);
			this.nextBtnEnabled = fetchParam("enableNext", true);
			this.nextBtnEnabled = parseBool(this.nextBtnEnabled);
		}
		
	},
	
	_setPageSize : function(totalRowNum){
		if(typeof(totalRowNum)!= "defined" && totalRowNum != null && totalRowNum!="null"){
			this.totalRowNumber = totalRowNum;
			this._maxSize = this.totalRowNumber;
			this.pageSize = this.rowsPerPage;
			this.totalPageSize = Math.ceil(this.totalRowNumber / this.rowsPerPage);
		}
	},
	
	_createPaginators: function(paginationArgs){
		// summary:
		//		Function to create the pagination control bar.
		this.paginators = [];
		if (this.mode == "simple") {
			if(paginationArgs.position === "both"){
				this.paginators = [
					new com.ibm.btt.dijit.plugins.SimplePaginator(dojo.mixin(paginationArgs, {position: "bottom", plugin: this})),
					new com.ibm.btt.dijit.plugins.SimplePaginator(dojo.mixin(paginationArgs, {position: "top", plugin: this}))
				];
			}else{
				this.paginators = [new com.ibm.btt.dijit.plugins.SimplePaginator(dojo.mixin(paginationArgs, {plugin: this}))];
			}
		} else if (this.mode == "nonePageSize") {
			if(paginationArgs.position === "both"){
				this.paginators = [
					new com.ibm.btt.dijit.plugins.NonePageSizePaginator(dojo.mixin(paginationArgs, {position: "bottom", plugin: this})),
					new com.ibm.btt.dijit.plugins.NonePageSizePaginator(dojo.mixin(paginationArgs, {position: "top", plugin: this}))
				];
			}else{
				this.paginators = [new com.ibm.btt.dijit.plugins.NonePageSizePaginator(dojo.mixin(paginationArgs, {plugin: this}))];
			}
		} else {
			console.error("Unsupport pagination mode, please check the parameter definition.");
		}
		
		
		dojo.forEach(this.paginators, function(f){
			f.update();
		});
	},
	 
	_stopEvent: function(event){
		try{
			dojo.stopEvent(event);
		}catch(e){}
	},
	
	_regApis: function(){
		var g = this.grid;
		g.gotoPage = dojo.hitch(this, this.gotoPage);
		g.nextPage = dojo.hitch(this, this.nextPage);
		g.prevPage = dojo.hitch(this, this.prevPage);
		g.gotoFirstPage = dojo.hitch(this, this.gotoFirstPage);
		g.gotoLastPage = dojo.hitch(this, this.gotoLastPage);
		g.getTotalRowCount = dojo.hitch(this, this.getTotalRowCount);
	},
	
	destroy: function(){
		this.inherited(arguments);
		var g = this.grid;
		try{
			dojo.forEach(this.paginators, function(p){
				p.destroy();
			});
			this.paginators = null;
		}catch(e){
			console.warn("Pagination.destroy() error: ", e);
		}
	},
		
	nextPage : function(e){
		if(this.mode == "simple"){
			this.gotoPage(this._currentPage + 2);
		}
		if(this.mode == "nonePageSize"){
			this.gotoPage("next");
		}
	},
	
	prevPage : function(e){
		if(this.mode == "simple"){
			this.gotoPage(this._currentPage);
		}
		if(this.mode == "nonePageSize"){
			this.gotoPage("prev");
		}
	},
	
	gotoFirstPage : function(e){
		this.gotoPage(1);
	},
	
	gotoLastPage : function(e){
		this.gotoPage(this.totalPageSize);
	},
	
	gotoPage : function(e){
		if(this.grid.edit)  this.grid.edit.apply();
		this.grid.selection.deselectAll();
		if (this._paginateable == true) {
			if (this.mode == "simple" && e >= 1 && e <= this.totalPageSize && e != (this._currentPage + 1)) {
				this._requestPageByNum(e);
				this._paginateable = false;
				dojo.forEach(this.paginators, function(p){
					p.disableBtns();
				});
			} 
			if (this.mode == "nonePageSize"
				&& ((e == "initial") || (e == "next" && this.nextBtnEnabled) || (e == "prev" && this.prevBtnEnabled)) && e != (this._currentPage + 1)) {
				this._fetchData({
					"pageRequest.pageEvent" : e,
					"mode" : this.mode
				});
				this._paginateable = false;
				dojo.forEach(this.paginators, function(p){
					p.disableBtns();
				});
			}
		}
	},
	
	_requestPageByNum : function(e){
		this._fetchData({
			"pageRequest.pageEvent" : "page",
			"pageRequest.pageNumber" : e,
			"mode" : this.mode
		});
		this._currentPage = e-1 ;
	},
	
	_requestFirstPage : function(){
		this._fetchData({
			"pageRequest.pageEvent" : "initial",
			"pageRequest.pageNumber" : 1,
			"mode" : this.mode
		});
		this._currentPage = 0 ;
	},
	
	_fetchData : function(arg){
		console.log(this.bttParams);
		/*var xhrParams = {
			url : this.requestURL,
			handleAs : "json",
			postData : dojo.toJson(dojo.mixin(this.bttParams, arg)),
			timeout : this.timeout,
			load : dojo.hitch(this, this._handleResponse),
			error : this._handleError
		};
		dojo.xhrPost(xhrParams);*/
		
		var data = this.bttParams;
		if (!data[AjaxUtil.constants.BTT_TIMEZONE]) {
			data[AjaxUtil.constants.BTT_TIMEZONE] = AjaxUtil.getTimzone();
		}
		AjaxUtil.xhrPost({
			//url : this.requestURL,
			handleAs : "text",
			timeout : this.timeout,
			success : dojo.hitch(this, this._handleResponse),
			error : dojo.hitch(this, this._handleError)
		}, dojo.mixin(data, arg));
	},
	
	_handleResponse : function(arg){
		try{
			var data = dojo.fromJson(arg);
			if(data.items){
				if(this.grid.get("store")){
					var tmpStore = this.grid.get("store");
					tmpStore.close();
				}
				this.grid.setStoreData(data.items);
				this.grid._refresh();
				try {
					this.grid._refresh();
				} catch (e) {
					console.warn('refresh failed');
				}
				
				if (this.mode == "simple") {
					this._setPageSize(data.totalRowNumber);
				}
				if (this.mode == "nonePageSize") {
					if (typeof (data.enableNext) != "undefined") {

					}
					this.nextBtnEnabled = this._setBtnState(data.enableNext);
					this.prevBtnEnabled = this._setBtnState(data.enablePrevious);
				}
				dojo.forEach(this.paginators, function(p){
					p.update();
				});
			}
			// do not keep selection for single selection mode grid
			if(this.grid.selection.mode === "single" && !this.keepSingleSelection){
				this.grid.selection.deselectAll();
			}
			
			dijit.focus(this.grid.domNode);
			
			if(data && data.errMsg) this.grid.showErrorIcon(data.errMsg);
			this.grid.onAsyncOK(arguments);
		}catch(e){
			this.grid.onAsyncError(arguments);
			this.handleResponseError(arg);
		}
		this._paginateable = true;
	},
	
	handleResponseError : function(arg){
		(new dijit.Dialog({
	        title: "",
	        content : arg
	    })).show();
	},
	
	_setBtnState : function(state) {
		if (typeof (state) != "undefined" && state != "null"
				&& state != null) {
			if (state == true || state == "true") {
				return true;
			} else {
				return false;
			}
		}
		return false;
	},
	
	_handleError : function(arg){
		console.error("An error occured when loading pagination data from " + AjaxUtil.ajaxOperationUrl);
		this._paginateable = true;
		if(arg.dojoType === "timeout") {
			this.grid.onAsyncTimeOut(arguments);
		} else if(arg.status !== undefined) {
			this.grid.onAsyncError(arguments);
		}
	},
	
	getTotalRowCount: function(){
		// summary:
		//		Function for get total row count
		return this._maxSize;
	}
});


dojo.declare("com.ibm.btt.dijit.plugins.SimplePaginator", [dojox.grid.enhanced.plugins._Paginator], {
	
	pageSizes : undefined,
	
	showAll : true,
	
	_updateDescription: function(){
		// summary:
		//		Update size information.
		/*if(this.description && this.descriptionDiv){
			this.descriptionDiv.innerHTML = this._maxItemSize > 0 ? dojo.string.substitute(this.descTemplate, [this.itemTitle, this._maxItemSize, 1, this.plugin.pageSize]) : "0 " + this.itemTitle;
		}
		if(this.descriptionWidth){
			dojo.style(this.descriptionTd, "width", this.descriptionWidth);
		}*/
	},
	
	_onKeyDown: function(event, isBubble){
		if(event.ctrlKey || event.altKey || event.metaKey) return;
		return this.inherited(arguments);
	},
	
	_onFocusPaginator: function(event, step){
		if(this._currentFocusNode){
			dijit.focus(this._currentFocusNode);
			this.focusArea = "pageStep";
			this.plugin._stopEvent(event);
			return true;
		}else{
			return this._onFocusPageStepNode(event);
		}
	},
	
	disableBtns: function(){
		// summary:
		//		Update the style of the page step nodes
		var value = null,
			curPage = this._getCurrentPageNo(),
			pageCount = this._getPageCount(),
			visibleNodeLen = 0;
			
		var updateClass = function(node, isWardBtn, status){
			var value = node.value,
				enableClass = isWardBtn ? "dojoxGrid" + value + "Btn" : "dojoxGridNumBtnDisabled",
				disableClass = isWardBtn ? "dojoxGrid" + value + "BtnDisable" : "dojoxGridNumBtnDisabled";
			if(status){
				dojo.addClass(node, disableClass);
				dojo.attr(node, "tabindex", "-1");
			}else{
				dojo.addClass(node, enableClass);
				dojo.attr(node, "tabindex", "0");
			}
		};
		dojo.forEach(this.pageStepperDiv.childNodes, function(node){
			dojo.removeClass(node);
			if(isNaN(parseInt(node.value, 10))){
				dojo.addClass(node, "dojoxGridWardButton");
				var disablePageNum = node.value == "prevPage" || node.value == "firstPage" ? 1 : pageCount;
				updateClass(node, true, true);
			}else{
				value = parseInt(node.value, 10);
				updateClass(node, false, true);
			}
		}, this);
	}
	
});


dojo.declare("com.ibm.btt.dijit.plugins.NonePageSizePaginator", [dijit._Widget,dijit._Templated], {
	templatePath: dojo.moduleUrl("dojox.grid","enhanced/templates/Pagination.html"),
		
	// pagination bar position - "bottom"|"top"
	position: "bottom",
	
	// max data item size
	_maxItemSize: 10,
	
	// description message status params
	description: true,
	
	// fast step page status params
	pageStepper: "30em",
	
	constructor: function(params){
		dojo.mixin(this, params);
		this.grid = this.plugin.grid;
	},
	
	postCreate: function(){
		this.inherited(arguments);
		this._setWidthValue();
		var self = this;
		var g = this.grid;
		this.plugin.connect(g, "_resize", dojo.hitch(this, "_resetGridHeight"));
		this._originalResize = dojo.hitch(g, "resize");
		g.resize = function(changeSize, resultSize){
			self._changeSize = g._pendingChangeSize = changeSize;
			self._resultSize = g._pendingResultSize = resultSize;
			g.sizeChange();
		};
		this._placeSelf();
	},
	
	destroy: function(){
		this.inherited(arguments);
		this.grid.focus.removeArea("pagination" + this.position.toLowerCase());
		this.grid.resize = this._originalResize;
		this.pageSizes = null;
	},
	
	update: function(){
		this.nextBtnEnabled = this.plugin.nextBtnEnabled ? this.plugin.nextBtnEnabled : this.grid.nextBtnEnabled;
		this.prevBtnEnabled = this.plugin.prevBtnEnabled ? this.plugin.prevBtnEnabled : this.grid.prevBtnEnabled;
		this._updatePageStepper();
	},
	
	disableBtns : function(){
		var updateClass = function(node, isWardBtn, status){
			var value = node.value,
				enableClass = isWardBtn ? "dojoxGrid" + value + "Btn" : "dojoxGridInactived",
				disableClass = isWardBtn ? "dojoxGrid" + value + "BtnDisable" : "dojoxGridActived";
			if(status){
				dojo.addClass(node, disableClass);
				dojo.attr(node, "tabindex", "-1");
			}else{
				dojo.addClass(node, enableClass);
				dojo.attr(node, "tabindex", "0");
			}
		};
		dojo.forEach(this.pageStepperDiv.childNodes, function(node){
			dojo.removeClass(node);
			if(node.value=="prevPage"){
				dojo.addClass(node, "dojoxGridWardButton");
				updateClass(node, true, true);
			}
			if(node.value=="nextPage"){
				dojo.addClass(node, "dojoxGridWardButton");
				updateClass(node, true, true);
			}			
		}, this);
	},
	
	_setWidthValue: function(){
		var type = ["description", "sizeSwitch", "pageStepper"];
		var endWith = function(str1, str2){
			var reg = new RegExp(str2+"$");
			return reg.test(str1);
		};
		dojo.forEach(type, function(t){
			var width, flag = this[t];
			if(flag === undefined || typeof flag == "boolean"){
				return;
			}
			if(dojo.isString(flag)){
				width = endWith(flag, "px") || endWith(flag, "%") || endWith(flag, "em") ? flag : parseInt(flag, 10) > 0 ? parseInt(flag, 10) + "px" : null;
			}else if(typeof flag === "number" && flag > 0){
				width = flag + "px";
			}
			this[t] = width ? true : false;
			this[t + "Width"] = width;
		}, this);
	},
	
	_regFocusMgr: function(position){
		// summary:
		//		Function to register pagination bar to focus manager.
		this.grid.focus.addArea({
			name: "pagination" + position,
			onFocus: dojo.hitch(this, this._onFocusPaginator),
			onBlur: dojo.hitch(this, this._onBlurPaginator),
			onMove: dojo.hitch(this, this._moveFocus),
			onKeyDown: dojo.hitch(this, this._onKeyDown)
		});
		switch(position){
			case "top":
				this.grid.focus.placeArea("pagination" + position, "before", "header");
				break;
			case "bottom":
			default:
				this.grid.focus.placeArea("pagination" + position, "after", "content");
				break;
		}
	},
	
	_placeSelf: function(){
		// summary:
		//		Place pagination bar to a position.
		//		There are two options, top of the grid, bottom of the grid.
		var g = this.grid;
		var	position = dojo.trim(this.position.toLowerCase());
		switch(position){
			case "top":
				this.placeAt(g.viewsHeaderNode, "before");
				this._regFocusMgr("top");
				break;
			case "bottom":
			default:
				this.placeAt(g.viewsNode, "after");
				this._regFocusMgr("bottom");
				break;
		}
	},
	
	_resetGridHeight: function(changeSize, resultSize){
		// summary:
		//		Function of resize grid height to place this pagination bar.
		//		Since the grid would be able to add other element in its domNode, we have
		//		change the grid view size to place the pagination bar.
		//		This function will resize the grid viewsNode height, scorllboxNode height
		var g = this.grid;
		changeSize = changeSize || this._changeSize;
		resultSize = resultSize || this._resultSize;
		delete this._changeSize;
		delete this._resultSize;
		if(g._autoHeight){
			return;
		}
		var padBorder = g._getPadBorder().h;
		if(!this.plugin.gh){
			this.plugin.gh = (g.domNode.clientHeight || dojo.style(g.domNode, 'height')) + 2 * padBorder;
		}
		if(resultSize){
			changeSize = resultSize;
		}
		if(changeSize){
			this.plugin.gh = dojo.contentBox(g.domNode).h + 2 * padBorder;
		}
		var gh = this.plugin.gh,
			hh = g._getHeaderHeight(),
			ph = dojo.marginBox(this.domNode).h;
		ph = this.plugin.paginators[1] ? ph * 2 : ph;
		if(typeof g.autoHeight == "number"){
			var cgh = gh + ph - padBorder;
			dojo.style(g.domNode, "height", cgh + "px");
			dojo.style(g.viewsNode, "height", (cgh - ph - hh) + "px");
			
			this._styleMsgNode(hh, dojo.marginBox(g.viewsNode).w, cgh - ph - hh);
		}else{
			var h = gh - ph - hh - padBorder;
			dojo.style(g.viewsNode, "height", h + "px");
			var hasHScroller = dojo.some(g.views.views, function(v){
				return v.hasHScrollbar();
			});
			dojo.forEach(g.viewsNode.childNodes, function(c, idx){
				dojo.style(c, "height", h + "px");
			});
			dojo.forEach(g.views.views, function(v, idx){
				if(v.scrollboxNode){
					if(!v.hasHScrollbar() && hasHScroller){
						dojo.style(v.scrollboxNode, "height", (h - dojox.html.metrics.getScrollbar().h) + "px");
					}else{
						dojo.style(v.scrollboxNode, "height", h + "px");
					}
				}
			});
			this._styleMsgNode(hh, dojo.marginBox(g.viewsNode).w, h);
		}
	},
	
	_styleMsgNode: function(top, width, height){
		var messagesNode = this.grid.messagesNode;
		dojo.style(messagesNode, {"position": "absolute", "top": top + "px", "width": width + "px", "height": height + "px", "z-Index": "100"});
	},
	
	_updateDescription: function(){
		// summary:
		//		Update size information.
		/*var s = this.plugin.forcePageStoreLayer;
		if(this.description && this.descriptionDiv){
			this.descriptionDiv.innerHTML = this._maxItemSize > 0 ? dojo.string.substitute(this.descTemplate, [this.itemTitle, this._maxItemSize, s.startIdx + 1, s.endIdx + 1]) : "0 " + this.itemTitle;
		}
		if(this.descriptionWidth){
			dojo.style(this.descriptionTd, "width", this.descriptionWidth);
		}*/
	},
		
	_updatePageStepper: function(){
		// summary:
		//		Update the page step nodes
		if(!this.pageStepperTd){
			return;
		}
		if(this.pageStepperDiv.childNodes.length < 1){
			this._createWardBtns();
		}
		this._updatePageStepNodeClass();
	},
	
	_createWardBtns: function(){
		// summary:
		//		Create the previous/next/first/last button
		var self = this;
		var highContrastLabel = {prevPage: "&#60;", firstPage: "&#171;", nextPage: "&#62;", lastPage: "&#187;"};
		var createWardBtn = function(value, label, position){
			label = I18nUtil.getI18nString(label);
			var node = dojo.create("div", {value: value, title: label, tabindex: 1}, self.pageStepperDiv, position);
			self.plugin.connect(node, "onclick", dojo.hitch(self, "_onPageStep"));
			dijit.setWaiState(node, "label", label);
			// for high contrast
			var highConrastNode = dojo.create("span", {value: value, title: label, innerHTML: highContrastLabel[value]}, node, position);
			dojo.addClass(highConrastNode, "dojoxGridWardButtonInner");
		};
		createWardBtn("prevPage", "%com.ibm.btt.dijit.Grid/prevPageBtn", "first");
		createWardBtn("nextPage", "%com.ibm.btt.dijit.Grid/nextPageBtn", "last");
	},
	
	_updatePageStepNodeClass: function(){
		// summary:
		//		Update the style of the page step nodes
			
		var updateClass = function(node, isWardBtn, status){
			var value = node.value,
				enableClass = isWardBtn ? "dojoxGrid" + value + "Btn" : "dojoxGridInactived",
				disableClass = isWardBtn ? "dojoxGrid" + value + "BtnDisable" : "dojoxGridActived";
			if(status){
				dojo.addClass(node, disableClass);
				dojo.attr(node, "tabindex", "-1");
			}else{
				dojo.addClass(node, enableClass);
				dojo.attr(node, "tabindex", "0");
			}
		};
		dojo.forEach(this.pageStepperDiv.childNodes, function(node){
			dojo.removeClass(node);
			if(node.value=="prevPage"){
				dojo.addClass(node, "dojoxGridWardButton");
				if(this.prevBtnEnabled){
					updateClass(node, true, false);
				}else{
					updateClass(node, true, true);
				}
			}
			if(node.value=="nextPage"){
				dojo.addClass(node, "dojoxGridWardButton");
				if(this.nextBtnEnabled){
					updateClass(node, true, false);
				}else{
					updateClass(node, true, true);
				}
			}			
		}, this);
	},
		
	// ===== focus handlers ===== //
	_onFocusPaginator: function(event, step){
		// summary:
		//		Focus handler
		if(!this._currentFocusNode){
			if(step != 0){
				return this._onFocusPageStepNode(event);
			}else{
				return false;
			}
		}else{
			return false;
		}
	},
		
	_onFocusPageStepNode: function(event){
		// summary:
		//		Focus the page step area, if there is no focusable node, return false
		var pageStepNodes = this._getPageStepActivableNodes();
		if(event && event.type !== "click"){
			if(pageStepNodes[0]){
				dijit.focus(pageStepNodes[0]);
				this._currentFocusNode = pageStepNodes[0];
				this.focusArea = "pageStep";
				this.plugin._stopEvent(event);
				return true;
			}else{
				return false;
			}
		}
		if(event && event.type == "click"){
			if(dojo.indexOf(this._getPageStepActivableNodes(), event.target) > -1){
				this.focusArea = "pageStep";
				this.plugin._stopEvent(event);
				return true;
			}
		}
		return false;
	},
		
	_onBlurPaginator: function(event, step){
		var pageStepNodes = this._getPageStepActivableNodes();
		
		if(step > 0 && this.focusArea === "pageSize" && (pageStepNodes.length > 1 || this.gotoButton)){
			return false;
		}else if(step < 0 && this.focusArea === "pageStep"){
			return false;
		}
		this._currentFocusNode = null;
		this.focusArea = null;
		return true;
	},
	
	_onKeyDown: function(event, isBubble){
		// summary:
		//		Focus navigation
		if(isBubble){
			return;
		}
		if(event.altKey || event.metaKey){
			return;
		}
		var dk = dojo.keys;
		if(event.keyCode === dk.ENTER || event.keyCode === dk.SPACE){
			if(dojo.indexOf(this._getPageStepActivableNodes(), this._currentFocusNode) > -1){
				this._onPageStep(event);
			}
		}
		this.plugin._stopEvent(event);
	},
	
	_moveFocus: function(rowDelta, colDelta, evt){
		// summary:
		//		Move focus according row delta&column delta
		var nodes;
		if(this.focusArea == "pageStep"){
			nodes = this._getPageStepActivableNodes();
			if(this.gotoPageDiv){
				nodes.push(this.gotoPageDiv);
			}
		}
		if(nodes.length < 1){
			return;
		}
		var currentIdx = dojo.indexOf(nodes, this._currentFocusNode);
		var focusIdx = currentIdx + colDelta;
		if(focusIdx >= 0 && focusIdx < nodes.length){
			dijit.focus(nodes[focusIdx]);
			this._currentFocusNode = nodes[focusIdx];
		}
		this.plugin._stopEvent(evt);
	},
		
	_getPageStepActivableNodes: function(){
		return (dojo.query("div[tabindex='0']", this.pageStepperDiv));
	},
		
	_getAllPageStepNodes: function(){
		var nodeList = [];
		for(var i = 0, len = this.pageStepperDiv.childNodes.length; i < len; i++){
			nodeList.push(this.pageStepperDiv.childNodes[i]);
		}
		return nodeList;
	},
	
	_onPageStep: function(/*Event*/e){
		// summary:
		//		The handler jump page event
		var g = this.grid;
		
		if(!this._currentFocusNode){
			this.grid.focus.currentArea("pagination" + this.position);
		}
		if(this.focusArea != "pageStep"){
			this.focusArea = "pageStep";
		}
		
		switch(e.target.value){
			case "prevPage":
				if(e.target.className.indexOf("dojoxGridprevPageBtnDisable") <= 0 ) g.prevPage();
				break;
			case "nextPage":
				if(e.target.className.indexOf("dojoxGridnextPageBtnDisable") <= 0 )	g.nextPage();
				break;
		}
	}

});

dojox.grid.EnhancedGrid.registerPlugin(com.ibm.btt.dijit.plugins.Pagination/*name:'bttpagination'*/);