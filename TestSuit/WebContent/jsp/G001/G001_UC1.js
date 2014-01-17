window.G001_UC1 = [{ /* ecaRule15 */
  name: 'ecaRule15',
  evts: [{ id: 'G001_UC1_button04', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G001_UC1_label05', 'text', this.runWF('G001_UC1_table', 'getCellValueByName', 'historyID', 8));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'G001_UC1_button_hide01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC1_table', 'hideColumn', 'columnId0');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'G001_UC1_button_hide02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC1_table', 'hideColumn', 'columnId1');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'G001_UC1_button_hide03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC1_table', 'hideColumn', 'columnId2');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'G001_UC1_button_hide04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC1_table', 'hideColumn', 'columnId3');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'G001_UC1_button_hide05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC1_table', 'hideColumn', 'columnId4');
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'G001_UC1_button_hide06', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC1_table', 'hideColumn', 'columnId5');
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'G001_UC1_button_show01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC1_table', 'showColumn', 'columnId0');
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'G001_UC1_button_show02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC1_table', 'showColumn', 'columnId1');
  }
}, 
{ /* ecaRule09 */
  name: 'ecaRule09',
  evts: [{ id: 'G001_UC1_button_show03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC1_table', 'showColumn', 'columnId2');
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'G001_UC1_button_show04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC1_table', 'showColumn', 'columnId3');
  }
}, 
{ /* ecaRule11 */
  name: 'ecaRule11',
  evts: [{ id: 'G001_UC1_button_show05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC1_table', 'showColumn', 'columnId4');
  }
}, 
{ /* ecaRule12 */
  name: 'ecaRule12',
  evts: [{ id: 'G001_UC1_button_show06', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC1_table', 'showColumn', 'columnId5');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G001_UC1_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G001_UC1_label02', 'text', this.runWF('G001_UC1_table', 'getCellValueByIndex', 4, 0));
  }
}, 
{ /* ecaRule14 */
  name: 'ecaRule14',
  evts: [{ id: 'G001_UC1_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC1_table', 'setCellValueByIndex', 4, 0, '9999');
  }
}, 
{ /* ecaRule16 */
  name: 'ecaRule16',
  evts: [{ id: 'G001_UC1_button05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G001_UC1_table', 'setCellValueByName', 'comments', 2, 'hello world');
  }
}, 
{ /* ecaRule17 */
  name: 'ecaRule17',
  evts: [{ id: 'G001_UC1_button06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G001_UC1_label08', 'text', this.runWF('G001_UC1_table', 'getValueInSelectedItem', 'toAccount'));
  }
}, 
{ /* ecaRule18 */
  name: 'ecaRule18',
  evts: [{ id: 'G001_UC1_button07', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G001_UC1_label10', 'text', this.runWF('G001_UC1_table', 'getValueInFirstSelectedItem', 'transfer_date'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(G001_UC1);
});