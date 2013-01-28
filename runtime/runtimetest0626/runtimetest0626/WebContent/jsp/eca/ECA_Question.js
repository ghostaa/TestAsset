window.ECA_Question = [{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'ECA_Question_text', e: 'onBlur'}],
  onTrue: function(e) {
    this.setPW('ECA_Question_button01', 'text', 'Text');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'ECA_Question_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('ECA_Question_text', 'focus');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'ECA_Question_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('ECA_Question_text', 'visibility', 'visible');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'ECA_Question_text', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('ECA_Question_label', 'text', '11');
    this.setPW('ECA_Question_text', 'visibility', 'gone');
    this.setPW('ECA_Question_text', 'disabled', true);
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'ECA_Question_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('ECA_Question_radio', 'text', 'It is a Changed for the text,but use the button,hi,this is too long,right?');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(ECA_Question);
});