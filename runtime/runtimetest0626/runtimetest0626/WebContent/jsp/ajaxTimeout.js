window.ajaxTimeout = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'ajaxTimeout_Button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ajaxTimeout_Form01', 'callAsyncOperation', 'ajaxTimeOut', 'ajax01', 2000);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'ajaxTimeout_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ajaxTimeout_Form01', 'callAsyncOperation', 'ajaxTimeOut', 'ajax02', 1000);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'ajaxTimeout_Button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ajaxTimeout_Form01', 'callAsyncOperation', 'ajaxTimeOut', 'ajax03', 200000);
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'ajaxTimeout_Button04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ajaxTimeout_Form01', 'callAsyncOperation', 'ajaxTimeOut', 'ajax04', 120000);
  }
}, 
{ /* message01 */
  name: 'message01',
  evts: [{ id: 'ajaxTimeout_Form01', e: 'onAsyncTimeOut'}],
  cond: function(e) {
    return this.getPW('ajaxTimeout_Form01', 'asyncCode') == 'ajax01';
  },
  onTrue: function(e) {
    this.runWF('ajaxTimeout_Message01', 'display', 'Time Out');
  }
}, 
{ /* message02 */
  name: 'message02',
  evts: [{ id: 'ajaxTimeout_Form01', e: 'onAsyncTimeOut'}],
  cond: function(e) {
    return this.getPW('ajaxTimeout_Form01', 'asyncCode') == 'ajax02';
  },
  onTrue: function(e) {
    this.runWF('ajaxTimeout_Message02', 'display', 'Time Out');
  }
}, 
{ /* message03 */
  name: 'message03',
  evts: [{ id: 'ajaxTimeout_Form01', e: 'onAsyncTimeOut'}],
  cond: function(e) {
    return this.getPW('ajaxTimeout_Form01', 'asyncCode') == 'ajax03';
  },
  onTrue: function(e) {
    this.runWF('ajaxTimeout_Message03', 'display', 'Time Out');
  }
}, 
{ /* message04 */
  name: 'message04',
  evts: [{ id: 'ajaxTimeout_Form01', e: 'onAsyncTimeOut'}],
  cond: function(e) {
    return this.getPW('ajaxTimeout_Form01', 'asyncCode') == 'ajax04';
  },
  onTrue: function(e) {
    this.runWF('ajaxTimeout_Message04', 'display', 'Time Out');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(ajaxTimeout);
});