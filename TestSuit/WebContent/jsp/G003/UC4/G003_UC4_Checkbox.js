window.G003_UC4_Checkbox = [{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'G003_UC4_Checkbox_RadioUncheckRow2', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G003_UC4_Checkbox_table', 'setCellValueByName', 'working', 1, false);
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G003_UC4_Checkbox_RadioCheckRow2', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G003_UC4_Checkbox_table', 'setCellValueByName', 'working', 1, true);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'G003_UC4_Checkbox_table.columnId3', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('G003_UC4_Checkbox_RadioChangeResult', 'text', (this.getPW('G003_UC4_Checkbox_HiddenField01', 'value') * 1) + 1);
    this.setPW('G003_UC4_Checkbox_HiddenField01', 'value', this.getPW('G003_UC4_Checkbox_RadioChangeResult', 'text'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'G003_UC4_Checkbox_CheckedCheckRow3', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G003_UC4_Checkbox_table', 'setCellValueByName', 'completed', 2, true);
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'G003_UC4_Checkbox_CheckedUncheckRow3', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G003_UC4_Checkbox_table', 'setCellValueByName', 'completed', 2, false);
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'G003_UC4_Checkbox_table.columnId2', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('G003_UC4_Checkbox_CheckboxChangeResult', 'text', this.getPW('G003_UC4_Checkbox_table.columnId2', 'isChecked'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(G003_UC4_Checkbox);
});