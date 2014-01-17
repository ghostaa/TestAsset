window.X061_UC1_date = [{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X061_UC1_date_table', e: 'onRowDblClick'}],
  onTrue: function(e) {
    this.setPW('X061_UC1_date_text_date_bar', 'value', this.runWF('X061_UC1_date_table', 'getObjectInFirstSelectedItem', 'Date_slash'));
    this.setPW('X061_UC1_date_text_calendar_bar', 'value', this.runWF('X061_UC1_date_table', 'getObjectInFirstSelectedItem', 'Calendar_slash'));
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X061_UC1_date_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_UC1_date_table01', 'setCellValueByName', 'Date_slash', 0, this.getPW('X061_UC1_date_text_date_bar', 'value'));
    this.runWF('X061_UC1_date_table01', 'setCellValueByName', 'Calendar_slash', 0, this.getPW('X061_UC1_date_text_calendar_bar', 'value'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X061_UC1_date_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_UC1_date_table01', 'setCellValueByName', 'Calendar_slash', 0, this.getPW('X061_UC1_date_text_date_bar', 'value'));
    this.runWF('X061_UC1_date_table01', 'setCellValueByName', 'Date_slash', 0, this.getPW('X061_UC1_date_text_calendar_bar', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X061_UC1_date);
});