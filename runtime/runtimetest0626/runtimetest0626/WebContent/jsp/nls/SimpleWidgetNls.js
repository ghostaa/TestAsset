window.SimpleWidgetNls = [{ /* IsFocusableClick */
  name: 'IsFocusableClick',
  evts: [{ id: 'SimpleWidgetNls_btnIsFocusable', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('SimpleWidgetNls_btnForTest', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('SimpleWidgetNls_lblInfo', 'text', 'Button isFocusable return TRUE');
  },
  onFalse: function(e) {
    this.setPW('SimpleWidgetNls_lblInfo', 'text', 'Button isFocusable return FALSE');
  }
}, 
{ /* DisableClick */
  name: 'DisableClick',
  evts: [{ id: 'SimpleWidgetNls_btnDisable', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('SimpleWidgetNls_btnForTest', 'inValid', true);
  }
}, 
{ /* EnableClick */
  name: 'EnableClick',
  evts: [{ id: 'SimpleWidgetNls_btnEnable', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('SimpleWidgetNls_btnForTest', 'inValid', false);
  }
}, 
{ /* ReadOnlyClick */
  name: 'ReadOnlyClick',
  evts: [{ id: 'SimpleWidgetNls_btnReadOnly', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('SimpleWidgetNls_lblInfo', 'text', 'Button does not support attribute readOnly, ignore it!');
  }
}, 
{ /* UndoReadOnlyClick */
  name: 'UndoReadOnlyClick',
  evts: [{ id: 'SimpleWidgetNls_btnUndoReadOnly', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('SimpleWidgetNls_lblInfo', 'text', 'Nothing need to be done!');
  }
}, 
{ /* HideClick */
  name: 'HideClick',
  evts: [{ id: 'SimpleWidgetNls_btnHide', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('SimpleWidgetNls_btnForTest', 'visibility', 'hidden');
  }
}, 
{ /* VisableClick */
  name: 'VisableClick',
  evts: [{ id: 'SimpleWidgetNls_btnVisible', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('SimpleWidgetNls_btnForTest', 'visibility', 'visable');
  }
}, 
{ /* GoneClick */
  name: 'GoneClick',
  evts: [{ id: 'SimpleWidgetNls_btnGone', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('SimpleWidgetNls_btnForTest', 'visibility', 'gone');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(SimpleWidgetNls);
});