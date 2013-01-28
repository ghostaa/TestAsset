window.radiobutton = [{ /* hint */
  name: 'hint',
  evts: [{ id: 'radiobutton_Button06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('radiobutton_Radio09', 'hint', 'New hint for radioButton');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'radiobutton_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('radiobutton_radio07', 'text', 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFG');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'radiobutton_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('radiobutton_selectList', 'loadStoreFromURL', 'listFiles/select/massdata.js');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'radiobutton_button04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('radiobutton_selectList', 'loadStoreFromURL', 'listFiles/select/none.js');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(radiobutton);
});