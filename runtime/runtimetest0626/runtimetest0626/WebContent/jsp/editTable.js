window.editTable = [{ /* SubmitAjax */
  name: 'SubmitAjax',
  evts: [{ id: 'editTable_AjaxButton', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('editTable_Form01', 'callAsyncOperation', 'TableAjaxOperation', 'TableAjax', 1000);
  }
}, 
{ /* ajax without op */
  name: 'ajax without op',
  evts: [{ id: 'editTable_Button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('editTable_Form01', 'callAsyncOperation', '', 'editTable', 1000);
  }
}, 
{ /* readonlyTrue */
  name: 'readonlyTrue',
  evts: [{ id: 'editTable_Button05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('editTable_Table01', 'readOnly', true);
  }
}, 
{ /* button06 */
  name: 'button06',
  evts: [{ id: 'editTable_Button06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('editTable_Table01', 'readOnly', false);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(editTable);
});