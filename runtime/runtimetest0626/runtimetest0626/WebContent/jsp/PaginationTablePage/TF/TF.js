window.TF = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TF_tableTF', e: 'onSelected'}]
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'TF_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TF_tableTF', 'disabled', true);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TF_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TF_tableTF', 'disabled', false);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TF);
});