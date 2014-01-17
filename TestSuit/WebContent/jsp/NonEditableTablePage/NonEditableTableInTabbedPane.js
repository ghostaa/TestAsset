window.NonEditableTableInTabbedPane = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'NonEditableTableInTabbedPane_table_non', e: 'onMenuItemClick'}],
  onTrue: function(e) {
    this.setPW('NonEditableTableInTabbedPane_showMenuItemId', 'text', this.getPW('NonEditableTableInTabbedPane_table_non', 'clickedMenuItemId'));
    this.setPW('NonEditableTableInTabbedPane_showWidgetId', 'text', this.getPW('NonEditableTableInTabbedPane_table_non', 'clickedWidgetId'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'NonEditableTableInTabbedPane_table_mutiple', e: 'onMenuItemClick'}],
  onTrue: function(e) {
    this.executeAG('item700',e);
    this.executeAG('columnId62ItemId730',e);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'NonEditableTableInTabbedPane_table_single', e: 'onMenuItemClick'}],
  cond: function(e) {
    return BTTUtil.equals(this.getPW('NonEditableTableInTabbedPane_table_single', 'clickedMenuItemId'), 'menu0_item0') ;
  },
  onTrue: function(e) {
    this.setPW('NonEditableTableInTabbedPane_label17', 'text', this.runWF('NonEditableTableInTabbedPane_table_single', 'getCellValueByName', 'ContentMenu_Link_NoAction', this.getPW('NonEditableTableInTabbedPane_table_single', 'rowIndex')));
  },
  onFalse: function(e) {
    this.executeAG('GetCellValueByIndex',e);
  }
}, 
{ /* item700 */
  name: 'item700',
  type:"AG",
  cond: function(e) {
    return BTTUtil.equals(this.getPW('NonEditableTableInTabbedPane_table_mutiple', 'clickedMenuItemId'), '700') ;
  },
  onTrue: function(e) {
    this.setPW('NonEditableTableInTabbedPane_show1', 'text', 'Hi,I\'m item 700');
  },
  onFalse: function(e) {
    this.executeAG('item701',e);
  }
}, 
{ /* item701 */
  name: 'item701',
  type:"AG",
  cond: function(e) {
    return BTTUtil.equals(this.getPW('NonEditableTableInTabbedPane_table_mutiple', 'clickedMenuItemId'), '701') ;
  },
  onTrue: function(e) {
    this.setPW('NonEditableTableInTabbedPane_show1', 'text', 'Hi,I\'m item 701 ~');
  }
}, 
{ /* columnId62ItemId730 */
  name: 'columnId62ItemId730',
  type:"AG",
  cond: function(e) {
    return (BTTUtil.equals(this.getPW('NonEditableTableInTabbedPane_table_mutiple', 'clickedWidgetId'), 'columnId62') ) && (BTTUtil.equals(this.getPW('NonEditableTableInTabbedPane_table_mutiple', 'clickedMenuItemId'), 730) );
  },
  onTrue: function(e) {
    this.setPW('NonEditableTableInTabbedPane_show2', 'text', 'Hi,my widgetId is' + this.getPW('NonEditableTableInTabbedPane_table_mutiple', 'clickedWidgetId'));
  },
  onFalse: function(e) {
    this.executeAG('columnId62ItemId731',e);
  }
}, 
{ /* columnId62ItemId731 */
  name: 'columnId62ItemId731',
  type:"AG",
  cond: function(e) {
    return (BTTUtil.equals(this.getPW('NonEditableTableInTabbedPane_table_mutiple', 'clickedWidgetId'), 'columnId62') ) && (BTTUtil.equals(this.getPW('NonEditableTableInTabbedPane_table_mutiple', 'clickedMenuItemId'), '731') );
  },
  onTrue: function(e) {
    this.setPW('NonEditableTableInTabbedPane_show2', 'text', ('HI ,mywidgetId is ' + this.getPW('NonEditableTableInTabbedPane_table_mutiple', 'clickedWidgetId')) + (' ,my itemId is ' + this.getPW('NonEditableTableInTabbedPane_table_mutiple', 'clickedMenuItemId')));
  }
}, 
{ /* GetCellValueByIndex */
  name: 'GetCellValueByIndex',
  type:"AG",
  cond: function(e) {
    return BTTUtil.equals(this.getPW('NonEditableTableInTabbedPane_table_single', 'clickedMenuItemId'), 'menu0_item1') ;
  },
  onTrue: function(e) {
    this.setPW('NonEditableTableInTabbedPane_label17', 'text', this.runWF('NonEditableTableInTabbedPane_table_single', 'getCellValueByIndex', 5, this.getPW('NonEditableTableInTabbedPane_table_single', 'rowIndex')));
  }
},
{
	name: 'NonEditableTableInTabbedPane_form02.xValidation',
	evts: [{id: 'NonEditableTableInTabbedPane_form02', e:'onLoaded' }],
	cond: function(e) { return true; },
	onTrue: function(e) {
		this.setPW('NonEditableTableInTabbedPane_form02', 'xValidations', [
		{
			name:'xValidation',
			cond:function(e){
				return !(this.getPW('NonEditableTableInTabbedPane_combo', 'value') != '2');
			},
			widgets: ['NonEditableTableInTabbedPane_combo'],
			hint: 'The value must be set 2'
		}]);
	} 
}];
dojo.addOnLoad(function(){
  engine.registerRules(NonEditableTableInTabbedPane);
});