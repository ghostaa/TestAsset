window.X061_CopyToTable = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X061_CopyToTable_button_d2d_editable', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_CopyToTable_table_editable', 'setCellValueByName', 'FieldCol', 0, this.getPW('X061_CopyToTable_text_field', 'value'));
    this.runWF('X061_CopyToTable_table_editable', 'setCellValueByName', 'NumberCol', 0, this.getPW('X061_CopyToTable_text_num', 'value'));
    this.runWF('X061_CopyToTable_table_editable', 'setCellValueByName', 'StringCol', 0, this.getPW('X061_CopyToTable_text_str', 'value'));
    this.runWF('X061_CopyToTable_table_editable', 'setCellValueByName', 'DateCol', 0, this.getPW('X061_CopyToTable_text_date', 'value'));
    this.runWF('X061_CopyToTable_table_editable', 'setCellValueByName', 'XGCCol', 0, this.getPW('X061_CopyToTable_text_xgc', 'value'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X061_CopyToTable_button_d2d_non', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_CopyToTable_table_noneditable', 'setCellValueByName', 'FieldCol', 0, this.getPW('X061_CopyToTable_text_field', 'value'));
    this.runWF('X061_CopyToTable_table_noneditable', 'setCellValueByName', 'NumberCol', 0, this.getPW('X061_CopyToTable_text_num', 'value'));
    this.runWF('X061_CopyToTable_table_noneditable', 'setCellValueByName', 'StringCol', 0, this.getPW('X061_CopyToTable_text_str', 'value'));
    this.runWF('X061_CopyToTable_table_noneditable', 'setCellValueByName', 'DateCol', 0, this.getPW('X061_CopyToTable_text_date', 'value'));
    this.runWF('X061_CopyToTable_table_noneditable', 'setCellValueByName', 'XGCCol', 0, this.getPW('X061_CopyToTable_text_xgc', 'value'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'X061_CopyToTable_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_CopyToTable_table_editable', 'setCellValueByName', 'Label2DateCol', 0, this.getPW('X061_CopyToTable_Label09', 'text'));
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'X061_CopyToTable_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_CopyToTable_table_editable', 'setCellValueByName', 'Label2XGCCol', 0, this.getPW('X061_CopyToTable_Label10', 'text'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X061_CopyToTable);
});