package com.ibm.btt.application.op;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.dojo.model.TreeModel;
/** 
 * Class Generated by BTT Tool
 * Created since: 2012/09/22 16:27:44
 */
public class CreateTreeData extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  TreeModel root = (TreeModel) getElementAt("root");
	  root.setLabel("root");
	  System.out.println(root.getValue());
	  TreeModel level1_1 = new TreeModel("level1-1", "002", "level1-1");
	  TreeModel level2_1 = new TreeModel("level2-1", "005", "level2-1");
	  TreeModel level3_1 = new TreeModel("level3-1", "008", "level3-1");
	  level1_1.addChild(level2_1);
	  level1_1.addChild(level3_1);
	  
	  TreeModel level1_2 = new TreeModel("level1-2", "003", "level1-2");
	  TreeModel level2_2 = new TreeModel("level2-2", "006", "level2-2");
	  TreeModel level3_2 = new TreeModel("level3-2", "009", "level3-2");
	  level1_2.addChild(level2_2);
	  level1_2.addChild(level3_2);
	  
	  TreeModel level1_3 = new TreeModel("level1-3", "004", "level1-3");
	  TreeModel level2_3 = new TreeModel("level2-3", "007", "level2-3");
	  level1_3.addChild(level2_3);
	  
	  root.addChild(level1_1);
	  root.addChild(level1_2);
	  root.addChild(level1_3);
	  

	  this.fireExitEvent("ok");
  }
}
