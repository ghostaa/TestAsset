package com.ibm.btt.application.op;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/03/06 19:14:04
 */
public class ForContextMenuOp extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  
	  Context context = this.getContext();
	  System.out.println(context.getValueAt("SingleSelectData.linkName"));
	  System.out.println(context.getValueAt("SingleSelectData.ContentMenu_Link_NoAction"));
	  System.out.println(context.getValueAt("SingleSelectData.ContentMenu_Link_URLAndSubmit"));
	  System.out.println(context.getValueAt("SingleSelectData.ContentMenu_Link_CancelAndSave"));
	  System.out.println(context.getValueAt("SingleSelectData.ContentMenu_Button_NoAction"));
	  System.out.println(context.getValueAt("SingleSelectData.ContentMenu_Button_URLAndSubmit"));
	  System.out.println(context.getValueAt("SingleSelectData.ContentMenu_Button_CancelAndSave"));
	  System.out.println(context.getValueAt("DataOutOfTable1"));
	  System.out.println(context.getValueAt("DataOutOfTable2"));
	  System.out.println(context.getValueAt("DataOutOfTable3"));
	  System.out.println(context.getValueAt("MutipleSelectData.0.linkName"));
	  System.out.println(context.getValueAt("MutipleSelectData.0.ContentMenu_Link_NoAction"));
	  System.out.println(context.getValueAt("MutipleSelectData.0.ContentMenu_Link_URLAndSubmit"));
	  System.out.println(context.getValueAt("MutipleSelectData.0.ContentMenu_Link_CancelAndSave"));
	  System.out.println(context.getValueAt("MutipleSelectData.0.ContentMenu_Button_NoAction"));
	  System.out.println(context.getValueAt("MutipleSelectData.0.ContentMenu_Button_URLAndSubmit"));
	  System.out.println(context.getValueAt("MutipleSelectData.0.ContentMenu_Button_CancelAndSave"));
	  
  }
}
