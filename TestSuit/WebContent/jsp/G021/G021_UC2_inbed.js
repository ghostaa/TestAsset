window.G021_UC2_inbed = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G021_UC2_inbed_auto', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G021_UC2_inbed_text', 'value', 'ABCDEFG');
    this.setPW('G021_UC2_inbed_combo', 'value', '01_combo');
    this.setPW('G021_UC2_inbed_selectList', 'value', '01_select');
    this.setPW('G021_UC2_inbed_checkBox', 'isChecked', true);
  }
},
{
	name: 'G021_UC2_inbed_form.xValidation',
	evts: [{id: 'G021_UC2_inbed_form', e:'onLoaded' }],
	cond: function(e) { return true; },
	onTrue: function(e) {
		this.setPW('G021_UC2_inbed_form', 'xValidations', [
		{
			name:'TextVal',
			cond:function(e){
				return (BTTStringFunctions.length(this.getPW('G021_UC2_inbed_text', 'value')) >= 6);
			},
			widgets: ['G021_UC2_inbed_text'],
			hint: 'The length must be >=6'
		},
		{
			name:'comboVal',
			cond:function(e){
				return (BTTUtil.equals(BTTStringFunctions.compare(BTTStringFunctions.subString(this.getPW('G021_UC2_inbed_combo', 'value'), 0, 2), BTTStringFunctions.subString(this.getPW('G021_UC2_inbed_selectList', 'value'), 0, 2)), 0) );
			},
			widgets: ['G021_UC2_inbed_combo', 'G021_UC2_inbed_selectList'],
			hint: 'The prefix of combo and selectList must be the same'
		},
		{
			name:'checkbox',
			cond:function(e){
				return (BTTUtil.equals(this.getPW('G021_UC2_inbed_checkBox', 'isChecked'), true) );
			},
			widgets: ['G021_UC2_inbed_checkBox'],
			hint: 'You must check the checkbox'
		}]);
	} 
}];
dojo.addOnLoad(function(){
  engine.registerRules(G021_UC2_inbed);
});