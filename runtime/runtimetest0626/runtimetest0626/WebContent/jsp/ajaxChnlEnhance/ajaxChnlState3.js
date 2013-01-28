window.ajaxChnlState3 = [{ /* InvokeBttOperationInAsyncWay */
  name: 'InvokeBttOperationInAsyncWay',
  evts: [{ id: 'ajaxChnlState3_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ajaxChnlState3_Form01', 'callAsyncOperation', 'ajaxEnhanceOpInvokedInProc', 'STATE3ID', 30000);
  }
}, 
{ /* FormOnLoadSetDefValue */
  name: 'FormOnLoadSetDefValue',
  evts: [{ id: 'ajaxChnlState3_Form01', e: 'onLoaded'}],
  onTrue: function(e) {
    this.setPW('ajaxChnlState3_Text01', 'value', 'ajaxChnlState3');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(ajaxChnlState3);
});