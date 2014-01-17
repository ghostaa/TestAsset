window.AttributeOne = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'AttributeOne_link', e: 'onFocus'}],
  onTrue: function(e) {
    this.runWF('AttributeOne_script', 'execute');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(AttributeOne);
});