/*
 * Licensed Materials - Property of IBM
 * Restricted Materials of IBM
 * 5724-H82
 * (C) Copyright IBM Corp.2010 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure
 * restricted by GSA ADP Schedule Contract with IBM Corp
*/

dojo.provide("com.ibm.btt.event.BaseMonitor");


dojo.declare("com.ibm.btt.event.BaseMonitor", null,{
	
	oldEvent : null,

	
	monitorEvent : function( event, rule){
	   
    },
    
	    
    monitorStartRule : function( event, rule){
    		  
    },
    
    monitorEndRule : function( event, rule){
    	
    },

	 
	monitorCondition : function (event, rule, result){
				
	},
	
	monitorStartAG : function (rule){
		  
    },
    
    monitorEndAG : function (rule){
    	
    },
	 
	monitorAGCondition : function (rule, result){
				
	},
	
	monitorCallFunctionAction: function(id, functionName, parameter){
		
	},
	
	monitorGetPropertyAction: function (id, property, value){
	  
	},
	
	monitorSetPropertyAction: function (id, property, value){
		
	}
	
	
});