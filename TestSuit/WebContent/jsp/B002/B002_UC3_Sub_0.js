[{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'B002_UC3_Sub_0_button', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW('B002_UC3_Sub_0_stateFlag', 'value', 'SubFlow');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'B002_UC3_Sub_0_button01', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW('B002_UC3_Sub_0_stateFlag', 'value', 'Operation');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'B002_UC3_Sub_0_button02', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW('B002_UC3_Sub_0_stateFlag', 'value', 'Page');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'B002_UC3_Sub_0_button03', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW('B002_UC3_Sub_0_stateFlag', 'value', 'Popup');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'B002_UC3_Sub_0_button04', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW('B002_UC3_Sub_0_stateFlag', 'value', 'PopupSubFlow');
  }
}]