window.TestCheckedMultiSelectECA = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TestCheckedMultiSelectECA_checkedMultiSelect', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelectECA_label02', 'text', this.getPW('TestCheckedMultiSelectECA_checkedMultiSelect', 'value'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'TestCheckedMultiSelectECA_checkedMultiSelect01', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelectECA_label04', 'text', this.getPW('TestCheckedMultiSelectECA_checkedMultiSelect01', 'value'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TestCheckedMultiSelectECA_checkedMultiSelect02', e: 'onBlur'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelectECA_label11', 'text', this.getPW('TestCheckedMultiSelectECA_checkedMultiSelect02', 'value'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'TestCheckedMultiSelectECA_checkedMultiSelect03', e: 'onKeyDown'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelectECA_label12', 'text', this.getPW('TestCheckedMultiSelectECA_checkedMultiSelect03', 'value'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'TestCheckedMultiSelectECA_checkedMultiSelect04', e: 'onKeyPress'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelectECA_label13', 'text', this.getPW('TestCheckedMultiSelectECA_checkedMultiSelect04', 'value'));
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'TestCheckedMultiSelectECA_checkedMultiSelect05', e: 'onKeyUp'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelectECA_label14', 'text', this.getPW('TestCheckedMultiSelectECA_checkedMultiSelect05', 'value'));
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'TestCheckedMultiSelectECA_checkedMultiSelect06', e: 'onMouseDown'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelectECA_label15', 'text', this.getPW('TestCheckedMultiSelectECA_checkedMultiSelect06', 'value'));
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'TestCheckedMultiSelectECA_checkedMultiSelect07', e: 'onMouseUp'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelectECA_label16', 'text', this.getPW('TestCheckedMultiSelectECA_checkedMultiSelect07', 'value'));
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'TestCheckedMultiSelectECA_checkedMultiSelect08', e: 'onMouseEnter'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelectECA_label17', 'text', this.getPW('TestCheckedMultiSelectECA_checkedMultiSelect08', 'value'));
  }
}, 
{ /* ecaRule09 */
  name: 'ecaRule09',
  evts: [{ id: 'TestCheckedMultiSelectECA_checkedMultiSelect09', e: 'onMouseLeave'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelectECA_label18', 'text', this.getPW('TestCheckedMultiSelectECA_checkedMultiSelect09', 'value'));
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'TestCheckedMultiSelectECA_checkedMultiSelect10', e: 'onMouseMove'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelectECA_label20', 'text', this.getPW('TestCheckedMultiSelectECA_checkedMultiSelect10', 'value'));
  }
}, 
{ /* ecaRule11 */
  name: 'ecaRule11',
  evts: [{ id: 'TestCheckedMultiSelectECA_checkedMultiSelect11', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelectECA_label21', 'text', this.getPW('TestCheckedMultiSelectECA_checkedMultiSelect11', 'value'));
  }
}, 
{ /* ecaRule12 */
  name: 'ecaRule12',
  evts: [{ id: 'TestCheckedMultiSelectECA_checkedMultiSelect12', e: 'onAsyncOK'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelectECA_label22', 'text', this.getPW('TestCheckedMultiSelectECA_checkedMultiSelect12', 'value'));
  }
}, 
{ /* ecaRule13 */
  name: 'ecaRule13',
  evts: [{ id: 'TestCheckedMultiSelectECA_checkedMultiSelect13', e: 'onAsyncError'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelectECA_label23', 'text', this.getPW('TestCheckedMultiSelectECA_checkedMultiSelect13', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TestCheckedMultiSelectECA);
});