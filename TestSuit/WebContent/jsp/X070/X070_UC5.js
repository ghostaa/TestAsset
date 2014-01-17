window.X070_UC5 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X070_UC5_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X070_UC5_Table01', 'setSortableColumn', 'columnId3', true);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X070_UC5_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X070_UC5_Table01', 'sortColumn', 'branch_id', false);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X070_UC5);
});