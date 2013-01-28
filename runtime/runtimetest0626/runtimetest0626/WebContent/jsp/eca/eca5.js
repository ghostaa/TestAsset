window.eca5 = [{ /* CallAjaxRequest */
  name: 'CallAjaxRequest',
  evts: [{ id: 'eca5_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('eca5_Form01', 'callAsyncOperation', 'eca5Op', 'eca5Code', 1000);
  }
}, 
{ /* AjaxReqResp */
  name: 'AjaxReqResp',
  evts: [{ id: 'eca5_Button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('eca5_Form01', 'callAsyncOperation', 'eca5Op', 'eca5Code', 1000);
  }
}, 
{ /* AjaxReqClick */
  name: 'AjaxReqClick',
  evts: [{ id: 'eca5_Radio01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca5_Button02', 'inValid', false);
    this.setPW('eca5_Button03', 'inValid', true);
    this.setPW('eca5_Button01', 'inValid', true);
  }
}, 
{ /* AjaxReqRepClick */
  name: 'AjaxReqRepClick',
  evts: [{ id: 'eca5_Radio03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca5_Button02', 'inValid', true);
    this.setPW('eca5_Button03', 'inValid', false);
    this.setPW('eca5_Button01', 'inValid', true);
  }
}, 
{ /* FormClick */
  name: 'FormClick',
  evts: [{ id: 'eca5_Radio02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca5_Button02', 'inValid', true);
    this.setPW('eca5_Button03', 'inValid', true);
    this.setPW('eca5_Button01', 'inValid', false);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(eca5);
});