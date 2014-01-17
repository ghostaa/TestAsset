window.G017_SelectList = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G017_SelectList_selectList_03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_label_03', 'text', this.getPW('G017_SelectList_selectList_03', 'value'));
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'G017_SelectList_selectList_05', e: 'onMouseUp'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_label_05', 'text', this.getPW('G017_SelectList_selectList_05', 'value'));
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'G017_SelectList_selectList_06', e: 'onMouseEnter'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_label_06', 'text', this.getPW('G017_SelectList_selectList_06', 'value'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'G017_SelectList_selectList_07', e: 'onMouseLeave'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_label_07', 'text', this.getPW('G017_SelectList_selectList_07', 'value'));
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'G017_SelectList_selectList_08', e: 'onMouseMove'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_label_08', 'text', this.getPW('G017_SelectList_selectList_08', 'value'));
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'G017_SelectList_selectList_09', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_label_09', 'text', this.getPW('G017_SelectList_selectList_09', 'value'));
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'G017_SelectList_selectList_10', e: 'onBlur'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_label_10', 'text', this.getPW('G017_SelectList_selectList_10', 'value'));
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'G017_SelectList_selectList_13', e: 'onKeyUp'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_label_13', 'text', this.getPW('G017_SelectList_selectList_13', 'value'));
  }
}, 
{ /* ecaRule11 */
  name: 'ecaRule11',
  evts: [{ id: 'G017_SelectList_selectList_14', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_label-_14', 'text', this.getPW('G017_SelectList_selectList_14', 'value'));
  }
}, 
{ /* ecaRule12 */
  name: 'ecaRule12',
  evts: [{ id: 'G017_SelectList_button_0', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_label_15', 'text', this.getPW('G017_SelectList_selectList_15', 'value'));
  }
}, 
{ /* ecaRule13 */
  name: 'ecaRule13',
  evts: [{ id: 'G017_SelectList_button_01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_selectList_15', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule14 */
  name: 'ecaRule14',
  evts: [{ id: 'G017_SelectList_button_02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_selectList_15', 'visibility', 'visible');
  }
}, 
{ /* ecaRule15 */
  name: 'ecaRule15',
  evts: [{ id: 'G017_SelectList_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_selectList_15', 'visibility', 'gone');
  }
}, 
{ /* ecaRule16 */
  name: 'ecaRule16',
  evts: [{ id: 'G017_SelectList_button_03', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_selectList_15', 'disabled', true);
  }
}, 
{ /* ecaRule17 */
  name: 'ecaRule17',
  evts: [{ id: 'G017_SelectList_button_04', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_selectList_15', 'disabled', false);
  }
}, 
{ /* ecaRule18 */
  name: 'ecaRule18',
  evts: [{ id: 'G017_SelectList_button_05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_selectList_15', 'readOnly', true);
  }
}, 
{ /* ecaRule19 */
  name: 'ecaRule19',
  evts: [{ id: 'G017_SelectList_button_06', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_selectList_15', 'readOnly', false);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'G017_SelectList_selectList_04', e: 'onMouseDown'}],
  onTrue: function(e) {
    this.setPW('G017_SelectList_label_04', 'text', this.getPW('G017_SelectList_selectList_04', 'value'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(G017_SelectList);
});