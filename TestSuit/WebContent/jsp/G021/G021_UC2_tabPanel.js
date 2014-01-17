window.G021_UC2_tabPanel = [{
	name: 'G021_UC2_tabPanel_form1.xValidation',
	evts: [{id: 'G021_UC2_tabPanel_form1', e:'onLoaded' }],
	cond: function(e) { return true; },
	onTrue: function(e) {
		this.setPW('G021_UC2_tabPanel_form1', 'xValidations', [
		{
			name:'pwVal',
			cond:function(e){
				return !((this.getPW('G021_UC2_tabPanel_pw1', 'value') != this.getPW('G021_UC2_tabPanel_pw2', 'value')) || ((BTTStringFunctions.length(this.getPW('G021_UC2_tabPanel_pw1', 'value')) < 6) || (BTTStringFunctions.length(this.getPW('G021_UC2_tabPanel_pw2', 'value')) <= 5)));
			},
			widgets: ['G021_UC2_tabPanel_pw1', 'G021_UC2_tabPanel_pw2'],
			hint: 'In tab01, Password length must be not smaller than 6, and pw1 must be pw2'
		}]);
	} 
},
{
	name: 'G021_UC2_tabPanel_form2.xValidation',
	evts: [{id: 'G021_UC2_tabPanel_form2', e:'onLoaded' }],
	cond: function(e) { return true; },
	onTrue: function(e) {
		this.setPW('G021_UC2_tabPanel_form2', 'xValidations', [
		{
			name:'dateVal',
			cond:function(e){
				return (BTTDateFunctions.daysBetween(this.getPW('G021_UC2_tabPanel_toDate_form2', 'value'), this.getPW('G021_UC2_tabPanel_fromDate_form2', 'value')) >= 1);
			},
			widgets: ['G021_UC2_tabPanel_toDate_form2', 'G021_UC2_tabPanel_fromDate_form2'],
			hint: '\"To Date\" must be later than \"From Date\"'
		},
		{
			name:'acceptVal',
			cond:function(e){
				return !(! this.getPW('G021_UC2_tabPanel_checkBox01_form2', 'isChecked'));
			},
			widgets: ['G021_UC2_tabPanel_checkBox01_form2'],
			hint: 'Please read and accept the agreement to proceed.'
		}]);
	} 
}];
dojo.addOnLoad(function(){
  engine.registerRules(G021_UC2_tabPanel);
});