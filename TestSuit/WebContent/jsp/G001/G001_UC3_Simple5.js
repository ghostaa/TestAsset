window.G001_UC3_Simple5 = [{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'G001_UC3_Simple5_button07', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G001_UC3_Simple5_label10', 'text', this.runWF('G001_UC3_Simple5_table', 'getValueInFirstSelectedItem', 'comments'));
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G001_UC3_Simple5_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G001_UC3_Simple5_label02', 'text', this.runWF('G001_UC3_Simple5_table', 'getCellValueByIndex', 3, 0));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'G001_UC3_Simple5_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC3_Simple5_table', 'setCellValueByIndex', 1, 2, '9999');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'G001_UC3_Simple5_button04', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G001_UC3_Simple5_label05', 'text', this.runWF('G001_UC3_Simple5_table', 'getCellValueByName', 'historyID', 2));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'G001_UC3_Simple5_button05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC3_Simple5_table', 'setCellValueByName', 'toAccount', 2, '1111');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'G001_UC3_Simple5_button06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G001_UC3_Simple5_label08', 'text', this.runWF('G001_UC3_Simple5_table', 'getValueInSelectedItem', 'toAccount'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(G001_UC3_Simple5);
});