window.G021_UC2_repetitive = [{
	name: 'G021_UC2_repetitive_form.xValidation',
	evts: [{id: 'G021_UC2_repetitive_form', e:'onLoaded' , repeatAt:'G021_UC2_repetitive_repetitivePanel'}],
	cond: function(e) { return true; },
	onTrue: function(e) {
		this.setPW('G021_UC2_repetitive_form'+ this.idxPostfix, 'xValidations', [
		{
			name:'numberVal',
			cond:function(e){
				return (BTTUtil.equals(BTTStringFunctions.length(this.getPW('G021_UC2_repetitive_number'+ this.idxPostfix, 'value')), 21) );
			},
			widgets: ['G021_UC2_repetitive_number'+ this.idxPostfix],
			hint: 'The length of the \"Number\" must be 21',
			repeatCondAt:'G021_UC2_repetitive_repetitivePanel'
		}]);
	} ,
    repeatActionAt:'G021_UC2_repetitive_repetitivePanel'
}];
dojo.addOnLoad(function(){
  engine.registerRules(G021_UC2_repetitive);
});