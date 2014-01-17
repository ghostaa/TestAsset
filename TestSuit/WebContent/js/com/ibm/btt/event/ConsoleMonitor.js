/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.event.ConsoleMonitor");

dojo.require("com.ibm.btt.event.BaseMonitor");

dojo.declare("com.ibm.btt.event.ConsoleMonitor", com.ibm.btt.event.BaseMonitor,{
	 

   
    monitorStartRule : function( event, rule){
    	console.debug("Start Rule : " + (rule.name ? "[" +  rule.name + "]" : ""), rule,"  for event ", event.id+"."+event.e);
  	  
    },
    
    monitorEndRule : function( event, rule){
    	console.debug("End Rule : " + (rule.name ? "[" + rule.name + "]" : ""), rule,"  for event ", event.id+"."+event.e);
    },

	 
	monitorCondition : function (event, rule, result){
		console.debug("    Evaluated Condition : Condition =", rule.cond, ",  Result="+result );
		
	},
	
	monitorStartAG : function (rule){
		console.debug("Start Action Group : " + rule.name, rule);
    },
    
    monitorEndAG : function (rule){
    	console.debug("End Action Group : " + rule.name, rule);
    },
	 
	monitorAGCondition : function (rule, result){
    	console.debug("    Evaluated Condition : Condition =", rule.cond, ",  Result=" + result );		
	},
	
	monitorCallFunctionAction: function(id, functionName, args, result){
		if (typeof (result) != "undefined" && result != null)
			console.debug("    CallFunction Action : ", id+"."+functionName , " , args=",args, ", result=",result);
		else 
			console.debug("    CallFunction Action : ", id+"."+functionName , " , args=",args);
	},
	
	monitorGetPropertyAction: function (id, property, value){	   
		console.debug("    GetProperty Action : ", id+"."+property+"=="+value );
	},
	
	monitorSetPropertyAction: function (id, property, value){
		console.debug("    SetProperty Action : ", id+"."+property+"="+value );
	}
	
	
	
});