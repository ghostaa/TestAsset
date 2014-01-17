package com.ibm.btt.web.service.test;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.ibm.btt.web.service.BTTWSServiceHandlerProxy;

public class TestClientPostData {
	static Random rand = new Random();

	@SuppressWarnings("unchecked")
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		// when use was, it will throws an exception.
		BTTWSServiceHandlerProxy proxy = new BTTWSServiceHandlerProxy(
				"http://localhost:8080/InternetBankTestWeb/services/BTTWSServiceHandler");
		HashMap<String, Object> m = new HashMap<String, Object>();

		m.put("dse_operationName", "Q005_TestClientPostDataOp");

		setValueForPostKColl(m);
		setValueForPostIColl(m);
		// filter
		HashMap<String, Object> filterMap = new HashMap<String, Object>();
		filterMap.put("testList", "");
		filterMap.put("testRecord", "");
		m.put("dse_wsResponseFilter", filterMap);

		Map<String, Object> resultMap = proxy.callBTT(m);
		System.out.println(resultMap);
	}

	public static void setValueForPostKColl(HashMap<String, Object> m)
			throws Exception {
		m.put("testRecord.TestField", "hello world, this is a field");
		m.put("testRecord.StringData", "this is a string");

		// not support Date
//		 m.put("testRecord.DateData",new Date());

		// not support currency
		// m.put("testRecord.CurrencyData",new Currency("CNY", new
		// BigDecimal(2345)));

		m.put("testRecord.NumberData", new BigDecimal(12121212));
		m.put("testRecord.BooleanData", true);
		//
		// ByteArray how to use
		// ByteArray ba = new ByteArray();
		// ba.write(9001);
		// m.put("testRecord.ByteArrayData", ba);

		// not support Duration
		// m.put("testRecord.DurationData",DatatypeFactory.newInstance().newDuration(1234567890)
		// );

		// not support XMLGregorianCalendar
		// m.put("testRecord.XMLGregorianCalendarData",DateUtilForTest.getXGC());

		m.put("testRecord.ByteData", (byte) rand.nextInt(127));
		m.put("testRecord.ShortData", (short) rand.nextInt(1000));
		m.put("testRecord.IntegerData", rand.nextInt());
		m.put("testRecord.LongData", rand.nextLong());
		m.put("testRecord.FloatData", rand.nextFloat());
		m.put("testRecord.DoubleData", rand.nextDouble());

		m.put("testRecord.BigIntegerData", new BigInteger("12345"));
		m.put("testRecord.BigDecimalData", new BigDecimal(1234456777.54544));
	}

	public static void setValueForPostIColl(HashMap<String, Object> m) {
		for (int i = 0; i < 10; i++) {
			m.put("testList." + i + ".TestField", "hello world, this is a field" + i);
			m.put("testList." + i + ".StringData", "this is a string" + i);

			// not support Date
			// m.put("testList." + i + ".DateData",new Date());

			// not support currency
			// m.put("testList." + i + ".CurrencyData",new Currency("CNY", new
			// BigDecimal(2345)));

			m.put("testList." + i + ".NumberData", new BigDecimal(rand.nextLong()));
			m.put("testList." + i + ".BooleanData", true);
			//
			// ByteArray how to use
			// ByteArray ba = new ByteArray();
			// ba.write(9001);
			// m.put("testList." + i + ".ByteArrayData", ba);

			// not support Duration
			// m.put("testList." + i + ".DurationData",DatatypeFactory.newInstance().newDuration(1234567890)
			// );

			// not support XMLGregorianCalendar
			// m.put("testList." + i + ".XMLGregorianCalendarData",DateUtilForTest.getXGC());

			m.put("testList." + i + ".ByteData", (byte) rand.nextInt(127));
			m.put("testList." + i + ".ShortData", (short) rand.nextInt(1000));
			m.put("testList." + i + ".IntegerData", rand.nextInt());
			m.put("testList." + i + ".LongData", rand.nextLong());
			m.put("testList." + i + ".FloatData", rand.nextFloat());
			m.put("testList." + i + ".DoubleData", rand.nextDouble());

			m.put("testList." + i + ".BigIntegerData", new BigInteger("12345"));
			m.put("testList." + i + ".BigDecimalData", new BigDecimal(1234456777.54544));
		}

	}

}
