window.X070_UC7 = [{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X070_UC7_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X070_UC7_table', 'sortColumn', 'surname', true, 'name', true);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X070_UC7_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X070_UC7_table', 'sortColumn', 'surname', true, 'name', false);
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X070_UC7_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X070_UC7_table', 'sortColumn', 'surname', true, 'name');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'X070_UC7_button_copy', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X070_UC7_table', 'sortColumn', 'surname', 'name', false);
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'X070_UC7_button_05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X070_UC7_table', 'sortColumn', 'surname', '');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'X070_UC7_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X070_UC7_table', 'sortColumn', 'surname', true, 'name');
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'X070_UC7_button04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('X070_UC7_table', 'sortColumn', 'surname', false);
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'X070_UC7_table', e: 'onCellEdit'}],
  onTrue: function(e) {
    this.setPW('X070_UC7_label', 'text', this.runWF('X070_UC7_table', 'getValueInSelectedItem', 'balance'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X070_UC7);
});