window.X061_Text2Table_Single_Editable = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X061_Text2Table_Single_Editable_text_date_slash', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Text2Table_Single_Editable_label_date_slash', 'text', this.getPW('X061_Text2Table_Single_Editable_text_date_slash', 'value'));
  }
}, 
{ /* ecaRule13 */
  name: 'ecaRule13',
  evts: [{ id: 'X061_Text2Table_Single_Editable_text_date_bar', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Text2Table_Single_Editable_label_date_bar', 'text', this.getPW('X061_Text2Table_Single_Editable_text_date_bar', 'value'));
  }
}, 
{ /* ecaRule14 */
  name: 'ecaRule14',
  evts: [{ id: 'X061_Text2Table_Single_Editable_text_calendar_slash', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Text2Table_Single_Editable_label_calendar_slash', 'text', this.getPW('X061_Text2Table_Single_Editable_text_calendar_slash', 'value'));
  }
}, 
{ /* ecaRule15 */
  name: 'ecaRule15',
  evts: [{ id: 'X061_Text2Table_Single_Editable_text_calendar_bar', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Text2Table_Single_Editable_label_calendar_bar', 'text', this.getPW('X061_Text2Table_Single_Editable_text_calendar_bar', 'value'));
  }
}, 
{ /* ecaRule_03 */
  name: 'ecaRule_03',
  evts: [{ id: 'X061_Text2Table_Single_Editable_text_num_1', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Text2Table_Single_Editable_label_num_1', 'text', this.getPW('X061_Text2Table_Single_Editable_text_num_1', 'value'));
  }
}, 
{ /* ecaRule_04 */
  name: 'ecaRule_04',
  evts: [{ id: 'X061_Text2Table_Single_Editable_text_num_2', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Text2Table_Single_Editable_label_num_2', 'text', this.getPW('X061_Text2Table_Single_Editable_text_num_2', 'value'));
  }
}, 
{ /* ecaRule_05 */
  name: 'ecaRule_05',
  evts: [{ id: 'X061_Text2Table_Single_Editable_text_float_2', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Text2Table_Single_Editable_label_float_2', 'text', this.getPW('X061_Text2Table_Single_Editable_text_float_2', 'value'));
  }
}, 
{ /* ecaRule_06 */
  name: 'ecaRule_06',
  evts: [{ id: 'X061_Text2Table_Single_Editable_text_float_3', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Text2Table_Single_Editable_label_float_3', 'text', this.getPW('X061_Text2Table_Single_Editable_text_float_3', 'value'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X061_Text2Table_Single_Editable_button_01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 0, 0, this.getPW('X061_Text2Table_Single_Editable_text_date_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 1, 0, this.getPW('X061_Text2Table_Single_Editable_text_date_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 2, 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 3, 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 4, 0, this.getPW('X061_Text2Table_Single_Editable_text_num_1', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 5, 0, this.getPW('X061_Text2Table_Single_Editable_text_num_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 6, 0, this.getPW('X061_Text2Table_Single_Editable_text_float_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 7, 0, this.getPW('X061_Text2Table_Single_Editable_text_float_3', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 8, 0, this.getPW('X061_Text2Table_Single_Editable_text_currency_cny', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 9, 0, this.getPW('X061_Text2Table_Single_Editable_text_currency_usd', 'value'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X061_Text2Table_Single_Editable_button_02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'date_slash', 0, this.getPW('X061_Text2Table_Single_Editable_text_date_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'date_bar', 0, this.getPW('X061_Text2Table_Single_Editable_text_date_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'calendar_slash', 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'calendar_bar', 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'num_1', 0, this.getPW('X061_Text2Table_Single_Editable_text_num_1', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'num_2', 0, this.getPW('X061_Text2Table_Single_Editable_text_num_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'float_2', 0, this.getPW('X061_Text2Table_Single_Editable_text_float_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'float_3', 0, this.getPW('X061_Text2Table_Single_Editable_text_float_3', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'currency_cny', 0, this.getPW('X061_Text2Table_Single_Editable_text_currency_cny', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'currency_usd', 0, this.getPW('X061_Text2Table_Single_Editable_text_currency_usd', 'value'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'X061_Text2Table_Single_Editable_button_04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 0, 0, this.getPW('X061_Text2Table_Single_Editable_text_date_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 1, 0, this.getPW('X061_Text2Table_Single_Editable_text_date_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 2, 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 3, 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 4, 0, this.getPW('X061_Text2Table_Single_Editable_text_num_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 5, 0, this.getPW('X061_Text2Table_Single_Editable_text_num_1', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 6, 0, this.getPW('X061_Text2Table_Single_Editable_text_float_3', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 7, 0, this.getPW('X061_Text2Table_Single_Editable_text_float_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 8, 0, this.getPW('X061_Text2Table_Single_Editable_text_currency_usd', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 9, 0, this.getPW('X061_Text2Table_Single_Editable_text_currency_cny', 'value'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'X061_Text2Table_Single_Editable_button_05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'date_bar', 0, this.getPW('X061_Text2Table_Single_Editable_text_date_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'date_slash', 0, this.getPW('X061_Text2Table_Single_Editable_text_date_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'calendar_bar', 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'calendar_slash', 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'num_1', 0, this.getPW('X061_Text2Table_Single_Editable_text_num_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'num_2', 0, this.getPW('X061_Text2Table_Single_Editable_text_num_1', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'float_2', 0, this.getPW('X061_Text2Table_Single_Editable_text_float_3', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'float_3', 0, this.getPW('X061_Text2Table_Single_Editable_text_float_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'currency_cny', 0, this.getPW('X061_Text2Table_Single_Editable_text_currency_usd', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'currency_usd', 0, this.getPW('X061_Text2Table_Single_Editable_text_currency_cny', 'value'));
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'X061_Text2Table_Single_Editable_button_07', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 0, 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 1, 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 2, 0, this.getPW('X061_Text2Table_Single_Editable_text_date_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 3, 0, this.getPW('X061_Text2Table_Single_Editable_text_date_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 4, 0, this.getPW('X061_Text2Table_Single_Editable_text_float_3', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 5, 0, this.getPW('X061_Text2Table_Single_Editable_text_float_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 6, 0, this.getPW('X061_Text2Table_Single_Editable_text_num_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 7, 0, this.getPW('X061_Text2Table_Single_Editable_text_currency_cny', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 8, 0, this.getPW('X061_Text2Table_Single_Editable_text_num_1', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 9, 0, this.getPW('X061_Text2Table_Single_Editable_text_float_2', 'value'));
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'X061_Text2Table_Single_Editable_button_08', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'date_slash', 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'date_bar', 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'calendar_slash', 0, this.getPW('X061_Text2Table_Single_Editable_text_date_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'calendar_bar', 0, this.getPW('X061_Text2Table_Single_Editable_text_date_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'float_3', 0, this.getPW('X061_Text2Table_Single_Editable_text_num_1', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'float_2', 0, this.getPW('X061_Text2Table_Single_Editable_text_num_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'num_2', 0, this.getPW('X061_Text2Table_Single_Editable_text_float_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'num_1', 0, this.getPW('X061_Text2Table_Single_Editable_text_float_3', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'currency_usd', 0, this.getPW('X061_Text2Table_Single_Editable_text_currency_cny', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'currency_cny', 0, this.getPW('X061_Text2Table_Single_Editable_text_currency_usd', 'value'));
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'X061_Text2Table_Single_Editable_button_10', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 0, 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 1, 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 2, 0, this.getPW('X061_Text2Table_Single_Editable_text_date_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 3, 0, this.getPW('X061_Text2Table_Single_Editable_text_date_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 4, 0, this.getPW('X061_Text2Table_Single_Editable_text_float_3', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 5, 0, this.getPW('X061_Text2Table_Single_Editable_text_float_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 6, 0, this.getPW('X061_Text2Table_Single_Editable_text_num_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 7, 0, this.getPW('X061_Text2Table_Single_Editable_text_currency_cny', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 8, 0, this.getPW('X061_Text2Table_Single_Editable_text_num_1', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 9, 0, this.getPW('X061_Text2Table_Single_Editable_text_float_2', 'value'));
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'X061_Text2Table_Single_Editable_button_11', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'date_slash', 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'date_bar', 0, this.getPW('X061_Text2Table_Single_Editable_text_calendar_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'calendar_slash', 0, this.getPW('X061_Text2Table_Single_Editable_text_date_bar', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'calendar_bar', 0, this.getPW('X061_Text2Table_Single_Editable_text_date_slash', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'float_3', 0, this.getPW('X061_Text2Table_Single_Editable_text_num_1', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'float_2', 0, this.getPW('X061_Text2Table_Single_Editable_text_num_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'num_2', 0, this.getPW('X061_Text2Table_Single_Editable_text_float_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'num_1', 0, this.getPW('X061_Text2Table_Single_Editable_text_float_3', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'currency_usd', 0, this.getPW('X061_Text2Table_Single_Editable_text_num_2', 'value'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'currency_cny', 0, this.getPW('X061_Text2Table_Single_Editable_text_float_2', 'value'));
  }
}, 
{ /* ecaRule09 */
  name: 'ecaRule09',
  evts: [{ id: 'X061_Text2Table_Single_Editable_button_13', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 0, 0, this.getPW('X061_Text2Table_Single_Editable_label_date_slash', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 1, 0, this.getPW('X061_Text2Table_Single_Editable_label_date_bar', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 2, 0, this.getPW('X061_Text2Table_Single_Editable_label_calendar_slash', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 3, 0, this.getPW('X061_Text2Table_Single_Editable_label_calendar_bar', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 4, 0, this.getPW('X061_Text2Table_Single_Editable_label_num_1', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 5, 0, this.getPW('X061_Text2Table_Single_Editable_label_num_2', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 6, 0, this.getPW('X061_Text2Table_Single_Editable_label_float_2', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 7, 0, this.getPW('X061_Text2Table_Single_Editable_label_float_3', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 8, 0, this.getPW('X061_Text2Table_Single_Editable_label_currency_cny', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByIndex', 9, 0, this.getPW('X061_Text2Table_Single_Editable_label_currency_usd', 'text'));
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'X061_Text2Table_Single_Editable_button_14', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'date_slash', 0, this.getPW('X061_Text2Table_Single_Editable_label_date_slash', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'date_bar', 0, this.getPW('X061_Text2Table_Single_Editable_label_date_bar', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'calendar_slash', 0, this.getPW('X061_Text2Table_Single_Editable_label_calendar_slash', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'calendar_bar', 0, this.getPW('X061_Text2Table_Single_Editable_label_calendar_bar', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'num_1', 0, this.getPW('X061_Text2Table_Single_Editable_label_num_1', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'num_2', 0, this.getPW('X061_Text2Table_Single_Editable_label_num_2', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'float_2', 0, this.getPW('X061_Text2Table_Single_Editable_label_float_2', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'float_3', 0, this.getPW('X061_Text2Table_Single_Editable_label_float_3', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'currency_cny', 0, this.getPW('X061_Text2Table_Single_Editable_label_currency_cny', 'text'));
    this.runWF('X061_Text2Table_Single_Editable_table', 'setCellValueByName', 'currency_usd', 0, this.getPW('X061_Text2Table_Single_Editable_label_currency_usd', 'text'));
  }
}, 
{ /* ecaRule11 */
  name: 'ecaRule11',
  evts: [{ id: 'X061_Text2Table_Single_Editable_text_currency_cny', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Text2Table_Single_Editable_label_currency_cny', 'text', this.getPW('X061_Text2Table_Single_Editable_text_currency_cny', 'value'));
  }
}, 
{ /* ecaRule12 */
  name: 'ecaRule12',
  evts: [{ id: 'X061_Text2Table_Single_Editable_text_currency_usd', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('X061_Text2Table_Single_Editable_label_currency_usd', 'text', this.getPW('X061_Text2Table_Single_Editable_text_currency_usd', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X061_Text2Table_Single_Editable);
});