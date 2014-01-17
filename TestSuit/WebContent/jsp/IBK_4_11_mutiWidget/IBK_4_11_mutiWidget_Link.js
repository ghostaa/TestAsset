window.IBK_4_11_mutiWidget_Link = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'IBK_4_11_mutiWidget_Link_table', e: 'onCellWidgetClick'}],
  onTrue: function(e) {
    this.setPW('IBK_4_11_mutiWidget_Link_RowIndexResult', 'text', this.getPW('IBK_4_11_mutiWidget_Link_table', 'rowIndex'));
    this.setPW('IBK_4_11_mutiWidget_Link_WidgetIdResult', 'text', this.getPW('IBK_4_11_mutiWidget_Link_table', 'clickedWidgetId'));
  }
},
{ /* ecaRule01 */
	  name: 'ecaRule01',
	  evts: [{ id: 'IBK_4_11_mutiWidget_Link_table', e: 'onMenuItemClick'}],
	  onTrue: function(e) {
	    this.setPW('IBK_4_11_mutiWidget_Link_MenuItemId', 'text', this.getPW('IBK_4_11_mutiWidget_Link_table', 'clickedMenuItemId'));
	  }
	}


];
dojo.addOnLoad(function(){
  engine.registerRules(IBK_4_11_mutiWidget_Link);
});