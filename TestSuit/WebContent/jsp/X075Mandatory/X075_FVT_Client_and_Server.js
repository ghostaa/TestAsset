window.X075_FVT_Client_and_Server = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X075_FVT_Client_and_Server_button01', e: 'onClick'}],
  cond: function(e) {
    return BTTUtil.equals(this.getPW('X075_FVT_Client_and_Server_text', 'required'), true) ;
  },
  onTrue: function(e) {
    this.setPW('X075_FVT_Client_and_Server_text', 'required', false);
  },
  onFalse: function(e) {
    this.setPW('X075_FVT_Client_and_Server_text', 'required', true);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X075_FVT_Client_and_Server_button03', e: 'onClick'}],
  cond: function(e) {
    return BTTUtil.equals(this.getPW('X075_FVT_Client_and_Server_text01', 'required'), true) ;
  },
  onTrue: function(e) {
    this.setPW('X075_FVT_Client_and_Server_text01', 'required', false);
  },
  onFalse: function(e) {
    this.setPW('X075_FVT_Client_and_Server_text01', 'required', true);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(X075_FVT_Client_and_Server);
});