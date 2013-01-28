window.globeEca = [{ /* Load */
  name: 'Load',
  evts: [{ id: 'globeEca_Form01', e: 'onLoaded'}],
  cond: function(e) {
    return this.getPW('globeEca_Text02', 'value') > '100';
  },
  onTrue: function(e) {
    this.runWF('globeEca_Text02', 'showErrorMessage', 'Too big value');
  }
}, 
{ /* button01 */
  name: 'button01',
  evts: [{ id: 'globeEca_Button01', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('globeEca_Text01', 'value') > '100';
  },
  onTrue: function(e) {
    this.runWF('globeEca_Text01', 'showErrorMessage', 'Too big,I just need 100');
  }
}, 
{ /* combo03 */
  name: 'combo03',
  evts: [{ id: 'globeEca_Combo03', e: 'onChange'}],
  cond: function(e) {
    return ((this.getPW('globeEca_Radio01', 'isChecked') == true) && (this.getPW('globeEca_Combo03', 'value') == 'Spanish')) || ((this.getPW('globeEca_Radio02', 'isChecked') == true) && (this.getPW('globeEca_Combo03', 'value') == 'Chinese'));
  },
  onTrue: function(e) {
    this.runWF('globeEca_Combo03', 'showErrorMessage', 'Selected language doesnt match with country');
  },
  onFalse: function(e) {
    this.runWF('globeEca_Combo03', 'showErrorMessage', '');
  }
}, 
{ /* sel03 */
  name: 'sel03',
  evts: [{ id: 'globeEca_SelectList03', e: 'onChange'}],
  cond: function(e) {
    return ((this.getPW('globeEca_Combo03', 'value') == 'Chinese') && (this.getPW('globeEca_SelectList03', 'value') == 'EURO')) || ((this.getPW('globeEca_Combo03', 'value') == 'Spanish') && (this.getPW('globeEca_SelectList03', 'value') == 'RMB'));
  },
  onTrue: function(e) {
    this.runWF('globeEca_SelectList03', 'showErrorMessage', 'Selected money doesnt match with language');
  }
}, 
{ /* text03 */
  name: 'text03',
  evts: [{ id: 'globeEca_Text03', e: 'onMouseLeave'}],
  cond: function(e) {
    return this.getPW('globeEca_Text03', 'value') > '100';
  },
  onTrue: function(e) {
    this.runWF('globeEca_Text03', 'showErrorMessage', 'You just have 100,aha');
  }
}, 
{ /* button03 */
  name: 'button03',
  evts: [{ id: 'globeEca_Button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('globeEca_Form01', 'callAsyncOperation', 'globeEcaOp', 'ecaCode', 1000);
  }
}, 
{ /* Load2 */
  name: 'Load2',
  evts: [{ id: 'globeEca_Form01', e: 'onLoaded'}],
  onTrue: function(e) {
    this.runWF('globeEca_Combo02', 'showErrorMessage', 'I live in China');
  }
}, 
{ /* load3 */
  name: 'load3',
  evts: [{ id: 'globeEca_Form01', e: 'onLoaded'}],
  onTrue: function(e) {
    this.runWF('globeEca_SelectList02', 'showErrorMessage', 'But I also love EURO');
  }
}, 
{ /* button012 */
  name: 'button012',
  evts: [{ id: 'globeEca_Button01', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('globeEca_Combo01', 'value') == 'Spanish';
  },
  onTrue: function(e) {
    this.runWF('globeEca_Combo01', 'showErrorMessage', 'Don\'t you know I am a Chinese ?');
  }
}, 
{ /* button013 */
  name: 'button013',
  evts: [{ id: 'globeEca_Button01', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('globeEca_SelectList01', 'value') == 'RMB';
  },
  onTrue: function(e) {
    this.runWF('globeEca_SelectList01', 'showErrorMessage', 'But I also love EURO');
  }
}, 
{ /* nlsButton */
  name: 'nlsButton',
  evts: [{ id: 'globeEca_Button02', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('globeEca_Text05', 'value') > '100';
  },
  onTrue: function(e) {
    this.runWF('globeEca_Text05', 'showErrorMessage', '%nls.NLSErrorMessage/TEXT_RANGE', 100);
  }
}, 
{ /* nlsCombo */
  name: 'nlsCombo',
  evts: [{ id: 'globeEca_Button02', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('globeEca_Combo05', 'value') == 'Spanish';
  },
  onTrue: function(e) {
    this.runWF('globeEca_Combo05', 'showErrorMessage', '%nls.NLSErrorMessage/COMBO_COUNTRY', 'China');
  },
  onFalse: function(e) {
    this.runWF('globeEca_Combo05', 'showErrorMessage', '');
  }
}, 
{ /* nlsSelect */
  name: 'nlsSelect',
  evts: [{ id: 'globeEca_Button02', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('globeEca_SelectList05', 'value') == 'Chinese';
  },
  onTrue: function(e) {
    this.runWF('globeEca_SelectList05', 'showErrorMessage', '%nls.NLSErrorMessage/SELECT_LANGUAGE', 'Spanish');
  },
  onFalse: function(e) {
    this.runWF('globeEca_SelectList05', 'showErrorMessage', '');
  }
}, 
{ /* combo2 */
  name: 'combo2',
  evts: [{ id: 'globeEca_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('globeEca_Combo06', 'showErrorMessage', '%nls.NLSErrorMessage/TWO_LANGUAGE', this.getPW('globeEca_Combo06', 'value'), this.getPW('globeEca_Combo06', 'value'));
  }
}, 
{ /* text2 */
  name: 'text2',
  evts: [{ id: 'globeEca_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('globeEca_Text06', 'showErrorMessage', '%nls.NLSErrorMessage/TWO_LANGUAGE', this.getPW('globeEca_Text06', 'value'), this.getPW('globeEca_Text06', 'value'));
  }
}, 
{ /* select2 */
  name: 'select2',
  evts: [{ id: 'globeEca_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('globeEca_SelectList06', 'showErrorMessage', '%nls.NLSErrorMessage/TWO_LANGUAGE', this.getPW('globeEca_SelectList06', 'value'), this.getPW('globeEca_SelectList06', 'value'));
  }
}, 
{ /* text0 */
  name: 'text0',
  evts: [{ id: 'globeEca_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('globeEca_Text07', 'showErrorMessage', '%nls.NLSErrorMessage/NONE');
  }
}, 
{ /* combo0 */
  name: 'combo0',
  evts: [{ id: 'globeEca_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('globeEca_Combo07', 'showErrorMessage', '%nls.NLSErrorMessage/NONE');
  }
}, 
{ /* select0 */
  name: 'select0',
  evts: [{ id: 'globeEca_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('globeEca_SelectList07', 'showErrorMessage', '%nls.NLSErrorMessage/NONE');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(globeEca);
});