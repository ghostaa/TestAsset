window.newXuiFile02 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'newXuiFile02_text_copy01', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('newXuiFile02_label', 'text', 'this text get focus,readOnly can get focus!');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'newXuiFile02_combo_copy01', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('newXuiFile02_label02', 'text', 'this combo get focus,this combo previous is readOnly!');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'newXuiFile02_text01', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('newXuiFile02_label04', 'text', 'This text is disabled,should not get focus,but get focus now!');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'newXuiFile02_text02', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('newXuiFile02_label05', 'text', 'this text TabIndex is 5,is bigger the disabled text TabIndex!');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'newXuiFile02_text01', e: 'onBlur'}],
  onTrue: function(e) {
    this.setPW('newXuiFile02_label04', 'text', 'can the disabled text lose focus.');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'newXuiFile02_button01', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('newXuiFile02_button_copy01', 'inValid');
  },
  onTrue: function(e) {
    this.setPW('newXuiFile02_button_copy01', 'inValid', false);
  },
  onFalse: function(e) {
    this.setPW('newXuiFile02_button_copy01', 'inValid', true);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(newXuiFile02);
});