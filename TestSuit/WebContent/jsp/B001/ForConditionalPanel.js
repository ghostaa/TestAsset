window.ForConditionalPanel = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'ForConditionalPanel_button', e: 'onClick', repeatAt: 'ForConditionalPanel_repetitivePanel'}],
  onTrue: function(e) {
    BTTDomFunctions.setVisibility(this.getPW('ForConditionalPanel_panel04'+ this.idxPostfix, 'id'), 'gone');
  },
  repeatActionAt: 'ForConditionalPanel_repetitivePanel'
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'ForConditionalPanel_button', e: 'onBlur', repeatAt: 'ForConditionalPanel_repetitivePanel'}],
  onTrue: function(e) {
    BTTDomFunctions.setVisibility(this.getPW('ForConditionalPanel_panel04'+ this.idxPostfix, 'id'), 'visible');
  },
  repeatActionAt: 'ForConditionalPanel_repetitivePanel'
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'ForConditionalPanel_button01', e: 'onClick', repeatAt: 'ForConditionalPanel_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('ForConditionalPanel_label31', 'text', this.getPW('ForConditionalPanel_label06'+ this.idxPostfix, 'text'));
  },
  repeatActionAt: 'ForConditionalPanel_repetitivePanel'
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'ForConditionalPanel_button03', e: 'onClick', repeatAt: 'ForConditionalPanel_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('ForConditionalPanel_hiddenField_AcctNo', 'value', this.getPW('ForConditionalPanel_label06'+ this.idxPostfix, 'text'));
  },
  repeatActionAt: 'ForConditionalPanel_repetitivePanel'
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'ForConditionalPanel_button02_1', e: 'onClick', repeatAt: 'ForConditionalPanel_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('ForConditionalPanel_hiddenField_AcctNo', 'value', this.getPW('ForConditionalPanel_label06'+ this.idxPostfix, 'text'));
  },
  repeatActionAt: 'ForConditionalPanel_repetitivePanel'
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'ForConditionalPanel_label31', e: 'onClick'}]
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'ForConditionalPanel_button02', e: 'onClick', repeatAt: 'ForConditionalPanel_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('ForConditionalPanel_hiddenField_AcctNo', 'value', this.getPW('ForConditionalPanel_label06'+ this.idxPostfix, 'text'));
  },
  repeatActionAt: 'ForConditionalPanel_repetitivePanel'
}];
dojo.addOnLoad(function(){
  engine.registerRules(ForConditionalPanel);
});