package com.ibm.btt.application.op.B004;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.DataElement;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.Vector;
import com.ibm.json.java.JSONArray;
import com.ibm.json.java.JSONObject;

public class TypeListOp extends BTTServerOperation {
	@Override
	public void execute() throws Exception {
		try {
			Context context = getContext();
			Object l_type_list = context.getValueAt("typeList");
			if ( l_type_list instanceof Vector ) {
				Object l_item = context.getElementAt("typeList");
				if ( l_item instanceof IndexedCollection ) {
					loadJsonData((Vector)l_type_list, (IndexedCollection)l_item, "type_list.json");
				}
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		}
	}

	/*
	 * load data data from JSON
	 */
	private void loadJsonData(Vector a_list, IndexedCollection a_list_def, String as_source) throws Exception {
		JSONArray l_result = JSONArray.parse(getClass().getResourceAsStream(as_source)),
				  l_trans_list = JSONArray.parse(getClass().getResourceAsStream("trans_list.json"));
		JSONObject l_type_data = JSONObject.parse(getClass().getResourceAsStream("account_list.json"));
		JSONArray l_type_list = null;

		Object l_account;
		if ( null != l_type_data &&
				(l_account = l_type_data.get("account")) instanceof JSONArray ) {
			l_type_list = (JSONArray)l_account;
		}

		a_list.removeAllElements();

		for ( int i = 0; i < l_result.size(); i++ ) {
			String ls_name = l_result.get(i).toString();
			DataElement l_element = a_list_def.createElement(false);
			if ( l_element instanceof KeyedCollection ) {
				KeyedCollection l_rec = (KeyedCollection)l_element;
				l_rec.setValueAt("name", ls_name);
				l_rec.setValueAt("id", ls_name);
				
				//load children data
				//l_rec.removeElementAt("typeList");
				Vector l_children = (Vector)l_rec.getValueAt("children");
				l_children.removeAllElements();
				Object l_list_def = l_rec.getElementAt("children");
				if ( l_list_def instanceof IndexedCollection ) {
					loadAccounts(ls_name, l_children, (IndexedCollection)l_list_def, l_type_list, l_trans_list);
				}
				a_list.addElement(l_rec);
			}
		}
	}

	private void loadAccounts(String as_account_type, Vector a_list, IndexedCollection a_list_def, JSONArray a_type_list, JSONArray a_trans_list) throws Exception {
		if ( null != a_type_list ) {
			a_list.removeAllElements();
			for ( int i = 0; i < a_type_list.size(); i++ ) {
				Object l_item = a_type_list.get(i);
				if ( l_item instanceof JSONObject ) {
					JSONObject l_json_item = (JSONObject)l_item;
					if ( as_account_type.equals(l_json_item.get("type")) ) {
						DataElement l_element = a_list_def.createElement(false);
						if ( l_element instanceof KeyedCollection ) {
							KeyedCollection l_rec = (KeyedCollection)l_element;
							String ls_id = l_json_item.get("id").toString();
							l_rec.setValueAt("id", ls_id);
							l_rec.setValueAt("account_id", ls_id);
							
							l_rec.setValueAt("name", l_json_item.get("alias"));
							l_rec.setValueAt("type", l_json_item.get("type"));
							l_rec.setValueAt("currency", l_json_item.get("currency"));
							l_rec.setValueAt("balance", l_json_item.get("balance"));
							l_rec.setValueAt("available", l_json_item.get("available"));
							l_rec.setValueAt("branch", l_json_item.get("branch"));
							l_rec.setValueAt("status", l_json_item.get("status"));
							
							//load transactions
							Vector l_children = (Vector)l_rec.getValueAt("children");
							l_children.removeAllElements();
							Object l_list_def = l_rec.getElementAt("children");
							if ( l_list_def instanceof IndexedCollection ) {
								loadTrans(ls_id, l_children, (IndexedCollection)l_list_def, a_trans_list);
								
								if ( l_children.size() <= 0 ) {
									l_rec.removeElementAt("children");
								}
							}

							a_list.addElement(l_rec);
						}
					}
				}
			}
		}
	}

	private void loadTrans(String as_id, Vector a_list, IndexedCollection a_list_def, JSONArray a_tran_list) throws Exception {
		if ( null != a_tran_list ) {
			a_list.removeAllElements();
			for ( int i = 0; i < a_tran_list.size(); i++ ) {
				Object l_item = a_tran_list.get(i);
				if ( l_item instanceof JSONObject ) {
					JSONObject l_json_item = (JSONObject)l_item;
					if ( as_id.equals(l_json_item.get("id")) ) {
						DataElement l_element = a_list_def.createElement(false);
						if ( l_element instanceof KeyedCollection ) {
							KeyedCollection l_rec = (KeyedCollection)l_element;
							l_rec.setValueAt("id", l_json_item.get("id"));
							l_rec.setValueAt("account_id", l_json_item.get("type"));
							l_rec.setValueAt("name", l_json_item.get("date"));
							l_rec.setValueAt("currency", l_json_item.get("currency"));
							l_rec.setValueAt("balance", l_json_item.get("balance"));
							l_rec.setValueAt("available", l_json_item.get("available"));
							l_rec.setValueAt("status", l_json_item.get("status"));
							
							a_list.addElement(l_rec);
						}
					}
				}
			}
		}
	}
}
