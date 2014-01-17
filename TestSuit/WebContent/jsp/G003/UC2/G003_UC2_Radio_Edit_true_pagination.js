window.G003_UC2_Radio_Edit_true_pagination = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G003_UC2_Radio_Edit_true_pagination_CheckedCheckRow3', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G003_UC2_Radio_Edit_true_pagination_table02', 'setCellValueByName', 'completed', 2, true);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'G003_UC2_Radio_Edit_true_pagination_CheckedUncheckRow3', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G003_UC2_Radio_Edit_true_pagination_table02', 'setCellValueByName', 'completed', 2, false);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'G003_UC2_Radio_Edit_true_pagination_RadioCheckRow2', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G003_UC2_Radio_Edit_true_pagination_table02', 'setCellValueByName', 'working', 1, true);
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'G003_UC2_Radio_Edit_true_pagination_RadioUncheckRow2', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G003_UC2_Radio_Edit_true_pagination_table02', 'setCellValueByName', 'working', 1, false);
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'G003_UC2_Radio_Edit_true_pagination_table02.columnId3', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('G003_UC2_Radio_Edit_true_pagination_RadioChangeResult', 'text', (this.getPW('G003_UC2_Radio_Edit_true_pagination_HiddenField01', 'value') * 1) + 1);
    this.setPW('G003_UC2_Radio_Edit_true_pagination_HiddenField01', 'value', this.getPW('G003_UC2_Radio_Edit_true_pagination_RadioChangeResult', 'text'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'G003_UC2_Radio_Edit_true_pagination_table02.columnId2', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('G003_UC2_Radio_Edit_true_pagination_CheckboxChangeResult', 'text', this.getPW('G003_UC2_Radio_Edit_true_pagination_table02.columnId2', 'isChecked'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(G003_UC2_Radio_Edit_true_pagination);
});