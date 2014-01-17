window.TableAppendFromOp = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TableAppendFromOp_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TableAppendFromOp_Script01', 'execute');
    this.runWF('TableAppendFromOp_form', 'callAsyncOperation', 'IBK_F_018_TableDataAppendOp', 'TableAppend', 60000);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'TableAppendFromOp_form', e: 'onAsyncOK'}],
  onTrue: function(e) {
    this.runWF('TableAppendFromOp_Script02', 'execute', 'CurrentLocation');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TableAppendFromOp);
});