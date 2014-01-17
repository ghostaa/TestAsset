window.SVT_8103_accountDetail = [{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'SVT_8103_accountDetail_Subscribe Fund topic', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SVT_8103_accountDetail_webMessageWidget', 'subscribe', '/fund');
    this.setPW('SVT_8103_accountDetail_describe Fund topic', 'visibility', 'visible');
    this.setPW('SVT_8103_accountDetail_Subscribe Fund topic', 'visibility', 'gone');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'SVT_8103_accountDetail_Subscribe Stock topic', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SVT_8103_accountDetail_webMessageWidget', 'subscribe', '/stock');
    this.setPW('SVT_8103_accountDetail_Subscribe Stock topic', 'visibility', 'gone');
    this.setPW('SVT_8103_accountDetail_describe Stock topic', 'visibility', 'visible');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'SVT_8103_accountDetail_describe Fund topic', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SVT_8103_accountDetail_webMessageWidget', 'unsubscribe', '/fund');
    this.setPW('SVT_8103_accountDetail_describe Fund topic', 'visibility', 'gone');
    this.setPW('SVT_8103_accountDetail_Subscribe Fund topic', 'visibility', 'visible');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'SVT_8103_accountDetail_describe Stock topic', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('SVT_8103_accountDetail_webMessageWidget', 'unsubscribe', '/stock');
    this.setPW('SVT_8103_accountDetail_Subscribe Stock topic', 'visibility', 'visible');
    this.setPW('SVT_8103_accountDetail_describe Stock topic', 'visibility', 'gone');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'SVT_8103_accountDetail_webMessageWidget', e: 'onWebMessage'}],
  onTrue: function(e) {
    this.setPW('SVT_8103_accountDetail_textArea', 'value', this.getPW('SVT_8103_accountDetail_textArea', 'value') + e.data.msg);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(SVT_8103_accountDetail);
});