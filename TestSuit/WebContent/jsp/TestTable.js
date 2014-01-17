window.TestTable = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TestTable_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TestTable_table07', 'hideColumn', '0');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'TestTable_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TestTable_table07', 'hideColumn', 2);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TestTable_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TestTable_table08', 'hideColumn', 'columnId1');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TestTable);
});