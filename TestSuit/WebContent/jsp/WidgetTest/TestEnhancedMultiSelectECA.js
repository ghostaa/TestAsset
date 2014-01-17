window.TestEnhancedMultiSelectECA = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TestEnhancedMultiSelectECA_checkedMultiSelectExt', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelectECA_label16', 'text', this.getPW('TestEnhancedMultiSelectECA_checkedMultiSelectExt', 'value'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'TestEnhancedMultiSelectECA_checkedMultiSelectExt01', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelectECA_label17', 'text', this.getPW('TestEnhancedMultiSelectECA_checkedMultiSelectExt01', 'value'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TestEnhancedMultiSelectECA_checkedMultiSelectExt02', e: 'onBlur'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelectECA_label18', 'text', this.getPW('TestEnhancedMultiSelectECA_checkedMultiSelectExt02', 'value'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'TestEnhancedMultiSelectECA_checkedMultiSelectExt03', e: 'onKeyDown'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelectECA_label19', 'text', this.getPW('TestEnhancedMultiSelectECA_checkedMultiSelectExt03', 'value'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'TestEnhancedMultiSelectECA_checkedMultiSelectExt04', e: 'onKeyPress'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelectECA_label20', 'text', this.getPW('TestEnhancedMultiSelectECA_checkedMultiSelectExt04', 'value'));
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'TestEnhancedMultiSelectECA_checkedMultiSelectExt05', e: 'onKeyUp'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelectECA_label21', 'text', this.getPW('TestEnhancedMultiSelectECA_checkedMultiSelectExt05', 'value'));
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'TestEnhancedMultiSelectECA_checkedMultiSelectExt06', e: 'onMouseDown'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelectECA_label22', 'text', this.getPW('TestEnhancedMultiSelectECA_checkedMultiSelectExt06', 'value'));
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'TestEnhancedMultiSelectECA_checkedMultiSelectExt07', e: 'onMouseUp'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelectECA_label23', 'text', this.getPW('TestEnhancedMultiSelectECA_checkedMultiSelectExt07', 'value'));
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'TestEnhancedMultiSelectECA_checkedMultiSelectExt08', e: 'onMouseEnter'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelectECA_label24', 'text', this.getPW('TestEnhancedMultiSelectECA_checkedMultiSelectExt08', 'value'));
  }
}, 
{ /* ecaRule09 */
  name: 'ecaRule09',
  evts: [{ id: 'TestEnhancedMultiSelectECA_checkedMultiSelectExt09', e: 'onMouseLeave'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelectECA_label25', 'text', this.getPW('TestEnhancedMultiSelectECA_checkedMultiSelectExt09', 'value'));
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'TestEnhancedMultiSelectECA_checkedMultiSelectExt10', e: 'onMouseMove'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelectECA_label26', 'text', this.getPW('TestEnhancedMultiSelectECA_checkedMultiSelectExt10', 'value'));
  }
}, 
{ /* ecaRule11 */
  name: 'ecaRule11',
  evts: [{ id: 'TestEnhancedMultiSelectECA_checkedMultiSelectExt11', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelectECA_label27', 'text', this.getPW('TestEnhancedMultiSelectECA_checkedMultiSelectExt11', 'value'));
  }
}, 
{ /* ecaRule12 */
  name: 'ecaRule12',
  evts: [{ id: 'TestEnhancedMultiSelectECA_checkedMultiSelectExt12', e: 'onAsyncOK'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelectECA_label28', 'text', this.getPW('TestEnhancedMultiSelectECA_checkedMultiSelectExt12', 'value'));
  }
}, 
{ /* ecaRule13 */
  name: 'ecaRule13',
  evts: [{ id: 'TestEnhancedMultiSelectECA_checkedMultiSelectExt13', e: 'onAsyncError'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelectECA_label29', 'text', this.getPW('TestEnhancedMultiSelectECA_checkedMultiSelectExt13', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TestEnhancedMultiSelectECA);
});