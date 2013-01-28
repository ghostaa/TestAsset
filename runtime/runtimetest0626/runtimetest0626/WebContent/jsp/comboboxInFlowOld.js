window.comboboxInFlowOld = [{ /* ECAChangeCombo */
  name: 'ECAChangeCombo',
  evts: [{ id: 'comboboxInFlowOld_Button04', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_Combo01', 'value', 'Other');
  }
}, 
{ /* comboClick */
  name: 'comboClick',
  evts: [{ id: 'comboboxInFlowOld_eventCombo', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_Label15', 'text', 'combo clicked');
  }
}, 
{ /* comboFocus */
  name: 'comboFocus',
  evts: [{ id: 'comboboxInFlowOld_eventCombo', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_eventLabel', 'text', 'combo focused');
  }
}, 
{ /* comboKeyUp */
  name: 'comboKeyUp',
  evts: [{ id: 'comboboxInFlowOld_eventCombo', e: 'onKeyUp'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_eventLabel', 'text', 'key up');
  }
}, 
{ /* setReadOnlyTrue */
  name: 'setReadOnlyTrue',
  evts: [{ id: 'comboboxInFlowOld_setReadOnlyTrue', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_comboTestProperties', 'readOnly', true);
  }
}, 
{ /* setReadOnlyFalse */
  name: 'setReadOnlyFalse',
  evts: [{ id: 'comboboxInFlowOld_setReadOnlyFalse', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_comboTestProperties', 'readOnly', false);
  }
}, 
{ /* setDisableTrue */
  name: 'setDisableTrue',
  evts: [{ id: 'comboboxInFlowOld_setDisableTrue', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_comboTestProperties', 'disabled', true);
  }
}, 
{ /* setDiableFalse */
  name: 'setDiableFalse',
  evts: [{ id: 'comboboxInFlowOld_setDisableFalse', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_comboTestProperties', 'disabled', false);
  }
}, 
{ /* setVisiblilityVisible */
  name: 'setVisiblilityVisible',
  evts: [{ id: 'comboboxInFlowOld_setVisibilityVisible', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_comboTestProperties', 'visibility', 'Visible');
  }
}, 
{ /* setVisibilityHidden */
  name: 'setVisibilityHidden',
  evts: [{ id: 'comboboxInFlowOld_setVisibilityHidden', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_comboTestProperties', 'visibility', 'hidden');
  }
}, 
{ /* setVisibilityGone */
  name: 'setVisibilityGone',
  evts: [{ id: 'comboboxInFlowOld_setVisibleGone', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_comboTestProperties', 'visibility', 'gone');
  }
}, 
{ /* setValueAt */
  name: 'setValueAt',
  evts: [{ id: 'comboboxInFlowOld_setValueAt', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_comboTestProperties', 'value', this.getPW('comboboxInFlowOld_Text01', 'value'));
  }
}, 
{ /* setReadonly */
  name: 'setReadonly',
  evts: [{ id: 'comboboxInFlowOld_setReadonly', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_readonlyMe', 'readOnly', ! this.getPW('comboboxInFlowOld_readonlyMe', 'readOnly'));
  }
}, 
{ /* setDisabled */
  name: 'setDisabled',
  evts: [{ id: 'comboboxInFlowOld_setDisabled', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_disableMe', 'disabled', ! this.getPW('comboboxInFlowOld_disableMe', 'disabled'));
  }
}, 
{ /* setFocus */
  name: 'setFocus',
  evts: [{ id: 'comboboxInFlowOld_btnSetFocus', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_comboTestProperties', 'focus');
  }
}, 
{ /* isFocusable */
  name: 'isFocusable',
  evts: [{ id: 'comboboxInFlowOld_btnIsFocusable', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('comboboxInFlowOld_comboTestProperties', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_lblIsFocusable', 'text', 'true');
  },
  onFalse: function(e) {
    this.setPW('comboboxInFlowOld_lblIsFocusable', 'text', 'false');
  }
}, 
{ /* loadData */
  name: 'loadData',
  evts: [{ id: 'comboboxInFlowOld_btnLoadingData', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_cbECALoadingData', 'loadStoreFromURL', 'listfiles/combo/normal.js');
  }
}, 
{ /* loadDataFileNotFound */
  name: 'loadDataFileNotFound',
  evts: [{ id: 'comboboxInFlowOld_btnLoadingData2', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_cbFileNotFound', 'loadStoreFromURL', 'listfiles/combo/none.js');
  }
}, 
{ /* loadDataFileNotFound2 */
  name: 'loadDataFileNotFound2',
  evts: [{ id: 'comboboxInFlowOld_btnLoadingData3', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_cbFileNotFound', 'loadStoreFromURL', 'listfiles/combo/normal.js');
  }
}, 
{ /* button07 */
  name: 'button07',
  evts: [{ id: 'comboboxInFlowOld_Combo07', e: 'onAsyncOK'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_Message03', 'display', 'load successfully');
  }
}, 
{ /* button07Click */
  name: 'button07Click',
  evts: [{ id: 'comboboxInFlowOld_Button07', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_Combo09', 'loadStoreFromURL', 'listfiles/combo/data.txt');
  }
}, 
{ /* combo09 */
  name: 'combo09',
  evts: [{ id: 'comboboxInFlowOld_Combo09', e: 'onAsyncError'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_Message02', 'display', (this.getPW('comboboxInFlowOld_Combo09', 'asyncStatus') + ':') + this.getPW('comboboxInFlowOld_Combo09', 'asyncErrorMessage'));
  }
}, 
{ /* combo08 */
  name: 'combo08',
  evts: [{ id: 'comboboxInFlowOld_Combo08', e: 'onAsyncError'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_Message01', 'display', this.getPW('comboboxInFlowOld_Combo08', 'asyncStatus') + (':' + this.getPW('comboboxInFlowOld_Combo08', 'asyncErrorMessage')));
  }
}, 
{ /* change hint */
  name: 'change hint',
  evts: [{ id: 'comboboxInFlowOld_Button10', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('comboboxInFlowOld_Combo11', 'hint', 'New hint for comboBox');
  }
}, 
{ /* btnShowErrMsg1Click */
  name: 'btnShowErrMsg1Click',
  evts: [{ id: 'comboboxInFlowOld_btnShowErrMsg1', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_Combo06', 'focus');
    this.runWF('comboboxInFlowOld_Combo06', 'showErrorMessage', 'Hello Jack, welcome to BTT!(Non-Nls message)');
  }
}, 
{ /* btnShowErrMsg2Click */
  name: 'btnShowErrMsg2Click',
  evts: [{ id: 'comboboxInFlowOld_btnShowErrMsg2', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_Combo06', 'focus');
    this.runWF('comboboxInFlowOld_Combo06', 'showErrorMessage', '%nls.NlsSupportTestResourse/_2Tip_Message2');
  }
}, 
{ /* btnShowErrMsg3Click */
  name: 'btnShowErrMsg3Click',
  evts: [{ id: 'comboboxInFlowOld_btnShowErrMsg3', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_Combo06', 'focus');
    this.runWF('comboboxInFlowOld_Combo06', 'showErrorMessage', '%nls.BTTResource/I18N_MESSAGE', 'Jack', 27);
  }
}, 
{ /* btnShowErrMsg4Click */
  name: 'btnShowErrMsg4Click',
  evts: [{ id: 'comboboxInFlowOld_btnShowErrMsg4', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_Combo06', 'focus');
    this.runWF('comboboxInFlowOld_Combo06', 'showErrorMessage', 'Dear user: {0}, your age is {AgeParameter}! Welcome to BTT!', 'Jack', 54, 'ExtValuesOfNoUse', 0);
  }
}, 
{ /* btnShowErrMsg5Click */
  name: 'btnShowErrMsg5Click',
  evts: [{ id: 'comboboxInFlowOld_btnShowErrMsg5', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_Combo06', 'focus');
    this.runWF('comboboxInFlowOld_Combo06', 'showErrorMessage', 'This is a constant message, no parameter defined for this message!', 'param0Vlaue', 987, true);
  }
}, 
{ /* btnShowErrMsg6Click */
  name: 'btnShowErrMsg6Click',
  evts: [{ id: 'comboboxInFlowOld_btnShowErrMsg6', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_Combo06', 'focus');
    this.runWF('comboboxInFlowOld_Combo06', 'showErrorMessage', '%nls.BTTResource/I18N_MESSAGE', 'Jack', 27, true, 'ExtValueOfNoUse', 213);
  }
}, 
{ /* submit */
  name: 'submit',
  evts: [{ id: 'comboboxInFlowOld_Button08', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('comboboxInFlowOld_form2', 'submit');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(comboboxInFlowOld);
});