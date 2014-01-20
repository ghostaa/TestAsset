window.Q002_ECA_Visible_01 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'Q002_ECA_Visible_01_button', e: 'onClick'}],
  onTrue: function(e) {
    BTTDomFunctions.setVisibility(this.getPW('xuiInclude_panel', 'id'), 'hidden');
    BTTDomFunctions.setVisibility(this.getPW('com_ibm_btt_test_login_panel', 'id'), 'hidden');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'Q002_ECA_Visible_01_button01', e: 'onClick'}],
  onTrue: function(e) {
    BTTDomFunctions.setVisibility(this.getPW('xuiInclude_panel', 'id'), 'gone');
    BTTDomFunctions.setVisibility(this.getPW('com_ibm_btt_test_login_panel', 'id'), 'gone');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'Q002_ECA_Visible_01_button02', e: 'onClick'}],
  onTrue: function(e) {
    BTTDomFunctions.setVisibility(this.getPW('xuiInclude_panel', 'id'), 'visible');
    BTTDomFunctions.setVisibility(this.getPW('com_ibm_btt_test_login_panel', 'id'), 'visible');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(Q002_ECA_Visible_01);
});