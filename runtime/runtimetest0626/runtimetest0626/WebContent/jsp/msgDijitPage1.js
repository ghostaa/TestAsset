window.msgDijitPage1 = [{ /* SetErrorMsgForMS03 */
  name: 'SetErrorMsgForMS03',
  evts: [{ id: 'msgDijitPage1_Button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('msgDijitPage1_ms03', 'display', 'Error message content set by ECA', 'ERROR');
  }
}, 
{ /* SetWarnMsgForMS03 */
  name: 'SetWarnMsgForMS03',
  evts: [{ id: 'msgDijitPage1_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('msgDijitPage1_ms03', 'display', 'Warning  message content set by ECA', 'WARN');
  }
}, 
{ /* SetInfoMsgForMS03 */
  name: 'SetInfoMsgForMS03',
  evts: [{ id: 'msgDijitPage1_Button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('msgDijitPage1_ms03', 'display', 'Information message content set by ECA', 'INFO');
  }
}, 
{ /* ComboOnBlurAlertError */
  name: 'ComboOnBlurAlertError',
  evts: [{ id: 'msgDijitPage1_Combo01', e: 'onChange'}],
  cond: function(e) {
    return this.getPW('msgDijitPage1_Combo01', 'value') != '[Select a message level!]';
  },
  onTrue: function(e) {
    this.runWF('msgDijitPage1_ms02', 'display', this.getPW('msgDijitPage1_Combo01', 'value') + ': Option selected does not equal [Select a message level!]', this.getPW('msgDijitPage1_Combo01', 'value'));
  }
}, 
{ /* DA02Execute */
  name: 'DA02Execute',
  evts: [{ id: 'msgDijitPage1_Button04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('msgDijitPage1_da02', 'display', 'WARN', '%nls.NlsSupportTestResourse/_2Tip_Message2');
  }
}, 
{ /* DA03Execute */
  name: 'DA03Execute',
  evts: [{ id: 'msgDijitPage1_Button05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('msgDijitPage1_da03', 'displayPopup', 'ERROR', '%nls.NlsSupportTestResourse/_2Text_Value2');
  }
}, 
{ /* MLComboOnChange */
  name: 'MLComboOnChange',
  evts: [{ id: 'msgDijitPage1_Combo02', e: 'onChange'}],
  cond: function(e) {
    return this.getPW('msgDijitPage1_Combo02', 'value') != '[Change Level!]';
  },
  onTrue: function(e) {
    this.runWF('msgDijitPage1_ml02', 'display', 'Non-NLS Message contents!', this.getPW('msgDijitPage1_Combo02', 'value'));
  }
}, 
{ /* mlInfoBtnClick */
  name: 'mlInfoBtnClick',
  evts: [{ id: 'msgDijitPage1_Button06', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('msgDijitPage1_ml0456', 'display', 'Information message contents!', 'INFO');
  }
}, 
{ /* mlWarnBtnClick */
  name: 'mlWarnBtnClick',
  evts: [{ id: 'msgDijitPage1_Button07', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('msgDijitPage1_ml0456', 'display', 'Warning message to display!', 'WARN', 'Dynamic-string-value');
  }
}, 
{ /* mlErrorBtnClick */
  name: 'mlErrorBtnClick',
  evts: [{ id: 'msgDijitPage1_Button08', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('msgDijitPage1_ml0456', 'display', 'Error level message', 'ERROR');
  }
}, 
{ /* mlPopupInfoClick */
  name: 'mlPopupInfoClick',
  evts: [{ id: 'msgDijitPage1_Button09', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('msgDijitPage1_ml0789', 'displayPopup', 'Popup information message contents!', 'INFO');
  }
}, 
{ /* mlPopupWarnClick */
  name: 'mlPopupWarnClick',
  evts: [{ id: 'msgDijitPage1_Button10', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('msgDijitPage1_ml0789', 'displayPopup', 'Popup warning message contents!', 'WARN');
  }
}, 
{ /* mlPopupErrorClick */
  name: 'mlPopupErrorClick',
  evts: [{ id: 'msgDijitPage1_Button11', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('msgDijitPage1_ml0789', 'displayPopup', 'Popup error message contents {0}.', 'ERROR', '000000');
  }
}, 
{ /* mp03Hide */
  name: 'mp03Hide',
  evts: [{ id: 'msgDijitPage1_Button17', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('msgDijitPage1_mp01', 'visibility', 'hidden');
  }
}, 
{ /* mp03Gone */
  name: 'mp03Gone',
  evts: [{ id: 'msgDijitPage1_Button18', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('msgDijitPage1_mp01', 'visibility', 'gone');
  }
}, 
{ /* mp03Visible */
  name: 'mp03Visible',
  evts: [{ id: 'msgDijitPage1_Button19', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('msgDijitPage1_mp01', 'visibility', 'visible');
  }
}, 
{ /* mp03Close */
  name: 'mp03Close',
  evts: [{ id: 'msgDijitPage1_Button20', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('msgDijitPage1_mp01', 'closeMessage');
  }
}, 
{ /* mnSetContents */
  name: 'mnSetContents',
  evts: [{ id: 'msgDijitPage1_Button21', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('msgDijitPage1_mn02', 'display', '1', 'INFO');
    this.runWF('msgDijitPage1_mn03', 'display', '%nls.NlsSupportTestResourse/_2Tip_Message2', 'WARN');
    this.runWF('msgDijitPage1_mn04', 'displayPopup', '%nls.NlsSupportTestResourse/_Message_Dijit_PlaceHolder_Msg', 'INFO', 'QWERTYUIOPLKJHGFDSAZXCVBNM');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(msgDijitPage1);
});