window.X061_Date_Table2Text_Multi_Editable = [{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'calendar_bar'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'calendar_bar'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_04', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'calendar_slash'));
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'calendar_slash'));
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_07', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'date_bar'));
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_08', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'date_bar'));
  }
}, 
{ /* ecaRule09 */
  name: 'ecaRule09',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_09', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'date_bar'));
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_10', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'date_slash'));
  }
}, 
{ /* ecaRule11 */
  name: 'ecaRule11',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_11', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'date_slash'));
  }
}, 
{ /* ecaRule12 */
  name: 'ecaRule12',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_12', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'date_slash'));
  }
}, 
{ /* ecaRule13 */
  name: 'ecaRule13',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_13', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_label_date_slash', 'text', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_label_date_bar', 'text', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_label_calendar_slash', 'text', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_label_calendar_bar', 'text', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
  }
}, 
{ /* ecaRule14 */
  name: 'ecaRule14',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_14', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_label_date_slash', 'text', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_label_date_bar', 'text', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_label_calendar_slash', 'text', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_label_calendar_bar', 'text', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
  }
}, 
{ /* ecaRule15 */
  name: 'ecaRule15',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_button_15', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_label_date_slash', 'text', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_label_date_bar', 'text', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_label_calendar_slash', 'text', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_label_calendar_bar', 'text', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getValueInSelectedItem', 'calendar_bar'));
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X061_Date_Table2Text_Multi_Editable_table', e: 'onRowDblClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_Editable_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_Editable_table', 'getObjectInFirstSelectedItem', 'date_slash'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X061_Date_Table2Text_Multi_Editable);
});