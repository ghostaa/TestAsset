window.X061_simple02 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X061_simple02_button_d2d_editable', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_simple02_table_editable', 'setCellValueByName', 'FieldCol', 0, this.getPW('X061_simple02_text_field', 'value'));
    this.runWF('X061_simple02_table_editable', 'setCellValueByName', 'NumberCol', 0, this.getPW('X061_simple02_text_num', 'value'));
    this.runWF('X061_simple02_table_editable', 'setCellValueByName', 'StringCol', 0, this.getPW('X061_simple02_text_str', 'value'));
    this.runWF('X061_simple02_table_editable', 'setCellValueByName', 'DateCol', 0, this.getPW('X061_simple02_text_date', 'value'));
    this.runWF('X061_simple02_table_editable', 'setCellValueByName', 'XGCCol', 0, this.getPW('X061_simple02_text_xgc', 'value'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X061_simple02_button_d2d_non', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_simple02_table_noneditable', 'setCellValueByName', 'FieldCol', 0, this.getPW('X061_simple02_text_field', 'value'));
    this.runWF('X061_simple02_table_noneditable', 'setCellValueByName', 'NumberCol', 0, this.getPW('X061_simple02_text_num', 'value'));
    this.runWF('X061_simple02_table_noneditable', 'setCellValueByName', 'StringCol', 0, this.getPW('X061_simple02_text_str', 'value'));
    this.runWF('X061_simple02_table_noneditable', 'setCellValueByName', 'DateCol', 0, this.getPW('X061_simple02_text_date', 'value'));
    this.runWF('X061_simple02_table_noneditable', 'setCellValueByName', 'XGCCol', 0, this.getPW('X061_simple02_text_xgc', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X061_simple02);
});