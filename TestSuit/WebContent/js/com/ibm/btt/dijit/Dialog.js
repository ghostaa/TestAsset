/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.dijit.Dialog"); 

dojo.require("com.ibm.btt.dijit.AbstractWidgetMixin");
dojo.require("dijit.Dialog"); 

dojo.declare("com.ibm.btt.dijit.Dialog",[ dijit.Dialog,com.ibm.btt.dijit.AbstractWidgetMixin] ,{ 
	
	closable : false,
	
	/**
	 * 
	 * hook method for close attribute
	 * 
	 * @tag private this is a internal method, may be changed or removed in later version
	 *              please do not use this method in customer code.
	 * */
	_setClosableAttr : function(value){
		this.closable = value;
		if(this.closable){
			dojo.style(this.closeButtonNode, "display", "");
		}else{
			dojo.style(this.closeButtonNode, "display", "none");
		}
	},
	
	_onKey: function(/*Event*/ evt){
		// summary:
		//		Handles the keyboard events for accessibility reasons
		// tags:
		//		private

		if(evt.charOrCode){
			var dk = dojo.keys;
			var node = evt.target;
			if(evt.charOrCode === dk.TAB){
				this._getFocusItems(this.domNode);
			}
			var singleFocusItem = (this._firstFocusItem == this._lastFocusItem);
			// see if we are shift-tabbing from first focusable item on dialog
			if(node == this._firstFocusItem && evt.shiftKey && evt.charOrCode === dk.TAB){
				if(!singleFocusItem){
					dijit.focus(this._lastFocusItem); // send focus to last item in dialog
				}
				dojo.stopEvent(evt);
			}else if(node == this._lastFocusItem && evt.charOrCode === dk.TAB && !evt.shiftKey){
				if(!singleFocusItem){
					dijit.focus(this._firstFocusItem); // send focus to first item in dialog
				}
				dojo.stopEvent(evt);
			}else{
				// see if the key is for the dialog
				while(node){
					if(node == this.domNode || dojo.hasClass(node, "dijitPopup")){
						if(evt.charOrCode == dk.ESCAPE && this.closable){
							this.onCancel();
						}else{
							return; // just let it go
						}
					}
					node = node.parentNode;
				}
				// this key is for the disabled document window
				if(evt.charOrCode !== dk.TAB){ // allow tabbing into the dialog for a11y
					dojo.stopEvent(evt);
				// opera won't tab to a div
				}else if(!dojo.isOpera){
					try{
						this._firstFocusItem.focus();
					}catch(e){ /*squelch*/ }
				}
			}
		}
	},
	
	/**
	 * Override, prevent dialog title section is dragged out of screen top side.
	 */
	_endDrag: function(e){
		// summary:
		//		Called after dragging the Dialog. Saves the position of the dialog in the viewport.
		// tags:
		//		private
		if(e && e.node && e.node === this.domNode){
			var pos = dojo.position(e.node);
			if(pos.y < 0) {
				pos.y = 0;
				dojo.style(this.domNode,{
					top: pos.y + "px"
				});
			}
			this._relativePosition = pos;
		}
	}

}); 
