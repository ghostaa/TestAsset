window.G030_scriptWidget_counter = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G030_scriptWidget_counter_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G030_scriptWidget_counter_Script01', 'execute', this.getPW('G030_scriptWidget_counter_text', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(G030_scriptWidget_counter);
});