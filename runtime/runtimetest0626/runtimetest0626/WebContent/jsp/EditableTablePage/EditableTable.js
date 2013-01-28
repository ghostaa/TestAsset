window.EditableTable = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'EditableTable_button04', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('EditableTable_table', 'isColumnVisible', 0);
  },
  onTrue: function(e) {
    this.runWF('EditableTable_table', 'hideColumn', 0);
  },
  onFalse: function(e) {
    this.runWF('EditableTable_table', 'showColumn', 0);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'EditableTable_button05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('EditableTable_table', 'setCellValueByName', 'AccountName', 1, 'Meilier');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'EditableTable_button06', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('EditableTable_table', 'setCellValueByIndex', 0, 1, 'Angle');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'EditableTable_button07', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('EditableTable_button07', 'text', this.runWF('EditableTable_table', 'getValueInSelectedItem', 'AccountName'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'EditableTable_button08', e: 'onClick'}],
  cond: function(e) {
    return 'Meilier' == this.runWF('EditableTable_table', 'getCellValueByIndex', 0, 1);
  },
  onTrue: function(e) {
    this.setPW('EditableTable_label09', 'text', 'True');
  },
  onFalse: function(e) {
    this.setPW('EditableTable_label09', 'text', 'False');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'EditableTable_button09', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('EditableTable_table', 'getCellValueByName', 'AccountName', 1) == 'Angle';
  },
  onTrue: function(e) {
    this.setPW('EditableTable_label10', 'text', 'True');
  },
  onFalse: function(e) {
    this.setPW('EditableTable_label10', 'text', 'False');
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'EditableTable_checkBox', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('EditableTable_table', 'isColumnVisible', 0);
  },
  onTrue: function(e) {
    this.runWF('EditableTable_table', 'hideColumn', 0);
  },
  onFalse: function(e) {
    this.runWF('EditableTable_table', 'showColumn', 0);
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'EditableTable_radio', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('EditableTable_table', 'isColumnVisible', 0);
  },
  onTrue: function(e) {
    this.runWF('EditableTable_table', 'hideColumn', 0);
  },
  onFalse: function(e) {
    this.runWF('EditableTable_table', 'showColumn', 0);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(EditableTable);
});