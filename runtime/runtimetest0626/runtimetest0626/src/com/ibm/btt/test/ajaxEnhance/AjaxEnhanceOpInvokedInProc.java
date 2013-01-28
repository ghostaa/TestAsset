package com.ibm.btt.test.ajaxEnhance;

import java.util.Vector;

import com.ibm.btt.automaton.html.HtmlProcessorInfo;
import com.ibm.btt.automaton.html.HtmlProcessorManager;
import com.ibm.btt.automaton.html.HtmlStateInfo;
import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.Context;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.base.Settings;
import com.ibm.btt.cs.html.HtmlConstants;
import com.ibm.btt.sample.util.AjaxChannelEnhanceUtil;

public class AjaxEnhanceOpInvokedInProc extends BTTServerOperation {

	@Override
	public void execute() throws Exception {
		String sessionId = getValueAt(HtmlConstants.SESSIONID).toString();
		Context ctxt = getContext();
		int level = 0;
		if (ctxt.getParent().getName().toLowerCase().indexOf("proc") > 0) {
			// parent is processor's context
			level = 2;
		} else {
			// parent is processor's state context
			level = 3;
		}

		AjaxChannelEnhanceUtil.updateAjaxChannelTestData();
		StringBuilder sb = new StringBuilder();
		if (level > 1) {
			String processorId = getValueAt(HtmlConstants.PROCESSORID)
					.toString();
			sb = new StringBuilder();
			String curStateName = String.valueOf(getValueAt("curStateName"));
			boolean sessionPersistence = false;
			try {
				sessionPersistence = Boolean.valueOf(Settings.getSettings()
						.getValueAt("initialization.sessionPersistence")
						.toString());
			} catch (Exception e) {
				e.printStackTrace();
				sessionPersistence = false;
			}

			HtmlProcessorInfo processor = null;
			if (sessionPersistence) {
				processor = HtmlProcessorManager.getUniqueHTMLInstance()
						.getPersistentInfo(sessionId, processorId);
			} else {
				processor = HtmlProcessorManager.getUniqueHTMLInstance()
						.getInfo(sessionId, processorId);
			}
			HtmlStateInfo curState = processor.getCurrentStateInfo();
			if (curState.getStateName().equals(curStateName)) {
				// current processor
				if (curState.isRunningFlag()) {
					// set processor context's values
					setValueAt("procId", processorId);
					setValueAt("procExpireTime", processor.getTimeStamp());
					// operation's context update
					sb.append("Current processor: ");
					sb.append(processorId);
					sb.append(", processor expire time: ");
					// sb.append(processor.getProcessorTimeout());
					sb.append(processor.getTimeStamp());
					sb.append(", current state: ");
					sb.append(curState.getStateName());
					setValueAt("CommonInvokedOpField2", sb.toString());

					// update processor context
					IndexedCollection procSubCtxtNameList = (IndexedCollection) getElementAt("procSubCtxtNameList");
					procSubCtxtNameList.removeAll();
					Vector<?> children = level == 2 ? getParent().getChildren()
							: getParent().getParent().getChildren();
					for (int counter = 0; counter < children.size(); counter++) {
						Context subCtxt = (Context) children.get(counter);
						KeyedCollection kcoll = (KeyedCollection) procSubCtxtNameList
								.createElement(true);
						kcoll.setValueAt("index", (counter + 1));
						kcoll.setValueAt("ctxtName", subCtxt.getName());
						procSubCtxtNameList.addElement(kcoll);
					}
					IndexedCollection stateSubCtxNametList = (IndexedCollection) getElementAt("stateSubCtxNametList");
					stateSubCtxNametList.removeAll();
					if (level == 3) {
						Vector<?> pageCtxtChildren = getParent().getChildren();
						for (int counter = 0; counter < pageCtxtChildren.size(); counter++) {
							Context subCtxt = (Context) pageCtxtChildren
									.get(counter);
							KeyedCollection kcoll = (KeyedCollection) stateSubCtxNametList
									.createElement(true);
							kcoll.setValueAt("index", (counter + 1));
							kcoll.setValueAt("ctxtName", subCtxt.getName());
							stateSubCtxNametList.addElement(kcoll);
						}
					}
				} else {
					System.err.println("Not Runnint now!");
				}
			}

			setValueAt("CommonInvokedOpField2", sb.toString());
		}
		super.execute();
		// System.out.println("Being invoked operation's keyed collection is:\n"
		// + getKeyedCollection());
	}
}
