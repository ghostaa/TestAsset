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
    return BTTUtil.equals(this.getPW('TreeECA_tree', 'id'), 'TreeECA_tree') ;
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
}];
dojo.addOnLoad(function(){
  engine.registerRules(TreeECA);
});