window.X061_Date_Table2Text_Multi = [{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X061_Date_Table2Text_Multi_button_01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X061_Date_Table2Text_Multi_button_02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'calendar_bar'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'X061_Date_Table2Text_Multi_button_04', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'X061_Date_Table2Text_Multi_button_05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'calendar_slash'));
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'X061_Date_Table2Text_Multi_button_07', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'date_bar'));
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'X061_Date_Table2Text_Multi_button_08', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'date_bar'));
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'X061_Date_Table2Text_Multi_button_10', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'date_slash'));
  }
}, 
{ /* ecaRule11 */
  name: 'ecaRule11',
  evts: [{ id: 'X061_Date_Table2Text_Multi_button_11', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_text_date_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Date_Table2Text_Multi_text_date_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_slash', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_text_calendar_bar', 'value', this.runWF('X061_Date_Table2Text_Multi_table', 'getObjectInFirstSelectedItem', 'date_slash'));
  }
}, 
{ /* ecaRule13 */
  name: 'ecaRule13',
  evts: [{ id: 'X061_Date_Table2Text_Multi_button_13', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_label_date_slash', 'text', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_label_date_bar', 'text', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_label_calendar_slash', 'text', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_label_calendar_bar', 'text', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
  }
}, 
{ /* ecaRule14 */
  name: 'ecaRule14',
  evts: [{ id: 'X061_Date_Table2Text_Multi_button_14', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Date_Table2Text_Multi_label_date_slash', 'text', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Date_Table2Text_Multi_label_date_bar', 'text', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Date_Table2Text_Multi_label_calendar_slash', 'text', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Date_Table2Text_Multi_label_calendar_bar', 'text', this.runWF('X061_Date_Table2Text_Multi_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X061_Date_Table2Text_Multi);
});