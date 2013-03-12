package com.ibm.btt.rest.test;



import org.junit.runner.RunWith;

import org.junit.runners.Suite;

 

@RunWith(Suite.class)

@Suite.SuiteClasses({
	
	TestSessionResourceAPI.class,
	TestSessionResourceData.class,
	
	TestFlowResourceAPI.class,
	TestFlowResourceData.class,
	
	TestOperationResourceAPI.class,
	TestOperationResourceData.class

})



public class REST_TestSuit {

}
