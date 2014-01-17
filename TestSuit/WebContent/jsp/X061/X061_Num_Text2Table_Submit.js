window.X061_Num_Text2Table_Submit = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X061_Num_Text2Table_Submit_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Num_Text2Table_Submit_table', 'setCellValueByName', 'num_1', 0, this.getPW('X061_Num_Text2Table_Submit_text_num_2', 'value'));
    this.runWF('X061_Num_Text2Table_Submit_table', 'setCellValueByName', 'num_2', 0, this.getPW('X061_Num_Text2Table_Submit_text_num_1', 'value'));
    this.runWF('X061_Num_Text2Table_Submit_table', 'setCellValueByName', 'float_2', 0, this.getPW('X061_Num_Text2Table_Submit_text_float_3', 'value'));
    this.runWF('X061_Num_Text2Table_Submit_table', 'setCellValueByName', 'float_3', 0, this.getPW('X061_Num_Text2Table_Submit_text_float_2', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X061_Num_Text2Table_Submit);
});