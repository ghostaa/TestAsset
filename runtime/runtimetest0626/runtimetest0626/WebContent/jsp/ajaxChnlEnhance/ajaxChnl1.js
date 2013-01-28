window.ajaxChnl1 = [{ /* InvokeBttOperationInAsyncWay */
  name: 'InvokeBttOperationInAsyncWay',
  evts: [{ id: 'ajaxChnl1_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ajaxChnl1_Form01', 'callAsyncOperation', 'ajaxEnhanceOpInvokedBeforeOp', 'BeforeSubmitToOpIDCode', 7000);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(ajaxChnl1);
});