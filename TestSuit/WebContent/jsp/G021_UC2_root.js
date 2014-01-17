window.G021_UC2_root = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G021_UC2_root_button_autoFill', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G021_UC2_root_pw1', 'value', 'aaaaaa');
    this.setPW('G021_UC2_root_pw2', 'value', 'aaaaaa');
    this.setPW('G021_UC2_root_fromDate', 'value', '2013-06-01');
    this.setPW('G021_UC2_root_toDate', 'value', '2013-06-09');
    this.setPW('G021_UC2_root_amount', 'value', 999.000);
    this.setPW('G021_UC2_root_checkBox01', 'isChecked', true);
  }
},
{
	name: 'G021_UC2_root_form.xValidation',
	evts: [{id: 'G021_UC2_root_form', e:'onLoaded' }],
	cond: function(e) { return true; },
	onTrue: function(e) {
		this.setPW('G021_UC2_root_form', 'xValidations', [
		{
			name:'pwVal',
			cond:function(e){
				return !((this.getPW('G021_UC2_root_pw1', 'value') != this.getPW('G021_UC2_root_pw2', 'value')) || ((BTTStringFunctions.length(this.getPW('G021_UC2_root_pw1', 'value')) < 6) || (BTTStringFunctions.length(this.getPW('G021_UC2_root_pw2', 'value')) <= 5)));
			},
			widgets: ['G021_UC2_root_pw1', 'G021_UC2_root_pw2'],
			hint: 'pw1 and pw2 length must >=6; And pw1 and pw2 must be the same.'
		},
		{
			name:'dateVal',
			cond:function(e){
				return (BTTDateFunctions.daysBetween(this.getPW('G021_UC2_root_toDate', 'value'), this.getPW('G021_UC2_root_fromDate', 'value')) >= 1);
			},
			widgets: ['G021_UC2_root_toDate', 'G021_UC2_root_fromDate'],
			hint: '\"To Date\" must be later than \"From Date\".'
		},
		{
			name:'amountVal',
			cond:function(e){
				return ((BTTNumberFunctions.truncate(((this.getPW('G021_UC2_root_balance', 'value') - 100) - this.getPW('G021_UC2_root_amount', 'value'))) >= 0) && (this.getPW('G021_UC2_root_amount', 'value') >= 100));
			},
			widgets: ['G021_UC2_root_balance', 'G021_UC2_root_amount'],
			hint: '\"Amount\" must be >=100, and (truncate((balance-100)-amount))>=0'
		},
		{
			name:'bankCodeVal',
			cond:function(e){
				return (BTTUtil.equals(BTTStringFunctions.subString(this.getPW('G021_UC2_root_bankCode', 'value'), 0, 4), 'ABC_') );
			},
			widgets: ['G021_UC2_root_bankCode'],
			hint: '\"Bank Code\" must have prefix \"ABC_\"'
		},
		{
			name:'acceptVal',
			cond:function(e){
				return !(! this.getPW('G021_UC2_root_checkBox01', 'isChecked'));
			},
			widgets: ['G021_UC2_root_checkBox01'],
			hint: 'You must accept the agreement before continue.'
		}]);
	} 
}];
dojo.addOnLoad(function(){
  engine.registerRules(G021_UC2_root);
});