window.acctPayAjax = [{ /* PayMoney */
  name: 'PayMoney',
  evts: [{ id: 'acctPayAjax_btnPayMoney', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('acctPayAjax_Form01', 'isValid');
  },
  onTrue: function(e) {
    this.runWF('acctPayAjax_Form01', 'callAsyncOperation', 'ajaxEnhanceTableJsonFormatOp', 'PayOpSubmitCode', 10000);
  },
  onFalse: function(e) {
    this.runWF('acctPayAjax_msg', 'displayPopup', 'Invalid values might be inputted, correct them before paying!', 'WARN');
  }
}, 
{ /* CheckPayResult */
  name: 'CheckPayResult',
  evts: [{ id: 'acctPayAjax_Form01', e: 'onAsyncOK'}],
  cond: function(e) {
    return this.getPW('acctPayAjax_txtPayResult', 'value') == 'SUCCESS';
  },
  onTrue: function(e) {
    this.setPW('acctPayAjax_txtMyAcct', 'disabled', true);
    this.setPW('acctPayAjax_txtRmtAcct', 'disabled', true);
    this.setPW('acctPayAjax_txtRmtAcctCfm', 'disabled', true);
    this.setPW('acctPayAjax_txtPayAmount', 'disabled', true);
    this.setPW('acctPayAjax_txtAtmPwd', 'disabled', true);
    this.setPW('acctPayAjax_txtVerifyCode', 'disabled', true);
    this.setPW('acctPayAjax_tareaComment', 'disabled', true);
    this.setPW('acctPayAjax_btnPayMoney', 'inValid', true);
    this.setPW('acctPayAjax_btnDefault', 'inValid', true);
    this.runWF('acctPayAjax_msg', 'displayPopup', this.getPW('acctPayAjax_txtPayAmount', 'value') + '  has been paied.', 'INFO');
  },
  onFalse: function(e) {
    this.runWF('acctPayAjax_msg', 'displayPopup', 'Pay money FAILED!', 'ERROR');
  }
}, 
{ /* InputDefaultValues */
  name: 'InputDefaultValues',
  evts: [{ id: 'acctPayAjax_btnDefault', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('acctPayAjax_txtMyAcct', 'value', 'A123456789077770077');
    this.setPW('acctPayAjax_txtRmtAcct', 'value', 'B123456789077770099');
    this.setPW('acctPayAjax_txtRmtAcctCfm', 'value', 'B123456789077770099');
    this.setPW('acctPayAjax_txtPayAmount', 'value', '7890.50');
    this.setPW('acctPayAjax_txtAtmPwd', 'value', '012345');
    this.setPW('acctPayAjax_txtVerifyCode', 'value', '5296');
    this.setPW('acctPayAjax_tareaComment', 'value', 'Pay the money to him!');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(acctPayAjax);
});