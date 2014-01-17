[{ /* ecaRule1: aaa */
  name: 'ecaRule1',
  evts: [{ id: 'X075_FVT_UseCase_checkBox', e: 'onChange'}],
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW('X075_FVT_UseCase_checkBox', 'isChecked'), true) ;
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_text', 'required', true);
  },
  onFalse: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_text', 'required', false);
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'X075_FVT_UseCase_radio', e: 'onClick'}, { id: 'X075_FVT_UseCase_radio01', e: 'onClick'}],
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW('X075_FVT_UseCase_radio', 'isChecked'), false) ;
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_textArea', 'isMandatory', true);
    this.setPW('X075_FVT_UseCase_combo', 'required', true);
  },
  onFalse: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_textArea', 'isMandatory', false);
    this.setPW('X075_FVT_UseCase_combo', 'required', false);
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'X075_FVT_UseCase_checkBox01', e: 'onClick'}],
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW('X075_FVT_UseCase_checkBox01', 'isChecked'), true) ;
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_text03', 'required', true);
  },
  onFalse: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_text03', 'required', false);
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'X075_FVT_UseCase_checkBox02', e: 'onClick'}],
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW('X075_FVT_UseCase_checkBox02', 'isChecked'), true) ;
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_text04', 'required', true);
  },
  onFalse: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_text04', 'required', false);
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'X075_FVT_UseCase_checkBox03', e: 'onClick'}],
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW('X075_FVT_UseCase_checkBox03', 'isChecked'), true) ;
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_text05', 'required', true);
  },
  onFalse: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_text05', 'required', false);
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'X075_FVT_UseCase_checkBox04', e: 'onClick'}],
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW('X075_FVT_UseCase_checkBox04', 'isChecked'), true) ;
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_text06', 'required', true);
  },
  onFalse: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_text06', 'required', false);
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'X075_FVT_UseCase_checkBox05', e: 'onClick'}],
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW('X075_FVT_UseCase_checkBox05', 'isChecked'), true) ;
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_text07', 'required', true);
  },
  onFalse: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_text07', 'required', false);
  }
}, 
{ /* radioGroup */
  name: 'radioGroup',
  type:"AG",
  cond: function(e, _rule) {
    return BTTUtil.equals(this.getPW('X075_FVT_UseCase_radio', 'isChecked'), true) ;
  },
  onTrue: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_textArea', 'isMandatory', true);
    this.setPW('X075_FVT_UseCase_combo', 'required', false);
  },
  onFalse: function(e, _rule) {
    this.setPW('X075_FVT_UseCase_textArea', 'isMandatory', false);
    this.setPW('X075_FVT_UseCase_combo', 'required', true);
  }
},
{
	name: 'X075_FVT_UseCase_form.xValidation',
	evts: [{id: 'X075_FVT_UseCase_form', e:'onLoaded' }],
	cond: function(e) { return true; },
	onTrue: function(e) {
		this.setPW('X075_FVT_UseCase_form', 'xValidations', [
		{
			name:'xValidation',
			cond:function(e){
				return (BTTStringFunctions.length(this.getPW('X075_FVT_UseCase_text01', 'value')) > 6);
			},
			widgets: ['X075_FVT_UseCase_text01'],
			hint: 'Please input more than 6  letters'
		}]);
	} 
}]