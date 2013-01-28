window.AfterFileUpload = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'AfterFileUpload_button', e: 'onClick'}]
}];
dojo.addOnLoad(function(){
  engine.registerRules(AfterFileUpload);
});