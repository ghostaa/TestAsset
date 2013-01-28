window.TabbedPane05 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TabbedPane05_Button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TabbedPane05_TabbedPane01', 'selectChildById', this.getPW('TabbedPane05_ContentPane02', 'id'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'TabbedPane05_ContentPane01', e: 'onClose'}],
  cond: function(e) {
    return BTTStringFunctions.contains('String', 'ring');
  },
  onTrue: function(e) {
    this.setPW('TabbedPane05_Label04', 'text', 'The ContentPane01 is Closed');
  },
  onFalse: function(e) {
    this.setPW('TabbedPane05_Label04', 'text', 'The ContentPane01 is not Closed');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TabbedPane05_ContentPane01', e: 'onShow'}],
  onTrue: function(e) {
    this.setPW('TabbedPane05_ContentPane01', 'title', 'this ContentPane01 is not Closed');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'TabbedPane05_button', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('TabbedPane05_ContentPane03', 'closable');
  },
  onFalse: function(e) {
    this.runWF('TabbedPane05_TabbedPane01', 'hideTabByIndex', 2);
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'TabbedPane05_button03', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('TabbedPane05_ContentPane03', 'disabled');
  },
  onFalse: function(e) {
    this.runWF('TabbedPane05_TabbedPane01', 'showTabByIndex', 2);
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'TabbedPane05_button02', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('TabbedPane05_Form01', 'validateOnSubmit');
  },
  onTrue: function(e) {
    this.runWF('TabbedPane05_TabbedPane01', 'hideTabById', this.getPW('TabbedPane05_ContentPane04', 'id'));
  },
  onFalse: function(e) {
    this.runWF('TabbedPane05_TabbedPane01', 'hideTabById', this.getPW('TabbedPane05_ContentPane04', 'id'));
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'TabbedPane05_button04', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('TabbedPane05_Form01', 'isValid');
  },
  onTrue: function(e) {
    this.runWF('TabbedPane05_TabbedPane01', 'showTabById', this.getPW('TabbedPane05_ContentPane04', 'id'));
  },
  onFalse: function(e) {
    this.runWF('TabbedPane05_TabbedPane01', 'showTabById', this.getPW('TabbedPane05_ContentPane04', 'id'));
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'TabbedPane05_button05', e: 'onClick'}],
  cond: function(e) {
    return false == 0;
  },
  onTrue: function(e) {
    this.setPW('TabbedPane05_ContentPane03', 'closable', true);
  },
  onFalse: function(e) {
    this.setPW('TabbedPane05_ContentPane03', 'closable', true);
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'TabbedPane05_button06', e: 'onClick'}],
  cond: function(e) {
    return BTTStringFunctions.compare('a', 'a') == this.getPW('TabbedPane05_button06', 'id');
  },
  onTrue: function(e) {
    this.setPW('TabbedPane05_ContentPane04', 'disabled', true);
  },
  onFalse: function(e) {
    this.setPW('TabbedPane05_ContentPane04', 'disabled', true);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TabbedPane05);
});