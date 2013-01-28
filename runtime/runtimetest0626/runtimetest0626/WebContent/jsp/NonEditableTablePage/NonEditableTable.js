window.NonEditableTable = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'NonEditableTable_button04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('NonEditableTable_table', 'focusOn');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'NonEditableTable_table', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('NonEditableTable_label01', 'text', '%nls.BTTResource/Sample');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'NonEditableTable_button05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('NonEditableTable_button05', 'text', this.runWF('NonEditableTable_table', 'getValueInFirstSelectedItem', 'AccountName'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'NonEditableTable_button06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('NonEditableTable_button06', 'text', this.runWF('NonEditableTable_table', 'getLengthOfSelectedRows'));
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'NonEditableTable_button07', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('NonEditableTable_button07', 'text', 'This focus is on the button');
    this.runWF('NonEditableTable_button07', 'focus');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(NonEditableTable);
});