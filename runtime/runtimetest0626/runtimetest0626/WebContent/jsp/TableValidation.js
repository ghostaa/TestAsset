window.TableValidation = [{ /* NumberInit */
  name: 'NumberInit',
  evts: [{ id: 'TableValidation_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TableValidation_Text01', 'value', 'numberInit');
  }
}, 
{ /* numberSubmit */
  name: 'numberSubmit',
  evts: [{ id: 'TableValidation_Button06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TableValidation_Text01', 'value', 'numberSubmit');
  }
}, 
{ /* StringInit */
  name: 'StringInit',
  evts: [{ id: 'TableValidation_Button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TableValidation_Text04', 'value', 'stringInit');
  }
}, 
{ /* ss */
  name: 'ss',
  evts: [{ id: 'TableValidation_Button05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TableValidation_Text04', 'value', ' ');
  }
}, 
{ /* ci */
  name: 'ci',
  evts: [{ id: 'TableValidation_Button03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TableValidation_Text02', 'value', 'currencyInit');
  }
}, 
{ /* cs */
  name: 'cs',
  evts: [{ id: 'TableValidation_Button07', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TableValidation_Text02', 'value', ' ');
  }
}, 
{ /* ds */
  name: 'ds',
  evts: [{ id: 'TableValidation_Button08', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TableValidation_Text03', 'value', ' ');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TableValidation_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TableValidation_Text03', 'value', 'dateInit');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TableValidation);
});