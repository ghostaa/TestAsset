window.BP31707 = [{ /* ECA_SUMBIT */
  name: 'ECA_SUMBIT',
  evts: [{ id: 'BP31707_button02', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('BP31707_mainForm', 'isValid');
  },
  onTrue: function(e) {
    this.runWF('BP31707_mainForm', 'submit');
  },
  onFalse: function(e) {
    this.runWF('BP31707_message', 'display', '444444444');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(BP31707);
});