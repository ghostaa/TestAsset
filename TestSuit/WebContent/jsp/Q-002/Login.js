window.Login = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'Login_fill', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('Login_text', 'value', 'user');
    this.setPW('Login_text01', 'value', '123');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(Login);
});