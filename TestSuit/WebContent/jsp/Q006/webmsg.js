window.webmsg = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'webmsg_bt_broadCast', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('webmsg_webMessageWidget', 'broadcastMsg', '{type:\'broadcast_client\', data:{f1:12, f2:false}}');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'webmsg_bt_privateMsg', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('webmsg_webMessageWidget', 'sendPrivateMsg', 'user02', '{type:\"privateMsg_client\", data:{a:\"aaa\"}}');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'webmsg_bt_topic', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('webmsg_webMessageWidget', 'publishMsg', '/btt/topic/test2', '{type:\"topic_client\", data:{a:\"aaa\"}}');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'webmsg_bt_op', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('webmsg_form', 'callAsyncOperation', 'WebMsgOp', 'webmsgop', 6000000);
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'webmsg_webMessageWidget', e: 'onWebMessage'}],
  onTrue: function(e) {
    this.executeAG('webMsg_broadcast',e);
    this.executeAG('webMsg_private',e);
    this.executeAG('webMsg_topic',e);
  }
}, 
{ /* webMsg_broadcast */
  name: 'webMsg_broadcast',
  type:"AG",
  cond: function(e) {
    return BTTUtil.equals(e.channel, '/btt/broadcast') ;
  },
  onTrue: function(e) {
    this.setPW('webmsg_label_broadCast', 'text', e.data.type);
  }
}, 
{ /* webMsg_private */
  name: 'webMsg_private',
  type:"AG",
  cond: function(e) {
    return BTTStringFunctions.contains(e.channel, '/btt/private');
  },
  onTrue: function(e) {
    this.setPW('webmsg_label_privateMsg', 'text', e.data.type);
  }
}, 
{ /* webMsg_topic */
  name: 'webMsg_topic',
  type:"AG",
  cond: function(e) {
    return BTTStringFunctions.contains(e.channel, '/btt/topic');
  },
  onTrue: function(e) {
    this.setPW('webmsg_label_topic', 'text', e.data.type);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(webmsg);
});