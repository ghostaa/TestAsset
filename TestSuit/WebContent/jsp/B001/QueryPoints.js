window.QueryPoints = [{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'QueryPoints_button02', e: 'onClick'}],
  cond: function(e) {
    return BTTUtil.equals(this.getPW('QueryPoints_conditionalPanel', 'id'), 'QueryPoints_conditionalPanel') ;
  },
  onTrue: function(e) {
    this.setPW('QueryPoints_label16', 'text', 'conditionalPanel\'s id is conditionalPanel, the condition work');
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'QueryPoints_button05', e: 'onClick'}],
  cond: function(e) {
    return BTTUtil.equals(this.getPW('QueryPoints_OptionPanel02', 'id'), 'QueryPoints_OptionPanel02') ;
  },
  onTrue: function(e) {
    this.setPW('QueryPoints_label17', 'text', 'optional panel id work in condition expression');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'QueryPoints_conditionalPanel', e: 'onkeydown'}],
  onTrue: function(e) {
    this.setPW('QueryPoints_label16', 'text', 'conditionalPanel on trigerred on key down');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'QueryPoints_conditionalPanel', e: 'onkeyup'}],
  onTrue: function(e) {
    this.setPW('QueryPoints_label17', 'text', 'conditional panel triggerred on key up');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'QueryPoints_conditionalPanel', e: 'onkeypress'}],
  onTrue: function(e) {
    this.setPW('QueryPoints_label18', 'text', 'conditional panel on key pressed');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'QueryPoints_button03', e: 'onClick'}],
  cond: function(e) {
    return BTTUtil.equals(this.getPW('QueryPoints_conditionalPanel', 'id'), 'conditionalPanel') ;
  },
  onTrue: function(e) {
    this.setPW('QueryPoints_label17', 'text', 'this ECA Rule should not be invoked, Condition not work');
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'QueryPoints_button06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('QueryPoints_conditionalPanel', 'class', 'bg-blue');
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'QueryPoints_button07', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('QueryPoints_OptionPanel01', 'class', 'bg-blue');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(QueryPoints);
});