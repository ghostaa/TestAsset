window.SVT_8103_MSG_manager = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'SVT_8103_MSG_manager_button', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SVT_8103_MSG_manager_webMessageWidget', 'broadcastMsg', '{\"msg\":\"broad cast\\n\"}');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'SVT_8103_MSG_manager_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SVT_8103_MSG_manager_webMessageWidget', 'publishMsg', '/fund', '{\"msg\":\"fund\\n\"}');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'SVT_8103_MSG_manager_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SVT_8103_MSG_manager_webMessageWidget', 'sendPrivateMsg', 'user', '{\"msg\":\"pravite msg\\n\"}');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'SVT_8103_MSG_manager_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SVT_8103_MSG_manager_webMessageWidget', 'publishMsg', '/stock', '{\"msg\":\"stock\\n\"}');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'SVT_8103_MSG_manager_button04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SVT_8103_MSG_manager_form', 'callAsyncOpWithMapping', 'svt_8103_msg_server_manager_Op', 'callback', 5000, 'SVT_8103_MSG_manager_2_input', 'SVT_8103_MSG_manager_1_output', true);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(SVT_8103_MSG_manager);
});