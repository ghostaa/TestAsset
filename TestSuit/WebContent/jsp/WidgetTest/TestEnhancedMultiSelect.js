window.TestEnhancedMultiSelect = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TestEnhancedMultiSelect_radio03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelect_checkedMultiSelectExt', 'disabled', false);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'TestEnhancedMultiSelect_radio04', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelect_checkedMultiSelectExt', 'disabled', true);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TestEnhancedMultiSelect_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelect_checkedMultiSelectExt', 'hint', this.getPW('TestEnhancedMultiSelect_text', 'value'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'TestEnhancedMultiSelect_radio05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelect_checkedMultiSelectExt', 'readOnly', false);
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'TestEnhancedMultiSelect_radio', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelect_checkedMultiSelectExt', 'visibility', 'visible');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'TestEnhancedMultiSelect_radio01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelect_checkedMultiSelectExt', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'TestEnhancedMultiSelect_radio02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelect_checkedMultiSelectExt', 'visibility', 'gone');
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'TestEnhancedMultiSelect_radio06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestEnhancedMultiSelect_checkedMultiSelectExt', 'readOnly', true);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TestEnhancedMultiSelect);
});