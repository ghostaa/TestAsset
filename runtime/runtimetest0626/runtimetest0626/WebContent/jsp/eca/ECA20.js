window.ECA20 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'ECA20_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('ECA20_text', 'value', '1111');
    this.setPW('ECA20_text01', 'value', '2222');
    this.setPW('ECA20_text02', 'value', '3333');
    this.setPW('ECA20_text03', 'value', '4444');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(ECA20);
});