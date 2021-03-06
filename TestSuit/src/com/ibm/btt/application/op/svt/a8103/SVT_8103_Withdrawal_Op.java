package com.ibm.btt.application.op.svt.a8103;
import java.util.Iterator;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/08/28 18:38:07
 */
public class SVT_8103_Withdrawal_Op extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  Context context = this.getContext();
	  Integer accountNO= (Integer)context.getValueAt("accountNO");
	  Float withdrawalAmount= (Float)context.getValueAt("WithdrawalAmount");
	  System.out.println(withdrawalAmount);
	  Iterator<Account> it=User.getAccount().iterator();
	  while(it.hasNext()){
		  Account account=it.next();
		  if(account.getAccountNO()==accountNO){
			  Float balance= account.getBalance();
			  if(withdrawalAmount>balance){
				  this.fireExitEvent("error");
				  break;
			  }else{
				  account.setBalance(balance-withdrawalAmount);
				  this.fireExitEvent("ok");
			  }
			  break;
		  }else{
			  this.fireExitEvent("error");
		  }
	  }
  }
}
