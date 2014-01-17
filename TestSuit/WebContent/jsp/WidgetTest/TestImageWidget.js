window.TestImageWidget = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TestImageWidget_image14', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestImageWidget_image14', 'location', 'img/JPG.JPG');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'TestImageWidget_image17', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestImageWidget_image17', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TestImageWidget_image', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TestImageWidget_image', 'location', 'img/10days.jpg');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TestImageWidget);
});