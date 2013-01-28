window.paginationTimeOutFT-Table = [{ /* PaginationTableTimeoutHandler */
  name: 'PaginationTableTimeoutHandler',
  evts: [{ id: 'paginationTimeOutFT-Table_form', e: 'onAsyncTimeOut'}],
  onTrue: function(e) {
    this.runWF('paginationTimeOutFT-Table_message', 'display', 'Pagination table timeout encountered!', 'WARN');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(paginationTimeOutFT-Table);
});