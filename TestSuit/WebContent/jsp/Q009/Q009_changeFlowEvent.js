window.Q009_changeFlowEvent = [{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'Q009_changeFlowEvent_link02', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().changeFlowEvent('outdiv', '');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'Q009_changeFlowEvent_link', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().changeFlowEvent('next', 'Q009_changeFlowEvent_divContainer');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(Q009_changeFlowEvent);
});