window.X073_Function_Test = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X073_Function_Test_table', e: 'onCellWidgetClick'}],
  onTrue: function(e) {
    this.setPW('X073_Function_Test_RowIndexResult', 'text', this.getPW('X073_Function_Test_table', 'rowIndex'));
    this.setPW('X073_Function_Test_WidgetIdResult', 'text', this.getPW('X073_Function_Test_table', 'clickedWidgetId'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X073_Function_Test_table', e: 'onMenuItemClick'}],
  onTrue: function(e) {
    this.setPW('X073_Function_Test_MenuIdResult', 'text', this.getPW('X073_Function_Test_table', 'clickedMenuItemId'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X073_Function_Test);
});