window.X061_UC1_date_noneditable = [{ /* ecaRule01_dbclick */
  name: 'ecaRule01_dbclick',
  evts: [{ id: 'X061_UC1_date_noneditable_table', e: 'onRowDblClick'}],
  onTrue: function(e) {
    this.setPW('X061_UC1_date_noneditable_text01', 'value', this.runWF('X061_UC1_date_noneditable_table', 'getValueInSelectedItem', 'Calendar_slash'));
    this.setPW('X061_UC1_date_noneditable_text02', 'value', this.runWF('X061_UC1_date_noneditable_table', 'getValueInSelectedItem', 'Date01'));
    this.setPW('X061_UC1_date_noneditable_label_date', 'text', this.runWF('X061_UC1_date_noneditable_table', 'getValueInSelectedItem', 'Date01'));
    this.setPW('X061_UC1_date_noneditable_label_XMLGC', 'text', this.runWF('X061_UC1_date_noneditable_table', 'getValueInSelectedItem', 'Calendar_slash'));
  }
}, 
{ /* ecaRule02_vifsi_d2d */
  name: 'ecaRule02_vifsi_d2d',
  evts: [{ id: 'X061_UC1_date_noneditable_button_vifsi_d2d', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_UC1_date_noneditable_text01', 'value', this.runWF('X061_UC1_date_noneditable_table', 'getValueInFirstSelectedItem', 'Date01'));
    this.setPW('X061_UC1_date_noneditable_text02', 'value', this.runWF('X061_UC1_date_noneditable_table', 'getValueInFirstSelectedItem', 'Calendar_slash'));
    this.setPW('X061_UC1_date_noneditable_label_date', 'text', this.runWF('X061_UC1_date_noneditable_table', 'getValueInFirstSelectedItem', 'Date01'));
    this.setPW('X061_UC1_date_noneditable_label_XMLGC', 'text', this.runWF('X061_UC1_date_noneditable_table', 'getValueInFirstSelectedItem', 'Calendar_slash'));
  }
}, 
{ /* ecaRule03_vifsi_d2x */
  name: 'ecaRule03_vifsi_d2x',
  evts: [{ id: 'X061_UC1_date_noneditable_button_vifsi_d2x', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_UC1_date_noneditable_text01', 'value', this.runWF('X061_UC1_date_noneditable_table', 'getValueInFirstSelectedItem', 'Calendar_slash'));
    this.setPW('X061_UC1_date_noneditable_text02', 'value', this.runWF('X061_UC1_date_noneditable_table', 'getValueInFirstSelectedItem', 'Date01'));
    this.setPW('X061_UC1_date_noneditable_label_date', 'text', this.runWF('X061_UC1_date_noneditable_table', 'getValueInFirstSelectedItem', 'Calendar_slash'));
    this.setPW('X061_UC1_date_noneditable_label_XMLGC', 'text', this.runWF('X061_UC1_date_noneditable_table', 'getValueInFirstSelectedItem', 'Date01'));
  }
}, 
{ /* ecaRule04_oifsi_d2d */
  name: 'ecaRule04_oifsi_d2d',
  evts: [{ id: 'X061_UC1_date_noneditable_button_oifsi_d2d', e: 'onClick'}]
}, 
{ /* ecaRule05_oifsi_d2x */
  name: 'ecaRule05_oifsi_d2x',
  evts: [{ id: 'X061_UC1_date_noneditable_button_oifsi_d2x', e: 'onClick'}]
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X061_UC1_date_noneditable_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_UC1_date_noneditable_table01', 'setCellValueByIndex', 0, 0, this.getPW('X061_UC1_date_noneditable_text01', 'value'));
    this.runWF('X061_UC1_date_noneditable_table01', 'setCellValueByIndex', 1, 1, this.getPW('X061_UC1_date_noneditable_text02', 'value'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X061_UC1_date_noneditable_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_UC1_date_noneditable_table01', 'setCellValueByIndex', 0, 0, this.getPW('X061_UC1_date_noneditable_text02', 'value'));
    this.runWF('X061_UC1_date_noneditable_table01', 'setCellValueByIndex', 1, 1, this.getPW('X061_UC1_date_noneditable_text01', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X061_UC1_date_noneditable);
});