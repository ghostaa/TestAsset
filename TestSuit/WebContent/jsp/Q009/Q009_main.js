window.Q009_main = [{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'Q009_main_link02', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().changeFlowEvent('testSubFlow', 'Q009_main_mainContent');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'Q009_main_creditCardRepayLink', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('Q009_BTTContainerFlow', 'Q009_main_mainContent');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'Q009_main_inCityTransferLink', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('Q009_launchFlowFlow', 'Q009_main_mainContent');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'Q009_main_link01', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('Q009_embededDivContainerFlow', 'Q009_main_mainContent');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'Q009_main_link04', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('Q009_stateInDifferFlow', 'Q009_main_mainContent');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'Q009_main_link03', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('IBK_30_Test_XHTML_Flow', 'Q009_main_mainContent');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(Q009_main);
});