window.AttributeTwo = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'AttributeTwo_link', e: 'onFocus'}],
  onTrue: function(e) {
    this.runWF('AttributeTwo_script', 'execute');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(AttributeTwo);
});