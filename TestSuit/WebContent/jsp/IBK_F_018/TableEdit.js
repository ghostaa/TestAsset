window.TableEdit = [{ /* AppendDataRule */
  name: 'AppendDataRule',
  evts: [{ id: 'TableEdit_AppendButton', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TableEdit_form', 'callAsyncOperation', 'IBK_F_018_TableDataAppendInputOp', 'inputForTableAppend', 60000);
    this.runWF('TableEdit_AppendInputScript01', 'execute');
  }
}, 
{ /* newEmptyRowRule */
  name: 'newEmptyRowRule',
  evts: [{ id: 'TableEdit_NewButton', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TableEdit_newRowScript', 'execute');
  }
}, 
{ /* DeleteRowRule */
  name: 'DeleteRowRule',
  evts: [{ id: 'TableEdit_DeleteButton', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TableEdit_DeleteRowScript', 'execute');
  }
}, 
{ /* upRule */
  name: 'upRule',
  evts: [{ id: 'TableEdit_UpButton', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TableEdit_UpDownScript', 'execute', 'Up');
  }
}, 
{ /* downRule */
  name: 'downRule',
  evts: [{ id: 'TableEdit_DownButton', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TableEdit_UpDownScript', 'execute', 'Down');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TableEdit);
});