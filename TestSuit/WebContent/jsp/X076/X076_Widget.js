[{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X076_Widget_button01', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.runWF('X076_Widget_text07', 'showErrorMessage', '%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"Text\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"X076_Widget_label08\",\"n\":\"WidgetName\"},{\"p\":\"text\",\"t\":\"w\",\"id\":\"X076_Widget_label08\",\"n\":\"value\"}]');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X076_Widget_Load Time', e: 'onClick'}]
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'X076_Widget_button03', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.runWF('X076_Widget_message01', 'displayPopup', '%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"Test\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"X076_Widget_label13\",\"n\":\"WidgetName\"},{\"p\":\"text\",\"t\":\"w\",\"id\":\"X076_Widget_label13\",\"n\":\"value\"}]');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'X076_Widget_link01', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.runWF('X076_Widget_message01', 'display', '%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"Text\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"X076_Widget_label13\",\"n\":\"WidgetName\"},{\"p\":\"text\",\"t\":\"w\",\"id\":\"X076_Widget_label13\",\"n\":\"value\"}]');
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'X076_Widget_button07', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW('X076_Widget_label20', 'text', '%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"visibility\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"X076_Widget_label20\",\"n\":\"WidgetName\"},{\"p\":\"visibility\",\"t\":\"w\",\"id\":\"X076_Widget_label20\",\"n\":\"value\"}]');
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'X076_Widget_button06', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW('X076_Widget_label19', 'hint', '%nls.bttsample/Text of Widget?[{\"t\":\"c\",\"v\":\"text\",\"n\":\"property\"},{\"p\":\"id\",\"t\":\"w\",\"id\":\"X076_Widget_label19\",\"n\":\"WidgetName\"},{\"p\":\"text\",\"t\":\"w\",\"id\":\"X076_Widget_label19\",\"n\":\"value\"}]');
  }
}]