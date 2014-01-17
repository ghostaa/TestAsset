window.G003_UC4_Both = [{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'G003_UC4_Both_RadioUncheckRow2', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G003_UC4_Both_table', 'setCellValueByName', 'working', 1, false);
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G003_UC4_Both_RadioCheckRow2', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G003_UC4_Both_table', 'setCellValueByName', 'working', 1, true);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'G003_UC4_Both_table.columnId3', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('G003_UC4_Both_RadioChangeResult', 'text', (this.getPW('G003_UC4_Both_HiddenField01', 'value') * 1) + 1);
    this.setPW('G003_UC4_Both_HiddenField01', 'value', this.getPW('G003_UC4_Both_RadioChangeResult', 'text'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'G003_UC4_Both_CheckedCheckRow3', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G003_UC4_Both_table', 'setCellValueByName', 'completed', 2, true);
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'G003_UC4_Both_CheckedUncheckRow3', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G003_UC4_Both_table', 'setCellValueByName', 'completed', 2, false);
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'G003_UC4_Both_table.columnId2', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('G003_UC4_Both_CheckboxChangeResult', 'text', this.getPW('G003_UC4_Both_table.columnId2', 'isChecked'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(G003_UC4_Both);
});