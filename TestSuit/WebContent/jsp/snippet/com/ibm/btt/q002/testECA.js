[{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'test1', e: 'onClick'}],
  cond: function(e, _rule) {
    return this.getPW(_rule.prefix + '_text', 'disabled');
  },
  onTrue: function(e, _rule) {
    this.setPW(_rule.prefix + '_text', 'disabled', false);
  },
  onFalse: function(e, _rule) {
    this.setPW(_rule.prefix + '_text', 'disabled', true);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'buttonGlobalFunction', e: 'onClick'}],
  cond: function(e, _rule) {
    return BTTStringFunctions.contains('abcd', 'bc');
  },
  onTrue: function(e, _rule) {
    this.setPW(_rule.prefix + '_text', 'value', 'GlobalFunction success');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'calculate', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW(_rule.prefix + '_result', 'text', (this.getPW(_rule.prefix + '_text01', 'value') * 1) + (this.getPW(_rule.prefix + '_text02', 'value') * 1));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'button01', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.executeAG('autoFill',e);
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'button', e: 'onClick'}],
  cond: function(e, _rule) {
    return BTTStringFunctions.contains(this.getPW(_rule.prefix + '_label', 'text'), 'be');
  },
  onTrue: function(e, _rule) {
    this.setPW(_rule.prefix + '_label', 'text', 'eb');
  },
  onFalse: function(e, _rule) {
    this.setPW(_rule.prefix + '_label', 'text', 'be');
  }
}, 
{ /* autoFill */
  name: 'autoFill',
  type:"AG",
  cond: function(e, _rule) {
    return (this.getPW(_rule.prefix + '_text01', 'value') != '1') && (this.getPW(_rule.prefix + '_text02', 'value') != '1');
  },
  onTrue: function(e, _rule) {
    this.setPW(_rule.prefix + '_text01', 'value', 1);
    this.setPW(_rule.prefix + '_text02', 'value', 1);
  },
  onFalse: function(e, _rule) {
    this.setPW(_rule.prefix + '_text01', 'value', '2');
    this.setPW(_rule.prefix + '_text02', 'value', '2');
  }
}]