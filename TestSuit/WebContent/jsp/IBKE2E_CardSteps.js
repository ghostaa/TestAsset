window.IBKE2E_CardSteps = [{ /* inputSampleData */
  name: 'inputSampleData',
  evts: [{ id: 'IBKE2E_CardSteps_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('IBKE2E_CardSteps_Script01', 'execute', 'Jack', 'Chen', '1971-01-01', '123456789', 'IBM', '12000');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(IBKE2E_CardSteps);
});