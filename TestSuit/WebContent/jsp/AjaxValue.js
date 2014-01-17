window.AjaxValue = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'AjaxValue_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('AjaxValue_form', 'callAsyncOperation', 'AjaxTestOp', 'inputValue', 5000, true);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(AjaxValue);
});