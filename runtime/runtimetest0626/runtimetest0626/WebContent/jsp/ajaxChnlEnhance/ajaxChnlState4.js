window.ajaxChnlState4 = [{ /* InvokeBttOperationInAsyncWay */
  name: 'InvokeBttOperationInAsyncWay',
  evts: [{ id: 'ajaxChnlState4_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ajaxChnlState4_Form01', 'callAsyncOperation', 'ajaxEnhanceOpInvokedInProc', 'STATE4ID', 30000);
  }
}, 
{ /* FormOnLoadSetDefValue */
  name: 'FormOnLoadSetDefValue',
  evts: [{ id: 'ajaxChnlState4_Form01', e: 'onLoaded'}],
  onTrue: function(e) {
    this.setPW('ajaxChnlState4_Text01', 'value', 'ajaxChnlState4');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(ajaxChnlState4);
});