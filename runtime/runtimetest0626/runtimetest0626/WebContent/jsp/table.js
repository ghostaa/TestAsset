window.table = [{ /* visibleTable */
  name: 'visibleTable',
  evts: [{ id: 'table_visibleButton', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('table_Table01', 'visibility') != 'visible';
  },
  onTrue: function(e) {
    this.setPW('table_Table01', 'visibility', 'visible');
  }
}, 
{ /* hiddenTable */
  name: 'hiddenTable',
  evts: [{ id: 'table_hiddenButton', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('table_Table01', 'visibility') != 'hidden';
  },
  onTrue: function(e) {
    this.setPW('table_Table01', 'visibility', 'hidden');
  }
}, 
{ /* goneTable */
  name: 'goneTable',
  evts: [{ id: 'table_goneButton', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('table_Table01', 'visibility') != 'gone';
  },
  onTrue: function(e) {
    this.setPW('table_Table01', 'visibility', 'gone');
  }
}, 
{ /* beginTrack */
  name: 'beginTrack',
  evts: [{ id: 'table_beginTrack', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('table_EventTrack', 'text', "");
  }
}, 
{ /* stopTrack */
  name: 'stopTrack',
  evts: [{ id: 'table_stopTrack', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('table_EventTrack', 'text', "wait");
  }
}, 
{ /* onClick */
  name: 'onClick',
  evts: [{ id: 'table_Table01', e: 'onClick'}],
  cond: function(e) {
    return this.getPW('table_EventTrack', 'text') != 'wait';
  },
  onTrue: function(e) {
    this.setPW('table_EventTrack', 'text', this.getPW('table_EventTrack', 'text') + ' onClick');
  }
}, 
{ /* onFocus */
  name: 'onFocus',
  evts: [{ id: 'table_Table01', e: 'onFocus'}],
  cond: function(e) {
    return this.getPW('table_EventTrack', 'text') != 'wait';
  },
  onTrue: function(e) {
    this.setPW('table_EventTrack', 'text', this.getPW('table_EventTrack', 'text') + ' onFocus');
  }
}, 
{ /* onBlur */
  name: 'onBlur',
  evts: [{ id: 'table_Table01', e: 'onBlur'}],
  cond: function(e) {
    return this.getPW('table_EventTrack', 'text') != 'wait';
  },
  onTrue: function(e) {
    this.setPW('table_EventTrack', 'text', this.getPW('table_EventTrack', 'text') + ' onBlur');
  }
}, 
{ /* onKeyDown */
  name: 'onKeyDown',
  evts: [{ id: 'table_Table01', e: 'onKeyDown'}],
  onTrue: function(e) {
    this.setPW('table_EventTrack', 'text', this.getPW('table_EventTrack', 'text') + ' onKeyDown');
  }
}, 
{ /* onKeyPress */
  name: 'onKeyPress',
  evts: [{ id: 'table_Table01', e: 'onKeyPress'}],
  cond: function(e) {
    return this.getPW('table_EventTrack', 'text') != 'wait';
  },
  onTrue: function(e) {
    this.setPW('table_EventTrack', 'text', this.getPW('table_EventTrack', 'text') + ' onKeyPress');
  }
}, 
{ /* onKeyUp */
  name: 'onKeyUp',
  evts: [{ id: 'table_Table01', e: 'onKeyUp'}],
  cond: function(e) {
    return this.getPW('table_EventTrack', 'text') != 'wait';
  },
  onTrue: function(e) {
    this.setPW('table_EventTrack', 'text', this.getPW('table_EventTrack', 'text') + ' onKeyUp');
  }
}, 
{ /* onMouseDown */
  name: 'onMouseDown',
  evts: [{ id: 'table_Table01', e: 'onMouseDown'}],
  cond: function(e) {
    return this.getPW('table_EventTrack', 'text') != 'wait';
  },
  onTrue: function(e) {
    this.setPW('table_EventTrack', 'text', this.getPW('table_EventTrack', 'text') + ' onMouseDown');
  }
}, 
{ /* onMouseUp */
  name: 'onMouseUp',
  evts: [{ id: 'table_Table01', e: 'onMouseUp'}],
  cond: function(e) {
    return this.getPW('table_EventTrack', 'text') != 'wait';
  },
  onTrue: function(e) {
    this.setPW('table_EventTrack', 'text', this.getPW('table_EventTrack', 'text') + ' onMouseUp');
  }
}, 
{ /* onMouseEnter */
  name: 'onMouseEnter',
  evts: [{ id: 'table_Table01', e: 'onMouseEnter'}],
  cond: function(e) {
    return this.getPW('table_EventTrack', 'text') != 'wait';
  },
  onTrue: function(e) {
    this.setPW('table_EventTrack', 'text', this.getPW('table_EventTrack', 'text') + ' onMouseEnter');
  }
}, 
{ /* onMouseLeave */
  name: 'onMouseLeave',
  evts: [{ id: 'table_Table01', e: 'onMouseLeave'}],
  cond: function(e) {
    return this.getPW('table_EventTrack', 'text') != 'wait';
  },
  onTrue: function(e) {
    this.setPW('table_EventTrack', 'text', this.getPW('table_EventTrack', 'text') + ' onMouseLeave');
  }
}, 
{ /* onMouseMove */
  name: 'onMouseMove',
  evts: [{ id: 'table_Table01', e: 'onMouseMove'}],
  cond: function(e) {
    return this.getPW('table_EventTrack', 'text') != 'wait';
  },
  onTrue: function(e) {
    this.setPW('table_EventTrack', 'text', this.getPW('table_EventTrack', 'text') + ' onMouseMove');
  }
}, 
{ /* onSelected */
  name: 'onSelected',
  evts: [{ id: 'table_Table01', e: 'onSelected'}],
  cond: function(e) {
    return this.getPW('table_EventTrack', 'text') != 'wait';
  },
  onTrue: function(e) {
    this.setPW('table_EventTrack', 'text', this.getPW('table_EventTrack', 'text') + ' onSelected');
  },
  onFalse: function(e) {
    this.setPW('table_EventTrack', 'text', this.getPW('table_EventTrack', 'text') + ' onSelected');
  }
}, 
{ /* isFocusable */
  name: 'isFocusable',
  evts: [{ id: 'table_isFocusable', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('table_Table01', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('table_Label05', 'text', 'true');
  },
  onFalse: function(e) {
    this.setPW('table_Label05', 'text', "false");
  }
}, 
{ /* onClickForIsFocusable */
  name: 'onClickForIsFocusable',
  evts: [{ id: 'table_Table01', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('table_Table01', 'isFocusable');
  },
  onTrue: function(e) {
    this.setPW('table_Label05', 'text', 'focusOn');
  }
}, 
{ /* printSelectedItem */
  name: 'printSelectedItem',
  evts: [{ id: 'table_Table01', e: 'onSelected'}],
  onTrue: function(e) {
    this.setPW('table_Label06', 'text', this.runWF('table_Table01', 'getValueInSelectedItem', 'salary'));
  }
}, 
{ /* moveFocusToTable */
  name: 'moveFocusToTable',
  evts: [{ id: 'table_Button02', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('table_Table01', 'focusOn');
  }
}, 
{ /* hint */
  name: 'hint',
  evts: [{ id: 'table_Button05', e: 'onClick'}],
  onTrue: function(e) {
    this.setPW('table_Table02', 'hint', 'New hint for table');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(table);
});