window.B001_UC1 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'B001_UC1_button', e: 'onClick', repeatAt: 'B001_UC1_repetitivePanel'}],
  onTrue: function(e) {
    BTTDomFunctions.setVisibility(this.getPW('B001_UC1_panel04'+ this.idxPostfix, 'id'), 'gone');
  },
  repeatActionAt: 'B001_UC1_repetitivePanel'
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'B001_UC1_button', e: 'onBlur', repeatAt: 'B001_UC1_repetitivePanel'}],
  onTrue: function(e) {
    BTTDomFunctions.setVisibility(this.getPW('B001_UC1_panel04'+ this.idxPostfix, 'id'), 'visible');
  },
  repeatActionAt: 'B001_UC1_repetitivePanel'
}];
dojo.addOnLoad(function(){
  engine.registerRules(B001_UC1);
});