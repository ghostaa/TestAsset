window.X070_UC8 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X070_UC8_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X070_UC8_table', 'setSortableColumn', 'columnId2', true);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X070_UC8_button_copy', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X070_UC8_table', 'setSortableColumn', 'columnId2', false);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X070_UC8);
});