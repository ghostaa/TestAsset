window.comboboxtInFlow = [{ /* ecaRule24 */
  name: 'ecaRule24',
  evts: [{ id: 'comboboxtInFlow_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_combo13', 'hint', 'new hint');
  }
}, 
{ /* ecaRule25 */
  name: 'ecaRule25',
  evts: [{ id: 'comboboxtInFlow_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxtInFlow_combo05', 'loadStoreFromURL', 'listFiles/select/normal.js');
  }
}, 
{ /* ecaRule26 */
  name: 'ecaRule26',
  evts: [{ id: 'comboboxtInFlow_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxtInFlow_combo06', 'loadStoreFromURL', 'listFiles/select/none.js');
    this.setPW('comboboxtInFlow_button04', 'visibility', 'visible');
    this.setPW('comboboxtInFlow_button03', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule27 */
  name: 'ecaRule27',
  evts: [{ id: 'comboboxtInFlow_button04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxtInFlow_combo06', 'loadStoreFromURL', 'listFiles/select/normal.js');
    this.setPW('comboboxtInFlow_button04', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule28 */
  name: 'ecaRule28',
  evts: [{ id: 'comboboxtInFlow_btnToggleReadonly', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_propertiesList', 'readOnly', ! this.getPW('comboboxtInFlow_propertiesList', 'readOnly'));
  }
}, 
{ /* ecaRule29 */
  name: 'ecaRule29',
  evts: [{ id: 'comboboxtInFlow_btnToggleDisable', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_propertiesList', 'disabled', ! this.getPW('comboboxtInFlow_propertiesList', 'disabled'));
  }
}, 
{ /* ecaRule30 */
  name: 'ecaRule30',
  evts: [{ id: 'comboboxtInFlow_btnSetFocus', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxtInFlow_propertiesList', 'focus');
  }
}, 
{ /* ecaRule31 */
  name: 'ecaRule31',
  evts: [{ id: 'comboboxtInFlow_btnVisible', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_propertiesList', 'visibility', 'visible');
  }
}, 
{ /* ecaRule33 */
  name: 'ecaRule33',
  evts: [{ id: 'comboboxtInFlow_btnHidden', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_propertiesList', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule34 */
  name: 'ecaRule34',
  evts: [{ id: 'comboboxtInFlow_btnGone', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_propertiesList', 'visibility', 'gone');
  }
}, 
{ /* ecaRule35 */
  name: 'ecaRule35',
  evts: [{ id: 'comboboxtInFlow_button05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_propertiesList', 'value', this.getPW('comboboxtInFlow_text', 'value'));
  }
}, 
{ /* ecaRule37 */
  name: 'ecaRule37',
  evts: [{ id: 'comboboxtInFlow_button07', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxtInFlow_selectList40', 'focus');
    this.runWF('comboboxtInFlow_selectList40', 'showErrorMessage', 'Hello Jack, welcome to BTT!(Non-Nls message)');
    this.runWF('comboboxtInFlow_selectList40', 'focus');
    this.runWF('comboboxtInFlow_selectList40', 'showErrorMessage', 'Hello Jack, welcome to BTT!(Non-Nls message)');
  }
}, 
{ /* ecaRule38 */
  name: 'ecaRule38',
  evts: [{ id: 'comboboxtInFlow_button08', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxtInFlow_selectList40', 'focus');
    this.runWF('comboboxtInFlow_selectList40', 'showErrorMessage', 'Dear user: {0}, your age is {AgeParameter}! Welcome to BTT!', 'Jack', 54, 'ExtValuesOfNoUse', 0);
  }
}, 
{ /* ecaRule39 */
  name: 'ecaRule39',
  evts: [{ id: 'comboboxtInFlow_button09', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxtInFlow_selectList40', 'focus');
    this.runWF('comboboxtInFlow_selectList40', 'showErrorMessage', 'This is a constant message, no parameter defined for this message!', 'param0value', 987, true);
  }
}, 
{ /* ecaRule40 */
  name: 'ecaRule40',
  evts: [{ id: 'comboboxtInFlow_button10', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxtInFlow_selectList40', 'focus');
    this.runWF('comboboxtInFlow_selectList40', 'showErrorMessage', '%nls.NlsSupportTestResourse/_2Tip_Message2');
  }
}, 
{ /* ecaRule41 */
  name: 'ecaRule41',
  evts: [{ id: 'comboboxtInFlow_button11', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxtInFlow_selectList40', 'focus');
    this.runWF('comboboxtInFlow_selectList40', 'showErrorMessage', '%nls.BTTResource/I18N_MESSAGE', 'Jack', 27);
  }
}, 
{ /* ecaRule42 */
  name: 'ecaRule42',
  evts: [{ id: 'comboboxtInFlow_button12', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxtInFlow_selectList40', 'focus');
    this.runWF('comboboxtInFlow_selectList40', 'showErrorMessage', '%nls.BTTResource/I18N_MESSAGE', 'Jack', 27, 'ExtValueOfNoUse', false, 7685);
  }
}, 
{ /* ecaRule45 */
  name: 'ecaRule45',
  evts: [{ id: 'comboboxtInFlow_selectList43', e: 'onAsyncError'}],
  onTrue: function(e) {
    this.runWF('comboboxtInFlow_message02', 'display', (this.getPW('comboboxtInFlow_selectList43', 'asyncStatus') + ':') + this.getPW('comboboxtInFlow_selectList43', 'asyncErrorMessage'));
  }
}, 
{ /* ecaRule46 */
  name: 'ecaRule46',
  evts: [{ id: 'comboboxtInFlow_button13', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxtInFlow_selectList43', 'loadStoreFromURL', 'listfiles/select/data.txt');
  }
}, 
{ /* ecaRule14 */
  name: 'ecaRule14',
  evts: [{ id: 'comboboxtInFlow_combo19', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label52', 'text', 'success');
  }
}, 
{ /* ecaRule15 */
  name: 'ecaRule15',
  evts: [{ id: 'comboboxtInFlow_combo20', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label55', 'text', 'success');
  }
}, 
{ /* ecaRule18 */
  name: 'ecaRule18',
  evts: [{ id: 'comboboxtInFlow_combo21', e: 'onBlur'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label56', 'text', 'success');
  }
}, 
{ /* ecaRule32 */
  name: 'ecaRule32',
  evts: [{ id: 'comboboxtInFlow_combo22', e: 'onKeyDown'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label57', 'text', 'success');
  }
}, 
{ /* ecaRule36 */
  name: 'ecaRule36',
  evts: [{ id: 'comboboxtInFlow_combo23', e: 'onKeyPress'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label58', 'text', 'success');
  }
}, 
{ /* ecaRule43 */
  name: 'ecaRule43',
  evts: [{ id: 'comboboxtInFlow_combo24', e: 'onKeyUp'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label59', 'text', 'success');
  }
}, 
{ /* ecaRule44 */
  name: 'ecaRule44',
  evts: [{ id: 'comboboxtInFlow_combo25', e: 'onMouseDown'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label60', 'text', 'success');
  }
}, 
{ /* ecaRule47 */
  name: 'ecaRule47',
  evts: [{ id: 'comboboxtInFlow_combo26', e: 'onMouseUp'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label61', 'text', 'success');
  }
}, 
{ /* ecaRule48 */
  name: 'ecaRule48',
  evts: [{ id: 'comboboxtInFlow_combo27', e: 'onMouseEnter'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label62', 'text', 'success');
  }
}, 
{ /* ecaRule49 */
  name: 'ecaRule49',
  evts: [{ id: 'comboboxtInFlow_combo28', e: 'onMouseLeave'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label63', 'text', 'success');
  }
}, 
{ /* ecaRule50 */
  name: 'ecaRule50',
  evts: [{ id: 'comboboxtInFlow_combo29', e: 'onMouseMove'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label64', 'text', 'success');
  }
}, 
{ /* ecaRule51 */
  name: 'ecaRule51',
  evts: [{ id: 'comboboxtInFlow_combo30', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label65', 'text', 'success');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'comboboxtInFlow_combo31', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('comboboxtInFlow_combo31', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label68', 'text', 'isFoucusable');
  },
  onFalse: function(e) {
    this.setPW('comboboxtInFlow_label68', 'text', 'isNotFoucusable');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'comboboxtInFlow_combo32', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('comboboxtInFlow_combo32', 'disabled');
  },
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label69', 'text', 'Disabled');
  },
  onFalse: function(e) {
    this.setPW('comboboxtInFlow_label69', 'text', 'Abled');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'comboboxtInFlow_combo33', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('comboboxtInFlow_combo33', 'readOnly');
  },
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label70', 'text', 'readOnly');
  },
  onFalse: function(e) {
    this.setPW('comboboxtInFlow_label70', 'text', 'notReadOnly');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'comboboxtInFlow_combo34', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_combo34', 'class', 'customStyle');
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'comboboxtInFlow_combo35', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_combo35', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'comboboxtInFlow_combo36', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_combo36', 'disabled', true);
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'comboboxtInFlow_combo37', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_combo37', 'readOnly', true);
  }
}, 
{ /* ecaRule09 */
  name: 'ecaRule09',
  evts: [{ id: 'comboboxtInFlow_combo38', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_combo38', 'hint', 'new hint');
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'comboboxtInFlow_combo39', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxtInFlow_combo39', 'showErrorMessage', 'Error');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'comboboxtInFlow_button06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_text01', 'value', this.getPW('comboboxtInFlow_combo06', 'value'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'comboboxtInFlow_button14', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_text02', 'value', this.getPW('comboboxtInFlow_combo01', 'value'));
  }
}, 
{ /* ecaRule11 */
  name: 'ecaRule11',
  evts: [{ id: 'comboboxtInFlow_button15', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_ContentPane03', 'disabled', true);
  }
}, 
{ /* ecaRule12 */
  name: 'ecaRule12',
  evts: [{ id: 'comboboxtInFlow_button', e: 'onClick'}]
}, 
{ /* ecaRule13 */
  name: 'ecaRule13',
  evts: [{ id: 'comboboxtInFlow_combo40', e: 'onFocus'}],
  cond: function(e) {
    return this.runWF('comboboxtInFlow_combo40', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label36', 'text', 'isFocusable');
  },
  onFalse: function(e) {
    this.setPW('comboboxtInFlow_label36', 'text', 'isNotFocusable');
  }
}, 
{ /* ecaRule16 */
  name: 'ecaRule16',
  evts: [{ id: 'comboboxtInFlow_combo41', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('comboboxtInFlow_label67', 'text', 'isFocusable');
  },
  onFalse: function(e) {
    this.setPW('comboboxtInFlow_label67', 'text', 'isNotFocusable');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(comboboxtInFlow);
});