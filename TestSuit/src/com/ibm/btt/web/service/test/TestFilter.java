package com.ibm.btt.web.service.test;
import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.Map;

import com.ibm.btt.web.service.BTTWSServiceHandlerProxy;


public class TestFilter {

	/**
	 * @param args
	 * @throws RemoteException 
	 */
	public static void main(String[] args) throws RemoteException {
		// TODO Auto-generated method stub
		// when use was, it will throws an exception.
		BTTWSServiceHandlerProxy proxy = new BTTWSServiceHandlerProxy("http://localhost:8080/InternetBankTestWeb/services/BTTWSServiceHandler");
		  HashMap<String, Object> m = new HashMap<String, Object>();
		//filter
		  HashMap<String, Object> filterMap = new HashMap<String, Object>();
		  m.put("dse_operationName", "Q005_TestFilterOp");
		  // group 1: no filter, keep other group comment out 
		  
		  // group 2: filter is testRecord
//		  filterMap.put("testRecord", "");
		  
		  // group 3: filter is testList
//		  filterMap.put("testList", "");
		  
		  // group 4: filter is an element in testRecord
		  filterMap.put("testRecord", "");
		  
		  // group 5: filter is an element in testList
		  filterMap.put("testList.3.BigIntegerData", "");
		  
		  // group 6: filter is testRecord and testList
//		  filterMap.put("testRecord", "");
//		  filterMap.put("testList", "");
		  
		  m.put("dse_wsResponseFilter", filterMap);
		  Map<String, Object> resultMap=proxy.callBTT(m);
		  System.out.println(resultMap);
	}

}
