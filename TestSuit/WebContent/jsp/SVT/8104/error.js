[{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'error_link01', e: 'onClick'}],
  onTrue: function(e, _rule) {
    
		var l_content_pane = dijit.byId('StockTransaction_contentPaneStock');
		if ( l_content_pane ) {
	    	var l_form = dijit.byId('');

	    	var l_value = {};
	    	if ( l_form ) {
		    	var l_func = dojo.hitch(l_form, l_form._rawOnSubmit || l_form.onSubmit);
		    	if ( dojo.isFunction(l_func) ) l_func();
				dojo.mixin(l_content_pane.ioArgs.content, dojo.formToObject(''||{}));
	    	}

			dojo.mixin(l_content_pane.ioArgs.content, {dse_nextEventName:'back'});
			l_content_pane.set('href', 'Request');
		}
      ;
  }
}]