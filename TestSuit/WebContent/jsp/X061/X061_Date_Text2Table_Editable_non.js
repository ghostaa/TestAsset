window.X061_Date_Text2Table_Editable_non = [{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_button_01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 0, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_slash', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 1, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_bar', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 2, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_slash', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 3, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_bar', 'value'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_button_02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'date_slash', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_slash', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'date_bar', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_bar', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'calendar_slash', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_slash', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'calendar_bar', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_bar', 'value'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_button_04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 0, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_bar', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 1, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_slash', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 2, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_bar', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 3, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_slash', 'value'));
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_button_05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'date_bar', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_slash', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'date_slash', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_bar', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'calendar_bar', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_slash', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'calendar_slash', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_bar', 'value'));
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_button_07', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 0, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_slash', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 1, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_bar', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 2, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_slash', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 3, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_bar', 'value'));
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_button_08', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'date_slash', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_slash', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'date_bar', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_bar', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'calendar_slash', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_slash', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'calendar_bar', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_bar', 'value'));
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_button_10', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 0, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_bar', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 1, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_slash', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 2, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_bar', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 3, 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_slash', 'value'));
  }
}, 
{ /* ecaRule11 */
  name: 'ecaRule11',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_button_11', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'date_slash', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_bar', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'date_bar', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_slash', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'calendar_slash', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_bar', 'value'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'calendar_bar', 0, this.getPW('X061_Date_Text2Table_Editable_non_text_date_slash', 'value'));
  }
}, 
{ /* ecaRule13 */
  name: 'ecaRule13',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_button_13', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 0, 0, this.getPW('X061_Date_Text2Table_Editable_non_label_date_slash', 'text'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 1, 0, this.getPW('X061_Date_Text2Table_Editable_non_label_date_bar', 'text'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 2, 0, this.getPW('X061_Date_Text2Table_Editable_non_label_calendar_slash', 'text'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 3, 0, this.getPW('X061_Date_Text2Table_Editable_non_label_calendar_bar', 'text'));
  }
}, 
{ /* ecaRule14 */
  name: 'ecaRule14',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_button_14', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'date_slash', 0, this.getPW('X061_Date_Text2Table_Editable_non_label_date_slash', 'text'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'date_bar', 0, this.getPW('X061_Date_Text2Table_Editable_non_label_date_bar', 'text'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'calendar_slash', 0, this.getPW('X061_Date_Text2Table_Editable_non_label_calendar_slash', 'text'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'calendar_bar', 0, this.getPW('X061_Date_Text2Table_Editable_non_label_calendar_bar', 'text'));
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_text_date_slash', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Text2Table_Editable_non_label_date_slash', 'text', this.getPW('X061_Date_Text2Table_Editable_non_text_date_slash', 'value'));
  }
}, 
{ /* ecaRule16 */
  name: 'ecaRule16',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_text_date_bar', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Text2Table_Editable_non_label_date_bar', 'text', this.getPW('X061_Date_Text2Table_Editable_non_text_date_bar', 'value'));
  }
}, 
{ /* ecaRule17 */
  name: 'ecaRule17',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_text_calendar_slash', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Text2Table_Editable_non_label_calendar_slash', 'text', this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_slash', 'value'));
  }
}, 
{ /* ecaRule18 */
  name: 'ecaRule18',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_text_calendar_bar', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Text2Table_Editable_non_label_calendar_bar', 'text', this.getPW('X061_Date_Text2Table_Editable_non_text_calendar_bar', 'value'));
  }
}, 
{ /* ecaRule19 */
  name: 'ecaRule19',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_button_16', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 0, 0, this.getPW('X061_Date_Text2Table_Editable_non_label_slash', 'text'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 1, 0, this.getPW('X061_Date_Text2Table_Editable_non_label_slash', 'text'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 2, 0, this.getPW('X061_Date_Text2Table_Editable_non_label_bar', 'text'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByIndex', 3, 0, this.getPW('X061_Date_Text2Table_Editable_non_label_bar', 'text'));
  }
}, 
{ /* ecaRule20 */
  name: 'ecaRule20',
  evts: [{ id: 'X061_Date_Text2Table_Editable_non_button_17', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'date_bar', 0, this.getPW('X061_Date_Text2Table_Editable_non_label_bar', 'text'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'date_slash', 0, this.getPW('X061_Date_Text2Table_Editable_non_label_bar', 'text'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'calendar_bar', 0, this.getPW('X061_Date_Text2Table_Editable_non_label_slash', 'text'));
    this.runWF('X061_Date_Text2Table_Editable_non_table', 'setCellValueByName', 'calendar_slash', 0, this.getPW('X061_Date_Text2Table_Editable_non_label_slash', 'text'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X061_Date_Text2Table_Editable_non);
});