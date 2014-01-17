window.Q009_page_main = [{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'Q009_page_main_form', e: 'onLoaded'}],
  onTrue: function(e) {
    this.runWF('Q009_page_main_form', 'submit');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'Q009_page_main_link01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('Q009_page_main_link01', 'visibility', 'gone');
    this.setPW('Q009_page_main_link02', 'visibility', 'visible');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'Q009_page_main_link02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('Q009_page_main_link02', 'visibility', 'gone');
    this.setPW('Q009_page_main_link03', 'visibility', 'visible');
    this.setPW('Q009_page_main_link04', 'visibility', 'visible');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'Q009_page_main_link03', e: 'onClick'}],
  onTrue: function(e) {
    this.executeAG('GoneLinks',e);
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'Q009_page_main_link04', e: 'onClick'}],
  onTrue: function(e) {
    this.executeAG('GoneLinks',e);
  }
}, 
{ /* GoneLinks */
  name: 'GoneLinks',
  type:"AG",
  onTrue: function(e) {
    this.setPW('Q009_page_main_link03', 'visibility', 'gone');
    this.setPW('Q009_page_main_link04', 'visibility', 'gone');
    this.setPW('Q009_page_main_link', 'visibility', 'visible');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(Q009_page_main);
});