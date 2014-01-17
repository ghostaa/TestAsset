window.TestCheckedMultiSelect = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TestCheckedMultiSelect_radio', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelect_checkedMultiSelect', 'visibility', 'visible');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'TestCheckedMultiSelect_Radio01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelect_checkedMultiSelect', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TestCheckedMultiSelect_radio02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelect_checkedMultiSelect', 'visibility', 'gone');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'TestCheckedMultiSelect_radio03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelect_checkedMultiSelect', 'disabled', false);
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'TestCheckedMultiSelect_Radio02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelect_checkedMultiSelect', 'disabled', true);
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'TestCheckedMultiSelect_radio04', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelect_checkedMultiSelect', 'readOnly', false);
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'TestCheckedMultiSelect_radio05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelect_checkedMultiSelect', 'readOnly', true);
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'TestCheckedMultiSelect_button07', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestCheckedMultiSelect_checkedMultiSelect', 'hint', this.getPW('TestCheckedMultiSelect_text', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TestCheckedMultiSelect);
});