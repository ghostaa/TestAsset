window.abnormalKcollSubmit = [{ /* CallAjaxOperation */
  name: 'CallAjaxOperation',
  evts: [{ id: 'abnormalKcollSubmit_btnAjax', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('abnormalKcollSubmit_Form01', 'callAsyncOperation', 'abnormalKcollSubmitOp', 'AjaxInvocationId', 60000);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(abnormalKcollSubmit);
});