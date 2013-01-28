window.RichText = [{ /* SetValueByECA */
  name: 'SetValueByECA',
  evts: [{ id: 'RichText_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('RichText_RichText01', 'value', 'setValueByECA');
  }
}, 
{ /* changeHint */
  name: 'changeHint',
  evts: [{ id: 'RichText_Button03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('RichText_RichText01', 'hint', 'new hint for richTextEditor');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'RichText_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('RichText_RichText01', 'readOnly', ! this.getPW('RichText_RichText01', 'readOnly'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(RichText);
});