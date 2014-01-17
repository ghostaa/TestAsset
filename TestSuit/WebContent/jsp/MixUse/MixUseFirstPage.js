window.MixUseFirstPage = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'MixUseFirstPage_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('MixUseFirstPage_text', 'value', '3456');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'MixUseFirstPage_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('MixUseFirstPage_text01', 'value', '123456');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(MixUseFirstPage);
});