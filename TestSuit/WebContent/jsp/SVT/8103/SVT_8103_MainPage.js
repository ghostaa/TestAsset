window.SVT_8103_MainPage = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'com_ibm_btt_svt_checkuser_success', e: 'onClick'}, { id: 'com_ibm_btt_svt_checkuser_form', e: 'onAsyncOK'}],
  cond: function(e) {
    return BTTUtil.equals(this.getPW('com_ibm_btt_svt_checkuser_success', 'visibility'), 'visible') ;
  },
  onTrue: function(e) {
    this.setPW('SVT_8103_MainPage_link', 'visibility', 'visible');
  },
  onFalse: function(e) {
    this.setPW('SVT_8103_MainPage_link', 'visibility', 'gone');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'SVT_8103_MainPage_button', e: 'onClick'}],
  cond: function(e) {
    return BTTUtil.equals(this.getPW('com_ibm_btt_svt_checkuser_success', 'visibility'), 'visible') ;
  },
  onTrue: function(e) {
    this.setPW('SVT_8103_MainPage_link', 'visibility', 'visible');
  },
  onFalse: function(e) {
    this.setPW('SVT_8103_MainPage_link', 'visibility', 'gone');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(SVT_8103_MainPage);
});