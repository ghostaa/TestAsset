[{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X075_FVT_formID_checkBox', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_formID_text', 'required', false);
    this.setPW('X075_FVT_formID_text01', 'required', false);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X075_FVT_formID_checkBox01', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.executeAG('text01isMandatoryGroup',e);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X075_FVT_formID_checkBox02', e: 'onClick'}],
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_formID_checkBox02', 'text', this.getPW('X075_FVT_formID_checkBox02', 'text') + '~');
    this.executeAG('nestActionGroup1',e);
  }
}, 
{ /* ecaRule03: condition expression in different form */
  name: 'ecaRule03',
  evts: [{ id: 'X075_FVT_formID_checkBox03', e: 'onClick'}],
  cond: function(e, _rule) {
    return (BTTUtil.equals(this.getPW('X075_FVT_formID_checkBox03', 'isChecked'), true) ) && (BTTUtil.equals(this.getPW('X075_FVT_formID_checkBox03_copy', 'isChecked'), true) );
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_formID_text03', 'required', true);
  }
}, 
{ /* ecaRule04: condition widget property in different form */
  name: 'ecaRule04',
  evts: [{ id: 'X075_FVT_formID_checkBox03', e: 'onClick'}],
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW('X075_FVT_formID_checkBox03', 'isChecked'), this.getPW('X075_FVT_formID_checkBox03_copy', 'isChecked')) ;
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_formID_text03', 'required', true);
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'X075_FVT_formID_checkBox03', e: 'onClick'}],
  cond: function(e, _rule) {
    return this.getPW('X075_FVT_formID_label04', 'text') != 'abccc';
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_formID_text03', 'required', false);
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'X075_FVT_formID_checkBox03', e: 'onClick'}, { id: 'X075_FVT_formID_checkBox04', e: 'onClick'}],
  cond: function(e, _rule) {
    return (BTTUtil.equals(this.getPW('X075_FVT_formID_checkBox03', 'isChecked'), true) ) && (BTTUtil.equals(this.getPW('X075_FVT_formID_checkBox04', 'isChecked'), true) );
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_formID_text03', 'required', true);
  },
  onFalse: function(e, _rule) {
    this.setPW('X075_FVT_formID_text03', 'required', false);
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'X075_FVT_formID_checkBox03_copy', e: 'onClick'}],
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW('X075_FVT_formID_checkBox03_copy', 'isChecked'), true) ;
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_formID_text03_copy', 'required', true);
    this.setPW('X075_FVT_formID_text03_copy01', 'required', true);
    this.setPW('X075_FVT_formID_text04', 'required', false);
  },
  onFalse: function(e, _rule) {
    this.setPW('X075_FVT_formID_text04', 'required', true);
    this.setPW('X075_FVT_formID_text03_copy02', 'required', true);
    this.setPW('X075_FVT_formID_text03_copy', 'required', false);
  }
}, 
{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'X075_FVT_formID_checkBox03_copy01', e: 'onClick'}],
  cond: function(e, _rule) {
    return BTTUtil.equals(true, this.getPW('X075_FVT_formID_checkBox03_copy01', 'isChecked')) ;
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_formID_text03_copy01', 'required', true);
    this.setPW('X075_FVT_formID_text03_copy', 'required', true);
  },
  onFalse: function(e, _rule) {
    this.setPW('X075_FVT_formID_text03_copy01', 'required', false);
    this.setPW('X075_FVT_formID_text04', 'required', true);
  }
}, 
{ /* ecaRule09 */
  name: 'ecaRule09',
  evts: [{ id: 'X075_FVT_formID_checkBox03_copy02', e: 'onClick'}],
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW('X075_FVT_formID_checkBox03_copy02', 'isChecked'), true) ;
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_formID_text03_copy02', 'required', true);
  },
  onFalse: function(e, _rule) {
    this.executeAG('text01isMandatoryGroup',e);
    this.executeAG('actionGroup4',e);
  }
}, 
{ /* ecaRule10 */
  name: 'ecaRule10',
  evts: [{ id: 'X075_FVT_formID_checkBox03_copy03', e: 'onClick'}],
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW('X075_FVT_formID_checkBox03_copy03', 'isChecked'), true) ;
  },
  onTrue: function(e, _rule) {
    this.executeAG('actionGroup',e);
  },
  onFalse: function(e, _rule) {
    this.setPW('X075_FVT_formID_text03_copy03', 'required', false);
  }
}, 
{ /* text01isMandatoryGroup */
  name: 'text01isMandatoryGroup',
  type:"AG",
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_formID_text01', 'required', false);
  }
}, 
{ /* nestActionGroup1 */
  name: 'nestActionGroup1',
  type:"AG",
  onTrue: function(e, _rule) {
    this.executeAG('nestActionGroup2',e);
  }
}, 
{ /* nestActionGroup2 */
  name: 'nestActionGroup2',
  type:"AG",
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_formID_text02', 'required', false);
  }
}, 
{ /* actionGroup4 */
  name: 'actionGroup4',
  type:"AG",
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_formID_text03_copy02', 'required', false);
  }
}, 
{ /* actionGroup */
  name: 'actionGroup',
  type:"AG",
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW('X075_FVT_formID_checkBox03_copy03', 'isChecked'), true) ;
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_formID_text03_copy03', 'required', true);
  }
}]