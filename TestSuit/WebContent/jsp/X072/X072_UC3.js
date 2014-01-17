window.X072_UC3 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X072_UC3_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X072_UC3_form', 'callAsyncOpWithMapping', 'X072_UC3Op', 'call UC3 Op', 8000, 'X072_UC3_0_input', 'X072_UC3_0_output');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X072_UC3_form', e: 'onAsyncOK'}],
  onTrue: function(e) {
    this.setPW('X072_UC3_button', 'text', 'Operation executed');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X072_UC3);
});