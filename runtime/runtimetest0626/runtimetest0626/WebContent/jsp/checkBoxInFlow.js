window.checkBoxInFlow = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'checkBoxInFlow_btnToggleJava', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('checkBoxInFlow_chkJava', 'isChecked', ! this.getPW('checkBoxInFlow_chkJava', 'isChecked'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'checkBoxInFlow_btnToggleCpp', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('checkBoxInFlow_chkCpp', 'isChecked', ! this.getPW('checkBoxInFlow_chkCpp', 'isChecked'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'checkBoxInFlow_Button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('checkBoxInFlow_Label04', 'text', this.getPW('checkBoxInFlow_chkJava', 'text'));
    this.setPW('checkBoxInFlow_Label06', 'text', this.getPW('checkBoxInFlow_chkCpp', 'text'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(checkBoxInFlow);
});