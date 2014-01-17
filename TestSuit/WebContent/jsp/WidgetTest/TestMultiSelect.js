window.TestMultiSelect = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TestMultiSelect_radio', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelect_multiSelect', 'visibility', 'visible');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'TestMultiSelect_radio01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelect_multiSelect', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TestMultiSelect_radio02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelect_multiSelect', 'visibility', 'gone');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'TestMultiSelect_radio03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelect_multiSelect', 'disabled', false);
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'TestMultiSelect_radio04', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelect_multiSelect', 'disabled', true);
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'TestMultiSelect_radio05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelect_multiSelect', 'readOnly', false);
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'TestMultiSelect_radio06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelect_multiSelect', 'readOnly', true);
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'TestMultiSelect_button_copy', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestMultiSelect_multiSelect', 'hint', this.getPW('TestMultiSelect_text', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TestMultiSelect);
});