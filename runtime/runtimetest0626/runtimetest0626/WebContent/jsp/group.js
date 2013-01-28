window.group = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'group_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('group_label', 'class', 'cusAuto');
    this.setPW('group_Button17', 'class', '');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(group);
});