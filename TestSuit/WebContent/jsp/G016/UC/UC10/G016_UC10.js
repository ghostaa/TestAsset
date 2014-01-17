window.G016_UC10 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G016_UC10_button', e: 'onClick', repeatAt: 'G016_UC10_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('G016_UC10_selectedName', 'text', this.getPW('G016_UC10_productName'+ this.idxPostfix, 'text'));
    this.setPW('G016_UC10_label02'+ this.idxPostfix, 'text', (this.getPW('G016_UC10_label02'+ this.idxPostfix, 'text') * 1) + 1);
  },
  repeatActionAt: 'G016_UC10_repetitivePanel'
}];
dojo.addOnLoad(function(){
  engine.registerRules(G016_UC10);
});