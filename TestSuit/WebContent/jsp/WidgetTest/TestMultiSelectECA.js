window.TestMultiSelectECA = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TestMultiSelectECA_multiSelect01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelectECA_label02', 'text', this.getPW('TestMultiSelectECA_multiSelect01', 'value'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'TestMultiSelectECA_multiSelect02', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelectECA_label04', 'text', this.getPW('TestMultiSelectECA_multiSelect02', 'value'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TestMultiSelectECA_multiSelect03', e: 'onBlur'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelectECA_label11', 'text', this.getPW('TestMultiSelectECA_multiSelect03', 'value'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'TestMultiSelectECA_multiSelect04', e: 'onKeyDown'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelectECA_label12', 'text', this.getPW('TestMultiSelectECA_multiSelect04', 'value'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'TestMultiSelectECA_multiSelect05', e: 'onKeyPress'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelectECA_label13', 'text', this.getPW('TestMultiSelectECA_multiSelect05', 'value'));
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'TestMultiSelectECA_multiSelect06', e: 'onKeyUp'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelectECA_label14', 'text', this.getPW('TestMultiSelectECA_multiSelect06', 'value'));
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'TestMultiSelectECA_multiSelect07', e: 'onMouseDown'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelectECA_label15', 'text', this.getPW('TestMultiSelectECA_multiSelect07', 'value'));
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'TestMultiSelectECA_multiSelect08', e: 'onMouseUp'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelectECA_label16', 'text', this.getPW('TestMultiSelectECA_multiSelect08', 'value'));
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'TestMultiSelectECA_multiSelect09', e: 'onMouseEnter'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelectECA_label17', 'text', this.getPW('TestMultiSelectECA_multiSelect09', 'value'));
  }
}, 
{ /* ecaRule09 */
  name: 'ecaRule09',
  evts: [{ id: 'TestMultiSelectECA_multiSelect10', e: 'onMouseLeave'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelectECA_label18', 'text', this.getPW('TestMultiSelectECA_multiSelect10', 'value'));
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'TestMultiSelectECA_multiSelect11', e: 'onMouseMove'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelectECA_label20', 'text', this.getPW('TestMultiSelectECA_multiSelect11', 'value'));
  }
}, 
{ /* ecaRule11 */
  name: 'ecaRule11',
  evts: [{ id: 'TestMultiSelectECA_multiSelect12', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelectECA_label21', 'text', this.getPW('TestMultiSelectECA_multiSelect12', 'value'));
  }
}, 
{ /* ecaRule12 */
  name: 'ecaRule12',
  evts: [{ id: 'TestMultiSelectECA_multiSelect13', e: 'onAsyncOK'}]
}, 
{ /* ecaRule13 */
  name: 'ecaRule13',
  evts: [{ id: 'TestMultiSelectECA_multiSelect14', e: 'onAsyncError'}]
}];
dojo.addOnLoad(function(){
  engine.registerRules(TestMultiSelectECA);
});