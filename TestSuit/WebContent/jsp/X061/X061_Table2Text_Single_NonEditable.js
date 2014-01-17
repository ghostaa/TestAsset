window.X061_Table2Text_Single_NonEditable = [{ /* ecaRule17 */
  name: 'ecaRule17',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_17', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'calendar_bar', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'calendar_slash', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'date_bar', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'date_slash', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'float_3', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'float_2', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'num_2', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'num_1', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'num_2', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'float_2', 0));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_04', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'currency_usd'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'currency_cny'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'currency_cny'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'currency_usd'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'currency_cny'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'currency_usd'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'currency_cny'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'currency_usd'));
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'currency_usd'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'currency_cny'));
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'currency_usd'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'currency_cny'));
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_07', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'float_2'));
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_08', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'float_2'));
  }
}, 
{ /* ecaRule09 */
  name: 'ecaRule09',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_09', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'float_2'));
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_10', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'float_2'));
  }
}, 
{ /* ecaRule11 */
  name: 'ecaRule11',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_11', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'float_2'));
  }
}, 
{ /* ecaRule12 */
  name: 'ecaRule12',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_12', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'float_2'));
  }
}, 
{ /* ecaRule13 */
  name: 'ecaRule13',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_13', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_label_date_slash', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_date_bar', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_calendar_slash', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_calendar_bar', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_num_1', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_num_2', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_float_2', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_float_3', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_currency_cny', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'currency_cny'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_currency_usd', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInFirstSelectedItem', 'currency_usd'));
  }
}, 
{ /* ecaRule14 */
  name: 'ecaRule14',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_14', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_label_date_slash', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_date_bar', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_calendar_slash', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_calendar_bar', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_num_1', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_num_2', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_float_2', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_float_3', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_currency_cny', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'currency_cny'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_currency_usd', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getObjectInFirstSelectedItem', 'currency_usd'));
  }
}, 
{ /* ecaRule15 */
  name: 'ecaRule15',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_15', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_label_date_slash', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'date_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_date_bar', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'date_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_calendar_slash', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'calendar_slash'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_calendar_bar', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'calendar_bar'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_num_1', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'num_1'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_num_2', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'num_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_float_2', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'float_2'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_float_3', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'float_3'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_currency_cny', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'currency_cny'));
    this.setPW('X061_Table2Text_Single_NonEditable_label_currency_usd', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getValueInSelectedItem', 'currency_usd'));
  }
}, 
{ /* ecaRule19 */
  name: 'ecaRule19',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_19', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'date_bar', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'date_slash', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'calendar_bar', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'calendar_slash', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'num_2', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'num_1', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'float_3', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'float_2', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'currency_usd', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'currency_cny', 0));
  }
}, 
{ /* ecaRule16 */
  name: 'ecaRule16',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_16', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'date_bar', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'date_slash', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'calendar_bar', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'calendar_slash', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'num_2', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'num_1', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'float_3', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'float_2', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'currency_usd', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'currency_cny', 0));
  }
}, 
{ /* ecaRule18 */
  name: 'ecaRule18',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_18', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_label_date_slash', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'date_slash', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_date_bar', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'date_bar', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_calendar_slash', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'calendar_slash', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_calendar_bar', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'calendar_bar', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_num_1', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'num_1', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_num_2', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'num_2', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_float_2', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'float_2', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_float_3', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'float_3', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_currency_cny', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'currency_cny', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_currency_usd', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByName', 'currency_usd', 0));
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_label06', e: 'onClick'}]
}, 
{ /* ecaRule20 */
  name: 'ecaRule20',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_20', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'calendar_bar', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'calendar_slash', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'date_bar', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'date_slash', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'float_3', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'float_2', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'num_2', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'num_1', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'num_2', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'float_2', 0));
  }
}, 
{ /* ecaRule22 */
  name: 'ecaRule22',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_22', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 1, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 0, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 3, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 2, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 5, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 4, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 7, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 6, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 9, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 8, 0));
  }
}, 
{ /* ecaRule23 */
  name: 'ecaRule23',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_23', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 3, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_date_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 2, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_slash', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 1, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_calendar_bar', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 0, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_1', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 7, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_num_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 6, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_2', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 5, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_float_3', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 4, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_cny', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 5, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_text_currency_usd', 'value', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 6, 0));
  }
}, 
{ /* ecaRule21 */
  name: 'ecaRule21',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_21', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_label_date_slash', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'date_slash', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_date_bar', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'date_bar', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_calendar_slash', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'calendar_slash', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_calendar_bar', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'calendar_bar', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_num_1', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'num_1', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_num_2', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'num_2', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_float_2', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'float_2', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_float_3', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'float_3', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_currency_cny', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'currency_cny', 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_currency_usd', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellObjectByName', 'currency_usd', 0));
  }
}, 
{ /* ecaRule24 */
  name: 'ecaRule24',
  evts: [{ id: 'X061_Table2Text_Single_NonEditable_button_24', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('X061_Table2Text_Single_NonEditable_label_date_slash', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 0, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_date_bar', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 1, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_calendar_slash', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 2, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_calendar_bar', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 3, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_num_1', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 4, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_num_2', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 5, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_float_2', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 6, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_float_3', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 7, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_currency_cny', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 8, 0));
    this.setPW('X061_Table2Text_Single_NonEditable_label_currency_usd', 'text', this.runWF('X061_Table2Text_Single_NonEditable_table', 'getCellValueByIndex', 9, 0));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X061_Table2Text_Single_NonEditable);
});