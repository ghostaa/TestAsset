window.select = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'select_form', e: 'onKeyDown'}, { id: 'select_form', e: 'onKeyPress'}],
  cond: function(e) {
    return e.altKey == 'true';
  },
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
console.error("this event is onKeyPress.You press the keyBoard:Alt");
}))
{
return;
};
  },
  onFalse: function(e) {
    if(false == this.runInlineScript(this, function(){

console.log("this is execution that Actions if false");
}))
{
return;
};
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(select);
});