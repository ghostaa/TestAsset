window.eca4 = [{ /* ClickFillDefaultValueForCurrencyTxt */
  name: 'ClickFillDefaultValueForCurrencyTxt',
  evts: [{ id: 'eca4_btnTPFillCurrencyValue', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca4_txtTPCurrency', 'value', '1024.52');
  }
}, 
{ /* ClickFillDefaultValueForNumberTxt */
  name: 'ClickFillDefaultValueForNumberTxt',
  evts: [{ id: 'eca4_btnTPFillNumberValue', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca4_txtTPNumber', 'value', '1024.128');
  }
}, 
{ /* EADateOnBlur */
  name: 'EADateOnBlur',
  evts: [{ id: 'eca4_txtEADateField', e: 'onBlur'}],
  cond: function(e) {
    return this.getPW('eca4_txtEADateField', 'value');
  },
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onBlur\" occured on \"Date\" Type TextBox! ' + this.getPW('eca4_txtEADateField', 'value'));
  },
  onFalse: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onBlur\" occured on \"Date\" Type TextBox! ');
  }
}, 
{ /* EADateOnClick */
  name: 'EADateOnClick',
  evts: [{ id: 'eca4_txtEADateField', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onClick\" occured on \"Date\" Type TextBox! ' + this.getPW('eca4_txtEADateField', 'value'));
  }
}, 
{ /* EADateOnChange */
  name: 'EADateOnChange',
  evts: [{ id: 'eca4_txtEADateField', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onChange\" occured on \"Date\" Type TextBox! ' + this.getPW('eca4_txtEADateField', 'value'));
  }
}, 
{ /* EADateOnFocus */
  name: 'EADateOnFocus',
  evts: [{ id: 'eca4_txtEADateField', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onFocus\" occured on \"Date\" Type TextBox! ');
  }
}, 
{ /* EADateOnMouseDown */
  name: 'EADateOnMouseDown',
  evts: [{ id: 'eca4_txtEADateField', e: 'onMouseDown'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onMouseDown\" occured on \"Date\" Type TextBox! ');
  }
}, 
{ /* EADateOnMouseUp */
  name: 'EADateOnMouseUp',
  evts: [{ id: 'eca4_txtEADateField', e: 'onMouseUp'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onMouseUp\" occured on \"Date\" Type TextBox! ');
  }
}, 
{ /* EADateOnMouseEnter */
  name: 'EADateOnMouseEnter',
  evts: [{ id: 'eca4_txtEADateField', e: 'onMouseEnter'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onMouseEnter\" occured on \"Date\" Type TextBox! ');
  }
}, 
{ /* EADateOnMouseLeave */
  name: 'EADateOnMouseLeave',
  evts: [{ id: 'eca4_txtEADateField', e: 'onMouseLeave'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onMouseLeave\" occured on \"Date\" Type TextBox! ' + this.getPW('eca4_txtEADateField', 'value'));
  }
}, 
{ /* EADateOnMouseMove */
  name: 'EADateOnMouseMove',
  evts: [{ id: 'eca4_txtEADateField', e: 'onMouseMove'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onMouseMove\" occured on \"Date\" Type TextBox! ' + this.getPW('eca4_txtEADateField', 'value'));
  }
}, 
{ /* EAStringOnBlur */
  name: 'EAStringOnBlur',
  evts: [{ id: 'eca4_txtEAStringField', e: 'onBlur'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onBlur\" occured on \"String\" Type TextBox! ');
  }
}, 
{ /* EAStringOnClick */
  name: 'EAStringOnClick',
  evts: [{ id: 'eca4_txtEAStringField', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onClick\" occured on \"String\" Type TextBox! ');
  }
}, 
{ /* EAStringOnChange */
  name: 'EAStringOnChange',
  evts: [{ id: 'eca4_txtEAStringField', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onChange\" occured on \"String\" Type TextBox! ' + this.getPW('eca4_txtEAStringField', 'value'));
  }
}, 
{ /* EAStringOnFocus */
  name: 'EAStringOnFocus',
  evts: [{ id: 'eca4_txtEAStringField', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onFocus\" occured on \"String\" Type TextBox! ');
  }
}, 
{ /* EAStringOnKeyDown */
  name: 'EAStringOnKeyDown',
  evts: [{ id: 'eca4_txtEAStringField', e: 'onKeyDown'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onKeyDown\" occured on \"String\" Type TextBox! ');
  }
}, 
{ /* EAStringOnKeyPress */
  name: 'EAStringOnKeyPress',
  evts: [{ id: 'eca4_txtEAStringField', e: 'onKeyPress'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onKeyPress\" occured on \"String\" Type TextBox! ');
  }
}, 
{ /* EAStringOnKeyUp */
  name: 'EAStringOnKeyUp',
  evts: [{ id: 'eca4_txtEAStringField', e: 'onKeyUp'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onKeyUp\" occured on \"String\" Type TextBox! ');
  }
}, 
{ /* EACurrencyOnBlur */
  name: 'EACurrencyOnBlur',
  evts: [{ id: 'eca4_txtEAExtendedCurrencyField', e: 'onBlur'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onBlur\" occured on \"Currency\" Type TextBox! ');
  }
}, 
{ /* EACurrencyOnClick */
  name: 'EACurrencyOnClick',
  evts: [{ id: 'eca4_txtEAExtendedCurrencyField', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onClick\" occured on \"Currency\" Type TextBox! ');
  }
}, 
{ /* EACurrencyOnChange */
  name: 'EACurrencyOnChange',
  evts: [{ id: 'eca4_txtEAExtendedCurrencyField', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', this.getPW('eca4_txtEAExtendedCurrencyField', 'value') + '  Event \"onChange\" occured on \"Currency\" Type TextBox! ');
  }
}, 
{ /* EACurrencyOnFocus */
  name: 'EACurrencyOnFocus',
  evts: [{ id: 'eca4_txtEAExtendedCurrencyField', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onFocus\" occured on \"Currency\" Type TextBox! ');
  }
}, 
{ /* EANumberOnBlur */
  name: 'EANumberOnBlur',
  evts: [{ id: 'eca4_txtEANumberField', e: 'onBlur'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onBlur\" occured on \"Number\" Type TextBox! ');
  }
}, 
{ /* EANumberOnClick */
  name: 'EANumberOnClick',
  evts: [{ id: 'eca4_txtEANumberField', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onClick\" occured on \"Number\" Type TextBox! ');
  }
}, 
{ /* EANumberOnChange */
  name: 'EANumberOnChange',
  evts: [{ id: 'eca4_txtEANumberField', e: 'onChange'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', this.getPW('eca4_txtEANumberField', 'value') + '  Event \"onChange\" occured on \"Number\" Type TextBox! ');
  }
}, 
{ /* EANumberOnFocus */
  name: 'EANumberOnFocus',
  evts: [{ id: 'eca4_txtEANumberField', e: 'onFocus'}],
  onTrue: function(e) {
    this.setPW('eca4_txtEAInformationDisplay', 'value', 'Event \"onFocus\" occured on \"Number\" Type TextBox! ');
  }
}, 
{ /* BACurrencyApply */
  name: 'BACurrencyApply',
  evts: [{ id: 'eca4_Button04', e: 'onClick'}],
  cond: function(e) {
    return (this.getPW('eca4_txtRandomConditionId', 'value') == '0') && (this.getPW('eca4_txtBACurrencyField', 'value') != '');
  },
  onTrue: function(e) {
    this.runWF('eca4_txtBACurrencyField', 'focus');
    this.setPW('eca4_txtBACurrencyField', 'value', '1280.00');
  },
  onFalse: function(e) {
    this.setPW('eca4_txtBACurrencyField', 'value', 'Condition is not met!');
  }
}, 
{ /* BADateApply */
  name: 'BADateApply',
  evts: [{ id: 'eca4_Button05', e: 'onClick'}],
  cond: function(e) {
    return (this.getPW('eca4_txtRandomConditionId', 'value') == '1') && (this.getPW('eca4_txtBADateField', 'value') != '');
  },
  onTrue: function(e) {
    this.setPW('eca4_txtBADateField', 'disabled', true);
    this.setPW('eca4_Edit Mode', 'text', 'Disabled Mode');
    this.setPW('eca4_Button05', 'text', 'Restore');
  },
  onFalse: function(e) {
    this.setPW('eca4_Edit Mode', 'text', 'Condition is not met!');
  }
}, 
{ /* BADateRestore */
  name: 'BADateRestore',
  evts: [{ id: 'eca4_Button05', e: 'onClick'}],
  cond: function(e) {
    return (this.getPW('eca4_txtRandomConditionId', 'value') == '1') && this.getPW('eca4_txtBADateField', 'disabled');
  },
  onTrue: function(e) {
    this.setPW('eca4_txtBADateField', 'disabled', false);
    this.setPW('eca4_Edit Mode', 'text', 'Edit Mode');
  },
  onFalse: function(e) {
    this.setPW('eca4_Edit Mode', 'text', 'Condition is not met!');
  }
}, 
{ /* BANumberApply */
  name: 'BANumberApply',
  evts: [{ id: 'eca4_Button06', e: 'onClick'}],
  cond: function(e) {
    return ! this.getPW('eca4_txtBANumberField', 'readOnly');
  },
  onTrue: function(e) {
    this.setPW('eca4_txtBANumberField', 'readOnly', true);
    this.setPW('eca4_Button06', 'text', 'Restore');
  },
  onFalse: function(e) {
    this.setPW('eca4_txtBANumberField', 'readOnly', false);
    this.setPW('eca4_Button06', 'text', 'ReadOnly');
  }
}, 
{ /* BAPlainHidden */
  name: 'BAPlainHidden',
  evts: [{ id: 'eca4_Button08', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('eca4_txtRandomConditionId', 'value') == '4';
  },
  onTrue: function(e) {
    this.setPW('eca4_txtBAPlainField', 'visibility', 'hidden');
  }
}, 
{ /* BAPlainGone */
  name: 'BAPlainGone',
  evts: [{ id: 'eca4_Button08', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('eca4_txtRandomConditionId', 'value') == '5';
  },
  onTrue: function(e) {
    this.setPW('eca4_txtBAPlainField', 'visibility', 'gone');
  }
}, 
{ /* BAPlainVisible */
  name: 'BAPlainVisible',
  evts: [{ id: 'eca4_Button08', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('eca4_txtRandomConditionId', 'value') == '6';
  },
  onTrue: function(e) {
    this.setPW('eca4_txtBAPlainField', 'visibility', 'visible');
  }
}, 
{ /* FetchNextCondition */
  name: 'FetchNextCondition',
  evts: [{ id: 'eca4_Button03', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('eca4_Form04', 'callAsyncOperation', 'eca4Op', 'ecaCode', 1000);
  }
}, 
{ /* ZeroEnableCurrencyBtn */
  name: 'ZeroEnableCurrencyBtn',
  evts: [{ id: 'eca4_txtRandomConditionId', e: 'onChange'}],
  cond: function(e) {
    return this.getPW('eca4_txtRandomConditionId', 'value') == '0';
  },
  onTrue: function(e) {
    this.setPW('eca4_Button04', 'inValid', false);
    this.setPW('eca4_Button03', 'text', 'Next Condition');
  }
}, 
{ /* OneEnableDateBtn */
  name: 'OneEnableDateBtn',
  evts: [{ id: 'eca4_txtRandomConditionId', e: 'onChange'}],
  cond: function(e) {
    return this.getPW('eca4_txtRandomConditionId', 'value') == '1';
  },
  onTrue: function(e) {
    this.setPW('eca4_Button04', 'inValid', true);
    this.setPW('eca4_Button05', 'inValid', false);
  }
}, 
{ /* TwoEnableNumberBtn */
  name: 'TwoEnableNumberBtn',
  evts: [{ id: 'eca4_txtRandomConditionId', e: 'onChange'}],
  cond: function(e) {
    return this.getPW('eca4_txtRandomConditionId', 'value') == '2';
  },
  onTrue: function(e) {
    this.setPW('eca4_Button05', 'inValid', true);
    this.setPW('eca4_Button06', 'inValid', false);
  }
}, 
{ /* ThreeEnableStringBtn */
  name: 'ThreeEnableStringBtn',
  evts: [{ id: 'eca4_txtRandomConditionId', e: 'onChange'}],
  cond: function(e) {
    return this.getPW('eca4_txtRandomConditionId', 'value') == '3';
  },
  onTrue: function(e) {
    this.setPW('eca4_Button06', 'inValid', true);
    this.setPW('eca4_Button07', 'inValid', false);
  }
}, 
{ /* FourToSixEnablePlainBtn */
  name: 'FourToSixEnablePlainBtn',
  evts: [{ id: 'eca4_txtRandomConditionId', e: 'onChange'}],
  cond: function(e) {
    return (this.getPW('eca4_txtRandomConditionId', 'value') >= '4') && (this.getPW('eca4_txtRandomConditionId', 'value') <= '6');
  },
  onTrue: function(e) {
    this.setPW('eca4_Button07', 'inValid', true);
    this.setPW('eca4_Button08', 'inValid', false);
  }
}, 
{ /* DisableTextBox: disable the textbox */
  name: 'DisableTextBox',
  evts: [{ id: 'eca4_mbtnDisable', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca4_txtMxDefect23997', 'disabled', true);
    this.setPW('eca4_lblInfo', 'text', 'TextBox widget is disabled!');
  }
}, 
{ /* HideTextBox */
  name: 'HideTextBox',
  evts: [{ id: 'eca4_mbtnHidden', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca4_txtMxDefect23997', 'visibility', 'hidden');
    this.setPW('eca4_lblInfo', 'text', 'TextBox widget is hidden!');
  }
}, 
{ /* GoneTextBox */
  name: 'GoneTextBox',
  evts: [{ id: 'eca4_mbtnGone', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca4_txtMxDefect23997', 'visibility', 'gone');
    this.setPW('eca4_lblInfo', 'text', 'TextBox widget is gone!');
  }
}, 
{ /* IsFocusTextBox */
  name: 'IsFocusTextBox',
  evts: [{ id: 'eca4_mbtnIsFocusable', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('eca4_txtMxDefect23997', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('eca4_lblInfo', 'text', 'TextBox widget is focusable!');
    this.runWF('eca4_txtMxDefect23997', 'focus');
  },
  onFalse: function(e) {
    this.setPW('eca4_lblInfo', 'text', 'TextBox widget is NOT focusable!');
  }
}, 
{ /* BADate2GetFocus */
  name: 'BADate2GetFocus',
  evts: [{ id: 'eca4_Button07', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('eca4_txtBADate2', 'focus');
  }
}, 
{ /* EnableClick */
  name: 'EnableClick',
  evts: [{ id: 'eca4_Button09', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca4_txtMxDefect23997', 'disabled', false);
  }
}, 
{ /* EditableClick */
  name: 'EditableClick',
  evts: [{ id: 'eca4_Button11', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca4_txtMxDefect23997', 'readOnly', false);
  }
}, 
{ /* ReadOnlyClick */
  name: 'ReadOnlyClick',
  evts: [{ id: 'eca4_Button10', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca4_txtMxDefect23997', 'readOnly', true);
  }
}, 
{ /* VisibleClick */
  name: 'VisibleClick',
  evts: [{ id: 'eca4_Button12', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('eca4_txtMxDefect23997', 'visibility', 'visible');
  }
}, 
{ /* btnShowErrMsg1Click */
  name: 'btnShowErrMsg1Click',
  evts: [{ id: 'eca4_btnShowErrMsg1', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('eca4_Text01', 'focus');
    this.runWF('eca4_Text01', 'showErrorMessage', 'Hello Jack, welcome to BTT!(Non-Nls message)');
  }
}, 
{ /* btnShowErrMsg2Click */
  name: 'btnShowErrMsg2Click',
  evts: [{ id: 'eca4_btnShowErrMsg2', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('eca4_Text01', 'focus');
    this.runWF('eca4_Text01', 'showErrorMessage', '%nls.NlsSupportTestResourse/_2Tip_Message2');
  }
}, 
{ /* btnShowErrMsg3Click */
  name: 'btnShowErrMsg3Click',
  evts: [{ id: 'eca4_btnShowErrMsg3', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('eca4_Text01', 'focus');
    this.runWF('eca4_Text01', 'showErrorMessage', '%nls.BTTResource/I18N_MESSAGE', 'Jack', 27, 'ExtValueOfNoUse', 90, false);
  }
}, 
{ /* btnShowErrMsg4Click */
  name: 'btnShowErrMsg4Click',
  evts: [{ id: 'eca4_btnShowErrMsg4', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('eca4_Text01', 'focus');
    this.runWF('eca4_Text01', 'showErrorMessage', 'Dear user: {0}, your age is {AgeParameter}! Welcome to BTT!', 'Jack', 54, 'ExtValuesOfNoUse', 0);
  }
}, 
{ /* btnShowErrMsg5Click */
  name: 'btnShowErrMsg5Click',
  evts: [{ id: 'eca4_btnShowErrMsg5', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('eca4_Text01', 'focus');
    this.runWF('eca4_Text01', 'showErrorMessage', 'This is a constant message, no parameter defined for this message!', 'param0Vlaue', 987, true);
  }
}, 
{ /* btnShowErrMsg6Click */
  name: 'btnShowErrMsg6Click',
  evts: [{ id: 'eca4_btnShowErrMsg6', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('eca4_Text01', 'focus');
    this.runWF('eca4_Text01', 'showErrorMessage', '%nls.BTTResource/I18N_MESSAGE', 'Jack', 27, 'ExtValueOfNoUse', 90, false);
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(eca4);
});