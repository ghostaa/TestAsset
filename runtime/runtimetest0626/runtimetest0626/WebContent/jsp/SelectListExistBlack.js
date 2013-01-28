window.SelectListExistBlack = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'SelectListExistBlack_form', e: 'onLoaded'}],
  cond: function(e) {
    return this.getPW('SelectListExistBlack_text', 'required');
  },
  onTrue: function(e) {
    this.setPW('SelectListExistBlack_link', 'target', '_blank');
  },
  onFalse: function(e) {
    this.setPW('SelectListExistBlack_link', 'target', '_blank');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'SelectListExistBlack_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('SelectListExistBlack_text', 'value', this.getPW('SelectListExistBlack_selectList', 'value'));
    this.setPW('SelectListExistBlack_label03', 'text', this.getPW('SelectListExistBlack_selectList', 'value'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'SelectListExistBlack_button01', e: 'onMouseEnter'}],
  cond: function(e) {
    return this.runWF('SelectListExistBlack_form', 'isValid');
  },
  onTrue: function(e) {
    this.setPW('SelectListExistBlack_label04', 'text', BTTStringFunctions.length('......'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'SelectListExistBlack_selectList', e: 'onChange'}],
  cond: function(e) {
    return engine.executeCond("commonCon1931") && engine.executeCond("commonCon1932");
  },
  onTrue: function(e) {
    this.setPW('SelectListExistBlack_label04', 'text', 'the value of select is changed');
  },
  onFalse: function(e) {
    this.setPW('SelectListExistBlack_label04', 'text', 'the value of select is changed');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'SelectListExistBlack_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SelectListExistBlack_selectList01', 'loadStoreFromURL', 'listFiles/select/money.js');
    this.setPW('SelectListExistBlack_text01', 'value', this.getPW('SelectListExistBlack_selectList01', 'value'));
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'SelectListExistBlack_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SelectListExistBlack_selectList01', 'loadStoreFromURL', 'listFiles/select/none.js');
    this.setPW('SelectListExistBlack_text01', 'value', this.getPW('SelectListExistBlack_selectList01', 'value'));
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'SelectListExistBlack_selectList01', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('SelectListExistBlack_text01', 'value', this.getPW('SelectListExistBlack_selectList01', 'value'));
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'SelectListExistBlack_button04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SelectListExistBlack_form', 'callAsyncOperation', 'SelectListExistBlackOp', 'a', 500000000000000);
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'SelectListExistBlack_button05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('SelectListExistBlack_text02', 'value', this.getPW('SelectListExistBlack_selectList02', 'value'));
    this.setPW('SelectListExistBlack_label03', 'text', this.getPW('SelectListExistBlack_selectList02', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(SelectListExistBlack);
});