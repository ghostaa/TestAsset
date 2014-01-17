window.NormalSubPageNoOne = [{
	name: 'NormalSubPageNoOne_form.xValidation',
	evts: [{id: 'NormalSubPageNoOne_form', e:'onLoaded' }],
	cond: function(e) { return true; },
	onTrue: function(e) {
		this.setPW('NormalSubPageNoOne_form', 'xValidations', [
		{
			name:'xValidation',
			cond:function(e){
				return !(BTTUtil.equals(this.getPW('NormalSubPageNoOne_text', 'value'), 'Hello') );
			},
			widgets: ['NormalSubPageNoOne_text'],
			hint: ''
		}]);
	} 
}];
dojo.addOnLoad(function(){
  engine.registerRules(NormalSubPageNoOne);
});