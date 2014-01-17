package com.ibm.btt.application.op.svt.a8103;

import java.util.Date;

public class Account {
	private Date AccountOpeningDate;
	private int accountNO;
	private float balance;
	public Date getAccountOpeningDate() {
		return AccountOpeningDate;
	}
	public void setAccountOpeningDate(Date accountOpeningDate) {
		AccountOpeningDate = accountOpeningDate;
	}
	public int getAccountNO() {
		return accountNO;
	}
	public void setAccountNO(int accountNO) {
		this.accountNO = accountNO;
	}
	public float getBalance() {
		return balance;
	}
	public void setBalance(float balance) {
		this.balance = balance;
	}
	
}
