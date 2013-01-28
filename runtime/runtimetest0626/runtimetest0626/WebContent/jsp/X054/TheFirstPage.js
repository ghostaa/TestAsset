window.TheFirstPage = [{ /* ecaRule08 */
  name: 'ecaRule08',
  evts: [{ id: 'TheFirstPage_button01', e: 'onKeyPress'}],
  cond: function(e) {
    return this.getPW('TheFirstPage_e', 'ctrlKey') == true;
  },
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
function buildUrl(){
 var qs="?debug=true";
 
 with(location){
 var url=href+qs;
}
 return url
}
var result=buildUrl();
alert(result);
}))
{
return;
};
    this.setPW('TheFirstPage_label03', 'text', 'Button.onKeyPress is successful');
  },
  onFalse: function(e) {
    if(false == this.runInlineScript(this, function(){
function addOne(num)
{
 num+=true;
 return num;
}
var Number=1;
var result=addOne(Number);
alert(typeof Number);
alert(typeof result);


}))
{
return;
};
    this.setPW('TheFirstPage_label03', 'text', 'Button.onKeyPress occur wrong');
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'TheFirstPage_button02', e: 'onClick'}],
  cond: function(e) {
    return e.ctrlKey == true;
  },
  onTrue: function(e) {
    this.runWF('TheFirstPage_table', 'hideColumn', 2);
  },
  onFalse: function(e) {
    this.runWF('TheFirstPage_table', 'showColumn', 2);
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'TheFirstPage_button03', e: 'onKeyPress'}],
  cond: function(e) {
    return e.ctrlKey == 'true';
  },
  onTrue: function(e) {
    this.runWF('TheFirstPage_table', 'hideColumn', 2);
  },
  onFalse: function(e) {
    this.runWF('TheFirstPage_table', 'showColumn', 2);
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'TheFirstPage_button04', e: 'onClick'}],
  cond: function(e) {
    return this.runWF('TheFirstPage_table', 'isColumnVisible', 2) == true;
  },
  onTrue: function(e) {
    this.runWF('TheFirstPage_table', 'hideColumn', 2);
  },
  onFalse: function(e) {
    this.runWF('TheFirstPage_table', 'showColumn', 2);
  }
}, 
{ /* ecaRule05 */
  name: 'ecaRule05',
  evts: [{ id: 'TheFirstPage_button05', e: 'onKeyDown'}],
  onTrue: function(e) {
    this.setPW('TheFirstPage_button05', 'text', 'change this button.text use by on \'Ctrl+F2\'');
  }
}, 
{ /* ecaRule06 */
  name: 'ecaRule06',
  evts: [{ id: 'TheFirstPage_form', e: 'onKeyUp'}],
  cond: function(e) {
    return ((e.keyCode == 49) && (e.ctrlKey == true)) == true;
  },
  onTrue: function(e) {
    this.setPW('TheFirstPage_button04', 'icon', 'img/Bomb1.jpg');
  },
  onFalse: function(e) {
    if(false == this.runInlineScript(this, function(){
function buildUrl(){
 var qs="?debug=true";
 
 with(location){
 var url=href+qs;
}
 return url
}
var result=buildUrl();
alert(result);
}))
{
return;
};
    this.setPW('TheFirstPage_link', 'text', 'From Action if false');
  }
}, 
{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'TheFirstPage_button06', e: 'onKeyPress'}],
  cond: function(e) {
    return (e.ctrlKey == true) && (true == this.runWF('TheFirstPage_table', 'isColumnVisible', 2));
  },
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
function buildUrl(){
 var qs="?debug=true";
 
 with(location){
 var url=href+qs;
}
 return url
}
var result=buildUrl();
alert(result);
}))
{
return;
};
  },
  onFalse: function(e) {
    if(false == this.runInlineScript(this, function(){
function addOne(num)
{
 num+=true;
 return num;
}
var Number=1;
var result=addOne(Number);
alert(typeof Number);
alert(typeof result);


}))
{
return;
};
  }
}, 
{ /* ecaRule07 */
  name: 'ecaRule07',
  evts: [{ id: 'TheFirstPage_button07', e: 'onClick'}],
  onTrue: function(e) {
    this.runWF('TheFirstPage_button04', 'focus');
  }
}, 
{ /* ecaRule09 */
  name: 'ecaRule09',
  evts: [{ id: 'TheFirstPage_button', e: 'onKeyDown'}],
  cond: function(e) {
    return e.altKey == this.runWF('TheFirstPage_table', 'isColumnVisible', 2);
  },
  onTrue: function(e) {
    this.setPW('TheFirstPage_button', 'text', 'TRUE');
  },
  onFalse: function(e) {
    this.setPW('TheFirstPage_button', 'text', 'FAlSE');
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(TheFirstPage);
});