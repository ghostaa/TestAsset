[{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'mybank_loan_offer_01_button', e: 'onClick'}],
  onTrue: function(e, _rule) {
    
		var l_content_pane = dijit.byId('mybank_index_centerPanel');
		if ( l_content_pane ) {
	    	var l_form = dijit.byId(this.getPW('mybank_loan_offer_01_form', 'id'));

	    	var l_value = {};
	    	if ( l_form ) {
		    	var l_func = dojo.hitch(l_form, l_form._rawOnSubmit || l_form.onSubmit);
		    	if ( dojo.isFunction(l_func) ) l_func();
				dojo.mixin(l_content_pane.ioArgs.content, dojo.formToObject(this.getPW('mybank_loan_offer_01_form', 'id')||{}));
	    	}

			dojo.mixin(l_content_pane.ioArgs.content, {dse_nextEventName:'submit'});
			l_content_pane.set('href', 'Request');
		}
      ;
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'mybank_loan_offer_01_dijit_form_HorizontalSlider01', e: 'onChange'}],
  onTrue: function(e, _rule) {
    this.setPW('mybank_loan_offer_01_yearLabel', 'text', this.getPW('mybank_loan_offer_01_dijit_form_HorizontalSlider01', 'value') + ' years');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'mybank_loan_offer_01_dijit_form_HorizontalSlider', e: 'onChange'}],
  onTrue: function(e, _rule) {
    if(false == this.runInlineScript(this, function(){
 dijit.byId('mybank_loan_offer_01_amountLabel').set('text',
   dojo.currency.format(dijit.byId('mybank_loan_offer_01_dijit_form_HorizontalSlider').get('value'), {currency:"$"}));
}))
{
return;
};
  }
}]