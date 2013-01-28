window.checkbox = [{ /* toggleJava */
  name: 'toggleJava',
  evts: [{ id: 'checkbox_btnToggleJava', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('checkbox_chkJava', 'isChecked', ! this.getPW('checkbox_chkJava', 'isChecked'));
  }
}, 
{ /* toggleCpp */
  name: 'toggleCpp',
  evts: [{ id: 'checkbox_btnToggleCpp', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('checkbox_chkCpp', 'isChecked', ! this.getPW('checkbox_chkCpp', 'isChecked'));
  }
}, 
{ /* toggleDisable */
  name: 'toggleDisable',
  evts: [{ id: 'checkbox_btnToggleDisable', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('checkbox_CheckBox01', 'disabled', ! this.getPW('checkbox_CheckBox01', 'disabled'));
  }
}, 
{ /* toggleReadonly */
  name: 'toggleReadonly',
  evts: [{ id: 'checkbox_btnToggleReadonly', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('checkbox_CheckBox01', 'readOnly', ! this.getPW('checkbox_CheckBox01', 'readOnly'));
  }
}, 
{ /* setText */
  name: 'setText',
  evts: [{ id: 'checkbox_btnSetTextAt', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('checkbox_CheckBox01', 'text', this.getPW('checkbox_checkboxText', 'value'));
  }
}, 
{ /* toggleSubmitReadonly */
  name: 'toggleSubmitReadonly',
  evts: [{ id: 'checkbox_toogleSubmitReadonly', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('checkbox_readonlySubmit', 'readOnly', ! this.getPW('checkbox_readonlySubmit', 'readOnly'));
  }
}, 
{ /* toggleSubmitDisable */
  name: 'toggleSubmitDisable',
  evts: [{ id: 'checkbox_toggleSubmitDisable', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('checkbox_disabelSubmit', 'disabled', ! this.getPW('checkbox_disabelSubmit', 'disabled'));
  }
}, 
{ /* setVisible */
  name: 'setVisible',
  evts: [{ id: 'checkbox_btnVisible', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('checkbox_CheckBox01', 'visibility', 'visible');
  }
}, 
{ /* setHidden */
  name: 'setHidden',
  evts: [{ id: 'checkbox_btnHidden', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('checkbox_CheckBox01', 'visibility', 'hidden');
  }
}, 
{ /* setGone */
  name: 'setGone',
  evts: [{ id: 'checkbox_btnGone', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('checkbox_CheckBox01', 'visibility', 'gone');
  }
}, 
{ /* setFocus */
  name: 'setFocus',
  evts: [{ id: 'checkbox_btnSetFocus', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('checkbox_CheckBox01', 'focus');
  }
}, 
{ /* isFocusable */
  name: 'isFocusable',
  evts: [{ id: 'checkbox_btnIsFocusable', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('checkbox_CheckBox01', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('checkbox_lblIsFocusable', 'text', 'true');
  },
  onFalse: function(e) {
    this.setPW('checkbox_lblIsFocusable', 'text', 'false');
  }
}, 
{ /* hint */
  name: 'hint',
  evts: [{ id: 'checkbox_Button06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('checkbox_CheckBox07', 'hint', 'New hint for checkbox');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(checkbox);
});