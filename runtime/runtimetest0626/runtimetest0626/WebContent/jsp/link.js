window.link = [{ /* change link's visibility */
  name: 'change link\'s visibility',
  evts: [{ id: 'link_Button01', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('link_Link01', 'visibility') == 'visible';
  },
  onTrue: function(e) {
    this.setPW('link_Link01', 'visibility', 'hidden');
  },
  onFalse: function(e) {
    this.setPW('link_Link01', 'visibility', 'visible');
  }
}, 
{ /* change link's disable */
  name: 'change link\'s disable',
  evts: [{ id: 'link_Button03', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('link_Link03', 'disabled');
  },
  onTrue: function(e) {
    this.setPW('link_Link03', 'disabled', false);
  },
  onFalse: function(e) {
    this.setPW('link_Link03', 'disabled', true);
  }
}, 
{ /* change link's text */
  name: 'change link\'s text',
  evts: [{ id: 'link_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('link_Link02', 'text', 'Link for Processor');
  }
}, 
{ /* change link to gone */
  name: 'change link to gone',
  evts: [{ id: 'link_Button04', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('link_Link04', 'visibility') == 'visible';
  },
  onTrue: function(e) {
    this.setPW('link_Link04', 'visibility', 'gone');
  },
  onFalse: function(e) {
    this.setPW('link_Link04', 'visibility', 'visible');
  }
}, 
{ /* change link's text and button's text: change link's text and button's text, but the button's type is submit */
  name: 'change link\'s text and button\'s text',
  evts: [{ id: 'link_Button05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('link_Link05', 'text', 'I am submit button');
  }
}, 
{ /* change link's disable and button's text: change link's disable, but the button's type is reset */
  name: 'change link\'s disable and button\'s text',
  evts: [{ id: 'link_Button06', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('link_Link05', 'disabled');
  },
  onTrue: function(e) {
    this.setPW('link_Link05', 'disabled', false);
    this.setPW('link_Button06', 'text', 'I am reset button');
  },
  onFalse: function(e) {
    this.setPW('link_Link05', 'disabled', true);
  }
}, 
{ /* hiddenanotherbutton */
  name: 'hiddenanotherbutton',
  evts: [{ id: 'link_Button10', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('link_Button01', 'visibility', 'hidden');
  }
}, 
{ /* focus */
  name: 'focus',
  evts: [{ id: 'link_Button11', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('link_Link11', 'isFocusable');
  },
  onTrue: function(e) {
    this.runWF('link_Link11', 'focus');
  }
}, 
{ /* button12 */
  name: 'button12',
  evts: [{ id: 'link_Button12', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('link_Link12', 'class', 'customStyle');
  }
}, 
{ /* button13 */
  name: 'button13',
  evts: [{ id: 'link_Button13', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('link_Link12', 'class', "");
  }
}, 
{ /* hint */
  name: 'hint',
  evts: [{ id: 'link_Button14', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('link_Link19', 'hint', 'new hint for link');
  }
}, 
{ /* FbtnHideClick */
  name: 'FbtnHideClick',
  evts: [{ id: 'link_fbtnHide', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('link_Link11', 'visibility', 'hidden');
  }
}, 
{ /* FbtnVisableClick */
  name: 'FbtnVisableClick',
  evts: [{ id: 'link_fbtnVisable', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('link_Link11', 'visibility', 'visable');
  }
}, 
{ /* FbtnGoneClick */
  name: 'FbtnGoneClick',
  evts: [{ id: 'link_fbtnGone', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('link_Link11', 'visibility', 'gone');
  }
}, 
{ /* FbtnIsFocsableClick */
  name: 'FbtnIsFocsableClick',
  evts: [{ id: 'link_fbtnIsFocusable', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('link_Link11', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('link_Label01', 'text', 'isFocusable return TRUE');
  },
  onFalse: function(e) {
    this.setPW('link_Label01', 'text', 'isFocusable return FALSE');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'link_button', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('link_link18', 'target', '_blank');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(link);
});