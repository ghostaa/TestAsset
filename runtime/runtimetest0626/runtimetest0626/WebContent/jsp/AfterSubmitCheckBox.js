window.AfterSubmitCheckBox = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'AfterSubmitCheckBox_btnToggleJava', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('AfterSubmitCheckBox_chkJava', 'isChecked', ! this.getPW('AfterSubmitCheckBox_chkJava', 'isChecked'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'AfterSubmitCheckBox_btnToggleCpp', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('AfterSubmitCheckBox_chkCpp', 'isChecked', ! this.getPW('AfterSubmitCheckBox_chkCpp', 'isChecked'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'AfterSubmitCheckBox_Button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('AfterSubmitCheckBox_Label04', 'text', this.getPW('AfterSubmitCheckBox_chkJava', 'text'));
    this.setPW('AfterSubmitCheckBox_Label06', 'text', this.getPW('AfterSubmitCheckBox_chkCpp', 'text'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(AfterSubmitCheckBox);
});