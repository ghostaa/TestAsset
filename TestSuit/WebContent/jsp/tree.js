window.tree = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'tree_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('tree_form', 'submit');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(tree);
});