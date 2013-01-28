window.hForm = [{ /* getCity */
  name: 'getCity',
  evts: [{ id: 'hForm_SelectList01', e: 'onChange'}],
  onTrue: function(e) {
    this.runWF('hForm_Form01', 'callAsyncOperation', 'getCitiesByProvince', 'SelCode');
  }
}, 
{ /* comboGetCity */
  name: 'comboGetCity',
  evts: [{ id: 'hForm_Combo01', e: 'onChange'}],
  onTrue: function(e) {
    this.runWF('hForm_Form02', 'callAsyncOperation', 'getCitiesByProvince', 'AjaxCityCode');
  }
}, 
{ /* filterText */
  name: 'filterText',
  evts: [{ id: 'hForm_Text01', e: 'onChange'}],
  onTrue: function(e) {
    this.runWF('hForm_Form03', 'callAsyncOperation', 'filterText', 'TextAreaCode');
  }
}, 
{ /* filterTextArea */
  name: 'filterTextArea',
  evts: [{ id: 'hForm_TextArea01', e: 'onChange'}],
  onTrue: function(e) {
    this.runWF('hForm_Form03', 'callAsyncOperation', 'filterText', 'TextCode');
  }
}, 
{ /* filterRichText */
  name: 'filterRichText',
  evts: [{ id: 'hForm_RichText01', e: 'onChange'}],
  onTrue: function(e) {
    this.runWF('hForm_Form03', 'callAsyncOperation', 'filterText', 'filterCode');
  }
}, 
{ /* evtFormLoaded */
  name: 'evtFormLoaded',
  evts: [{ id: 'hForm_onLoadForm', e: 'onLoaded'}],
  onTrue: function(e) {
    this.setPW('hForm_txtOnLoadMsg', 'text', 'Form loaded event triggered.');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(hForm);
});