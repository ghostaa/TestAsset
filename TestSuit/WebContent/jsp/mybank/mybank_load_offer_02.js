[{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'mybank_load_offer_02_button', e: 'onClick'}],
  onTrue: function(e, _rule) {
    
		var l_content_pane = dijit.byId('mybank_index_centerPanel');
		if ( l_content_pane ) {
	    	var l_form = dijit.byId(this.getPW('mybank_load_offer_02_form', 'id'));

	    	var l_value = {};
	    	if ( l_form ) {
		    	var l_func = dojo.hitch(l_form, l_form._rawOnSubmit || l_form.onSubmit);
		    	if ( dojo.isFunction(l_func) ) l_func();
				dojo.mixin(l_content_pane.ioArgs.content, dojo.formToObject(this.getPW('mybank_load_offer_02_form', 'id')||{}));
	    	}

			dojo.mixin(l_content_pane.ioArgs.content, {dse_nextEventName:'back'});
			l_content_pane.set('href', 'Request');
		}
      ;
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'mybank_load_offer_02_button01', e: 'onClick'}],
  onTrue: function(e, _rule) {
    
		var l_content_pane = dijit.byId('mybank_index_centerPanel');
		if ( l_content_pane ) {
	    	var l_form = dijit.byId(null);

	    	var l_value = {};
	    	if ( l_form ) {
		    	var l_func = dojo.hitch(l_form, l_form._rawOnSubmit || l_form.onSubmit);
		    	if ( dojo.isFunction(l_func) ) l_func();
				dojo.mixin(l_content_pane.ioArgs.content, dojo.formToObject(null||{}));
	    	}

			dojo.mixin(l_content_pane.ioArgs.content, {dse_nextEventName:'submit'});
			l_content_pane.set('href', 'Request');
		}
      ;
  }
}]