window.selectInFlow = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'selectInFlow_selectList26', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('selectInFlow_selectList26', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('selectInFlow_label68', 'text', 'isFocusable');
  },
  onFalse: function(e) {
    this.setPW('selectInFlow_label68', 'text', 'isNotFocusable');
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'selectInFlow_selectList29', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_selectList29', 'class', 'customStyle');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'selectInFlow_selectList12', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_label52', 'text', 'success');
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'selectInFlow_selectList13', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_label55', 'text', 'success');
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'selectInFlow_selectList14', e: 'onBlur'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_label56', 'text', 'success');
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'selectInFlow_selectList15', e: 'onKeyDown'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_label57', 'text', 'success');
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'selectInFlow_selectList16', e: 'onKeyPress'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_label58', 'text', 'success');
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'selectInFlow_selectList17', e: 'onKeyUp'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_label59', 'text', 'success');
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'selectInFlow_selectList18', e: 'onMouseDown'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_label60', 'text', 'success');
  }
}, 
{ /* ecaRule09 */
  name: 'ecaRule09',
  evts: [{ id: 'selectInFlow_selectList19', e: 'onMouseUp'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_label61', 'text', 'success');
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'selectInFlow_selectList20', e: 'onMouseEnter'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_label62', 'text', 'success');
  }
}, 
{ /* ecaRule11 */
  name: 'ecaRule11',
  evts: [{ id: 'selectInFlow_selectList21', e: 'onMouseLeave'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_label63', 'text', 'success');
  }
}, 
{ /* ecaRule12 */
  name: 'ecaRule12',
  evts: [{ id: 'selectInFlow_selectList22', e: 'onMouseMove'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_label64', 'text', 'success');
  }
}, 
{ /* ecaRule13 */
  name: 'ecaRule13',
  evts: [{ id: 'selectInFlow_selectList23', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_label65', 'text', 'success');
  }
}, 
{ /* ecaRule16 */
  name: 'ecaRule16',
  evts: [{ id: 'selectInFlow_selectList27', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('selectInFlow_selectList27', 'disabled');
  },
  onTrue: function(e) {
    this.setPW('selectInFlow_label69', 'text', 'Disabled');
  },
  onFalse: function(e) {
    this.setPW('selectInFlow_label69', 'text', 'Abled');
  }
}, 
{ /* ecaRule17 */
  name: 'ecaRule17',
  evts: [{ id: 'selectInFlow_selectList28', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('selectInFlow_selectList28', 'readOnly');
  },
  onTrue: function(e) {
    this.setPW('selectInFlow_label70', 'text', 'readOnly');
  },
  onFalse: function(e) {
    this.setPW('selectInFlow_label70', 'text', 'notReadOnly');
  }
}, 
{ /* ecaRule19 */
  name: 'ecaRule19',
  evts: [{ id: 'selectInFlow_selectList31', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_selectList31', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule20 */
  name: 'ecaRule20',
  evts: [{ id: 'selectInFlow_selectList32', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_selectList32', 'disabled', true);
  }
}, 
{ /* ecaRule21 */
  name: 'ecaRule21',
  evts: [{ id: 'selectInFlow_selectList33', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_selectList33', 'readOnly', true);
  }
}, 
{ /* ecaRule22 */
  name: 'ecaRule22',
  evts: [{ id: 'selectInFlow_selectList34', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_selectList34', 'hint', 'this is a simple hint');
  }
}, 
{ /* ecaRule23 */
  name: 'ecaRule23',
  evts: [{ id: 'selectInFlow_selectList35', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('selectInFlow_selectList35', 'showErrorMessage', 'Error');
  }
}, 
{ /* ecaRule24 */
  name: 'ecaRule24',
  evts: [{ id: 'selectInFlow_button01', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_selectList07', 'hint', 'new hint');
  }
}, 
{ /* ecaRule25 */
  name: 'ecaRule25',
  evts: [{ id: 'selectInFlow_button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('selectInFlow_selectList36', 'loadStoreFromURL', 'listFiles/select/normal.js');
  }
}, 
{ /* ecaRule26 */
  name: 'ecaRule26',
  evts: [{ id: 'selectInFlow_button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('selectInFlow_selectList37', 'loadStoreFromURL', 'listFiles/select/none.js');
    this.setPW('selectInFlow_button04', 'visibility', 'visible');
    this.setPW('selectInFlow_button03', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule27 */
  name: 'ecaRule27',
  evts: [{ id: 'selectInFlow_button04', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('selectInFlow_selectList37', 'loadStoreFromURL', 'listFiles/select/normal.js');
    this.setPW('selectInFlow_button04', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule28 */
  name: 'ecaRule28',
  evts: [{ id: 'selectInFlow_btnToggleReadonly', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_propertiesList', 'readOnly', ! this.getPW('selectInFlow_propertiesList', 'readOnly'));
  }
}, 
{ /* ecaRule29 */
  name: 'ecaRule29',
  evts: [{ id: 'selectInFlow_btnToggleDisable', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_propertiesList', 'disabled', ! this.getPW('selectInFlow_propertiesList', 'disabled'));
  }
}, 
{ /* ecaRule30 */
  name: 'ecaRule30',
  evts: [{ id: 'selectInFlow_btnSetFocus', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('selectInFlow_propertiesList', 'focus');
  }
}, 
{ /* ecaRule31 */
  name: 'ecaRule31',
  evts: [{ id: 'selectInFlow_btnVisible', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_propertiesList', 'visibility', 'visible');
  }
}, 
{ /* ecaRule32 */
  name: 'ecaRule32',
  evts: [{ id: 'selectInFlow_propertiesList', e: 'onClick'}]
}, 
{ /* ecaRule33 */
  name: 'ecaRule33',
  evts: [{ id: 'selectInFlow_btnHidden', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_propertiesList', 'visibility', 'hidden');
  }
}, 
{ /* ecaRule34 */
  name: 'ecaRule34',
  evts: [{ id: 'selectInFlow_btnGone', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_propertiesList', 'visibility', 'gone');
  }
}, 
{ /* ecaRule35 */
  name: 'ecaRule35',
  evts: [{ id: 'selectInFlow_button05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('selectInFlow_propertiesList', 'value', this.getPW('selectInFlow_text', 'value'));
  }
}, 
{ /* ecaRule37 */
  name: 'ecaRule37',
  evts: [{ id: 'selectInFlow_button07', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('selectInFlow_selectList40', 'focus');
    this.runWF('selectInFlow_selectList40', 'showErrorMessage', 'Hello Jack, welcome to BTT!(Non-Nls message)');
  }
}, 
{ /* ecaRule38 */
  name: 'ecaRule38',
  evts: [{ id: 'selectInFlow_button08', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('selectInFlow_selectList40', 'focus');
    this.runWF('selectInFlow_selectList40', 'showErrorMessage', 'Dear user: {0}, your age is {AgeParameter}! Welcome to BTT!', 'Jack', 54, 'ExtValuesOfNoUse', 0);
  }
}, 
{ /* ecaRule39 */
  name: 'ecaRule39',
  evts: [{ id: 'selectInFlow_button09', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('selectInFlow_selectList40', 'focus');
    this.runWF('selectInFlow_selectList40', 'showErrorMessage', 'This is a constant message, no parameter defined for this message!', 'param0value', 987, true);
  }
}, 
{ /* ecaRule40 */
  name: 'ecaRule40',
  evts: [{ id: 'selectInFlow_button10', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('selectInFlow_selectList40', 'focus');
    this.runWF('selectInFlow_selectList40', 'showErrorMessage', '%nls.NlsSupportTestResourse/_2Tip_Message2');
  }
}, 
{ /* ecaRule41 */
  name: 'ecaRule41',
  evts: [{ id: 'selectInFlow_button11', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('selectInFlow_selectList40', 'focus');
    this.runWF('selectInFlow_selectList40', 'showErrorMessage', '%nls.BTTResource/I18N_MESSAGE', 'Jack', 27);
  }
}, 
{ /* ecaRule42 */
  name: 'ecaRule42',
  evts: [{ id: 'selectInFlow_button12', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('selectInFlow_selectList40', 'focus');
    this.runWF('selectInFlow_selectList40', 'showErrorMessage', '%nls.BTTResource/I18N_MESSAGE', 'Jack', 27, 'ExtValueOfNoUse', false, 7685);
  }
}, 
{ /* ecaRule45 */
  name: 'ecaRule45',
  evts: [{ id: 'selectInFlow_selectList43', e: 'onAsyncError'}],
  onTrue: function(e) {
    this.runWF('selectInFlow_message02', 'display', (this.getPW('selectInFlow_selectList43', 'asyncStatus') + ':') + this.getPW('selectInFlow_selectList43', 'asyncErrorMessage'));
  }
}, 
{ /* ecaRule46 */
  name: 'ecaRule46',
  evts: [{ id: 'selectInFlow_button13', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('selectInFlow_selectList43', 'loadStoreFromURL', 'listfiles/select/data.txt');
  }
}, 
{ /* ecaRule14 */
  name: 'ecaRule14',
  evts: [{ id: 'selectInFlow_panel', e: 'onkeydown'}],
  cond: function(e) {
    return e.keyCode == 16;
  },
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
console.log("this action occur on the panel not on form!!");
console.log("you press the keyboard:Shift_panel");
function sum(num1,num2)
{
 opera.postError("Entering sum(),arguments are"+num1+","+num2);
 opera.postError("Before calculation");
 var result=num1+num2;
 opera.postError("After calculation");
 opera.postError("Exiting sum()");
 return result;
}
}))
{
return;
};
  },
  onFalse: function(e) {
    if(false == this.runInlineScript(this, function(){
console.log("this action occur on the panel not on form!!");
console.log("you not press the keyBoard:Shift_panel");
}))
{
return;
};
  }
}, 
{ /* ecaRule15 */
  name: 'ecaRule15',
  evts: [{ id: 'selectInFlow_form', e: 'onKeyDown'}],
  cond: function(e) {
    return e.keyCode == 16;
  },
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){

console.info("this action occur on the form!");
console.info("you press the keyboard:shift_form");
}))
{
return;
};
  },
  onFalse: function(e) {
    if(false == this.runInlineScript(this, function(){
console.info("this action occur on the form!")
console.info("you not press the keyboard:shift_from");
}))
{
return;
};
  }
}, 
{ /* ecaRule18 */
  name: 'ecaRule18',
  evts: [{ id: 'selectInFlow_group01', e: 'onKeyDown'}],
  cond: function(e) {
    return (e.keyCode == 17) && this.runWF('selectInFlow_selectList04', 'isFocusable');
  },
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
console.info("this action occur on the group");
}))
{
return;
};
    if(false == this.runInlineScript(this, function(){
console.info("this condition is that e.keyCode==17 and selectList04.isFocusable()");
}))
{
return;
};
    if(false == this.runInlineScript(this, function(){
console.info(">>>><<<<");
}))
{
return;
};
    if(false == this.runInlineScript(this, function(){
console.info("this Actions if true!!!");
}))
{
return;
};
  },
  onFalse: function(e) {
    if(false == this.runInlineScript(this, function(){
console.info("this action occur on the group");
}))
{
return;
};
    if(false == this.runInlineScript(this, function(){
console.info("this condition is that e.keyCode==17 and selectList04.isFocusable()");
}))
{
return;
};
    if(false == this.runInlineScript(this, function(){
console.info(">>>><<<<");
}))
{
return;
};
    if(false == this.runInlineScript(this, function(){
console.info("this Actions if false!!!");
}))
{
return;
};
  }
}, 
{ /* ecaRule36 */
  name: 'ecaRule36',
  evts: [{ id: 'selectInFlow_group02', e: 'onKeyDown'}]
}];
dojo.addOnLoad(function(){
  engine.registerRules(selectInFlow);
});