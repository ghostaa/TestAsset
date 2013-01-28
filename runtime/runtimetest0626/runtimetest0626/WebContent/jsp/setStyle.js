window.setStyle = [{ /* NewStyle */
  name: 'NewStyle',
  evts: [{ id: 'setStyle_Button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('setStyle_Label01', 'class', 'customStyle');
    this.setPW('setStyle_Text01', 'class', 'customStyle');
    this.setPW('setStyle_Combo01', 'class', 'customStyle');
    this.setPW('setStyle_SelectList01', 'class', 'customStyle');
    this.setPW('setStyle_Radio01', 'class', 'customStyle');
    this.setPW('setStyle_CheckBox01', 'class', 'customStyle');
    this.setPW('setStyle_Link01', 'class', 'customStyle');
    this.setPW('setStyle_Table01', 'class', 'customStyle');
    this.setPW('setStyle_Tree01', 'class', 'customStyle');
    this.setPW('setStyle_Message01', 'class', 'customStyle');
    this.setPW('setStyle_TextArea01', 'class', 'customStyle');
    this.setPW('setStyle_RichText01', 'class', 'customStyle');
    this.setPW('setStyle_Button01', 'class', 'customStyle');
    this.setPW('setStyle_TabbedPane01', 'class', 'customStyle');
  }
}, 
{ /* default */
  name: 'default',
  evts: [{ id: 'setStyle_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('setStyle_Label01', 'class', '');
    this.setPW('setStyle_Text01', 'class', '');
    this.setPW('setStyle_Combo01', 'class', '');
    this.setPW('setStyle_SelectList01', 'class', '');
    this.setPW('setStyle_Radio01', 'class', '');
    this.setPW('setStyle_CheckBox01', 'class', '');
    this.setPW('setStyle_Link01', 'class', '');
    this.setPW('setStyle_Table01', 'class', '');
    this.setPW('setStyle_Tree01', 'class', '');
    this.setPW('setStyle_Message01', 'class', '');
    this.setPW('setStyle_TextArea01', 'class', '');
    this.setPW('setStyle_RichText01', 'class', '');
    this.setPW('setStyle_Button01', 'class', '');
    this.setPW('setStyle_TabbedPane01', 'class', '');
    this.setPW('setStyle_label', 'class', '');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'setStyle_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('setStyle_label', 'class', 'label');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(setStyle);
});