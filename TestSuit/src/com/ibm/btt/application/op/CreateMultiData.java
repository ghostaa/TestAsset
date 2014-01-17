package com.ibm.btt.application.op;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/02/04 17:18:15
 */
public class CreateMultiData extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  
	  	Context context= getContext();
	  	for (int i = 0; i < 10; i++) {
	  		if (i==2) {
				//select field
	  			context.setValueAt("TestMultiSelectList."+i+".FieldForLabel","Selected is true");
	  			context.setValueAt("TestMultiSelectList."+i+".FieldForSelect","true");
			}else if(i==4){
				//disable filed
				context.setValueAt("TestMultiSelectList."+i+".FieldForLabel","disabled is true");
				context.setValueAt("TestMultiSelectList."+i+".FieldForDisable","true");
				
			}else{
				context.setValueAt("TestMultiSelectList."+i+".FieldForLabel","sample-"+i);
			}
	  		context.setValueAt("TestMultiSelectList."+i+".FieldForValue","value-"+i);
		}
	  	fireExitEvent("opEvt");
  }
}
