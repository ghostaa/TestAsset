window.TabbedPane04 = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TabbedPane04_Button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TabbedPane04_Label07', 'text', this.getPW('TabbedPane04_combo', 'value'));
    this.runWF('TabbedPane04_TabbedPane01', 'selectChildByIndex', 1);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TabbedPane04_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('TabbedPane04_Label08', 'text', this.getPW('TabbedPane04_SelectList01', 'value'));
    this.runWF('TabbedPane04_TabbedPane01', 'selectChildById', this.getPW('TabbedPane04_ContentPane03', 'id'));
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'TabbedPane04_button', e: 'onClick'}],
  cond: function(e) {
    return 321 != null;
  },
  onTrue: function(e) {
    this.runWF('TabbedPane04_TabbedPane01', 'closeChildByIndex', 3);
  },
  onFalse: function(e) {
    this.runWF('TabbedPane04_TabbedPane01', 'closeChildByIndex', 3);
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'TabbedPane04_button03', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('TabbedPane04_button03', 'isFocusable');
  },
  onTrue: function(e) {
    this.runWF('TabbedPane04_TabbedPane01', 'closeChildById', this.getPW('TabbedPane04_ContentPane05', 'id'));
  },
  onFalse: function(e) {
    this.runWF('TabbedPane04_TabbedPane01', 'closeChildById', this.getPW('TabbedPane04_ContentPane05', 'id'));
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'TabbedPane04_button04', e: 'onClick'}],
  onTrue: function(e) {
    this.executeAG('actionGroup');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'TabbedPane04_button05', e: 'onKeyPress'}],
  cond: function(e) {
    return this.getPW('TabbedPane04_e', 'altKey') == true;
  },
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
 public void execute() throws Exception {
  System.out.println("ImageOperation");
  setValueAt(HtmlConstants.REPLYPAGE, "image.jsp"); 
 }
}))
{
return;
};
  },
  onFalse: function(e) {
    if(false == this.runInlineScript(this, function(){
 public void execute() throws Exception {
  System.out.println("ImageOperation");
  setValueAt(HtmlConstants.REPLYPAGE, "link.jsp"); 
 }
}))
{
return;
};
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'TabbedPane04_button06', e: 'onKeyPress'}],
  cond: function(e) {
    return this.getPW('TabbedPane04_e', 'altKey') == 'true';
  },
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
System.out.println(This.true==boolean.true)
}))
{
return;
};
  },
  onFalse: function(e) {
    if(false == this.runInlineScript(this, function(){
assert.assertequal(e.altKey,true);
message.format(this is s%,altKey);
System.out.println(Actions if false,execute this action;);
}))
{
return;
};
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'TabbedPane04_button07', e: 'onKeyPress'}],
  cond: function(e) {
    return engine.executeCond("commonCon",this.getPW('TabbedPane04_e', 'shiftKey'));
  },
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
logger.info("onPress event");
}))
{
return;
};
  },
  onFalse: function(e) {
    if(false == this.runInlineScript(this, function(){
logger.info("Actions if false");
}))
{
return;
};
  }
}, 
{ /* actionGroup */
  name: 'actionGroup',
  type:"AG",
  onTrue: function(e) {
    this.setPW('TabbedPane04_label06', 'text', this.getPW('TabbedPane04_label06', 'visibility'));
    this.setPW('TabbedPane04_label09', 'text', this.getPW('TabbedPane04_Label01', 'text'));
    this.setPW('TabbedPane04_label10', 'text', this.getPW('TabbedPane04_message', 'level'));
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TabbedPane04);
});