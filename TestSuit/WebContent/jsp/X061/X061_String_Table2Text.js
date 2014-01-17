window.X061_String_Table2Text = [{ /* ecaRule26 */
  name: 'ecaRule26',
  evts: [{ id: 'X061_String_Table2Text_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_String_Table2Text_text', 'value', this.runWF('X061_String_Table2Text_table', 'getValueInFirstSelectedItem', 'longString'));
    this.setPW('X061_String_Table2Text_text01', 'value', this.runWF('X061_String_Table2Text_table', 'getObjectInFirstSelectedItem', 'longString'));
    this.setPW('X061_String_Table2Text_text02', 'value', this.runWF('X061_String_Table2Text_table', 'getValueInSelectedItem', 'longString'));
    this.setPW('X061_String_Table2Text_text04', 'value', this.runWF('X061_String_Table2Text_table', 'getCellObjectByName', 'longString', 0));
    this.setPW('X061_String_Table2Text_text05', 'value', this.runWF('X061_String_Table2Text_table', 'getCellValueByIndex', 0, 0));
  }
}, 
{ /* ecaRule25 */
  name: 'ecaRule25',
  evts: [{ id: 'X061_String_Table2Text_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_String_Table2Text_label18', 'text', this.runWF('X061_String_Table2Text_table', 'getValueInFirstSelectedItem', 'longString'));
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X061_String_Table2Text_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_String_Table2Text_table01', 'setCellValueByName', 'longString', 0, this.getPW('X061_String_Table2Text_label18', 'text'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X061_String_Table2Text_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_String_Table2Text_table01', 'setCellValueByName', 'longString', 1, this.getPW('X061_String_Table2Text_text', 'value'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X061_String_Table2Text_button04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_String_Table2Text_table01', 'setCellValueByName', 'longString', 3, this.getPW('X061_String_Table2Text_text02', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X061_String_Table2Text);
});