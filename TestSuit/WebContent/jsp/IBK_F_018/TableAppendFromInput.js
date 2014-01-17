window.TableAppendFromInput = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TableAppendFromInput_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TableAppendFromInput_form', 'callAsyncOperation', 'IBK_F_018_TableDataAppendInputOp', 'inputForTableAppend', 60000);
    this.runWF('TableAppendFromInput_Script01', 'execute');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TableAppendFromInput);
});