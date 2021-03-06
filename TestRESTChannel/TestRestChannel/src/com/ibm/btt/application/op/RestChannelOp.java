package com.ibm.btt.application.op;

import java.math.BigDecimal;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.rest.test.DataValue;

/**
 * Class Generated by BTT Tool Created since: 2013/01/16 18:07:15
 */
public class RestChannelOp extends BTTServerOperation {
	DataValue dv = new DataValue();
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 */
	public void execute() throws Exception {
	
		Context context = this.getContext();
		
		Context cxtSuper = context.getParent();
//		setValueForContext(cxtSuper, "Se");
//		setValueForContext(context, "Op");
		System.out.println("*************************************************");
		System.out.println(context.getKeyedCollection().toString());
		System.out.println("*************************************************");
		System.out.println(context.getParent().getKeyedCollection().toString());
		System.out.println("*************************************************");
		System.out.println("start execute");
		fireExitEvent("opEvt");
		System.out.println("end execute");
	}
	
	public void setValueForContext(Context context, String identification) throws Exception {
		
		context.setValueAt("stringData" + identification, dv.getStringValue());
		context.setValueAt("dateData" + identification, dv.getDateValue());
		context.setValueAt("booleanData" + identification, dv.getBooleanValue());
//		context.setValueAt("byteArrayData" + identification, dv.getByteArrayValue() );
//		context.setValueAt("durationData" + identification, );
		context.setValueAt("byteData" + identification, dv.getByteValue());
		context.setValueAt("shortData" + identification, dv.getShortValue());
		context.setValueAt("integerData" + identification, dv.getIntValue());
		context.setValueAt("longData" + identification, dv.getLongValue());
		context.setValueAt("FloatData" + identification, dv.getFloatValue());
		context.setValueAt("doubleData" + identification, dv.getDoubleValue());
		
//		context.setValueAt("numberData" + identification, dv.getNumberValue());
		context.setValueAt("currencyData" + identification, dv.getCurrencyValue());
		context.setValueAt("XMLGregorianCalendarData" + identification, DataValue.convertToXMLGregorianCalendar());
		context.setValueAt("bigIntegerData" + identification, dv.getBigIngeterValu());
		new BigDecimal("1048576.8192");
		context.setValueAt("bigDecimalData" + identification, dv.getBigDecimal());
		
		
	}

}
