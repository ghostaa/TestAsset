window.EditableTable = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'EditableTable_button04', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('EditableTable_table', 'isColumnVisible', '3');
  },
  onTrue: function(e) {
    this.runWF('EditableTable_table', 'hideColumn', '3');
  },
  onFalse: function(e) {
    this.runWF('EditableTable_table', 'showColumn', '3');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(EditableTable);
});