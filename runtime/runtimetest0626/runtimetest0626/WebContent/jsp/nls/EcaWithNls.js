window.EcaWithNls = [{ /* ChangeHintMsgAndText: Change the hint messages and text values */
  name: 'ChangeHintMsgAndText',
  evts: [{ id: 'EcaWithNls_btnChangeHintText', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('EcaWithNls_Form01', 'callAsyncOperation', 'ecaWithNlsOp', 'ecaNlsCode', 1000);
    this.setPW('EcaWithNls_Image01', 'location', 'img/dataName.gif');
    this.setPW('EcaWithNls_Button01', 'text', '%nls.NlsSupportTestResourse/_0Submit_Button');
    this.setPW('EcaWithNls_Button02', 'text', '%nls.NlsSupportTestResourse/_0Button_Button');
    this.setPW('EcaWithNls_Button03', 'text', '%nls.NlsSupportTestResourse/_0Reset_Button');
    this.setPW('EcaWithNls_CheckBox01', 'text', '%nls.NlsSupportTestResourse/_2Tip_Message1');
    this.setPW('EcaWithNls_Radio01', 'text', '%nls.NlsSupportTestResourse/_2Tip_Message1');
    this.setPW('EcaWithNls_Link01', 'text', '%nls.NlsSupportTestResourse/_2Tip_Message2');
    this.setPW('EcaWithNls_RichText01', 'value', 'What a day!');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(EcaWithNls);
});