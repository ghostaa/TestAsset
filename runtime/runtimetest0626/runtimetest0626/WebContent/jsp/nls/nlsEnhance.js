window.nlsEnhance = [{ /* nls */
  name: 'nls',
  evts: [{ id: 'nlsEnhance_Button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('nlsEnhance_Button01', 'text', '%nls.BTTResource/I18N_MESSAGE');
  }
}, 
{ /* nls with obj */
  name: 'nls with obj',
  evts: [{ id: 'nlsEnhance_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('nlsEnhance_Label03', 'text', 'fff');
  }
}, 
{ /* nls with no param */
  name: 'nls with no param',
  evts: [{ id: 'nlsEnhance_Button03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('nlsEnhance_Label01', 'text', '%nls.BTTResource/Sample');
  }
}, 
{ /* nls with multi params */
  name: 'nls with multi params',
  evts: [{ id: 'nlsEnhance_Button04', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('nlsEnhance_Label03', 'text', 'd');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(nlsEnhance);
});