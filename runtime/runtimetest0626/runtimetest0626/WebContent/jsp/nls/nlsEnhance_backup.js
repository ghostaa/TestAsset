window.nlsEnhance_backup = [{ /* nls */
  name: 'nls',
  evts: [{ id: 'nlsEnhance_backup_Button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('nlsEnhance_backup_Button01', 'text', '%nls.BTTResource/I18N_MESSAGE');
  }
}, 
{ /* nls with obj */
  name: 'nls with obj',
  evts: [{ id: 'nlsEnhance_backup_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('nlsEnhance_backup_Label03', 'text', 'fff');
  }
}, 
{ /* nls with no param */
  name: 'nls with no param',
  evts: [{ id: 'nlsEnhance_backup_Button03', e: 'onClick'}]
}, 
{ /* nls with multi params */
  name: 'nls with multi params',
  evts: [{ id: 'nlsEnhance_backup_Button04', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('nlsEnhance_backup_Label03', 'text', 'd');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(nlsEnhance_backup);
});