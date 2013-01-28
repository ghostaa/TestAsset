window.TheNewTryPage = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TheNewTryPage_button', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('TheNewTryPage_radio', 'disabled') == true;
  },
  onTrue: function(e) {
    this.setPW('TheNewTryPage_radio', 'disabled', false);
  },
  onFalse: function(e) {
    this.setPW('TheNewTryPage_radio', 'disabled', true);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TheNewTryPage);
});