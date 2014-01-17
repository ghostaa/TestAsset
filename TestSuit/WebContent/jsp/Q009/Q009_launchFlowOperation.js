window.Q009_launchFlowOperation = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'Q009_launchFlowOperation_link', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('Q009_BTTContainerFlow', 'Q009_launchFlowOperation_divContainer');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'Q009_launchFlowOperation_button', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('Q009_BTTContainerFlow', '');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(Q009_launchFlowOperation);
});