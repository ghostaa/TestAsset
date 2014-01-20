window.Q002_ECA_test = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'Q002_ECA_test_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('com_ibm_btt_q002_testECA_result', 'text', (this.getPW('com_ibm_btt_q002_testECA_text01', 'value') * 1) * (this.getPW('com_ibm_btt_q002_testECA_text02', 'value') * 1));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'com_ibm_btt_q002_testECA_button', e: 'onClick'}],
  cond: function(e) {
    return BTTUtil.equals(this.getPW('com_ibm_btt_q002_testECA_label', 'text'), 'eb') ;
  },
  onTrue: function(e) {
    this.setPW('Q002_ECA_test_label01', 'text', 'bc');
  },
  onFalse: function(e) {
    this.setPW('Q002_ECA_test_label01', 'text', 'cb');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'Q002_ECA_test_button01', e: 'onClick'}],
  cond: function(e) {
    return BTTUtil.equals(this.getPW('com_ibm_btt_q002_testECA_text', 'visibility'), 'visible') ;
  },
  onTrue: function(e) {
    this.setPW('com_ibm_btt_q002_testECA_text', 'visibility', 'hidden');
  },
  onFalse: function(e) {
    this.setPW('com_ibm_btt_q002_testECA_text', 'visibility', 'visible');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(Q002_ECA_test);
});