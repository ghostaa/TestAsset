package com.ibm.btt.application.op;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/04/09 13:54:42
 */
public class G028_ForLaunchOperationOp extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  
	  KeyedCollection k = this.getContext().getKeyedCollection();
		IndexedCollection accounts = (IndexedCollection) k
				.getElementAt("accounts");
		KeyedCollection formData = (KeyedCollection) k.getElementAt("formData");
		KeyedCollection selectedAccount = (KeyedCollection) k.getElementAt("selectedAccount");
		IndexedCollection selectedAccounts = (IndexedCollection) k.getElementAt("selectedAccounts");
		System.out.println("accounts------------------------------" );
		System.out.println(accounts);
		System.out.println("formData------------------------------" );
		System.out.println(formData);
		System.out.println("selectedAccount------------------------------" );
		System.out.println(selectedAccount);
		System.out.println("selectedAccounts------------------------------" );
		System.out.println(selectedAccounts);
		
  }
}
