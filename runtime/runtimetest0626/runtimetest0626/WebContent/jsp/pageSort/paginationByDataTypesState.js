window.paginationByDataTypesState = [{ /* MakeTableGone */
  name: 'MakeTableGone',
  evts: [{ id: 'paginationByDataTypesState_btnGone', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('paginationByDataTypesState_Table01', 'visibility', 'gone');
  }
}, 
{ /* MakeTableHidden */
  name: 'MakeTableHidden',
  evts: [{ id: 'paginationByDataTypesState_btnHidden', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('paginationByDataTypesState_Table01', 'visibility', 'hidden');
  }
}, 
{ /* MakeTableVisible */
  name: 'MakeTableVisible',
  evts: [{ id: 'paginationByDataTypesState_btnVisible', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('paginationByDataTypesState_Table01', 'visibility', 'visible');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(paginationByDataTypesState);
});