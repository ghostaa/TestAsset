window.IBK_4_11_mutiWidget_formatter = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'IBK_4_11_mutiWidget_formatter_table', e: 'onCellWidgetClick'}],
  cond: function(e) {
    return (BTTUtil.equals(this.getPW('IBK_4_11_mutiWidget_formatter_table', 'clickedWidgetId'), 'button4') ) && (BTTUtil.equals(this.getPW('IBK_4_11_mutiWidget_formatter_label01', 'visibility'), 'visible') );
  },
  onTrue: function(e) {
    this.setPW('IBK_4_11_mutiWidget_formatter_label01', 'visibility', 'hidden');
  },
  onFalse: function(e) {
    this.executeAG('labelFalse',e);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'IBK_4_11_mutiWidget_formatter_table', e: 'onCellWidgetClick'}],
  cond: function(e) {
    return (BTTUtil.equals(this.getPW('IBK_4_11_mutiWidget_formatter_table', 'clickedWidgetId'), 'link4') ) && (BTTUtil.equals(this.getPW('IBK_4_11_mutiWidget_formatter_text01', 'visibility'), 'visible') );
  },
  onTrue: function(e) {
    this.setPW('IBK_4_11_mutiWidget_formatter_text01', 'visibility', 'hidden');
  },
  onFalse: function(e) {
    this.executeAG('textFalse',e);
  }
}, 
{ /* labelFalse */
  name: 'labelFalse',
  type:"AG",
  cond: function(e) {
    return (BTTUtil.equals(this.getPW('IBK_4_11_mutiWidget_formatter_table', 'clickedWidgetId'), 'button4') ) && (BTTUtil.equals(this.getPW('IBK_4_11_mutiWidget_formatter_label01', 'visibility'), 'hidden') );
  },
  onTrue: function(e) {
    this.setPW('IBK_4_11_mutiWidget_formatter_label01', 'visibility', 'visible');
  }
}, 
{ /* textFalse */
  name: 'textFalse',
  type:"AG",
  cond: function(e) {
    return (BTTUtil.equals(this.getPW('IBK_4_11_mutiWidget_formatter_table', 'clickedWidgetId'), 'link4') ) && (BTTUtil.equals(this.getPW('IBK_4_11_mutiWidget_formatter_text01', 'visibility'), 'hidden') );
  },
  onTrue: function(e) {
    this.setPW('IBK_4_11_mutiWidget_formatter_text01', 'visibility', 'visible');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(IBK_4_11_mutiWidget_formatter);
});