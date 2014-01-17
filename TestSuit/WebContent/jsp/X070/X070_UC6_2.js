window.X070_UC6_2 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X070_UC6_2_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X070_UC6_2_table', 'setSortableColumn', 'columnId3', true);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X070_UC6_2_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X070_UC6_2_table', 'sortColumn', 'branch_id', false);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X070_UC6_2);
});