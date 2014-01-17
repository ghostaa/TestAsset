[{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'stock_label02_copy01', e: 'onClick', repeatAt: 'stock_repetitivePanel01_copy'}],
  onTrue: function(e, _rule) {
    this.executeAG('saleAction',e);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'stock_label02_copy_copy', e: 'onClick', repeatAt: 'stock_repetitivePanel01_copy'}],
  onTrue: function(e, _rule) {
    this.executeAG('saleAction',e);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'stock_label02', e: 'onClick', repeatAt: 'stock_repetitivePanel01'}],
  onTrue: function(e, _rule) {
    this.executeAG('buyAction',e);
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'stock_label02_copy', e: 'onClick', repeatAt: 'stock_repetitivePanel01'}],
  onTrue: function(e, _rule) {
    this.executeAG('buyAction',e);
  }
}, 
{ /* buyAction */
  name: 'buyAction',
  type:"AG",
  onTrue: function(e, _rule) {
    
		var l_content_pane = dijit.byId('stock_contentPane01');
		if ( l_content_pane ) {
	    	var l_form = dijit.byId(this.getPW('stock_form01', 'id'));

	    	var l_value = {};
	    	if ( l_form ) {
		    	var l_func = dojo.hitch(l_form, l_form._rawOnSubmit || l_form.onSubmit);
		    	if ( dojo.isFunction(l_func) ) l_func();
				dojo.mixin(l_content_pane.ioArgs.content, dojo.formToObject(this.getPW('stock_form01', 'id')||{}));
	    	}

			dojo.mixin(l_content_pane.ioArgs.content, {dse_nextEventName:'buy'});
			l_content_pane.set('href', 'Request');
		}
      ;
  }
}, 
{ /* saleAction */
  name: 'saleAction',
  type:"AG",
  onTrue: function(e, _rule) {
    
		var l_content_pane = dijit.byId('stock_contentPane');
		if ( l_content_pane ) {
	    	var l_form = dijit.byId(this.getPW('stock_form', 'id'));

	    	var l_value = {};
	    	if ( l_form ) {
		    	var l_func = dojo.hitch(l_form, l_form._rawOnSubmit || l_form.onSubmit);
		    	if ( dojo.isFunction(l_func) ) l_func();
				dojo.mixin(l_content_pane.ioArgs.content, dojo.formToObject(this.getPW('stock_form', 'id')||{}));
	    	}

			dojo.mixin(l_content_pane.ioArgs.content, {dse_nextEventName:'sale'});
			l_content_pane.set('href', 'Request');
		}
      ;
  }
}]