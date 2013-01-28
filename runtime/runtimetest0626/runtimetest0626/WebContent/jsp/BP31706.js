window.BP31706 = [{ /* SUBMIT */
  name: 'SUBMIT',
  evts: [{ id: 'BP31706_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('BP31706_mainForm', 'submit');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(BP31706);
});