window.tableAlignTestAfterSubmitted = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'tableAlignTestAfterSubmitted_Table01', e: 'onSelected'}],
  onTrue: function(e) {
    this.setPW('tableAlignTestAfterSubmitted_label', 'text', this.runWF('tableAlignTestAfterSubmitted_Table01', 'getLengthOfSelectedRows'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(tableAlignTestAfterSubmitted);
});