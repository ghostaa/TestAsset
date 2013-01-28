window.EditableTableInGroup = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'EditableTableInGroup_button02', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('EditableTableInGroup_table', 'isColumnVisible', 0);
  },
  onTrue: function(e) {
    this.runWF('EditableTableInGroup_table', 'hideColumn', 0);
  },
  onFalse: function(e) {
    this.runWF('EditableTableInGroup_table', 'showColumn', 0);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(EditableTableInGroup);
});