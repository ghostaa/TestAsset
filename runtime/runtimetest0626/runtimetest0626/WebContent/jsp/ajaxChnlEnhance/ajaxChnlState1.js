window.ajaxChnlState1 = [{ /* InvokeBttOperationInAsyncWay */
  name: 'InvokeBttOperationInAsyncWay',
  evts: [{ id: 'ajaxChnlState1_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ajaxChnlState1_Form01', 'callAsyncOperation', 'ajaxEnhanceOpInvokedInProc', 'STATE1ID', 30000);
  }
}, 
{ /* FormOnLoadSetDefValue */
  name: 'FormOnLoadSetDefValue',
  evts: [{ id: 'ajaxChnlState1_Form01', e: 'onLoaded'}],
  onTrue: function(e) {
    this.setPW('ajaxChnlState1_Text01', 'value', 'ajaxChnlState1');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(ajaxChnlState1);
});