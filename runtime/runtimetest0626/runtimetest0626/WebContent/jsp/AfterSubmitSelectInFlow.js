window.AfterSubmitSelectInFlow = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'AfterSubmitSelectInFlow_form', e: 'onKeyUp'}],
  cond: function(e) {
    return e.keyCode == 90;
  },
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
console.error("Actions if true:the Shift is press");
}))
{
return;
};
  },
  onFalse: function(e) {
    if(false == this.runInlineScript(this, function(){
console.info("Actions if false:the keyBoard:the Shift is not press");
}))
{
return;
};
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(AfterSubmitSelectInFlow);
});