[{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'fill', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW(_rule.prefix + '_text', 'value', 'user');
    this.setPW(_rule.prefix + '_text01', 'value', '123');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'button', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.runWF(_rule.prefix + '_form', 'callAsyncOperation', 'svt_8103_ajax_checkuser_Op', 'callback', 200000, true);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'form', e: 'onAsyncOK'}],
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW(_rule.prefix + '_form', 'asyncCode'), 'callback') ;
  },
  onTrue: function(e, _rule) {
    this.executeAG('checkUserResult',e);
  }
}, 
{ /* checkUserResult */
  name: 'checkUserResult',
  type:"AG",
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW(_rule.prefix + '_hiddenField', 'value'), 'pass') ;
  },
  onTrue: function(e, _rule) {
    BTTDomFunctions.setVisibility(this.getPW(_rule.prefix + '_panel03', 'id'), 'visible');
    BTTDomFunctions.setVisibility(this.getPW(_rule.prefix + '_login', 'id'), 'gone');
    BTTDomFunctions.setVisibility(this.getPW(_rule.prefix + '_panel04', 'id'), 'gone');
    this.setPW(_rule.prefix + '_success', 'visibility', 'visible');
    this.setPW(_rule.prefix + '_fail', 'visibility', 'gone');
  },
  onFalse: function(e, _rule) {
    BTTDomFunctions.setVisibility(this.getPW(_rule.prefix + '_panel03', 'id'), 'hidden');
    BTTDomFunctions.setVisibility(this.getPW(_rule.prefix + '_login', 'id'), 'visible');
    BTTDomFunctions.setVisibility(this.getPW(_rule.prefix + '_panel04', 'id'), 'visible');
    this.setPW(_rule.prefix + '_success', 'visibility', 'gone');
    this.setPW(_rule.prefix + '_fail', 'visibility', 'visible');
  }
}]