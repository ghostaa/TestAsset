window.AjaxTest = [{ /* textOnChange */
  name: 'textOnChange',
  evts: [{ id: 'AjaxTest_Text03', e: 'onChange'}],
  onTrue: function(e) {
    this.runWF('AjaxTest_Form01', 'callAsyncOperation', 'AjaxTestOp', 'onChange', 1000);
  }
}, 
{ /* ajaxRequest */
  name: 'ajaxRequest',
  evts: [{ id: 'AjaxTest_Text01', e: 'onKeyPress'}],
  onTrue: function(e) {
    this.runWF('AjaxTest_Form01', 'callAsyncOperation', 'AjaxTestOp', 'te', 1000);
  }
}, 
{ /* ajaxTextOnChangeOk */
  name: 'ajaxTextOnChangeOk',
  evts: [{ id: 'AjaxTest_Form01', e: 'onAsyncOK'}],
  cond: function(e) {
    return this.getPW('AjaxTest_Form01', 'asyncCode') == 'onChange';
  },
  onTrue: function(e) {
    this.runWF('AjaxTest_Message02', 'display', 'code:    ' + ((this.getPW('AjaxTest_Form01', 'asyncCode') + ('    status:  ' + (this.getPW('AjaxTest_Form01', 'asyncStatus') + ('   ErrorMessage:  ' + this.getPW('AjaxTest_Form01', 'asyncErrorMessage'))))) + ' '));
  }
}, 
{ /* ajaxOk */
  name: 'ajaxOk',
  evts: [{ id: 'AjaxTest_Form01', e: 'onAsyncOK'}],
  cond: function(e) {
    return this.getPW('AjaxTest_Form01', 'asyncCode') == 'te';
  },
  onTrue: function(e) {
    this.runWF('AjaxTest_Message01', 'display', 'code :' + (this.getPW('AjaxTest_Form01', 'asyncCode') + ('   Status : ' + (this.getPW('AjaxTest_Form01', 'asyncStatus') + ('  ErrorMessage  :' + this.getPW('AjaxTest_Form01', 'asyncErrorMessage'))))));
  }
}, 
{ /* ajax404 */
  name: 'ajax404',
  evts: [{ id: 'AjaxTest_Form01', e: 'onAsyncError'}],
  cond: function(e) {
    return this.getPW('AjaxTest_Form01', 'asyncCode') == 'E404';
  },
  onTrue: function(e) {
    this.runWF('AjaxTest_Message04', 'display', 'code =  ' + (this.getPW('AjaxTest_Form01', 'asyncCode') + ('   Status =  ' + (this.getPW('AjaxTest_Form01', 'asyncStatus') + ('    ErrorMessage = ' + this.getPW('AjaxTest_Form01', 'asyncErrorMessage'))))));
  }
}, 
{ /* 404click */
  name: '404click',
  evts: [{ id: 'AjaxTest_Button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('AjaxTest_Form01', 'callAsyncOperation', 'noneOp', 'E404', 1000);
  }
}, 
{ /* exceptionClick */
  name: 'exceptionClick',
  evts: [{ id: 'AjaxTest_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('AjaxTest_Form01', 'callAsyncOperation', 'AjaxExceptionTestOp', 'E500', 1000);
  }
}, 
{ /* Ajax500Error */
  name: 'Ajax500Error',
  evts: [{ id: 'AjaxTest_Form01', e: 'onAsyncError'}],
  cond: function(e) {
    return this.getPW('AjaxTest_Form01', 'asyncCode') == 'E500';
  },
  onTrue: function(e) {
    this.runWF('AjaxTest_Message05', 'display', (this.getPW('AjaxTest_Form01', 'asyncCode') + '______') + (('Status : ' + this.getPW('AjaxTest_Form01', 'asyncStatus')) + ('             ErrorMessage :' + this.getPW('AjaxTest_Form01', 'asyncErrorMessage'))));
  }
}, 
{ /* Ajax500ok */
  name: 'Ajax500ok',
  evts: [{ id: 'AjaxTest_Form01', e: 'onAsyncOK'}],
  cond: function(e) {
    return this.getPW('AjaxTest_Form01', 'asyncCode') == 'E500';
  },
  onTrue: function(e) {
    this.runWF('AjaxTest_Message06', 'display', 'code:' + (this.getPW('AjaxTest_Form01', 'asyncCode') + ('      status:' + (this.getPW('AjaxTest_Form01', 'asyncStatus') + ('   ErrorMessage:' + this.getPW('AjaxTest_Form01', 'asyncErrorMessage'))))));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(AjaxTest);
});