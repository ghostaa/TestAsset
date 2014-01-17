window.G016_Fun_form_submit_table = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'G016_Fun_form_submit_table_button01', e: 'onClick'}],
  cond: function(e) {
    return BTTUtil.equals(this.getPW('G016_Fun_form_submit_table_table'+ this.idxPostfix +'.columnId0', 'readOnly'), false) ;
  },
  onTrue: function(e) {
    this.setPW('G016_Fun_form_submit_table_table'+ this.idxPostfix +'.columnId0', 'readOnly', true);
    this.setPW('G016_Fun_form_submit_table_button01', 'text', 'Change column A to readOnly=true');
  },
  onFalse: function(e) {
    this.setPW('G016_Fun_form_submit_table_table'+ this.idxPostfix +'.columnId0', 'readOnly', false);
    this.setPW('G016_Fun_form_submit_table_button01', 'text', 'Change column A to readOnly=false');
  },
  repeatCondAt: 'G016_Fun_form_submit_table_repetitivePanel',
  repeatActionAt: 'G016_Fun_form_submit_table_repetitivePanel'
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'G016_Fun_form_submit_table_table.columnId4', e: 'onChange', repeatAt: 'G016_Fun_form_submit_table_repetitivePanel'}],
  onTrue: function(e) {
    this.setPW('G016_Fun_form_submit_table_countryResult', 'text', this.getPW('G016_Fun_form_submit_table_table'+ this.idxPostfix +'.columnId4', 'value'));
  },
  repeatActionAt: 'G016_Fun_form_submit_table_repetitivePanel'
}];
dojo.addOnLoad(function(){
  engine.registerRules(G016_Fun_form_submit_table);
});