window.eca3 = [{ /* preSubmitDos */
  name: 'preSubmitDos',
  evts: [{ id: 'eca3_btnSubmit', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('eca3_rtxtSignature', 'value') != '';
  },
  onTrue: function(e) {
    this.setPW('eca3_rtxtSignatureCopy', 'value', this.getPW('eca3_rtxtSignature', 'value'));
    this.setPW('eca3_btnSubmit', 'text', 'Submitting...');
    this.setPW('eca3_rtxtSignature', 'readOnly', true);
    this.setPW('eca3_rtxtInfo', 'value', 'Submitting forms to server...');
  },
  onFalse: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'You must input a signature to signature box before submitting to server.');
  }
}, 
{ /* doAfterReset */
  name: 'doAfterReset',
  evts: [{ id: 'eca3_btnReset', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca3_rtxtSignature', 'readOnly', false);
    this.setPW('eca3_rtxtInfo', 'value', 'Signature boxes can be edited now!');
    this.setPW('eca3_rtxtSignature', 'visibility', 'visible');
    this.setPW('eca3_rtxtSignatureCopy', 'visibility', 'visible');
  },
  onFalse: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'All signature boxes are editable!');
  }
}, 
{ /* EventOnClick */
  name: 'EventOnClick',
  evts: [{ id: 'eca3_rtxtSignature', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box \"onClick\" event is triggered!');
  }
}, 
{ /* EventOnFocus */
  name: 'EventOnFocus',
  evts: [{ id: 'eca3_rtxtSignature', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box \"onFocus\" event is triggered!');
  }
}, 
{ /* EventOnBlur */
  name: 'EventOnBlur',
  evts: [{ id: 'eca3_rtxtSignature', e: 'onBlur'}],
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box \"onBlur\" event is triggered!');
    this.setPW('eca3_rtxtSignatureCopy', 'value', this.getPW('eca3_rtxtSignature', 'value'));
  }
}, 
{ /* EventOn */
  name: 'EventOn',
  evts: [{ id: 'eca3_rtxtSignature', e: 'onKeyDown'}],
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box \"onKeyDown\" event is triggered!');
  }
}, 
{ /* EventOnKeyPress */
  name: 'EventOnKeyPress',
  evts: [{ id: 'eca3_rtxtSignature', e: 'onKeyPress'}],
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box \"onKeyPress\" event is triggered!');
  }
}, 
{ /* EventOnKeyUp */
  name: 'EventOnKeyUp',
  evts: [{ id: 'eca3_rtxtSignature', e: 'onKeyUp'}],
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box \"onKeyUp\" event is triggered!');
  }
}, 
{ /* EventOnMouseEnter */
  name: 'EventOnMouseEnter',
  evts: [{ id: 'eca3_rtxtSignature', e: 'onMouseEnter'}],
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box \"onMouseEnter\" event is triggered!');
  }
}, 
{ /* EventOnMouseLeave */
  name: 'EventOnMouseLeave',
  evts: [{ id: 'eca3_rtxtSignature', e: 'onMouseLeave'}],
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box \"onMouseLeave\" event is triggered!');
  }
}, 
{ /* EventOnMouseMove */
  name: 'EventOnMouseMove',
  evts: [{ id: 'eca3_rtxtSignature', e: 'onMouseMove'}],
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', '<b\>Signature box \"onMouseMove\" event is triggered!</b\>');
  }
}, 
{ /* EventOnChange */
  name: 'EventOnChange',
  evts: [{ id: 'eca3_rtxtSignature', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box \"onChange\" event is triggered!');
  }
}, 
{ /* doSthOnValueChanged */
  name: 'doSthOnValueChanged',
  evts: [{ id: 'eca3_txtResult', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', '<b\><i\><u\>Server return result changed to: \"' + (this.getPW('eca3_txtResult', 'value') + '\"</u\></i\></b\>'));
  }
}, 
{ /* FocusClick */
  name: 'FocusClick',
  evts: [{ id: 'eca3_btnFocus', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('eca3_rtxtSignature', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box is focusable now!\\n Change it to false!');
    this.runWF('eca3_rtxtSignature', 'focus');
  }
}, 
{ /* ClickReadOnly */
  name: 'ClickReadOnly',
  evts: [{ id: 'eca3_btnReadOnly', e: 'onClick'}],
  cond: function(e) {
    return ! this.getPW('eca3_rtxtSignature', 'readOnly');
  },
  onTrue: function(e) {
    this.setPW('eca3_rtxtSignature', 'readOnly', true);
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box is readOnly');
  },
  onFalse: function(e) {
    this.setPW('eca3_rtxtSignature', 'readOnly', false);
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box is editable');
  }
}, 
{ /* ClickVisible */
  name: 'ClickVisible',
  evts: [{ id: 'eca3_btnVisible', e: 'onClick'}],
  cond: function(e) {
    return ! (this.getPW('eca3_rtxtSignature', 'visibility') == 'hidden');
  },
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box is visible now! Change visibility to hidden!');
    this.setPW('eca3_rtxtSignature', 'visibility', 'hidden');
  },
  onFalse: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box is NOT visible now!');
  }
}, 
{ /* ClickHidden */
  name: 'ClickHidden',
  evts: [{ id: 'eca3_btnHidden', e: 'onClick'}],
  cond: function(e) {
    return ! (this.getPW('eca3_rtxtSignature', 'visibility') == 'gone');
  },
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box is hidden now! Change visibility to gone!');
    this.setPW('eca3_rtxtSignature', 'visibility', 'gone');
  },
  onFalse: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box is NOT hidden now!');
  }
}, 
{ /* ClickGone */
  name: 'ClickGone',
  evts: [{ id: 'eca3_btnGone', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box is gone now! Change visibility to visible!');
    this.setPW('eca3_rtxtSignature', 'visibility', 'visible');
  },
  onFalse: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'Signature box is NOT gnoe now!');
  }
}, 
{ /* CheckIfRTEIsFocusable: check if the RichTextEditor widget is focusable */
  name: 'CheckIfRTEIsFocusable',
  evts: [{ id: 'eca3_btnIsFocusable', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('eca3_rtxtSignature', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'RichTextEditor widget is focusable now!');
    this.runWF('eca3_rtxtSignature', 'focus');
  },
  onFalse: function(e) {
    this.setPW('eca3_rtxtInfo', 'value', 'RichTextEditor widget is NOT focusable now!');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(eca3);
});