window.AttributeFive = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'AttributeFive_link', e: 'onFocus'}],
  onTrue: function(e) {
    this.runWF('AttributeFive_script', 'execute');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(AttributeFive);
});