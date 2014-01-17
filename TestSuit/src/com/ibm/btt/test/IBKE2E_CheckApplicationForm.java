package com.ibm.btt.test;


import java.text.SimpleDateFormat;
import java.util.Date;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.impl.Currency;

/**
 * Class Generated by BTT Tool Created since: 2013/02/26 11:17:26
 */
public class IBKE2E_CheckApplicationForm extends BTTServerOperation {
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 */
	public void execute() throws Exception {

		KeyedCollection kc = this.getKeyedCollection();

		System.out.println("***************Check Application Form**********");
		System.out.println(kc);
		
		
		Boolean applyContine = (Boolean) kc.getValueAt("CreditCard.ApplyContinue");
		
		if (Boolean.FALSE.equals(applyContine))
		{
			fireExitEvent("cancelCard");
		}
		else
		{
			String incorrectFields = "";
			Date birthDate = (Date) kc.getValueAt("CreditCard.DateBirth");
			//111-22-4444
			Integer ssn = (Integer) kc.getValueAt("CreditCard.SSN");
			Currency anIncome =  (Currency) kc.getValueAt("CreditCard.AnnualIncome");
			
			if (birthDate.before( new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("1950-01-01 00:00:00") ) || birthDate.after(new Date()))
			{
				incorrectFields = incorrectFields + "Birth Date should be between 1900-01-01 and Today\n";
			}
			
			if (ssn.toString().length() != 9)
			{
				incorrectFields = incorrectFields + "Social Security Number must be 9 digits\n";
			}
			
			if (anIncome.getValue().doubleValue() < 100)
			{
				incorrectFields = incorrectFields + "Annual Income must be greater than 100\n";
			}
			//String employerName = (String) kc.getValueAt("CreditCard.EmployerName");
			
			if ("".equals(incorrectFields))
			{
				fireExitEvent("selectCard");
				
			}
			else
			{
				kc.setValueAt("CreditCard.MissInfo", incorrectFields);
				fireExitEvent("missInfo");
			}
		}
		
	}

}
