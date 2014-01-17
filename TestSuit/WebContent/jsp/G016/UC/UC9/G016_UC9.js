window.G016_UC9 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G016_UC9_button', e: 'onClick', repeatAt: 'G016_UC9_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('G016_UC9_productName'+ this.idxPostfix, 'text', this.getPW('G016_UC9_productName'+ this.idxPostfix, 'text') + ' clicked ! ');
  },
  repeatActionAt: 'G016_UC9_repetitivePanel'
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'G016_UC9_changeStyle', e: 'onClick', repeatAt: 'G016_UC9_repetitivePanel'}],
  onTrue: function(e) {
    this.runWF('G016_UC9_repetitivePanel', 'setStyleClass', this.runWF('G016_UC9_repetitivePanel', 'getCurrentPanelIndex'), 'specialOffer');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'G016_UC9_cleanStyle', e: 'onClick', repeatAt: 'G016_UC9_repetitivePanel'}],
  cond: function(e) {
    return BTTUtil.equals(this.runWF('G016_UC9_repetitivePanel', 'hasStyleClass', this.runWF('G016_UC9_repetitivePanel', 'getCurrentPanelIndex'), 'specialOffer'), true) ;
  },
  onTrue: function(e) {
    this.runWF('G016_UC9_repetitivePanel', 'setStyleClass', this.runWF('G016_UC9_repetitivePanel', 'getCurrentPanelIndex'), '');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(G016_UC9);
});