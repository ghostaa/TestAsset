window.tableAlignTest = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'tableAlignTest_Table01', e: 'onSelected'}],
  onTrue: function(e) {
    this.setPW('tableAlignTest_label', 'text', this.runWF('tableAlignTest_Table01', 'getLengthOfSelectedRows'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(tableAlignTest);
});