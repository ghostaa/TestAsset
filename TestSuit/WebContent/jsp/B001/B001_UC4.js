window.B001_UC4 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'B001_UC4_button', e: 'onClick', repeatAt: 'B001_UC4_repetitivePanel'}],
  onTrue: function(e) {
    BTTDomFunctions.setVisibility(this.getPW('B001_UC4_panel04'+ this.idxPostfix, 'id'), 'gone');
  },
  repeatActionAt: 'B001_UC4_repetitivePanel'
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'B001_UC4_button', e: 'onBlur', repeatAt: 'B001_UC4_repetitivePanel'}],
  onTrue: function(e) {
    BTTDomFunctions.setVisibility(this.getPW('B001_UC4_panel04'+ this.idxPostfix, 'id'), 'visible');
  },
  repeatActionAt: 'B001_UC4_repetitivePanel'
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'B001_UC4_button01', e: 'onClick', repeatAt: 'B001_UC4_repetitivePanel'}]
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'B001_UC4_button03', e: 'onClick', repeatAt: 'B001_UC4_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('B001_UC4_hiddenField_AcctNo', 'value', this.getPW('B001_UC4_label06'+ this.idxPostfix, 'text'));
  },
  repeatActionAt: 'B001_UC4_repetitivePanel'
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'B001_UC4_button02_1', e: 'onClick', repeatAt: 'B001_UC4_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('B001_UC4_hiddenField_AcctNo', 'value', this.getPW('B001_UC4_label06'+ this.idxPostfix, 'text'));
  },
  repeatActionAt: 'B001_UC4_repetitivePanel'
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'B001_UC4_button02', e: 'onClick', repeatAt: 'B001_UC4_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('B001_UC4_hiddenField_AcctNo', 'value', this.getPW('B001_UC4_label06'+ this.idxPostfix, 'text'));
  },
  repeatActionAt: 'B001_UC4_repetitivePanel'
}];
dojo.addOnLoad(function(){
  engine.registerRules(B001_UC4);
});