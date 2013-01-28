window.ajaxChnlJsonFmtErr = [{ /* InvokeBttOperationInAsyncWay */
  name: 'InvokeBttOperationInAsyncWay',
  evts: [{ id: 'ajaxChnlJsonFmtErr_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ajaxChnlJsonFmtErr_Form01', 'callAsyncOperation', 'ajaxEnhanceJSONFormatErrOp', 'JSONFormatOpIDCode', 7000);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(ajaxChnlJsonFmtErr);
});