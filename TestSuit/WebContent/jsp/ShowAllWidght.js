window.ShowAllWidght = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'ShowAllWidght_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ShowAllWidght_message', 'display', 'This is Message Widght');
  }
}, 
{ /* testScriptWidget */
  name: 'testScriptWidget',
  evts: [{ id: 'ShowAllWidght_button05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ShowAllWidght_Script01', 'execute', 'parameter1\'', 'parameter2\'', 'parameter3', 'parameter4', 'parameter5');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'ShowAllWidght_button06', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ShowAllWidght_Script02', 'execute', 'hello', ' world', ' !', 'Test ', 'case');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'ShowAllWidght_button07', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('ShowAllWidght_labelHiddenValue', 'text', this.getPW('ShowAllWidght_HiddenField01', 'value'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'ShowAllWidght_button08', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('ShowAllWidght_labelHiddenDataName', 'text', this.getPW('ShowAllWidght_HiddenField02', 'value'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'ShowAllWidght_label33', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ShowAllWidght_form02', 'submit');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'ShowAllWidght_label31', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ShowAllWidght_form01', 'submit');
  }
},
{
	name: 'ShowAllWidght_form.xValidation',
	evts: [{id: 'ShowAllWidght_form', e:'onLoaded' }],
	cond: function(e) { return true; },
	onTrue: function(e) {
		this.setPW('ShowAllWidght_form', 'xValidations', [
		{
			name:'xValidation',
			cond:function(e){
				return !(this.getPW('ShowAllWidght_selectList', 'value') != '1');
			},
			widgets: ['ShowAllWidght_selectList'],
			hint: 'The selection must be selected \'City1\' ,this test case is used for xValidations of \'form\' widget'
		}]);
	} 
}];
dojo.addOnLoad(function(){
  engine.registerRules(ShowAllWidght);
});