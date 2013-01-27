package com.ibm.btt.rest.test;



import org.junit.runner.RunWith;

import org.junit.runners.Suite;

 

@RunWith(Suite.class)

@Suite.SuiteClasses({
	
	TestFlowResourceAPI.class,
	TestFlowResourceData.class,
	
	TestOperationResourceAPI.class,
	TestOperationResourceData.class,
	
	TestSessionResourceAPI.class,
	TestSessionResourceData.class

})



public class REST_TestSuit {

}
