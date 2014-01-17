window.X061_simple01 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X061_simple01_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_simple01_text01', 'value', this.runWF('X061_simple01_table', 'getValueInSelectedItem', 'Calendar_slash'));
    this.setPW('X061_simple01_text02', 'value', this.runWF('X061_simple01_table', 'getValueInSelectedItem', 'Calendar_slash'));
    this.setPW('X061_simple01_text', 'value', BTTDateFunctions.parseDate(this.runWF('X061_simple01_table', 'getValueInSelectedItem', 'Calendar_slash'), 'dd/MM/yyyy'));
    this.setPW('X061_simple01_label04', 'text', this.runWF('X061_simple01_table', 'getValueInSelectedItem', 'Calendar_slash'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X061_simple01_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_simple01_selectList', 'value', this.runWF('X061_simple01_table', 'getValueInSelectedItem', 'Calendar_slash'));
    this.setPW('X061_simple01_selectList01', 'value', this.runWF('X061_simple01_table', 'getValueInSelectedItem', 'Calendar_slash'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X061_simple01_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_simple01_combo', 'value', this.runWF('X061_simple01_table', 'getValueInSelectedItem', 'Calendar_slash'));
    this.setPW('X061_simple01_combo01', 'value', this.runWF('X061_simple01_table', 'getValueInSelectedItem', 'Calendar_slash'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X061_simple01);
});