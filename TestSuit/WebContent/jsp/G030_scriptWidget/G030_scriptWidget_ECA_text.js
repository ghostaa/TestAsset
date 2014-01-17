window.G030_scriptWidget_ECA_text = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G030_scriptWidget_ECA_text_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G030_scriptWidget_ECA_text_Script01', 'execute', this.getPW('G030_scriptWidget_ECA_text_text', 'value'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'G030_scriptWidget_ECA_text_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G030_scriptWidget_ECA_text_Script02', 'execute', this.getPW('G030_scriptWidget_ECA_text_text02', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(G030_scriptWidget_ECA_text);
});