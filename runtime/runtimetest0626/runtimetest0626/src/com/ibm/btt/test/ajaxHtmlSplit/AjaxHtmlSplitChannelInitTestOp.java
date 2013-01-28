/**
 * 
 */
package com.ibm.btt.test.ajaxHtmlSplit;

import static com.ibm.btt.base.Constants.REPLYPAGE;

import com.ibm.btt.base.BTTServerOperation;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.channel.ChannelInitializer;
import com.ibm.btt.cs.servlet.CSConstants;

/**
 * @author stlv
 * 
 */
public class AjaxHtmlSplitChannelInitTestOp extends BTTServerOperation {
//ajax channel definition	
//	<kColl id="ajax">
//		<field id="encoding" value="UTF-8" />
//		<field id="cookies" value="true" />
//		<field id="runInSession" value="true" />
//		<field id="requestHandler"
//			value="com.ibm.btt.cs.ajax.AjaxHtmlRequestHandler" />
//		<field id="presentationHandler"
//			value="com.ibm.btt.cs.ajax.AjaxHtmlPresentationHandler" />
//		<kColl id="fileHandlers">
//			<kColl id="sampleFileHandler">
//				<field id="implClass"
//					value="com.ibm.btt.sample.SampleFileHandler" />
//				<field id="timeout" value="20000" />
//				<field id="maxSize" value="62914560" />
//				<field id="cachePath"
//					value="c:\\temp\\fileupload\\cache" />
//				<field id="filepath"
//					value="c:\\temp\\fileupload\\upload" />
//				<field id="memCacheSize" value="4096" />
//			</kColl>
//		</kColl>
//	</kColl>	
	
	@Override
	public void execute() throws Exception {
		setValueAt(REPLYPAGE, "ajaxHtmlSplit/ChannelInitTest.jsp");
		setValueAt("replyMessage","All definitions can be correctly fetched from ajax channel settings!");
		KeyedCollection ajax = (KeyedCollection)ChannelInitializer.getSettings().getElementAt(CSConstants.AJAX);
		try {
			setValueAt("encoding", ajax.getValueAt("encoding"));
			setValueAt("cookies", ajax.getValueAt("cookies"));
			setValueAt("runInSession", ajax.getValueAt("runInSession"));
			setValueAt("requestHandler", ajax.getValueAt("requestHandler"));
			setValueAt("presentationHandler", ajax.getValueAt("presentationHandler"));
			setValueAt("fileHandlers.sampleFileHandler.implClass",
					ajax.getValueAt("fileHandlers.sampleFileHandler.implClass"));
			setValueAt("fileHandlers.sampleFileHandler.timeout",
					ajax.getValueAt("fileHandlers.sampleFileHandler.timeout"));
			setValueAt("fileHandlers.sampleFileHandler.maxSize",
					ajax.getValueAt("fileHandlers.sampleFileHandler.maxSize"));
			setValueAt("fileHandlers.sampleFileHandler.cachePath",
					ajax.getValueAt("fileHandlers.sampleFileHandler.cachePath"));
			setValueAt(
					"fileHandlers.sampleFileHandler.memCacheSize",
					ajax.getValueAt("fileHandlers.sampleFileHandler.memCacheSize"));
		} catch (Exception e) {
			setValueAt("replyMessage",
					"Exception encountered:" + e.getLocalizedMessage());
		}
		super.execute();
	}
}
