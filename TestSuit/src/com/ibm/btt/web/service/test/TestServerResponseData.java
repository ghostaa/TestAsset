package com.ibm.btt.web.service.test;

import java.util.HashMap;
import java.util.Map;

import com.ibm.btt.web.service.BTTWSServiceHandlerProxy;

public class TestServerResponseData {

	@SuppressWarnings("unchecked")
	public static void main(String[] arg0) throws Exception {
		BTTWSServiceHandlerProxy proxy = new BTTWSServiceHandlerProxy("http://localhost:8080/InternetBankTestWeb/services/BTTWSServiceHandler");
		HashMap<String, Object> m = new HashMap<String, Object>();
		m.put("dse_operationName", "Q005_TestServerResponseDataOp");

		// filter
		HashMap<String, Object> filterMap = new HashMap<String, Object>();
		filterMap.put("testList", "");
		m.put("dse_wsResponseFilter", filterMap);
		// in the server-side, the type is Date, but in the client-side it is GregorianCalendar.
		
		Map<String, Object> resultMap = proxy.callBTT(m);
		System.out.println(resultMap);
	}
}
