dojo.provide("com.ibm.btt.util.BTTTooltip");
dojo.getObject("com.ibm.btt.util.BTTTooltip", true); 

dojo.declare(
		"com.ibm.btt.util.BTTTooltip",
		[dijit._MasterTooltip],
		{
			show: function(/*String*/ innerHTML, /*DomNode*/ aroundNode, /*String[]?*/ position, /*Boolean*/ rtl, /*Event*/e){
				// summary:
				//		Display tooltip w/specified contents to right of specified node
				//		(To left if there's no space on the right, or if rtl == true)

				if(this.aroundNode && this.aroundNode === aroundNode){
					return;
				}

				// reset width; it may have been set by orient() on a previous tooltip show()
				this.domNode.width = "auto";

				if(this.fadeOut.status() == "playing"){
					// previous tooltip is being hidden; wait until the hide completes then show new one
					this._onDeck=arguments;
					return;
				}
				this.containerNode.innerHTML=innerHTML;

				var aroundNodePos = dojo.position(aroundNode, true);
				if(dojo.isIE<9 && ("mousePoint"==position || "textEnd"==position)){ // IE8 doesn't support "mousePoint" and "textEnd"
					position = dijit.Tooltip.defaultPosition;
				}
				// place the node around the calculated rectangle
				if("mousePoint" == position){
					dijit._placeOnScreenAroundRect(this.domNode,e.clientX, aroundNodePos.y, 0, aroundNodePos.h, dijit.getPopupAroundAlignment(dijit.Tooltip.defaultPosition, !rtl), dojo.hitch(this, "orient"));
				}else if("textEnd" == position){
					var xPosition = aroundNodePos.x + aroundNodePos.w/2;
					var textWidth = aroundNode.childNodes[0].offsetWidth;
					if(dojo.query(".dojoxEllipsis",aroundNode)[0]){
						textWidth = dojo.query(".dojoxEllipsis",aroundNode)[0].childNodes[0].offsetWidth;
					}
					if(textWidth < aroundNodePos.w && textWidth != 0){
						if(textWidth < aroundNodePos.w)
							xPosition = aroundNodePos.x + textWidth;
					}
					dijit._placeOnScreenAroundRect(this.domNode,xPosition, aroundNodePos.y, 0, aroundNodePos.h, dijit.getPopupAroundAlignment(dijit.Tooltip.defaultPosition, !rtl), dojo.hitch(this, "orient"));
				}else{
					dijit.placeOnScreenAroundElement(this.domNode, aroundNode, dijit.getPopupAroundAlignment((position && position.length) ? position : dijit.Tooltip.defaultPosition, !rtl), dojo.hitch(this, "orient"));
				}
				// show it
				dojo.style(this.domNode, "opacity", 0);
				this.fadeIn.play();
				this.isShowingNow = true;
				this.aroundNode = aroundNode;
			}

		}
	);

dijit.showBTTTooltip = function(/*String*/ innerHTML, /*DomNode*/ aroundNode, /*String[]?*/ position, /*Boolean*/ rtl, /*Event*/e){
		if(!dijit._masterTT_BTT){ dijit._masterTT_BTT = new com.ibm.btt.util.BTTTooltip(); }
		return dijit._masterTT_BTT.show(innerHTML, aroundNode, position, rtl, e);
};

dijit.hiddenBTTTooltip = function(/*DomNode*/ aroundNode){
	if(dijit._masterTT_BTT){
		return dijit._masterTT_BTT.hide(aroundNode);
	}
};