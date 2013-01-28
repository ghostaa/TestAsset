window.TabbedPane06 = [{ /* test */
  name: 'test',
  evts: [{ id: 'TabbedPane06_TabbedPane01', e: 'onClildSelect'}]
}, 
{ /* testa: aa */
  name: 'testa',
  evts: [{ id: 'TabbedPane06_TabbedPane01', e: 'onClildSelect'}]
}, 
{ /* tt1 */
  name: 'tt1',
  evts: [{ id: 'TabbedPane06_Button01', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('TabbedPane06_ContentPane01', 'selected');
  },
  onTrue: function(e) {
    this.runWF('TabbedPane06_TabbedPane01', 'closeChildByIndex', 2);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TabbedPane06);
});