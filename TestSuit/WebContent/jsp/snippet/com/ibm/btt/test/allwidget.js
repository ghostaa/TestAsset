[{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'button', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW(_rule.prefix + '_label', 'text', this.getPW(_rule.prefix + '_hiddenField', 'value'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'button01', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW(_rule.prefix + '_label03', 'text', this.getPW(_rule.prefix + '_script', 'location'));
  }
}]