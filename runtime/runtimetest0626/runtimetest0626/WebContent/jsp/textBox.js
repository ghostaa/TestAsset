window.textBox = [{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'textBox_form06', e: 'onClick'}]
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'textBox_form06', e: 'onClick'}]
}, 
{ /* ecaRule14 */
  name: 'ecaRule14',
  evts: [{ id: 'textBox_button20', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('textBox_text65', 'class', 'customStyle');
    this.setPW('textBox_text66', 'class', 'customStyle');
    this.setPW('textBox_text67', 'class', 'customStyle');
    this.setPW('textBox_text68', 'class', 'customStyle');
    this.setPW('textBox_text69', 'class', 'customStyle');
    this.setPW('textBox_text70', 'class', 'customStyle');
  }
}, 
{ /* ecaRule15 */
  name: 'ecaRule15',
  evts: [{ id: 'textBox_button21', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('textBox_text65', 'class', '');
    this.setPW('textBox_text66', 'class', '');
    this.setPW('textBox_text67', 'class', '');
    this.setPW('textBox_text68', 'class', '');
    this.setPW('textBox_text69', 'class', '');
    this.setPW('textBox_text70', 'class', '');
  }
}, 
{ /* ecaRule16 */
  name: 'ecaRule16',
  evts: [{ id: 'textBox_button22', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('textBox_text71', 'hint', 'new hint');
  }
}, 
{ /* ecaRule17 */
  name: 'ecaRule17',
  evts: [{ id: 'textBox_text88', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('textBox_text88', 'value', '2');
  }
}, 
{ /* ecaRule18 */
  name: 'ecaRule18',
  evts: [{ id: 'textBox_text89', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('textBox_text89', 'value', '2');
  }
}, 
{ /* ecaRule19 */
  name: 'ecaRule19',
  evts: [{ id: 'textBox_text90', e: 'onBlur'}],
  onTrue: function(e) {
    this.setPW('textBox_text90', 'value', '2');
  }
}, 
{ /* ecaRule20 */
  name: 'ecaRule20',
  evts: [{ id: 'textBox_text91', e: 'onKeyDown'}],
  onTrue: function(e) {
    this.setPW('textBox_text91', 'value', '2');
  }
}, 
{ /* ecaRule21 */
  name: 'ecaRule21',
  evts: [{ id: 'textBox_text92', e: 'onKeyPress'}],
  onTrue: function(e) {
    this.setPW('textBox_text92', 'value', '2');
  }
}, 
{ /* ecaRule22 */
  name: 'ecaRule22',
  evts: [{ id: 'textBox_text93', e: 'onKeyUp'}],
  onTrue: function(e) {
    this.setPW('textBox_text93', 'value', '2');
  }
}, 
{ /* ecaRule23 */
  name: 'ecaRule23',
  evts: [{ id: 'textBox_text94', e: 'onMouseDown'}],
  onTrue: function(e) {
    this.setPW('textBox_text94', 'value', '2');
  }
}, 
{ /* ecaRule24 */
  name: 'ecaRule24',
  evts: [{ id: 'textBox_text95', e: 'onMouseUp'}],
  onTrue: function(e) {
    this.setPW('textBox_text95', 'value', '2');
  }
}, 
{ /* ecaRule25 */
  name: 'ecaRule25',
  evts: [{ id: 'textBox_text96', e: 'onMouseEnter'}],
  onTrue: function(e) {
    this.setPW('textBox_text96', 'value', '2');
  }
}, 
{ /* ecaRule26 */
  name: 'ecaRule26',
  evts: [{ id: 'textBox_text97', e: 'onMouseLeave'}],
  onTrue: function(e) {
    this.setPW('textBox_text97', 'value', '2');
  }
}, 
{ /* ecaRule27 */
  name: 'ecaRule27',
  evts: [{ id: 'textBox_text98', e: 'onMouseMove'}],
  onTrue: function(e) {
    this.setPW('textBox_text98', 'value', '2');
  }
}, 
{ /* ecaRule28 */
  name: 'ecaRule28',
  evts: [{ id: 'textBox_text99', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('textBox_text99', 'value', '2');
  }
}, 
{ /* ecaRule29 */
  name: 'ecaRule29',
  evts: [{ id: 'textBox_text100', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('textBox_text100', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('textBox_text100', 'value', 'isFocusable');
  },
  onFalse: function(e) {
    this.setPW('textBox_text100', 'value', 'isNotFocusable');
  }
}, 
{ /* ecaRule30 */
  name: 'ecaRule30',
  evts: [{ id: 'textBox_text101', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('textBox_text101', 'required');
  },
  onTrue: function(e) {
    this.setPW('textBox_text101', 'value', 'IsMandatory');
  },
  onFalse: function(e) {
    this.setPW('textBox_text101', 'value', 'IsNotMandatory');
  }
}, 
{ /* ecaRule31 */
  name: 'ecaRule31',
  evts: [{ id: 'textBox_text104', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('textBox_text104', 'readOnly');
  },
  onTrue: function(e) {
    this.setPW('textBox_text104', 'value', 'ReadOnly');
  },
  onFalse: function(e) {
    this.setPW('textBox_text104', 'value', 'NotReadOnly');
  }
}, 
{ /* ecaRule32 */
  name: 'ecaRule32',
  evts: [{ id: 'textBox_text103', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('textBox_text103', 'disabled');
  },
  onTrue: function(e) {
    this.setPW('textBox_text103', 'value', 'Disabled');
  },
  onFalse: function(e) {
    this.setPW('textBox_text103', 'value', 'NotDisabled');
  }
}, 
{ /* ecaRule33 */
  name: 'ecaRule33',
  evts: [{ id: 'textBox_text102', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('textBox_text102', 'class', 'customStyle');
  }
}, 
{ /* ecaRule34 */
  name: 'ecaRule34',
  evts: [{ id: 'textBox_text105', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('textBox_text105', 'value', 'value');
  }
}, 
{ /* ecaRule35 */
  name: 'ecaRule35',
  evts: [{ id: 'textBox_text106', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('textBox_text106', 'required', true);
  }
}, 
{ /* ecaRule36 */
  name: 'ecaRule36',
  evts: [{ id: 'textBox_text107', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('textBox_text107', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule37 */
  name: 'ecaRule37',
  evts: [{ id: 'textBox_text108', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('textBox_text108', 'disabled', true);
  }
}, 
{ /* ecaRule38 */
  name: 'ecaRule38',
  evts: [{ id: 'textBox_text109', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('textBox_text109', 'readOnly', true);
  }
}, 
{ /* ecaRule39 */
  name: 'ecaRule39',
  evts: [{ id: 'textBox_text110', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('textBox_text110', 'hint', 'new hint');
  }
}, 
{ /* ecaRule40 */
  name: 'ecaRule40',
  evts: [{ id: 'textBox_text111', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('textBox_text111', 'showErrorMessage', 'ErrorMessage');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(textBox);
});