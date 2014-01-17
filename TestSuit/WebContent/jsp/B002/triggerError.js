window.triggerError = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'triggerError_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('triggerError_hiddenField', 'value', 'ok');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'triggerError_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('triggerError_hiddenField', 'value', 'error');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'triggerError_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('triggerError_hiddenField', 'value', 'help');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(triggerError);
});