window.MyCreditAccts = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'MyCreditAccts_button', e: 'onClick', repeatAt: 'MyCreditAccts_repetitivePanel'}],
  onTrue: function(e) {
    BTTDomFunctions.setVisibility(this.getPW('MyCreditAccts_panel04'+ this.idxPostfix, 'id'), 'gone');
  },
  repeatActionAt: 'MyCreditAccts_repetitivePanel'
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'MyCreditAccts_button', e: 'onBlur', repeatAt: 'MyCreditAccts_repetitivePanel'}],
  onTrue: function(e) {
    BTTDomFunctions.setVisibility(this.getPW('MyCreditAccts_panel04'+ this.idxPostfix, 'id'), 'visible');
  },
  repeatActionAt: 'MyCreditAccts_repetitivePanel'
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'MyCreditAccts_button01', e: 'onClick', repeatAt: 'MyCreditAccts_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('MyCreditAccts_label31', 'text', this.getPW('MyCreditAccts_label06'+ this.idxPostfix, 'text'));
  },
  repeatActionAt: 'MyCreditAccts_repetitivePanel'
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'MyCreditAccts_button03', e: 'onClick', repeatAt: 'MyCreditAccts_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('MyCreditAccts_hiddenField_AcctNo', 'value', this.getPW('MyCreditAccts_label06'+ this.idxPostfix, 'text'));
  },
  repeatActionAt: 'MyCreditAccts_repetitivePanel'
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'MyCreditAccts_button02_1', e: 'onClick', repeatAt: 'MyCreditAccts_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('MyCreditAccts_hiddenField_AcctNo', 'value', this.getPW('MyCreditAccts_label06'+ this.idxPostfix, 'text'));
  },
  repeatActionAt: 'MyCreditAccts_repetitivePanel'
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'MyCreditAccts_label31', e: 'onClick'}]
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'MyCreditAccts_button02', e: 'onClick', repeatAt: 'MyCreditAccts_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('MyCreditAccts_hiddenField_AcctNo', 'value', this.getPW('MyCreditAccts_label06'+ this.idxPostfix, 'text'));
  },
  repeatActionAt: 'MyCreditAccts_repetitivePanel'
}];
dojo.addOnLoad(function(){
  engine.registerRules(MyCreditAccts);
});