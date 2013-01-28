window.multLine = [{ /* MultiLine */
  name: 'MultiLine',
  evts: [{ id: 'multLine_Button05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('multLine_Label01', 'text', '%nls.BTTResource/MultiLine');
    this.setPW('multLine_Button01', 'text', '%nls.BTTResource/MultiLine');
    this.setPW('multLine_Link01', 'text', '%nls.BTTResource/MultiLine');
    this.setPW('multLine_Radio01', 'text', '%nls.BTTResource/MultiLine');
    this.setPW('multLine_CheckBox01', 'text', '%nls.BTTResource/MultiLine');
    this.runWF('multLine_Message01', 'display', '%nls.BTTResource/MultiLine');
    this.setPW('multLine_Label02', 'text', 'Fresh Flower');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(multLine);
});