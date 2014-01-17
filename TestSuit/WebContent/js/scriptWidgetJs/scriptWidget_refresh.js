var num=parseInt(param0);
	
	setInterval("sum(num)",1000);
	

function sum(i){
	dijit.byId("G030_scriptWidget_counter_label01").set('value', i);
	num--;
}