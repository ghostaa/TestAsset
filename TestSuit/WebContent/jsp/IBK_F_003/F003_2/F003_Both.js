window.F003_Both = [{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'F003_Both_button_hide01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('F003_Both_table', 'hideColumn', 'columnId0');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'F003_Both_button_hide02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('F003_Both_table', 'hideColumn', 'columnId1');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'F003_Both_button_hide03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('F003_Both_table', 'hideColumn', 'columnId2');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'F003_Both_button_hide04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('F003_Both_table', 'hideColumn', 'columnId3');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'F003_Both_button_hide05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('F003_Both_table', 'hideColumn', 'columnId4');
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'F003_Both_button_hide06', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('F003_Both_table', 'hideColumn', 'columnId5');
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'F003_Both_button_show01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('F003_Both_table', 'showColumn', 'columnId0');
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'F003_Both_button_show02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('F003_Both_table', 'showColumn', 'columnId1');
  }
}, 
{ /* ecaRule09 */
  name: 'ecaRule09',
  evts: [{ id: 'F003_Both_button_show03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('F003_Both_table', 'showColumn', 'columnId2');
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'F003_Both_button_show04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('F003_Both_table', 'showColumn', 'columnId3');
  }
}, 
{ /* ecaRule11 */
  name: 'ecaRule11',
  evts: [{ id: 'F003_Both_button_show05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('F003_Both_table', 'showColumn', 'columnId4');
  }
}, 
{ /* ecaRule12 */
  name: 'ecaRule12',
  evts: [{ id: 'F003_Both_button_show06', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('F003_Both_table', 'showColumn', 'columnId5');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(F003_Both);
});