window.SVT_8103_AccountInfo = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'SVT_8103_AccountInfo_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SVT_8103_AccountInfo_table', 'sortColumn', 'accountNO', true);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'SVT_8103_AccountInfo_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SVT_8103_AccountInfo_table', 'sortColumn', 'accountNO', false);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'SVT_8103_AccountInfo_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SVT_8103_AccountInfo_table', 'sortColumn', 'balance', true);
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'SVT_8103_AccountInfo_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SVT_8103_AccountInfo_table', 'sortColumn', 'balance', false);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(SVT_8103_AccountInfo);
});