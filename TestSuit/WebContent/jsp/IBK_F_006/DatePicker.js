window.DatePicker = [{ /* ecaRule */
  name: 'ecaRule',
  evts: [{ id: 'DatePicker_combo_year', e: 'onChange'}, { id: 'DatePicker_combo_month', e: 'onChange'}],
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
var widget_year = dijit.byId("DatePicker_combo_year");
var widget_month = dijit.byId("DatePicker_combo_month");
var widget_day = dijit.byId("DatePicker_combo_day");
var widget_calendar = dijit.byId("DatePicker_calendar");

var year = widget_year.get("value");
var month = widget_month.get("value");
if (year && month) {
 if (month == 12) {
  widget_day.loadStoreFromURL("listFiles/day31.js");
 } else {
  month++;
  if (month < 10) {
   month = "0" + month;
  }
  var date = new Date(year + "-" + month + "-01");
  date.setDate(0);
  widget_day.loadStoreFromURL("listFiles/day" + date.getDate() + ".js");
 }
 var day = widget_day.get("value");
 if (day) {
month --;
    if (month < 10){
     month = "0" + month;
    }
  var value = year + "-" + month + "-" + day;
  widget_calendar.set("value", value);
 }
}
}))
{
return;
};
  }
}, 
{ /* ecaRule01 */
  name: 'ecaRule01',
  evts: [{ id: 'DatePicker_combo_day', e: 'onChange'}],
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
var widget_year = dijit.byId("DatePicker_combo_year");
var widget_month = dijit.byId("DatePicker_combo_month");
var widget_day = dijit.byId("DatePicker_combo_day");
var widget_calendar = dijit.byId("DatePicker_calendar");

var year = widget_year.get("value");
var month = widget_month.get("value");
var day = widget_day.get("value");
if (year && month && day) {

 var value = year + "-" + month + "-" + day;
 widget_calendar.set("value", value);
}
}))
{
return;
};
  }
}, 
{ /* ecaRule02 */
  name: 'ecaRule02',
  evts: [{ id: 'DatePicker_calendar', e: 'onChange'}],
  onTrue: function(e) {
    if(false == this.runInlineScript(this, function(){
var widget_year = dijit.byId("DatePicker_combo_year");
var widget_month = dijit.byId("DatePicker_combo_month");
var widget_day = dijit.byId("DatePicker_combo_day");
var widget_calendar = dijit.byId("DatePicker_calendar");

var date = widget_calendar.get("value");
widget_year.set("value", date.getFullYear(), false);
var month = date.getMonth();
month++;
if (month < 10) {
 month = "0" + month;
}
widget_month.set("value", month, false);
var day = date.getDate();
if (day < 10) {
 day = "0" + day;
}
widget_day.set("value", day, false);
}))
{
return;
};
  }
}];
dojo.addOnLoad(function(){
  engine.registerRules(DatePicker);
});