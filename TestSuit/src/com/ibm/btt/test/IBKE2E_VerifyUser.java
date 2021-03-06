package com.ibm.btt.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Constants;
import com.ibm.btt.base.DSEInvalidArgumentException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.KeyedCollection;

/**
 * Class Generated by BTT Tool Created since: 2013/02/26 11:17:26
 */
public class IBKE2E_VerifyUser extends BTTServerOperation {
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 */
	public void execute() throws Exception {
		
		KeyedCollection kc = this.getKeyedCollection();

		String loginUser = (String) kc.getValueAt("Login.UserName");
		
		if ("user01".equals(loginUser)) {
			
			initializeContext(kc);
			
			fireExitEvent("loginSuccess");
		} else {
			kc.setValueAt("Login.VerifyResult",
					"Wrong user name or password");
			fireExitEvent("loginFailure");
		}
	}

	private void initializeContext(KeyedCollection kc)
			throws DSEInvalidArgumentException, DSEObjectNotFoundException, ParseException {
		// initialize the account details for this user
		kc.setValueAt("AccountList.0.AccountNumber", "111111111");
		kc.setValueAt("AccountList.0.AccountType", "Saving");
		kc.setValueAt("AccountList.0.AccountStatus", "Noramal");
		kc.setValueAt("AccountList.0.OpenDate", new SimpleDateFormat("yyyy-MM-dd").parse("2012-08-12"));
		kc.setValueAt("AccountList.0.AccountBalance", new java.math.BigDecimal(11111.1));
		kc.setValueAt("AccountList.0.Description",
				"This is my primary saving card.\n The annual interest reate is 5%. \n ......");
		kc.setValueAt("AccountList.0.Tooltip",	"Click to see the transaction details");
		kc.setValueAt("AccountList.0.Clickable",	Boolean.TRUE);
		
		
		kc.setValueAt("AccountList.1.AccountNumber", "222222222");
		kc.setValueAt("AccountList.1.AccountType", "Saving");
		kc.setValueAt("AccountList.1.AccountStatus", "Noramal");
		kc.setValueAt("AccountList.1.OpenDate", new SimpleDateFormat("yyyy-MM-dd").parse("2013-01-28"));
		kc.setValueAt("AccountList.1.AccountBalance", new java.math.BigDecimal(22222.2));
		kc.setValueAt("AccountList.1.Description",
				"This is my secondary saving card");
		kc.setValueAt("AccountList.1.Tooltip",	"Click to see the transaction details");
		kc.setValueAt("AccountList.1.Clickable",	Boolean.TRUE);

		kc.setValueAt("AccountList.2.AccountNumber", "333333333");
		kc.setValueAt("AccountList.2.AccountType", "Credit");
		kc.setValueAt("AccountList.2.AccountStatus", "Noramal");
		kc.setValueAt("AccountList.2.OpenDate", new SimpleDateFormat("yyyy-MM-dd").parse("2011-11-02"));
		kc.setValueAt("AccountList.2.AccountBalance", new java.math.BigDecimal(-33333.3));
		kc.setValueAt("AccountList.2.Description", "This is credit card");
		kc.setValueAt("AccountList.2.Tooltip",	"Click to see the transaction details");
		kc.setValueAt("AccountList.2.Clickable",	Boolean.TRUE);
		
		// initialize the account type list for select
		kc.setValueAt("CreditCard.MyAccountTypeList.0.Name", "Saving Accoumt");
		kc.setValueAt("CreditCard.MyAccountTypeList.0.Value", "SAccount");
		kc.setValueAt("CreditCard.MyAccountTypeList.0.Selected", "true");
		
		kc.setValueAt("CreditCard.MyAccountTypeList.1.Name", "Checking Accoumt");
		kc.setValueAt("CreditCard.MyAccountTypeList.1.Value", "CAccount");
		
		kc.setValueAt("CreditCard.MyAccountTypeList.2.Name", "Loan Accoumt");
		kc.setValueAt("CreditCard.MyAccountTypeList.2.Value", "LAccount");
		
		kc.setValueAt("CreditCard.State", "CA");
		
		//test combo in table
		kc.setValueAt("AccountDetails.UsageList.0.LabelField", "Debit");
		kc.setValueAt("AccountDetails.UsageList.1.LabelField", "Withdraw");
		
		// initialize the options
		kc.setValueAt("CreditCard.HaveAccountChoice", Boolean.FALSE);
		kc.setValueAt("CreditCard.ApplyContinue", Boolean.TRUE);
		
		// initialize selected card type
		kc.setValueAt("CreditCard.CardType", "Platinum");
		
		kc.setValueAt("Login.VerifyResult",	"");
	}
}
