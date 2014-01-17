window.G028_UC2_single = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G028_UC2_single_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('G028_UC2_single_form', 'callAsyncOperation', 'G028_initAccountsOp', '12', 30000);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(G028_UC2_single);
});