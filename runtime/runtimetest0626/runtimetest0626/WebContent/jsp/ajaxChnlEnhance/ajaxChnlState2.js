window.ajaxChnlState2 = [{ /* InvokeBttOperationInAsyncWay */
  name: 'InvokeBttOperationInAsyncWay',
  evts: [{ id: 'ajaxChnlState2_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ajaxChnlState2_Form01', 'callAsyncOperation', 'ajaxEnhanceOpInvokedInProc', 'STATE2ID', 30000);
  }
}, 
{ /* FormOnLoadSetDefValue */
  name: 'FormOnLoadSetDefValue',
  evts: [{ id: 'ajaxChnlState2_Form01', e: 'onLoaded'}],
  onTrue: function(e) {
    this.setPW('ajaxChnlState2_Text01', 'value', 'ajaxChnlState2');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(ajaxChnlState2);
});