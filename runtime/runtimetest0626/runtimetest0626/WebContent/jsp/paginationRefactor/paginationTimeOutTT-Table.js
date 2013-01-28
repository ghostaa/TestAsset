window.paginationTimeOutTT-Table = [{ /* PaginationTableTimeoutHandler */
  name: 'PaginationTableTimeoutHandler',
  evts: [{ id: 'paginationTimeOutTT-Table_form', e: 'onAsyncTimeOut'}],
  onTrue: function(e) {
    this.runWF('paginationTimeOutTT-Table_message', 'displayPopup', 'Timeout event encountered!', 'ERROR');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(paginationTimeOutTT-Table);
});