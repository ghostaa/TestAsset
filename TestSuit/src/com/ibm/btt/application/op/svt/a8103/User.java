package com.ibm.btt.application.op.svt.a8103;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class User {
	private static String username ="user";
	private static String password ="123";
	private static List<Account> accountList=new ArrayList<Account>();
	 static{  
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Account account=new Account();
				account.setAccountOpeningDate(sdf.parse("2012-12-12"));
				account.setAccountNO(1676289900);
				account.setBalance(20000.55f);
				Account account1=new Account();
				account1.setAccountOpeningDate(sdf.parse("2013-02-08"));
				account1.setAccountNO(1676289902);
				account1.setBalance(890.00f);
				Account account2=new Account();
				account2.setAccountOpeningDate(sdf.parse("2013-05-29"));
				account2.setAccountNO(1676289800);
				account2.setBalance(438290.98f);
				
				accountList.add(account);
				accountList.add(account1);
				accountList.add(account2);
			} catch (ParseException e) {
				e.printStackTrace();
			}
	  }  
	public static List<Account> addAccount(Account account){
		accountList.add(account);
		return accountList;
	}
	public static List<Account> getAccount(){
		return accountList;
	} 
	public static String getUsername() {
		return username;
	}

	public static String getPassword() {
		return password;
	}

	
	
}
