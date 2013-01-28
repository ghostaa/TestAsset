window.TreeECA = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TreeECA_visible', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TreeECA_tree', 'visibility', 'visible');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'TreeECA_hidden', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TreeECA_tree', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TreeECA_gone', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TreeECA_tree', 'visibility', 'gone');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'TreeECA_verify tree id', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('TreeECA_tree', 'id') == 'TreeECA_tree';
  },
  onTrue: function(e) {
    this.runWF('TreeECA_message', 'display', 'ID of the tree is TreeECA_tree');
  },
  onFalse: function(e) {
    this.runWF('TreeECA_message', 'display', 'ID of the tree is  not TreeECA_tree');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'TreeECA_get tree id', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TreeECA_message', 'display', this.getPW('TreeECA_tree', 'id'));
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'TreeECA_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TreeECA_tree', 'getSelectedLabel');
    this.setPW('TreeECA_button01', 'text', this.runWF('TreeECA_tree', 'getSelectedLabel'));
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'TreeECA_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TreeECA_tree', 'getSelectedLabelNLS');
    this.setPW('TreeECA_button02', 'text', this.runWF('TreeECA_tree', 'getSelectedValue'));
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'TreeECA_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TreeECA_button03', 'text', this.runWF('TreeECA_tree', 'getSelectedLabelNLS'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TreeECA);
});