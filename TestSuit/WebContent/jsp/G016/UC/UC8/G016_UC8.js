window.G016_UC8 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G016_UC8_button', e: 'onClick'}],
  cond: function(e) {
    return BTTUtil.equals(this.runWF('G016_UC8_repetitivePanel', 'hasStyleClass', 0, 'specialOffer'), false) ;
  },
  onTrue: function(e) {
    this.runWF('G016_UC8_repetitivePanel', 'setStyleClass', 0, 'specialOffer');
    this.setPW('G016_UC8_label01', 'text', 'Product 0 is a special offer');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(G016_UC8);
});