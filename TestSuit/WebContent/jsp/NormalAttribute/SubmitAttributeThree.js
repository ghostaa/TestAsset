window.SubmitAttributeThree = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'SubmitAttributeThree_text', e: 'onFocus'}],
  onTrue: function(e) {
    this.runWF('SubmitAttributeThree_script', 'execute');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(SubmitAttributeThree);
});