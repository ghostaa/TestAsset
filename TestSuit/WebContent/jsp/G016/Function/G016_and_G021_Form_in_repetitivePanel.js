window.G016_and_G021_Form_in_repetitivePanel = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G016_and_G021_Form_in_repetitivePanel_button_autoFill', e: 'onClick', repeatAt: 'G016_and_G021_Form_in_repetitivePanel_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('G016_and_G021_Form_in_repetitivePanel_pw1'+ this.idxPostfix, 'value', 'aaaaaa');
    this.setPW('G016_and_G021_Form_in_repetitivePanel_pw2'+ this.idxPostfix, 'value', 'aaaaaa');
    this.setPW('G016_and_G021_Form_in_repetitivePanel_fromDate'+ this.idxPostfix, 'value', '2013-06-01');
    this.setPW('G016_and_G021_Form_in_repetitivePanel_toDate'+ this.idxPostfix, 'value', '2013-06-09');
    this.setPW('G016_and_G021_Form_in_repetitivePanel_amount'+ this.idxPostfix, 'value', 500.000);
  },
  repeatActionAt: 'G016_and_G021_Form_in_repetitivePanel_repetitivePanel'
},
{
	name: 'G016_and_G021_Form_in_repetitivePanel_form.xValidation',
	evts: [{id: 'G016_and_G021_Form_in_repetitivePanel_form', e:'onLoaded' , repeatAt:'G016_and_G021_Form_in_repetitivePanel_repetitivePanel'}],
	cond: function(e) { return true; },
	onTrue: function(e) {
		this.setPW('G016_and_G021_Form_in_repetitivePanel_form'+ this.idxPostfix, 'xValidations', [
		{
			name:'pwVal',
			cond:function(e){
				return !((this.getPW('G016_and_G021_Form_in_repetitivePanel_pw1'+ this.idxPostfix, 'value') != this.getPW('G016_and_G021_Form_in_repetitivePanel_pw2'+ this.idxPostfix, 'value')) || ((BTTStringFunctions.length(this.getPW('G016_and_G021_Form_in_repetitivePanel_pw1'+ this.idxPostfix, 'value')) < 6) || (BTTStringFunctions.length(this.getPW('G016_and_G021_Form_in_repetitivePanel_pw2'+ this.idxPostfix, 'value')) <= 5)));
			},
			widgets: ['G016_and_G021_Form_in_repetitivePanel_pw1'+ this.idxPostfix, 'G016_and_G021_Form_in_repetitivePanel_pw2'+ this.idxPostfix],
			hint: 'Password length must be not smaller than 6, and pw1 must be pw2',
			repeatCondAt:'G016_and_G021_Form_in_repetitivePanel_repetitivePanel'
		},
		{
			name:'dateVal',
			cond:function(e){
				return (BTTDateFunctions.daysBetween(this.getPW('G016_and_G021_Form_in_repetitivePanel_toDate'+ this.idxPostfix, 'value'), this.getPW('G016_and_G021_Form_in_repetitivePanel_fromDate'+ this.idxPostfix, 'value')) >= 1);
			},
			widgets: ['G016_and_G021_Form_in_repetitivePanel_toDate'+ this.idxPostfix, 'G016_and_G021_Form_in_repetitivePanel_fromDate'+ this.idxPostfix],
			hint: '\"To Date\" must be later than \"From Date\"',
			repeatCondAt:'G016_and_G021_Form_in_repetitivePanel_repetitivePanel'
		},
		{
			name:'amountVal',
			cond:function(e){
				return ((BTTNumberFunctions.truncate(((this.getPW('G016_and_G021_Form_in_repetitivePanel_balance'+ this.idxPostfix, 'value') - 100) - this.getPW('G016_and_G021_Form_in_repetitivePanel_amount'+ this.idxPostfix, 'value'))) >= 0) && (this.getPW('G016_and_G021_Form_in_repetitivePanel_amount'+ this.idxPostfix, 'value') >= 100));
			},
			widgets: ['G016_and_G021_Form_in_repetitivePanel_balance'+ this.idxPostfix, 'G016_and_G021_Form_in_repetitivePanel_amount'+ this.idxPostfix],
			hint: '(amount>=100)&(truncate((balance-100)-amount))',
			repeatCondAt:'G016_and_G021_Form_in_repetitivePanel_repetitivePanel'
		},
		{
			name:'bankCodeVal',
			cond:function(e){
				return (BTTUtil.equals(BTTStringFunctions.subString(this.getPW('G016_and_G021_Form_in_repetitivePanel_bankCode'+ this.idxPostfix, 'value'), 0, 4), 'ABC_') );
			},
			widgets: ['G016_and_G021_Form_in_repetitivePanel_bankCode'+ this.idxPostfix],
			hint: 'Bank Code should has prefix \"ABC_\"',
			repeatCondAt:'G016_and_G021_Form_in_repetitivePanel_repetitivePanel'
		},
		{
			name:'acceptVal',
			cond:function(e){
				return !(! this.getPW('G016_and_G021_Form_in_repetitivePanel_checkBox01'+ this.idxPostfix, 'isChecked'));
			},
			widgets: ['G016_and_G021_Form_in_repetitivePanel_checkBox01'+ this.idxPostfix],
			hint: '%nls.bttsample/accept',
			repeatCondAt:'G016_and_G021_Form_in_repetitivePanel_repetitivePanel'
		}]);
	} ,
    repeatActionAt:'G016_and_G021_Form_in_repetitivePanel_repetitivePanel'
}];
dojo.addOnLoad(function(){
  engine.registerRules(G016_and_G021_Form_in_repetitivePanel);
});