[{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'StockTransaction_button', e: 'onClick'}],
  onTrue: function(e, _rule) {
    
		var l_content_pane = dijit.byId('StockTransaction_contentPaneStock');
		if ( l_content_pane ) {
	    	var l_form = dijit.byId(this.getPW('StockTransaction_form', 'id'));

	    	var l_value = {};
	    	if ( l_form ) {
		    	var l_func = dojo.hitch(l_form, l_form._rawOnSubmit || l_form.onSubmit);
		    	if ( dojo.isFunction(l_func) ) l_func();
				dojo.mixin(l_content_pane.ioArgs.content, dojo.formToObject(this.getPW('StockTransaction_form', 'id')||{}));
	    	}

			dojo.mixin(l_content_pane.ioArgs.content, {dse_nextEventName:'queryStockNumber'});
			l_content_pane.set('href', 'Request');
		}
      ;
    this.setPW('StockTransaction_label', 'text', '%nls.svt/stockNumber?[{\"p\":\"value\",\"t\":\"w\",\"id\":\"StockTransaction_text\",\"n\":\"number\"}]');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'StockTransaction_horizontalSlider', e: 'onChange'}],
  onTrue: function(e, _rule) {
    
		var l_content_pane = dijit.byId('StockTransaction_contentPaneStock');
		if ( l_content_pane ) {
	    	var l_form = dijit.byId(this.getPW('StockTransaction_form01', 'id'));

	    	var l_value = {};
	    	if ( l_form ) {
		    	var l_func = dojo.hitch(l_form, l_form._rawOnSubmit || l_form.onSubmit);
		    	if ( dojo.isFunction(l_func) ) l_func();
				dojo.mixin(l_content_pane.ioArgs.content, dojo.formToObject(this.getPW('StockTransaction_form01', 'id')||{}));
	    	}

			dojo.mixin(l_content_pane.ioArgs.content, {dse_nextEventName:'queryStockNumber'});
			l_content_pane.set('href', 'Request');
		}
      ;
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'StockTransaction_label01', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW('StockTransaction_text', 'value', '002351');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'StockTransaction_label02', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW('StockTransaction_text', 'value', '600220');
  }
}]