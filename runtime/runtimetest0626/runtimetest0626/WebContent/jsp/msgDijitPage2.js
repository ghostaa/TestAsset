window.msgDijitPage2 = [{ /* InvokeTheRequest */
  name: 'InvokeTheRequest',
  evts: [{ id: 'msgDijitPage2_Button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('msgDijitPage2_Form01', 'callAsyncOperation', 'generateMsgContentsOp', 'RetIdentifyCode', 15000);
  },
  onFalse: function(e) {
    this.runWF('msgDijitPage2_Form01', 'callAsyncOperation', 'generateMsgContentsOp', 'contentCode');
    this.runWF('msgDijitPage2_mr01', 'displayPopup', 'How can I get the message return from server?', this.getPW('msgDijitPage2_msgLevel', 'value'));
  }
}, 
{ /* OnFormAsyncOkExecute */
  name: 'OnFormAsyncOkExecute',
  evts: [{ id: 'msgDijitPage2_Form01', e: 'onAsyncOK'}],
  cond: function(e) {
    return (this.getPW('msgDijitPage2_Form01', 'asyncCode') == 'RetIdentifyCode') && this.getPW('msgDijitPage2_Radio01', 'isChecked');
  },
  onTrue: function(e) {
    this.setPW('msgDijitPage2_mr01', 'visibility', 'visible');
  },
  onFalse: function(e) {
    this.runWF('msgDijitPage2_mr01', 'displayPopup', 'Here should be the text attribute of message dijit! But now only get the level attribute value:' + this.getPW('msgDijitPage2_mr01', 'level'), this.getPW('msgDijitPage2_msgLevel', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(msgDijitPage2);
});