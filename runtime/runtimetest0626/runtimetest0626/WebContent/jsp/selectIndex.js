window.selectIndex = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'selectIndex_panel', e: 'onkeydown'}],
  cond: function(e) {
    return (e.keyCode == 90) && (e.ctrlKey == true);
  },
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
function log(message){
 var console=document.getElementById("debug.info");
 if(console===null){
  console=document.createElement("div");
  console.id="debuginfo";
  console.style.background="#dedede";
  console.style.borader="lpx solid silver";
  console.style.padding="5px";
  console.style.width="t400px";
  console.style.position="absolute";
  console.style.right="0px";
  console.style.top="0px";
  document.body.appendChild(console);
 }
 console.innerHTML+="<p>"+message+"</p>";
}
}))
{
return;
};
    if(false == this.runInlineScript(this, function(){
//console.info("you press both keyBoard ctrl and z with same time");

}))
{
return;
};
  },
  onFalse: function(e) {
    this.setPW('selectIndex_link', 'text', '%nls.BTTResource/clientName');
    if(false == this.runInlineScript(this, function(){
console.log("not same time press Ctrl + ASCII:90(z)");
}))
{
return;
};
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'selectIndex_form', e: 'onKeyDown'}],
  cond: function(e) {
    return (e.ctrlKey == true) && (e.keyCode == 65);
  },
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
function buildURL(){
 with(location)
 {
  var url =href;
 }
 return url;
}
var result =buildURL();
console.info(result);
}))
{
return;
};
    if(false == this.runInlineScript(this, function(){
var a;
}))
{
return;
};
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'selectIndex_link', e: 'onKeyDown'}],
  cond: function(e) {
    return e.keyCode == 17;
  },
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
function buildURL(){
 var url=location.href;
 return url;
}
console.info(buildURL());
}))
{
return;
};
    if(false == this.runInlineScript(this, function(){
console.log("this info is link widgets,not form");
}))
{
return;
};
  }
}, 
{ /* ecaRule03 */
  name: 'ecaRule03',
  evts: [{ id: 'selectIndex_link02', e: 'onKeyDown'}],
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
//<a href="www.baidu.com" title=This a very popular browser engine>Baidu</a> search very thing 
// a
// b
var a;
var b;
}))
{
return;
};
  }
}, 
{ /* ecaRule04 */
  name: 'ecaRule04',
  evts: [{ id: 'selectIndex_link01', e: 'onKeyDown'}],
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
 
}))
{
return;
};
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(selectIndex);
});