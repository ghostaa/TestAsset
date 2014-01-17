[{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'fill', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW(_rule.prefix + '_text', 'value', 'user');
    this.setPW(_rule.prefix + '_text01', 'value', '123');
  }
}]