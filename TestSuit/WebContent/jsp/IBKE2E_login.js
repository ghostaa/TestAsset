window.IBKE2E_login = [{ /* imageClick */
  name: 'imageClick',
  evts: [{ id: 'IBKE2E_login_image', e: 'onClick'}],
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
window.alert("please use user01 as UserName to login");
}))
{
return;
};
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(IBKE2E_login);
});