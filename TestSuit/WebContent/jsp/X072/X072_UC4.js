window.X072_UC4 = [{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X072_UC4_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X072_UC4_form', 'callAsyncOpWithMapping', 'X072_UC4_02Op', 'Call X072_UC4Op', 8000, 'X072_UC4_1_input', 'X072_UC4_1_output');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X072_UC4_form', e: 'onAsyncOK'}],
  onTrue: function(e) {
    this.setPW('X072_UC4_button', 'text', 'Operation excuted');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'X072_UC4_button01_copy', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X072_UC4_form', 'callAsyncOpWithMapping', 'X072_UC4_02Op', 'Call X072_UC4Op', 1000, 'X072_UC4_2_input', 'X072_UC4_2_output');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'X072_UC4_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X072_UC4_form', 'callAsyncOpWithMapping', 'X072_UC4_02Op', 'Call X072_UC4Op', 8000, 'X072_UC4_3_input', 'X072_UC4_3_output');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X072_UC4_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X072_UC4_form', 'callAsyncOpWithMapping', 'X072_UC4_02Op', 'op', 8000, 'X072_UC4_6_input', 'X072_UC4_6_output');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'X072_UC4_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X072_UC4_form', 'callAsyncOpWithMapping', 'X072_UC4_02Op', 'call uc4Op', 8000, 'X072_UC4_8_input', 'X072_UC4_7_output');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X072_UC4);
});