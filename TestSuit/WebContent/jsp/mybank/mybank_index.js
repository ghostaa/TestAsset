[{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'mybank_index_link14', e: 'onClick'}],
  onTrue: function(e, _rule) {
    
		var l_content_pane = dijit.byId('mybank_index_centerPanel');
		if ( l_content_pane ) {
			dojo.mixin(l_content_pane.ioArgs.content,{
				dse_applicationId:-1,
				dse_pageId:1,
				dse_processorState:"initial",
				dse_operationName:'loanOfferFlow',
				dse_nextEventName:"start",
				dse_timezone:AjaxUtil.getTimzone()
			});
			delete l_content_pane.ioArgs.content['dse_processorId'];
			l_content_pane.set('href', 'Request');
		}
      ;
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'mybank_index_link12', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.runWF('mybank_index_bottomContentPane', 'set', 'href', 'jsp/mybank/bottom_4_network.jsp');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'mybank_index_link13', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.runWF('mybank_index_bottomContentPane', 'set', 'href', 'jsp/mybank/bottom_others.jsp');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'mybank_index_link10', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.runWF('mybank_index_bottomContentPane', 'set', 'href', 'jsp/mybank/bottom_others.jsp');
  }
}]