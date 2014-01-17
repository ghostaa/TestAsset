window.G016_UC11 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G016_UC11_button', e: 'onClick'}],
  cond: function(e) {
    return BTTStringFunctions.contains(this.getPW('G016_UC11_productName'+ this.idxPostfix, 'text'), 'new');
  },
  onTrue: function(e) {
    this.setPW('G016_UC11_state'+ this.idxPostfix, 'text', 'Sold out');
  },
  onFalse: function(e) {
    this.setPW('G016_UC11_state'+ this.idxPostfix, 'text', 'Out of stock');
  },
  repeatCondAt: 'G016_UC11_repetitivePanel',
  repeatActionAt: 'G016_UC11_repetitivePanel'
}];
dojo.addOnLoad(function(){
  engine.registerRules(G016_UC11);
});