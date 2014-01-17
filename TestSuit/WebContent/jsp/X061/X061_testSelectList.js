window.X061_testSelectList = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X061_testSelectList_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_testSelectList_text01', 'value', this.runWF('X061_testSelectList_table', 'getValueInSelectedItem', 'StringData'));
    this.setPW('X061_testSelectList_text02', 'value', this.runWF('X061_testSelectList_table', 'getValueInSelectedItem', 'NumberData'));
    this.setPW('X061_testSelectList_label04', 'text', this.runWF('X061_testSelectList_table', 'getValueInSelectedItem', 'StringData'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X061_testSelectList_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_testSelectList_selectList', 'value', this.runWF('X061_testSelectList_table', 'getValueInSelectedItem', 'StringData'));
    this.setPW('X061_testSelectList_selectList01', 'value', this.runWF('X061_testSelectList_table', 'getValueInSelectedItem', 'NumberData'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X061_testSelectList_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_testSelectList_combo', 'value', this.runWF('X061_testSelectList_table', 'getValueInSelectedItem', 'StringData'));
    this.setPW('X061_testSelectList_combo01', 'value', this.runWF('X061_testSelectList_table', 'getValueInSelectedItem', 'NumberData'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X061_testSelectList);
});