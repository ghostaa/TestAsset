window.SVT_8103_Withdrawal = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'SVT_8103_Withdrawal_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('SVT_8103_Withdrawal_WithdrawalPassword', 'value', 'abc');
  }
},
{
	name: 'SVT_8103_Withdrawal_form.xValidation',
	evts: [{id: 'SVT_8103_Withdrawal_form', e:'onLoaded' }],
	cond: function(e) { return true; },
	onTrue: function(e) {
		this.setPW('SVT_8103_Withdrawal_form', 'xValidations', [
		{
			name:'xValidation',
			cond:function(e){
				return !(this.getPW('SVT_8103_Withdrawal_WithdrawalAmount', 'value') > this.getPW('SVT_8103_Withdrawal_balance', 'text'));
			},
			widgets: ['SVT_8103_Withdrawal_WithdrawalAmount', 'SVT_8103_Withdrawal_balance'],
			hint: 'please confirm the amount less than balance'
		}]);
	} 
}];
dojo.addOnLoad(function(){
  engine.registerRules(SVT_8103_Withdrawal);
});