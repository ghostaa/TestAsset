package com.ibm.btt.application.op.svt.a8103;
import java.util.Iterator;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/08/28 16:44:15
 */
public class SVT_8103_accountDetails_Op extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
	private Account selected_account;
  public void execute() throws Exception {
	  
	  Context context = this.getContext();
	  
	  Integer accountNO=(Integer)context.getValueAt("accountNO");
	  Iterator<Account> it=User.getAccount().iterator();
	  while(it.hasNext()){
		  Account account=it.next();
		  if(account.getAccountNO()==accountNO){
			  this.selected_account=account;
			  break;
		  }
	  }
	  if(this.selected_account!=null){
		  context.setValueAt("AccountOpeningDate",selected_account.getAccountOpeningDate());
		  context.setValueAt("accountNO", selected_account.getAccountNO());
		  context.setValueAt("balance",selected_account.getBalance());
	  }
	  context.setValueAt("UserName","user");
	  System.out.println(accountNO);
	  this.fireExitEvent("opEvt");
  }
}
