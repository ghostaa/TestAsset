window.G016_UC7 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G016_UC7_button', e: 'onClick'}],
  cond: function(e) {
    return BTTUtil.equals(this.runWF('G016_UC7_repetitivePanel', 'getVisibility', 0), 'visible') ;
  },
  onTrue: function(e) {
    this.runWF('G016_UC7_repetitivePanel', 'setVisibility', 0, 'hidden');
    this.setPW('G016_UC7_label01', 'text', 'Product 0 is hidden');
  },
  onFalse: function(e) {
    this.executeAG('actionGroupRule2',e);
  }
}, 
{ /* actionGroupRule2 */
  name: 'actionGroupRule2',
  type:"AG",
  cond: function(e) {
    return BTTUtil.equals(this.runWF('G016_UC7_repetitivePanel', 'getVisibility', 0), 'hidden') ;
  },
  onTrue: function(e) {
    this.runWF('G016_UC7_repetitivePanel', 'setVisibility', 0, 'gone');
    this.setPW('G016_UC7_label01', 'text', 'Product 0 is gone');
  },
  onFalse: function(e) {
    this.executeAG('actionGroupRule3',e);
  }
}, 
{ /* actionGroupRule3 */
  name: 'actionGroupRule3',
  type:"AG",
  cond: function(e) {
    return BTTUtil.equals(this.runWF('G016_UC7_repetitivePanel', 'getVisibility', 0), 'gone') ;
  },
  onTrue: function(e) {
    this.runWF('G016_UC7_repetitivePanel', 'setVisibility', 0, 'visible');
    this.setPW('G016_UC7_label01', 'text', 'Product 0 is visible');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(G016_UC7);
});