window.Q009_stateInDifferFlow = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'Q009_stateInDifferFlow_link02', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('Q009_subFlow', 'Q009_stateInDifferFlow_flow1Container');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'Q009_stateInDifferFlow_link03', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('Q009_BTTContainerFlow', 'Q009_stateInDifferFlow_flow2Container');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'Q009_stateInDifferFlow_link', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('Q009_subFlow', 'Q009_stateInDifferFlow_group');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'Q009_stateInDifferFlow_link04', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('Q009_BTTContainerFlow', 'Q009_stateInDifferFlow_group01');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'Q009_stateInDifferFlow_link05', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('Q009_subFlow', 'Q009_stateInDifferFlow_titlePane');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'Q009_stateInDifferFlow_link06', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('Q009_subFlow', 'Q009_stateInDifferFlow_ContentPane01');
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'Q009_stateInDifferFlow_link07', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('Q009_BTTContainerFlow', 'Q009_stateInDifferFlow_titlePane01');
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'Q009_stateInDifferFlow_link08', e: 'onClick'}],
  onTrue: function(e) {
    Engine.getInstance().launchNewFlow('Q009_BTTContainerFlow', 'Q009_stateInDifferFlow_ContentPane02');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(Q009_stateInDifferFlow);
});