window.message = [{ /* setDefaultI18NMessage */
  name: 'setDefaultI18NMessage',
  evts: [{ id: 'message_btnSetDefaultI18N', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('message_txtMessage', 'value', '%nls.BTTResource/I18N_MESSAGE');
  }
}, 
{ /* showDefaultType */
  name: 'showDefaultType',
  evts: [{ id: 'message_btnShowDefaultType', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('message_rdNormal', 'isChecked');
  },
  onTrue: function(e) {
    this.runWF('message_ecaMessage', 'display', this.getPW('message_txtMessage', 'value'));
  },
  onFalse: function(e) {
    this.runWF('message_ecaMessage', 'displayPopup', this.getPW('message_txtMessage', 'value'));
  }
}, 
{ /* showCustomType */
  name: 'showCustomType',
  evts: [{ id: 'message_btnShowCustomType', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('message_rdNormal', 'isChecked');
  },
  onTrue: function(e) {
    this.runWF('message_ecaMessage', 'display', this.getPW('message_txtMessage', 'value'), this.getPW('message_lblMessageType', 'text'));
  },
  onFalse: function(e) {
    this.runWF('message_ecaMessage', 'displayPopup', this.getPW('message_txtMessage', 'value'), this.getPW('message_lblMessageType', 'text'));
  }
}, 
{ /* radioErrorChanged */
  name: 'radioErrorChanged',
  evts: [{ id: 'message_rdError', e: 'onChange'}],
  cond: function(e) {
    return this.getPW('message_rdError', 'isChecked');
  },
  onTrue: function(e) {
    this.setPW('message_lblMessageType', 'text', this.getPW('message_rdError', 'value'));
  }
}, 
{ /* radioInfoChanged */
  name: 'radioInfoChanged',
  evts: [{ id: 'message_rdInfo', e: 'onChange'}],
  cond: function(e) {
    return this.getPW('message_rdInfo', 'isChecked');
  },
  onTrue: function(e) {
    this.setPW('message_lblMessageType', 'text', this.getPW('message_rdInfo', 'value'));
  }
}, 
{ /* radioWarnChanged */
  name: 'radioWarnChanged',
  evts: [{ id: 'message_rdWarn', e: 'onChange'}],
  cond: function(e) {
    return this.getPW('message_rdWarn', 'isChecked');
  },
  onTrue: function(e) {
    this.setPW('message_lblMessageType', 'text', this.getPW('message_rdWarn', 'value'));
  }
}, 
{ /* showTemplate */
  name: 'showTemplate',
  evts: [{ id: 'message_btnShowTemplate', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('message_rdNormal', 'isChecked');
  },
  onTrue: function(e) {
    this.runWF('message_ecaMessage', 'display', '%nls.BTTResource/I18N_MESSAGE', this.getPW('message_lblMessageType', 'text'), this.getPW('message_txtParam1', 'value'), this.getPW('message_txtParam2', 'value'));
  },
  onFalse: function(e) {
    this.runWF('message_ecaMessage', 'displayPopup', '%nls.BTTResource/I18N_MESSAGE', this.getPW('message_lblMessageType', 'text'), this.getPW('message_txtParam1', 'value'), this.getPW('message_txtParam2', 'value'));
  }
}, 
{ /* closeMessage */
  name: 'closeMessage',
  evts: [{ id: 'message_btnCloseMessage', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('message_ecaMessage', 'closeMessage');
  }
}, 
{ /* button02 */
  name: 'button02',
  evts: [{ id: 'message_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('message_Message104', 'class', 'customStyle');
    this.setPW('message_Message05', 'class', 'customStyle');
  }
}, 
{ /* button03 */
  name: 'button03',
  evts: [{ id: 'message_Button03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('message_Message104', 'class', '');
    this.setPW('message_Message05', 'class', "");
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(message);
});