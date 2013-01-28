window.image = [{ /* setVisible */
  name: 'setVisible',
  evts: [{ id: 'image_visibleButton', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('image_VisibleImage', 'visibility') != "visible";
  },
  onTrue: function(e) {
    this.setPW('image_VisibleImage', 'visibility', "visible");
  }
}, 
{ /* setDisable */
  name: 'setDisable',
  evts: [{ id: 'image_disVisibleButton', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('image_VisibleImage', 'visibility') != "hidden";
  },
  onTrue: function(e) {
    this.setPW('image_VisibleImage', 'visibility', "hidden");
  }
}, 
{ /* gone */
  name: 'gone',
  evts: [{ id: 'image_displayGone', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('image_VisibleImage', 'visibility') != "gone";
  },
  onTrue: function(e) {
    this.setPW('image_VisibleImage', 'visibility', "gone");
  }
}, 
{ /* changeHint */
  name: 'changeHint',
  evts: [{ id: 'image_Button05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('image_Image08', 'hint', 'new hint for image');
  }
}, 
{ /* changeLocation2 */
  name: 'changeLocation2',
  evts: [{ id: 'image_Button02', e: 'onMouseDown'}, { id: 'image_Button02', e: 'onKeyDown'}],
  cond: function(e) {
    return this.getPW('image_Image06', 'location') == "img/smile.jpg";
  },
  onTrue: function(e) {
    this.setPW('image_Image06', 'location', 'img/Bomb1.jpg');
  },
  onFalse: function(e) {
    this.setPW('image_Image06', 'location', 'img/Bomb12.jpg');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'image_button', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('image_image03', 'hint', '%nls.NlsSupportTestResourse/OMG_SPENT_GREAT_WP');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'image_button04', e: 'onKeyPress'}],
  cond: function(e) {
    return this.getPW('image_image05', 'location') == 'img/smile.jpg';
  },
  onTrue: function(e) {
    this.setPW('image_image05', 'location', 'img/Bomb1.jpg');
  },
  onFalse: function(e) {
    this.setPW('image_image05', 'location', 'img/Bomb12.jpg');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(image);
});