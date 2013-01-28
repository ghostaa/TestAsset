//
//package com.ibm.btt.sample.operation;
//
///**
// * @author Meilier
// * 
// */
//
//
//import com.ibm.btt.base.BTTServerOperation;
//import com.ibm.btt.base.Context;
//import com.ibm.btt.base.DSEInvalidArgumentException;
//import com.ibm.btt.base.DSEInvalidRequestException;
//import com.ibm.btt.base.DSEObjectNotFoundException;
//import com.ibm.btt.base.types.DSETypeException;
//import com.ibm.btt.cs.html.HtmlConstants;
//import com.ibm.btt.sample.util.AjaxChannelEnhanceUtil;
//
//@SuppressWarnings("serial")
//public class AbnormalKcollSubmitOp extends BTTServerOperation {
//
//	
//	public AbnormalKcollSubmitOp() {
//		super();
//	}
//	public AbnormalKcollSubmitOp(String anOperationName) throws java.io.IOException {
//		super(anOperationName);
//	}
//	public AbnormalKcollSubmitOp(String anOperationName, String aParentContext)
//			throws java.io.IOException, DSEObjectNotFoundException, DSEInvalidRequestException {
//		super(anOperationName, aParentContext);
//	}
//	public AbnormalKcollSubmitOp(String anOperationName, Context aParentContext)
//			throws java.io.IOException, DSEInvalidRequestException {
//		super(anOperationName, aParentContext);
//	}
//	public void execute() throws Exception {
//		
//		private void setBADataValues() throws DSEObjectNotFoundException,
//		DSEInvalidArgumentException, DSETypeException {
//			 
//		setValueAt(HtmlConstants.REPLYPAGE, "abnormalKcollSubmit.jsp");
//		setValueAt(abnormalKColl.dftCurrencyField,"1.01");
//		setValueAt(abnormalKColl.dftDateField, "2012-09-06");
//		setValueAt(abnormalKColl.dftNumberField, "1999");
//		setValueAt(abnormalKColl.dftStringField, "Hello");
//		setValueAt(abnormalKColl.userComments, "Ok");
//		}
//		super.execute();
//		System.out.println(getKeyedCollection());
//	
//	}
//}       