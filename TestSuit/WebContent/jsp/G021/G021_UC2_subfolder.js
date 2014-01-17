window.G021_UC2_subfolder = [{
	name: 'G021_UC2_subfolder_form1.xValidation',
	evts: [{id: 'G021_UC2_subfolder_form1', e:'onLoaded' }],
	cond: function(e) { return true; },
	onTrue: function(e) {
		this.setPW('G021_UC2_subfolder_form1', 'xValidations', [
		{
			name:'pwVal',
			cond:function(e){
				return !((this.getPW('G021_UC2_subfolder_pw1', 'value') != this.getPW('G021_UC2_subfolder_pw2', 'value')) || ((BTTStringFunctions.length(this.getPW('G021_UC2_subfolder_pw1', 'value')) < 6) || (BTTStringFunctions.length(this.getPW('G021_UC2_subfolder_pw2', 'value')) <= 5)));
			},
			widgets: ['G021_UC2_subfolder_pw1', 'G021_UC2_subfolder_pw2'],
			hint: 'Password length must be not smaller than 6, and pw1 must be pw2'
		}]);
	} 
},
{
	name: 'G021_UC2_subfolder_form2.xValidation',
	evts: [{id: 'G021_UC2_subfolder_form2', e:'onLoaded' }],
	cond: function(e) { return true; },
	onTrue: function(e) {
		this.setPW('G021_UC2_subfolder_form2', 'xValidations', [
		{
			name:'dateVal',
			cond:function(e){
				return (BTTDateFunctions.daysBetween(this.getPW('G021_UC2_subfolder_toDate_form2', 'value'), this.getPW('G021_UC2_subfolder_fromDate_form2', 'value')) >= 1);
			},
			widgets: ['G021_UC2_subfolder_toDate_form2', 'G021_UC2_subfolder_fromDate_form2'],
			hint: '\"To Date\" must be later than \"From Date\"'
		}]);
	} 
},
{
	name: 'G021_UC2_subfolder_form3.xValidation',
	evts: [{id: 'G021_UC2_subfolder_form3', e:'onLoaded' }],
	cond: function(e) { return true; },
	onTrue: function(e) {
		this.setPW('G021_UC2_subfolder_form3', 'xValidations', [
		{
			name:'amountVal',
			cond:function(e){
				return ((BTTNumberFunctions.truncate(((this.getPW('G021_UC2_subfolder_balance_form3', 'value') - 100) - this.getPW('G021_UC2_subfolder_amount_form3', 'value'))) >= 0) && (this.getPW('G021_UC2_subfolder_amount_form3', 'value') >= 100));
			},
			widgets: ['G021_UC2_subfolder_balance_form3', 'G021_UC2_subfolder_amount_form3'],
			hint: '(amount>=100)&(truncate((balance-100)-amount))'
		},
		{
			name:'bankCodeVal',
			cond:function(e){
				return (BTTUtil.equals(BTTStringFunctions.subString(this.getPW('G021_UC2_subfolder_bankCode_form3', 'value'), 0, 4), 'ABC_') );
			},
			widgets: ['G021_UC2_subfolder_bankCode_form3'],
			hint: 'Bank Code should has prefix \"ABC_\"'
		},
		{
			name:'acceptVal',
			cond:function(e){
				return !(! this.getPW('G021_UC2_subfolder_checkBox01_form3', 'isChecked'));
			},
			widgets: ['G021_UC2_subfolder_checkBox01_form3'],
			hint: 'Please read and accept the agreement to proceed.'
		}]);
	} 
}];
dojo.addOnLoad(function(){
  engine.registerRules(G021_UC2_subfolder);
});