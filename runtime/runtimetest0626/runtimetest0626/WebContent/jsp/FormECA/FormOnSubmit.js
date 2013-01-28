window.FormOnSubmit = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'FormOnSubmit_form', e: 'onFormSubmit'}],
  cond: function(e) {
    return this.getPW('FormOnSubmit_checkBox', 'isChecked');
  },
  onTrue: function(e) {
    this.setPW('FormOnSubmit_label', 'text', 'This checkBox is checked');
  },
  onFalse: function(e) {
    this.setPW('FormOnSubmit_label', 'text', 'This checkBox is not checked');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'FormOnSubmit_form', e: 'onReset'}],
  cond: function(e) {
    return engine.executeCond("commonCon1931");
  },
  onTrue: function(e) {
    this.setPW('FormOnSubmit_label01', 'text', 'it has resetted');
  },
  onFalse: function(e) {
    this.setPW('FormOnSubmit_label01', 'text', 'it not has resetted');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'FormOnSubmit_form', e: 'onValidStateChange'}]
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'FormOnSubmit_form', e: 'onAsyncOK'}],
  onTrue: function(e) {
    this.setPW('FormOnSubmit_label', 'text', 'It is Form OnAsyncOK');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'FormOnSubmit_form', e: 'onAsyncError'}],
  onTrue: function(e) {
    this.setPW('FormOnSubmit_label01', 'text', 'It is Form OnAsyncError');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'FormOnSubmit_form', e: 'onAsyncTimeOut'}],
  onTrue: function(e) {
    this.setPW('FormOnSubmit_text', 'value', 'It is Form OnAsyncTimeOut');
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'FormOnSubmit_form', e: 'onWidgetChange'}],
  onTrue: function(e) {
    this.setPW('FormOnSubmit_text', 'value', 'The SelectList Value has been Changed');
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'FormOnSubmit_form', e: 'onLoaded'}],
  onTrue: function(e) {
    this.setPW('FormOnSubmit_combo', 'required', true);
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'FormOnSubmit_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('FormOnSubmit_combo', 'loadStoreFromURL', 'listFiles/select/none.js');
  }
}, 
{ /* ecaRule09 */
  name: 'ecaRule09',
  evts: [{ id: 'FormOnSubmit_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('FormOnSubmit_selectList', 'loadStoreFromURL', 'listFiles/select/none.js');
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'FormOnSubmit_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('FormOnSubmit_form', 'callAsyncOperation', 'FireExitEventOp', '1234', 3000);
  }
}, 
{ /* ecaRule11 */
  name: 'ecaRule11',
  evts: [{ id: 'FormOnSubmit_button04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('FormOnSubmit_form', 'validate');
  }
}, 
{ /* ecaRule12 */
  name: 'ecaRule12',
  evts: [{ id: 'FormOnSubmit_button07', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('FormOnSubmit_form', 'submit');
  }
}, 
{ /* ecaRule13 */
  name: 'ecaRule13',
  evts: [{ id: 'FormOnSubmit_button05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('FormOnSubmit_form', 'reset');
  }
}, 
{ /* ecaRule14 */
  name: 'ecaRule14',
  evts: [{ id: 'FormOnSubmit_button06', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('FormOnSubmit_form', 'callAsyncOperation', 'FireExitEventOp', '4321', 3000);
  }
}, 
{ /* ecaRule15 */
  name: 'ecaRule15',
  evts: [{ id: 'FormOnSubmit_button08', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('FormOnSubmit_form', 'validateOnSubmit', false);
  },
  onFalse: function(e) {
    this.setPW('FormOnSubmit_form', 'validateOnSubmit', true);
  }
}, 
{ /* ecaRule16 */
  name: 'ecaRule16',
  evts: [{ id: 'FormOnSubmit_button09', e: 'onClick'}]
}, 
{ /* ecaRule17 */
  name: 'ecaRule17',
  evts: [{ id: 'FormOnSubmit_button10', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('FormOnSubmit_form', 'validateOnSubmit', true);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(FormOnSubmit);
});