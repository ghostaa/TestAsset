window.IBKE2E_AccountPay = [{ /* getAvailableAmountECA */
  name: 'getAvailableAmountECA',
  evts: [{ id: 'IBKE2E_AccountPay_selectList', e: 'onChange'}, { id: 'IBKE2E_AccountPay_selectList', e: 'onFocus'}],
  onTrue: function(e) {
    this.runWF('IBKE2E_AccountPay_form', 'callAsyncOperation', 'IBKE2E_GetAccountBalanceOp', 'refresh', 3000);
  }
}, 
{ /* computeLeftAmount */
  name: 'computeLeftAmount',
  evts: [{ id: 'IBKE2E_AccountPay_amountText', e: 'onChange'}],
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
var amount = this.getPW('IBKE2E_AccountPay_availableAmountLabel', 'text');
//111,1.11->1111.11
amount = amount.replace(',', '');
var transfer = this.getPW('IBKE2E_AccountPay_amountText', 'value');
var leftMoney= Number(amount)-Number(transfer);

if (transfer <= 0) {
 this.setPW('IBKE2E_AccountPay_checkAmountLabel', 'text', 'Amount is wrong');
 //window.alert("Amount is wrong");
}
else if (leftMoney < 0) {
 //window.alert("The money you are transfering should not exceed " + amount);
 this.setPW('IBKE2E_AccountPay_checkAmountLabel',  'text',  'Amount should not exceed ' + amount);
}
else {
 this.setPW('IBKE2E_AccountPay_checkAmountLabel',  'text',  '');
 var realTimeTransfer = this.getPW('IBKE2E_AccountPay_inRealTimeCheckBox', 'value');
      var rate = 0.01;
 if (realTimeTransfer == true || realTimeTransfer == "true")
 {
       rate = rate * 1.1;
 }

     var fee = Number(transfer)*rate;
     this.setPW('IBKE2E_AccountPay_feeNumberLabel',  'text',  fee);
 
}

}))
{
return;
};
  }
}, 
{ /* realTimeCheck */
  name: 'realTimeCheck',
  evts: [{ id: 'IBKE2E_AccountPay_inRealTimeCheckBox', e: 'onChange'}],
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
 var transfer = this.getPW('IBKE2E_AccountPay_amountText', 'value');
 
 var realTimeTransfer = this.getPW('IBKE2E_AccountPay_inRealTimeCheckBox', 'value');
      var rate = 0.01;
 if (realTimeTransfer == true || realTimeTransfer == "true")
 {
       rate = rate * 1.1;
 }

     var fee = Number(transfer)*rate;
     this.setPW('IBKE2E_AccountPay_feeNumberLabel',  'text',  fee);
 


}))
{
return;
};
  }
}, 
{ /* confirmFee */
  name: 'confirmFee',
  evts: [{ id: 'IBKE2E_AccountPay_feeConfirmCheck', e: 'onChange'}],
  cond: function(e) {
    return this.getPW('IBKE2E_AccountPay_feeConfirmCheck', 'isChecked');
  },
  onTrue: function(e) {
    this.setPW('IBKE2E_AccountPay_submitButton', 'inValid', false);
  },
  onFalse: function(e) {
    this.setPW('IBKE2E_AccountPay_submitButton', 'inValid', true);
  }
}, 
{ /* setHiddenValues */
  name: 'setHiddenValues',
  evts: [{ id: 'IBKE2E_AccountPay_submitButton', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('IBKE2E_AccountPay_FromAccount', 'value', this.getPW('IBKE2E_AccountPay_selectList', 'value'));
    this.setPW('IBKE2E_AccountPay_ToAccount', 'value', this.getPW('IBKE2E_AccountPay_combo', 'value'));
    this.setPW('IBKE2E_AccountPay_Amount', 'value', this.getPW('IBKE2E_AccountPay_amountText', 'value'));
    this.setPW('IBKE2E_AccountPay_TransferFee', 'value', this.getPW('IBKE2E_AccountPay_feeNumberLabel', 'text'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(IBKE2E_AccountPay);
});