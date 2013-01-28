window.multiSelectResultWithoutPagination = [{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'multiSelectResultWithoutPagination_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('multiSelectResultWithoutPagination_Link01', 'text', 'asdfasdfa');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(multiSelectResultWithoutPagination);
});