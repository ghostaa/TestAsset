[{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'button', e: 'onClick', repeatAt: 'repetitivePanel'}],
  onTrue: function(e, _rule) {
    this.setPW(_rule.prefix + '_selectedName', 'text', this.getPW(_rule.prefix + '_productName'+ this.idxPostfix, 'text'));
    this.setPW(_rule.prefix + '_label02'+ this.idxPostfix, 'text', (this.getPW(_rule.prefix + '_label02'+ this.idxPostfix, 'text') * 1) + 1);
  },
  repeatActionAt:'repetitivePanel'
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'label', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW(_rule.prefix + '_label', 'text', 'aa');
  }
}]