window.TableAbnormalICollAfterSubmitted = [{ /* onselected */
  name: 'onselected',
  evts: [{ id: 'TableAbnormalICollAfterSubmitted_Table01', e: 'onSelected'}],
  onTrue: function(e) {
    this.setPW('TableAbnormalICollAfterSubmitted_Label02', 'text', this.getPW('TableAbnormalICollAfterSubmitted_Label02', 'text') + 'selected');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TableAbnormalICollAfterSubmitted);
});