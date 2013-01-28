window.TableAbnormalIColl = [{ /* onselected */
  name: 'onselected',
  evts: [{ id: 'TableAbnormalIColl_Table01', e: 'onSelected'}],
  onTrue: function(e) {
    this.setPW('TableAbnormalIColl_Label02', 'text', this.getPW('TableAbnormalIColl_Label02', 'text') + 'selected');
    this.runWF('TableAbnormalIColl_Table01', 'getValueInFirstSelectedItem', 'Table01');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TableAbnormalIColl_Button01', e: 'onClick'}]
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'TableAbnormalIColl_tree', e: 'onClick'}]
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TableAbnormalIColl_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TableAbnormalIColl_label04', 'text', this.runWF('TableAbnormalIColl_tree', 'getSelectedLabel'));
    this.setPW('TableAbnormalIColl_label05', 'text', this.runWF('TableAbnormalIColl_tree', 'getSelectedLabelNLS'));
    this.setPW('TableAbnormalIColl_label', 'text', this.runWF('TableAbnormalIColl_tree', 'getSelectedValue'));
    this.runWF('TableAbnormalIColl_Table01', 'focusOn');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'TableAbnormalIColl_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TableAbnormalIColl_Table01', 'focusOn');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'TableAbnormalIColl_Table01', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('TableAbnormalIColl_label06', 'text', 'The Table is OnFocusable');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'TableAbnormalIColl_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TableAbnormalIColl_Table01', 'disabled', true);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TableAbnormalIColl);
});