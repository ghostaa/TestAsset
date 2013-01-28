window.radioButtonByAjax = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'radioButtonByAjax_toggleDisable', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('radioButtonByAjax_animalRadio1', 'disabled') == true;
  },
  onTrue: function(e) {
    this.setPW('radioButtonByAjax_animalRadio1', 'disabled', false);
    this.setPW('radioButtonByAjax_animalRadio2', 'disabled', false);
    this.setPW('radioButtonByAjax_animalRadio3', 'disabled', false);
  },
  onFalse: function(e) {
    this.setPW('radioButtonByAjax_animalRadio1', 'disabled', true);
    this.setPW('radioButtonByAjax_animalRadio2', 'disabled', true);
    this.setPW('radioButtonByAjax_animalRadio3', 'disabled', true);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'radioButtonByAjax_toggleReadonly', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('radioButtonByAjax_animalRadio1', 'readOnly', ! this.getPW('radioButtonByAjax_animalRadio1', 'readOnly'));
    this.setPW('radioButtonByAjax_animalRadio2', 'readOnly', ! this.getPW('radioButtonByAjax_animalRadio2', 'readOnly'));
    this.setPW('radioButtonByAjax_animalRadio3', 'readOnly', ! this.getPW('radioButtonByAjax_animalRadio3', 'readOnly'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'radioButtonByAjax_toogleIsChecked', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('radioButtonByAjax_animalRadio1', 'isChecked', ! this.getPW('radioButtonByAjax_animalRadio1', 'isChecked'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'radioButtonByAjax_setValueAt', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('radioButtonByAjax_animalRadio1', 'text', this.getPW('radioButtonByAjax_radioText', 'value'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'radioButtonByAjax_btnSetFocus', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('radioButtonByAjax_animalRadio1', 'focus');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'radioButtonByAjax_btnVisible', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('radioButtonByAjax_animalRadio2', 'visibility', 'visible');
    this.setPW('radioButtonByAjax_animalRadio1', 'visibility', 'visible');
    this.setPW('radioButtonByAjax_animalRadio3', 'visibility', 'visible');
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'radioButtonByAjax_btnHidden', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('radioButtonByAjax_animalRadio1', 'visibility', 'hidden');
    this.setPW('radioButtonByAjax_animalRadio2', 'visibility', 'hidden');
    this.setPW('radioButtonByAjax_animalRadio3', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'radioButtonByAjax_btnGone', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('radioButtonByAjax_animalRadio1', 'visibility', 'gone');
    this.setPW('radioButtonByAjax_animalRadio2', 'visibility', 'gone');
    this.setPW('radioButtonByAjax_animalRadio3', 'visibility', 'gone');
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'radioButtonByAjax_btnIsFocusable', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('radioButtonByAjax_animalRadio3', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('radioButtonByAjax_label', 'text', 'True');
  },
  onFalse: function(e) {
    this.setPW('radioButtonByAjax_label', 'text', 'False');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(radioButtonByAjax);
});