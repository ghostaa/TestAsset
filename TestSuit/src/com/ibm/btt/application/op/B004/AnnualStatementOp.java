package com.ibm.btt.application.op.B004;
import java.util.Map;
import java.util.Random;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.DataElement;
import com.ibm.btt.base.DataField;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.Vector;
import com.ibm.json.java.JSONArray;
import com.ibm.json.java.JSONObject;
/** 
 * Class Generated by BTT Tool
 * Created since: 2013/10/30 13:24:30
 */
public class AnnualStatementOp extends BTTServerOperation {
  /** 
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 */
  public void execute() throws Exception {
	  Context context = getContext();

	  try {
		  JSONObject l_json = JSONObject.parse(getClass().getResourceAsStream("anualStatement.json"));
		  Object l_root = l_json.get("root");
		  if ( l_root instanceof JSONArray ) {
			  JSONArray l_result = (JSONArray)l_root;
		
				Object l_list = context.getElementAt("AnnualStatementList");
				Vector l_instance = (Vector)context.getValueAt("AnnualStatementList");
				if ( l_list instanceof IndexedCollection ) {
					l_instance.clear();
		
					IndexedCollection l_idx_list = (IndexedCollection)l_list;
					int li_start_idx = 0;
					int li_end_idx = l_result.size();
					
					Random l_random = new Random();
		
					for ( int i = li_start_idx; i < li_end_idx; i++ ) {
						DataElement l_element = l_idx_list.createElement(false);
						if ( l_element instanceof KeyedCollection ) {
							Object l_data = l_result.get(i);
							if ( l_data instanceof JSONObject ) {
								JSONObject l_json_item = (JSONObject)l_data;
		
								KeyedCollection l_item = (KeyedCollection)l_element;
								l_item.setValueAt("month", l_json_item.get("month"));
								
								l_item.setValueAt("profit", (100*i+100) + "");
								l_item.setValueAt("weight", ((i%2)==0)?(i+1):(i-1));
								l_item.setValueAt("size", l_random.nextFloat() * 200+100 + "");
								l_instance.addElement(l_item);
							}
						}
					}
				}
				
				
		  }
	  } catch (Exception ex) {
		  ex.printStackTrace();
		  throw ex;
	  }
	  this.fireExitEvent("opEvt");
  }
  
}
