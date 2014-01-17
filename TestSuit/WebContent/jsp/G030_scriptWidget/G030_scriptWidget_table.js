window.G030_scriptWidget_table = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G030_scriptWidget_table_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G030_scriptWidget_table_Script01', 'execute');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(G030_scriptWidget_table);
});