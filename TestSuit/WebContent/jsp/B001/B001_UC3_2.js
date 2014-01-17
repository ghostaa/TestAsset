window.B001_UC3_2 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'B001_UC3_2_button', e: 'onClick', repeatAt: 'B001_UC3_2_repetitivePanel'}],
  onTrue: function(e) {
    BTTDomFunctions.setVisibility(this.getPW('B001_UC3_2_panel04'+ this.idxPostfix, 'id'), 'gone');
  },
  repeatActionAt: 'B001_UC3_2_repetitivePanel'
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'B001_UC3_2_button', e: 'onBlur', repeatAt: 'B001_UC3_2_repetitivePanel'}],
  onTrue: function(e) {
    BTTDomFunctions.setVisibility(this.getPW('B001_UC3_2_panel04'+ this.idxPostfix, 'id'), 'visible');
  },
  repeatActionAt: 'B001_UC3_2_repetitivePanel'
}];
dojo.addOnLoad(function(){
  engine.registerRules(B001_UC3_2);
});