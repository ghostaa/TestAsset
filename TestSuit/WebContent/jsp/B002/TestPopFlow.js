[{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'TestPopFlow_button', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW('TestPopFlow_stateFlag', 'value', 'PopupSubFlow');
  }
}]