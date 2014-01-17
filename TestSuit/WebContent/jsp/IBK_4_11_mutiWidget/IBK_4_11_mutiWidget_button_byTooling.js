window.IBK_4_11_mutiWidget_button_byTooling = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'IBK_4_11_mutiWidget_button_byTooling_table', e: 'onCellWidgetClick'}],
  onTrue: function(e) {
    this.setPW('IBK_4_11_mutiWidget_button_byTooling_RowIndexResult', 'text', this.getPW('IBK_4_11_mutiWidget_button_byTooling_table', 'rowIndex'));
    this.setPW('IBK_4_11_mutiWidget_button_byTooling_WidgetIdResult', 'text', this.getPW('IBK_4_11_mutiWidget_button_byTooling_table', 'clickedWidgetId'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'IBK_4_11_mutiWidget_button_byTooling_table', e: 'onMenuItemClick'}],
  onTrue: function(e) {
    this.setPW('IBK_4_11_mutiWidget_button_byTooling_MenuIdResult', 'text', this.getPW('IBK_4_11_mutiWidget_button_byTooling_table', 'clickedMenuItemId'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(IBK_4_11_mutiWidget_button_byTooling);
});