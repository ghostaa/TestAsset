window.eca2 = [{ /* submitBtnClick: if there is value in textarea, then disable the text area and reset button, or display a message to remind that there should be value in text area */
  name: 'submitBtnClick',
  evts: [{ id: 'eca2_btnSubmit', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('eca2_tareaUserComments', 'value') != '';
  },
  onTrue: function(e) {
    this.setPW('eca2_tareaUserComments', 'readOnly', true);
    this.setPW('eca2_btnReset', 'inValid', true);
  }
}, 
{ /* enableSubmitOnValueNotNull: enable the submit button when there is value in textarea */
  name: 'enableSubmitOnValueNotNull',
  evts: [{ id: 'eca2_tareaUserComments', e: 'onBlur'}],
  cond: function(e) {
    return this.getPW('eca2_tareaUserComments', 'value') != '';
  },
  onTrue: function(e) {
    this.setPW('eca2_btnSubmit', 'inValid', false);
    this.runWF('eca2_btnSubmit', 'focus');
  }
}, 
{ /* allEventOnClick */
  name: 'allEventOnClick',
  evts: [{ id: 'eca2_tareaUserComments', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Event \"onClick\" triggered \\n');
  }
}, 
{ /* AllEventOnFocus */
  name: 'AllEventOnFocus',
  evts: [{ id: 'eca2_tareaUserComments', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Event \"onFocus\" triggered\\n');
  }
}, 
{ /* AllEventOnBlur */
  name: 'AllEventOnBlur',
  evts: [{ id: 'eca2_tareaUserComments', e: 'onBlur'}],
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Event \"Blur\" triggered\\n');
  }
}, 
{ /* AllEventOnKeyDown */
  name: 'AllEventOnKeyDown',
  evts: [{ id: 'eca2_tareaUserComments', e: 'onKeyDown'}],
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Event \"onKeyDown\" triggered\\n');
  }
}, 
{ /* AllEventOnKeyPress */
  name: 'AllEventOnKeyPress',
  evts: [{ id: 'eca2_tareaUserComments', e: 'onKeyPress'}],
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Event \"onKeyPress\" triggered\\n');
  }
}, 
{ /* AllEventOnKeyUp */
  name: 'AllEventOnKeyUp',
  evts: [{ id: 'eca2_tareaUserComments', e: 'onKeyUp'}],
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Event \"onKeyUp\" triggered\\n');
  }
}, 
{ /* AllEventOnMouseDown */
  name: 'AllEventOnMouseDown',
  evts: [{ id: 'eca2_tareaUserComments', e: 'onMouseDown'}],
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Event \"onMouseDown\" triggered\\n');
  }
}, 
{ /* AllEventOnMouseUp */
  name: 'AllEventOnMouseUp',
  evts: [{ id: 'eca2_tareaUserComments', e: 'onMouseUp'}],
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Event \"onMouseUp\" triggered\\n');
  }
}, 
{ /* AllEventOnMouseEnter */
  name: 'AllEventOnMouseEnter',
  evts: [{ id: 'eca2_tareaUserComments', e: 'onMouseEnter'}],
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Event \"onMouseEnter\" triggered\\n');
  }
}, 
{ /* AllEventOnMouseLeave */
  name: 'AllEventOnMouseLeave',
  evts: [{ id: 'eca2_tareaUserComments', e: 'onMouseLeave'}],
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Event \"onMouseLeave\" triggered\\n');
  }
}, 
{ /* AllEventOnMouseMove */
  name: 'AllEventOnMouseMove',
  evts: [{ id: 'eca2_tareaUserComments', e: 'onMouseMove'}],
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Event \"onMouseMove\" triggered\\n');
  }
}, 
{ /* AllEventOnChange */
  name: 'AllEventOnChange',
  evts: [{ id: 'eca2_tareaUserComments', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Event \"onChange\" triggered\\n');
  }
}, 
{ /* chkTxtAreaIsFocusAble */
  name: 'chkTxtAreaIsFocusAble',
  evts: [{ id: 'eca2_btnFocus', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('eca2_tareaUserComments', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'The text area got focus!\\n');
    this.runWF('eca2_tareaUserComments', 'focus');
  }
}, 
{ /* chkTxtAreaIsDisabled */
  name: 'chkTxtAreaIsDisabled',
  evts: [{ id: 'eca2_btnDisable', e: 'onClick'}],
  cond: function(e) {
    return ! this.getPW('eca2_tareaUserComments', 'disabled');
  },
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Text area is disabled!\\n');
    this.setPW('eca2_tareaUserComments', 'disabled', true);
  },
  onFalse: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Text area is enabled\\n');
    this.setPW('eca2_tareaUserComments', 'disabled', false);
  }
}, 
{ /* chkTxtAreaIsReadOnly */
  name: 'chkTxtAreaIsReadOnly',
  evts: [{ id: 'eca2_btnReadOnly', e: 'onClick'}],
  cond: function(e) {
    return ! this.getPW('eca2_tareaUserComments', 'readOnly');
  },
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Text area is read only!\\n');
    this.setPW('eca2_tareaUserComments', 'readOnly', true);
  },
  onFalse: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Text area is editable!\\n');
    this.setPW('eca2_tareaUserComments', 'readOnly', false);
  }
}, 
{ /* chkTextAreaVisibilities */
  name: 'chkTextAreaVisibilities',
  evts: [{ id: 'eca2_btnVisible', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Text area visibility is hidden!\\n');
    this.setPW('eca2_tareaUserComments', 'visibility', 'hidden');
  }
}, 
{ /* chkTextareaVisibilities1 */
  name: 'chkTextareaVisibilities1',
  evts: [{ id: 'eca2_btnGone', e: 'onClick'}],
  cond: function(e) {
    return ! (this.getPW('eca2_tareaUserComments', 'visibility') == 'visible');
  },
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'Text area visibility is visible\\n');
    this.setPW('eca2_tareaUserComments', 'visibility', 'visible');
  }
}, 
{ /* chkTextareaVisibilities2 */
  name: 'chkTextareaVisibilities2',
  evts: [{ id: 'eca2_btnHidden', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('eca2_tareaUserComments', 'visibility', 'gone');
    this.setPW('eca2_txtareaInfo', 'value', 'Text area visibility is gone\\n');
  }
}, 
{ /* CheckIfTextAreaIsForcusable: Check if the textarea can be forcused */
  name: 'CheckIfTextAreaIsForcusable',
  evts: [{ id: 'eca2_btnIsFocusable', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('eca2_tareaUserComments', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'TextArea widget can get focus now!');
    this.runWF('eca2_tareaUserComments', 'focus');
  },
  onFalse: function(e) {
    this.setPW('eca2_txtareaInfo', 'value', 'TextArea widget can NOT get focus now!');
  }
}, 
{ /* isFocusable */
  name: 'isFocusable',
  evts: [{ id: 'eca2_Button03', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('eca2_TextArea02', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('eca2_Label04', 'text', "true");
  },
  onFalse: function(e) {
    this.setPW('eca2_Label04', 'text', "false");
  }
}, 
{ /* hide */
  name: 'hide',
  evts: [{ id: 'eca2_Button04', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('eca2_TextArea02', 'visibility') == 'hidden';
  },
  onTrue: function(e) {
    this.setPW('eca2_TextArea02', 'visibility', 'visible');
  },
  onFalse: function(e) {
    this.setPW('eca2_TextArea02', 'visibility', 'hidden');
  }
}, 
{ /* disabled */
  name: 'disabled',
  evts: [{ id: 'eca2_Button05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca2_TextArea02', 'disabled', ! this.getPW('eca2_TextArea02', 'disabled'));
  }
}, 
{ /* readOnly */
  name: 'readOnly',
  evts: [{ id: 'eca2_Button06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca2_TextArea02', 'readOnly', ! this.getPW('eca2_TextArea02', 'readOnly'));
  }
}, 
{ /* gone */
  name: 'gone',
  evts: [{ id: 'eca2_Button07', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('eca2_TextArea02', 'visibility') == 'gone';
  },
  onTrue: function(e) {
    this.setPW('eca2_TextArea02', 'visibility', 'visible');
  },
  onFalse: function(e) {
    this.setPW('eca2_TextArea02', 'visibility', 'gone');
  }
}, 
{ /* focus */
  name: 'focus',
  evts: [{ id: 'eca2_Button08', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('eca2_TextArea02', 'focus');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(eca2);
});