window.form3 = [{ /* isValidReturnValue */
  name: 'isValidReturnValue',
  evts: [{ id: 'form3_Button01', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('form3_Form01', 'isValid');
  },
  onTrue: function(e) {
    this.setPW('form3_Label03', 'text', 'valid is true');
  },
  onFalse: function(e) {
    this.setPW('form3_Label03', 'text', 'valid is false');
  }
}, 
{ /* validateReturnValue */
  name: 'validateReturnValue',
  evts: [{ id: 'form3_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('form3_Form01', 'validate');
  }
}, 
{ /* ECAsubmit */
  name: 'ECAsubmit',
  evts: [{ id: 'form3_Button03', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('form3_Form01', 'isValid');
  },
  onTrue: function(e) {
    this.runWF('form3_Form01', 'submit');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(form3);
});