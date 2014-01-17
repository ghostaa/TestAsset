package com.ibm.btt.application.op.svt.a8103;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.application.op.svt.a8103.User;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/08/28 14:42:07
 */
public class SVT_8103_account_Op extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  
	  Context context = this.getContext();
	  
	  context.setValueAt("account_List.0.AccountOpeningDate",User.getAccount().get(0).getAccountOpeningDate());
	  context.setValueAt("account_List.0.accountNO", User.getAccount().get(0).getAccountNO());
	  context.setValueAt("account_List.0.balance", User.getAccount().get(0).getBalance());
	  
	  context.setValueAt("account_List.1.AccountOpeningDate",User.getAccount().get(1).getAccountOpeningDate());
	  context.setValueAt("account_List.1.accountNO", User.getAccount().get(1).getAccountNO());
	  context.setValueAt("account_List.1.balance", User.getAccount().get(1).getBalance());
		
	  context.setValueAt("account_List.2.AccountOpeningDate",User.getAccount().get(2).getAccountOpeningDate());
	  context.setValueAt("account_List.2.accountNO", User.getAccount().get(2).getAccountNO());
	  context.setValueAt("account_List.2.balance", User.getAccount().get(2).getBalance());
	  this.fireExitEvent("opEvt");
  }
}