window.sample28855 = [{ /* Add */
  name: 'Add',
  evts: [{ id: 'sample28855_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('sample28855_resultText', 'value', this.getPW('sample28855_InputText01', 'value') + this.getPW('sample28855_InputText02', 'value'));
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'sample28855_button_copy', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('sample28855_HiddenField01', 'value', this.getPW('sample28855_InputText01_copy', 'value') + this.getPW('sample28855_InputText02_copy', 'value'));
  }
}, 
{ /* ecaSufijoFuncional */
  name: 'ecaSufijoFuncional',
  evts: [{ id: 'sample28855_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('sample28855_form02', 'callAsyncOperation', 'Sample28855Op', 'Sample28855Op', 1000);
  }
}, 
{ /* ecaSufijoFuncional */
  name: 'ecaSufijoFuncional',
  evts: [{ id: 'sample28855_button08', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('sample28855_form07', 'callAsyncOperation', 'Sample28855Op', 'Sample28855Op', 1000);
  }
}, 
{ /* ecaSufijoFuncional */
  name: 'ecaSufijoFuncional',
  evts: [{ id: 'sample28855_button06', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('sample28855_form05', 'callAsyncOperation', 'Sample28855Op', 'Sample28855Op', 1000);
  }
}, 
{ /* ecaSufijoFuncional */
  name: 'ecaSufijoFuncional',
  evts: [{ id: 'sample28855_button04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('sample28855_form03', 'callAsyncOperation', 'Sample28855Op', 'Sample28855Op', 1000);
  }
}, 
{ /* ecaSufijoFuncional */
  name: 'ecaSufijoFuncional',
  evts: [{ id: 'sample28855_button05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('sample28855_form04', 'callAsyncOperation', 'Sample28855Op', 'Sample28855Op', 1000);
  }
}, 
{ /* ecaSufijoFuncional */
  name: 'ecaSufijoFuncional',
  evts: [{ id: 'sample28855_button07', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('sample28855_form06', 'callAsyncOperation', 'Sample28855Op', 'Sample28855Op', 1000);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'sample28855_form01', e: 'onClick'}, { id: 'sample28855_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('sample28855_form01', 'callAsyncOperation', 'Sample28855Op', 'Sample28855Op', 1000);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'sample28855_button10', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('sample28855_form09', 'callAsyncOperation', 'Sample28855Op', 'Sample28855Op', 1000);
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'sample28855_button11', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('sample28855_form10', 'callAsyncOperation', 'Sample28855Op', 'Sample28855Op', 1000);
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'sample28855_button12', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('sample28855_form11', 'callAsyncOperation', 'Sample28855Op', 'Sample28855Op', 1000);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(sample28855);
});