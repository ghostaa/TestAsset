window.X061_Num_Text2Table_Editable = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X061_Num_Text2Table_Editable_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Num_Text2Table_Editable_table', 'setCellValueByName', 'num_1', 0, this.getPW('X061_Num_Text2Table_Editable_text_num_2', 'value'));
    this.runWF('X061_Num_Text2Table_Editable_table', 'setCellValueByName', 'num_2', 0, this.getPW('X061_Num_Text2Table_Editable_text_num_1', 'value'));
    this.runWF('X061_Num_Text2Table_Editable_table', 'setCellValueByName', 'float_2', 0, this.getPW('X061_Num_Text2Table_Editable_text_float_3', 'value'));
    this.runWF('X061_Num_Text2Table_Editable_table', 'setCellValueByName', 'float_3', 0, this.getPW('X061_Num_Text2Table_Editable_text_float_2', 'value'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X061_Num_Text2Table_Editable_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Num_Text2Table_Editable_text_num_1', 'value', this.runWF('X061_Num_Text2Table_Editable_table', 'getCellObjectByName', 'num_2', 0));
    this.setPW('X061_Num_Text2Table_Editable_text_num_2', 'value', this.runWF('X061_Num_Text2Table_Editable_table', 'getCellObjectByName', 'float_2', 0));
    this.setPW('X061_Num_Text2Table_Editable_text_float_2', 'value', this.runWF('X061_Num_Text2Table_Editable_table', 'getCellObjectByName', 'float_3', 0));
    this.setPW('X061_Num_Text2Table_Editable_text_float_3', 'value', this.runWF('X061_Num_Text2Table_Editable_table', 'getCellObjectByName', 'num_1', 0));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X061_Num_Text2Table_Editable_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Num_Text2Table_Editable_text_num_1', 'value', this.runWF('X061_Num_Text2Table_Editable_table', 'getObjectInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Num_Text2Table_Editable_text_num_2', 'value', this.runWF('X061_Num_Text2Table_Editable_table', 'getObjectInFirstSelectedItem', 'float_2'));
    this.setPW('X061_Num_Text2Table_Editable_text_float_2', 'value', this.runWF('X061_Num_Text2Table_Editable_table', 'getObjectInFirstSelectedItem', 'float_3'));
    this.setPW('X061_Num_Text2Table_Editable_text_float_3', 'value', this.runWF('X061_Num_Text2Table_Editable_table', 'getObjectInFirstSelectedItem', 'num_1'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'X061_Num_Text2Table_Editable_text_num_1', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Num_Text2Table_Editable_label_num_1', 'text', this.getPW('X061_Num_Text2Table_Editable_text_num_1', 'value'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'X061_Num_Text2Table_Editable_text_num_2', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Num_Text2Table_Editable_label_num_2', 'text', this.getPW('X061_Num_Text2Table_Editable_text_num_2', 'value'));
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'X061_Num_Text2Table_Editable_text_float_2', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Num_Text2Table_Editable_label_float_2', 'text', this.getPW('X061_Num_Text2Table_Editable_text_float_2', 'value'));
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'X061_Num_Text2Table_Editable_text_float_3', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Num_Text2Table_Editable_label_float_3', 'text', this.getPW('X061_Num_Text2Table_Editable_text_float_3', 'value'));
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'X061_Num_Text2Table_Editable_button04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Num_Text2Table_Editable_table', 'setCellValueByName', 'forCheckBox', 0, this.getPW('X061_Num_Text2Table_Editable_checkBox', 'isChecked'));
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'X061_Num_Text2Table_Editable_button05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Num_Text2Table_Editable_checkBox', 'isChecked', this.runWF('X061_Num_Text2Table_Editable_table', 'getObjectInFirstSelectedItem', 'forCheckBox'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X061_Num_Text2Table_Editable);
});