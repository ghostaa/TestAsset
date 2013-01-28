window.TabbedPane08 = [{ /* s1 */
  name: 's1',
  evts: [{ id: 'TabbedPane08_Button01', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TabbedPane08_TabbedPane01', 'selectChildById', this.getPW('TabbedPane08_ContentPane02', 'id'));
  }
}, 
{ /* s2 */
  name: 's2',
  evts: [{ id: 'TabbedPane08_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TabbedPane08_TabbedPane01', 'selectChildByIndex', 2);
  }
}, 
{ /* s3 */
  name: 's3',
  evts: [{ id: 'TabbedPane08_Button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TabbedPane08_TabbedPane01', 'closeChildById', this.getPW('TabbedPane08_ContentPane01', 'id'));
  }
}, 
{ /* s4 */
  name: 's4',
  evts: [{ id: 'TabbedPane08_Button04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TabbedPane08_TabbedPane01', 'closeChildByIndex', 4);
  }
}, 
{ /* s5 */
  name: 's5',
  evts: [{ id: 'TabbedPane08_Button05', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TabbedPane08_TabbedPane01', 'selectChildById', this.getPW('TabbedPane08_ContentPane04', 'id'));
  }
}, 
{ /* s6 */
  name: 's6',
  evts: [{ id: 'TabbedPane08_Button06', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TabbedPane08_TabbedPane01', 'selectChildByIndex', 0);
  }
}, 
{ /* ss1 */
  name: 'ss1',
  evts: [{ id: 'TabbedPane08_Button08', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TabbedPane08_TabbedPane01', 'visibility', 'visible');
  }
}, 
{ /* ss3 */
  name: 'ss3',
  evts: [{ id: 'TabbedPane08_Button10', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TabbedPane08_TabbedPane01', 'hint', 'this is hint again!');
  }
}, 
{ /* ss5 */
  name: 'ss5',
  evts: [{ id: 'TabbedPane08_Button12', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TabbedPane08_ContentPane01', 'title', 'this is title!');
  }
}, 
{ /* ss8 */
  name: 'ss8',
  evts: [{ id: 'TabbedPane08_Button15', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TabbedPane08_ContentPane01', 'closable', false);
  }
}, 
{ /* ss9 */
  name: 'ss9',
  evts: [{ id: 'TabbedPane08_Button16', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TabbedPane08_ContentPane01', 'closable', true);
  }
}, 
{ /* ss11 */
  name: 'ss11',
  evts: [{ id: 'TabbedPane08_Button18', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TabbedPane08_TabbedPane01', 'visibility', 'gone');
  }
}, 
{ /* ss13 */
  name: 'ss13',
  evts: [{ id: 'TabbedPane08_Button19', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('TabbedPane08_ContentPane01', 'closable');
  },
  onTrue: function(e) {
    this.setPW('TabbedPane08_label04', 'text', 'ContentPane01_closable is true');
  },
  onFalse: function(e) {
    this.setPW('TabbedPane08_label04', 'text', 'ContentPane01_closable is false');
  }
}, 
{ /* ss15 */
  name: 'ss15',
  evts: [{ id: 'TabbedPane08_Button21', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TabbedPane08_TabbedPane01', 'class', 'label');
  }
}, 
{ /* p1 */
  name: 'p1',
  evts: [{ id: 'TabbedPane08_ContentPane01', e: 'onShow'}],
  onTrue: function(e) {
    this.setPW('TabbedPane08_Label01', 'text', 'event: tabpene01.onshow');
  }
}, 
{ /* p2 */
  name: 'p2',
  evts: [{ id: 'TabbedPane08_ContentPane01', e: 'onClose'}],
  onTrue: function(e) {
    this.setPW('TabbedPane08_Label01', 'text', 'event: tabpene01.onclose');
  }
}, 
{ /* ss2 */
  name: 'ss2',
  evts: [{ id: 'TabbedPane08_Button09', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('TabbedPane08_TabbedPane01', 'visibility') == 'gone';
  },
  onTrue: function(e) {
    this.setPW('TabbedPane08_Label01', 'text', 'tabbenpane-gone');
  },
  onFalse: function(e) {
    this.setPW('TabbedPane08_Label01', 'text', 'tabbedpane=visible');
  }
}, 
{ /* ss111 */
  name: 'ss111',
  evts: [{ id: 'TabbedPane08_Button07', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TabbedPane08_TabbedPane01', 'class', 'customStyle');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TabbedPane08);
});