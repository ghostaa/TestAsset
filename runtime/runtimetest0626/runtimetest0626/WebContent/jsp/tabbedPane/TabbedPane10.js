window.TabbedPane10 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TabbedPane10_button', e: 'onKeyPress'}],
  cond: function(e) {
    return this.getPW('TabbedPane10_e', 'altKey') == true;
  },
  onTrue: function(e) {
    this.setPW('TabbedPane10_ContentPane01', 'closable', true);
  },
  onFalse: function(e) {
    this.setPW('TabbedPane10_ContentPane01', 'closable', false);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'TabbedPane10_button01', e: 'onKeyUp'}],
  cond: function(e) {
    return this.getPW('TabbedPane10_e', 'altKey') == true;
  },
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
 public void execute(){
  fireExitEvent("DisplayPageOp");

 }
}))
{
return;
};
  },
  onFalse: function(e) {
    if(false == this.runInlineScript(this, function(){
 public void execute(){
  fireExitEvent("event0");

 }
}))
{
return;
};
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TabbedPane10_button02', e: 'onKeyDown'}]
}];
dojo.addOnLoad(function(){
  engine.registerRules(TabbedPane10);
});