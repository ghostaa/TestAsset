package com.ibm.btt.sample.operation.nls;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Random;

import com.ibm.btt.base.Constants;
import com.ibm.btt.base.DSEInvalidArgumentException;
import com.ibm.btt.base.DSEInvalidRequestException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.types.DSETypeException;
import com.ibm.btt.base.types.impl.Currency;
import com.ibm.xtq.bcel.generic.NEW;

public class SimpleWidgetNlsOp extends CommonServerOp {
	private Random rand = new Random();

	public void execute() throws Exception {
		// System.out.println(getKeyedCollection());
		super.execute();
		setValueAt(Constants.REPLYPAGE, "nls/SimpleWidgetNls.jsp");
		setLabelValue();
		setImageValue();
		setTextValues();
		setTextAreaValues();
		setCheckBoxValues();
		setRadioButtonValues();
		setRTEValues();
		setTableValues();
	}

	/**
	 * set the key for a label to display NLS information
	 * 
	 * @throws DSEObjectNotFoundException
	 * @throws DSEInvalidArgumentException
	 */
	private void setLabelValue() throws DSEObjectNotFoundException,
			DSEInvalidArgumentException {
		setValueAt("LabelKColl.labelDataName",
				"%nls.NlsSupportTestResourse/_2Text_Value2");
	}

	/**
	 * set image location
	 * 
	 * @throws DSEObjectNotFoundException
	 * @throws DSEInvalidArgumentException
	 */
	private void setImageValue() throws DSEObjectNotFoundException,
			DSEInvalidArgumentException {
		setValueAt("ImageKColl.imgDataName", "img/dataName.gif");
	}

	/**
	 * set values for text box
	 * 
	 * @throws DSEObjectNotFoundException
	 * @throws DSEInvalidArgumentException
	 * @throws DSETypeException
	 */
	private void setTextValues() throws DSEObjectNotFoundException,
			DSEInvalidArgumentException, DSETypeException {
		setValueAt("TextKColl.txtPlainField", "Plain text value");
		setValueAt("TextKColl.txtCurrencyField", new Currency("USD",
				new BigDecimal("1024.32")));
		setValueAt("TextKColl.txtDateField", new Date());
		setValueAt("TextKColl.txtNumberField", new BigDecimal(11.11));
		setValueAt("TextKColl.txtStringField", "01234");
		setValueAt("TextKColl.txtStringPassword", "0123456");
		setValueAt("TextKColl.txtCurrencyDisabled", new Currency("USD",
				new BigDecimal("512.16")));
		setValueAt("TextKColl.txtDateReadOnly", new Date());
	}

	/**
	 * set values for text area
	 * 
	 * @throws DSEObjectNotFoundException
	 * @throws DSEInvalidArgumentException
	 */
	private void setTextAreaValues() throws DSEObjectNotFoundException,
			DSEInvalidArgumentException {
		setValueAt("TextAreaKColl.taPlainField1", "I am a plain text area!");
		setValueAt("TextAreaKColl.taPlainField2",
				"I am a text area, but I am disabled!");
		setValueAt("TextAreaKColl.taPlainField3",
				"I am a text area, but I am read only!");
	}

	/**
	 * set values for check box
	 * 
	 * @throws DSEObjectNotFoundException
	 * @throws DSEInvalidArgumentException
	 */
	private void setCheckBoxValues() throws DSEObjectNotFoundException,
			DSEInvalidArgumentException {
		setValueAt("CheckBoxKColl.cbPlainField1", rand.nextBoolean());
		setValueAt("CheckBoxKColl.cbPlainField2", rand.nextBoolean());
		setValueAt("CheckBoxKColl.cbPlainField3", rand.nextBoolean());
		setValueAt("CheckBoxKColl.cbPlainField4", rand.nextBoolean());
	}

	/**
	 * set values for radio button
	 * 
	 * @throws DSEObjectNotFoundException
	 * @throws DSEInvalidArgumentException
	 */
	private void setRadioButtonValues() throws DSEObjectNotFoundException,
			DSEInvalidArgumentException {
		int si = rand.nextInt(4);
		// System.out.println("#####################" + si);
		setValueAt("CheckBoxKColl.rbPlainField1", String.valueOf(si));
	}

	/**
	 * set values for rich text editors
	 * 
	 * @throws DSEObjectNotFoundException
	 * @throws DSEInvalidArgumentException
	 */
	private void setRTEValues() throws DSEObjectNotFoundException,
			DSEInvalidArgumentException {
		String str1, str2, str3, str4;
		str1 = "<b>Tip message is NOT a NLS string key!</b><br>";
		str2 = "<b>Tip message is a NLS key!</b><br>";
		str3 = "<b>Tip message is a NLS key, but I am disabled!</b><br>";
		str4 = "<b>Tip message is a NLS key, but I am readonly!</b><br>";
		setValueAt("RichTextEditorKColl.rtePlainField1",
				str1 + String.valueOf(rand.nextLong()));
		setValueAt("RichTextEditorKColl.rtePlainField2",
				str2 + String.valueOf(rand.nextLong()));
		setValueAt("RichTextEditorKColl.rtePlainField3",
				str3 + String.valueOf(rand.nextLong()));
		setValueAt("RichTextEditorKColl.rtePlainField4",
				str4 + String.valueOf(rand.nextLong()));
	}

	/**
	 * set values for all tables
	 * 
	 * @throws DSEObjectNotFoundException
	 * @throws DSEInvalidArgumentException
	 * @throws DSEInvalidRequestException
	 */
	private void setTableValues() throws DSEObjectNotFoundException,
			DSEInvalidArgumentException, DSEInvalidRequestException {
		setTable1Values();
		setTable2Values();
		setTable3Values();
		setTable4Values();
	}

	/**
	 * set values for table1
	 * 
	 * @throws DSEObjectNotFoundException
	 * @throws DSEInvalidArgumentException
	 * @throws DSEInvalidRequestException
	 */
	private void setTable1Values() throws DSEObjectNotFoundException,
			DSEInvalidArgumentException, DSEInvalidRequestException {
		IndexedCollection table1DataList = (IndexedCollection) getElementAt("TableDataKColl.Table1DataList");
		for (int i = 0; i < 13; i++) {
			KeyedCollection kcoll = (KeyedCollection) table1DataList
					.createElement(false);
			kcoll.setName("Table1");
			kcoll.setValueAt("tbInnerField1",
					String.valueOf(rand.nextInt(19999)));
			kcoll.setValueAt("tbInnerField2",
					String.valueOf(rand.nextInt(19999)));
			kcoll.setValueAt("tbInnerField3",
					String.valueOf(rand.nextInt(19999)));
			table1DataList.addElement(kcoll);
		}
	}

	/**
	 * set values for table2
	 * 
	 * @throws DSEObjectNotFoundException
	 * @throws DSEInvalidArgumentException
	 * @throws DSEInvalidRequestException
	 */
	private void setTable2Values() throws DSEObjectNotFoundException,
			DSEInvalidArgumentException, DSEInvalidRequestException {
		IndexedCollection table1DataList = (IndexedCollection) getElementAt("TableDataKColl.Table2DataList");
		for (int i = 0; i < 15; i++) {
			KeyedCollection kcoll = (KeyedCollection) table1DataList
					.createElement(false);
			kcoll.setName("Table2");
			kcoll.setValueAt("tbInnerField1",
					"TB2-" + String.valueOf(rand.nextInt(29999)));
			kcoll.setValueAt("tbInnerField2",
					"TB2-" + String.valueOf(rand.nextInt(29999)));
			kcoll.setValueAt("tbInnerField3",
					"TB2-" + String.valueOf(rand.nextInt(29999)));
			table1DataList.addElement(kcoll);
		}
	}

	/**
	 * set values for table3
	 * 
	 * @throws DSEObjectNotFoundException
	 * @throws DSEInvalidArgumentException
	 * @throws DSEInvalidRequestException
	 */
	private void setTable3Values() throws DSEObjectNotFoundException,
			DSEInvalidArgumentException, DSEInvalidRequestException {
		IndexedCollection table1DataList = (IndexedCollection) getElementAt("TableDataKColl.Table3DataList");
		for (int i = 0; i < 27; i++) {
			KeyedCollection kcoll = (KeyedCollection) table1DataList
					.createElement(false);
			kcoll.setName("Table3");
			kcoll.setValueAt("tbInnerField1",
					"TB3-" + String.valueOf(rand.nextInt(39999)));
			kcoll.setValueAt("tbInnerField2",
					"TB3-" + String.valueOf(rand.nextInt(39999)));
			kcoll.setValueAt("tbInnerField3",
					"TB3-" + String.valueOf(rand.nextInt(39999)));
			kcoll.setValueAt("tbInnerField4",
					"TB3-" + String.valueOf(rand.nextInt(39999)));
			kcoll.setValueAt("tbInnerField5",
					"TB3-" + String.valueOf(rand.nextInt(39999)));
			table1DataList.addElement(kcoll);
		}
	}

	/**
	 * set values for table4
	 * 
	 * @throws DSEObjectNotFoundException
	 * @throws DSEInvalidArgumentException
	 * @throws DSEInvalidRequestException
	 */
	private void setTable4Values() throws DSEObjectNotFoundException,
			DSEInvalidArgumentException, DSEInvalidRequestException {
		IndexedCollection table1DataList = (IndexedCollection) getElementAt("TableDataKColl.Table4DataList");
		for (int i = 0; i < 39; i++) {
			KeyedCollection kcoll = (KeyedCollection) table1DataList
					.createElement(false);
			kcoll.setName("Table4");
			kcoll.setValueAt("tbInnerField1",
					"TB4-" + String.valueOf(rand.nextInt(49999)));
			kcoll.setValueAt("tbInnerField2",
					"TB4-" + String.valueOf(rand.nextInt(49999)));
			kcoll.setValueAt("tbInnerField3",
					"TB4-" + String.valueOf(rand.nextInt(49999)));
			kcoll.setValueAt("tbInnerField4",
					"TB4-" + String.valueOf(rand.nextInt(49999)));
			table1DataList.addElement(kcoll);
		}
	}

}
