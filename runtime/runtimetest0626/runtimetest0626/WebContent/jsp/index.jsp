<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from index.xui by Administrator, on Tue Jan 29 10:56:49 CST 2013 -->
<head>
<%@ taglib uri="/WEB-INF/bttdojo.tld" prefix="bttdojo"%>
<%@ page import="com.ibm.btt.cs.html.JSPUtil" %> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
@import "js/dojo/resources/dojo.css";
@import "js/dijit/themes/claro/claro.css";	
@import "js/dojox/grid/enhanced/resources/claro/EnhancedGrid.css";
@import "css/dijit/message.css";
@import "js/com/ibm/btt/dijit/templates/FileUpload.css";
@import "js/dijit/themes/claro/document.css";
@import "js/com/ibm/btt/dijit/templates/Grid.css";
@import "js/com/ibm/btt/dijit/templates/ScreenCover.css";
@import "js/com/ibm/btt/dijit/templates/Group.css";
@import "js/com/ibm/btt/dijit/templates/Label.css";
@import "js/com/ibm/btt/dijit/templates/message.css";
@import "css/dijit/main.css";
@import "css/dijit/dijit.css";
@import "css/dijit/FileUpload.css";
@import "css/dijit/Grid.css";
@import "css/dijit/Group.css";
@import "css/dijit/Label.css";
@import "css/dijit/ScreenCover.css";
@import "css/dijit/show.css";




.dojoxGrid table { margin: 0; }
.dj_gecko .dijitTextBoxReadOnly INPUT.dijitInputInner {
    -moz-user-input: auto;
}
.dj_gecko .dijitTextBoxReadOnlyFocused INPUT.dijitInputInner {
	-moz-user-input: none;
}
</style>
<script>
	var djConfig =  {
		baseUrl:"js/dojo/",
		<bttdojo:locale/>,
		isDebug: false, 
		parseOnLoad: true
	};
</script>

<script type="text/javascript" src="js/dojo/dojo_BTT.js" ></script>
<script type="text/javascript" src="js/com/ibm/btt/btt.js"></script>

<script type="text/javascript" >
dojo.addOnLoad(function(){
	dojo.style(document.body, "visibility", "");
});
</script>

<script type="text/javascript">
	
	if(!window.engine){
		<%if(utb.ajaxNavigationEnabled()){%>
			window.engine = new com.ibm.btt.event.NavigationEngine();
		<%}else{%>
			window.engine = new com.ibm.btt.event.Engine();
		<%}%>
		engine.setMonitor(new com.ibm.btt.event.BaseMonitor());
		engine.registerCond("js/condition/condition.js");
		engine.registerKeys("http://9.181.87.190:9082/runtimetest0626/js/attendGlobalKey.js");
		
		
	}
	<%if(utb.ajaxNavigationEnabled()){%>
		dojo.require("dojo.back");
		var state = {
		    back: function() { /* window.engine.onBack(); */},
		    forward: function() { /* window.engine.onForward(); */ }
		};
		dojo.back.setInitialState(state);
	<%}%>

</script>
</head>
<body class="claro" style="visibility:hidden">
  <table id="index_null">
    <tr>
      <td>
        <bttdojo:form id="index_form1" operationId="displayPageOp" errorPage="index.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="index_Label01" text="0803Sample:" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_link57" text="This Link use to quickly skip to other position,such as use the way #index_link27" target="_top" action="#index_Link27" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link01" text="Start Information Submission" visibility="hidden" flowId="infoProc" flowEvent="start" width="225px" height="21px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link02" text="Start Account Transfer" visibility="hidden" flowId="accountTransferProc" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link38" text="Loan Service" visibility="hidden" operationId="displayPageOp" extraParams="pageName=loanServiceIndex.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_link" text="Draw and Deposit Money" visibility="hidden" flowId="drawMoneyProc" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link405" text="Query By Condition" visibility="hidden" flowId="conditionMock" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_LinkT00217" text="T00217" visibility="hidden" flowId="TT00217" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_LinkT00428" text="W021By1102" visibility="hidden" flowId="sampleW021Flow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_link51" text="28855By1102" visibility="hidden" flowId="sample28855Flow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="index_Label02" text="Testcase:" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link35_copy" text="AccessKey And FiledReference" operationId="DisplayPageOp" extraParams="pageName=accessKey.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link35" text="TextBox" flowId="textBoxFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link04" text="Image" operationId="ImageOp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link36" text="Image_extend" flowId="imageextendFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link05" text="Combo" flowId="comboboxFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link06" text="Select" flowId="selectFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link07" text="RadioButton" flowId="radiobuttonFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link08" text="CheckBox" flowId="checkBoxFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_link55" text="TableTestingAssert" operationId="DisplayPageOp" extraParams="pageName=OptionTable.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link09" text="Table(combo no list)" visibility="hidden" flowId="tableTestFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link10" text="TableAbnormalIColl" flowId="tableAbnormalICollFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link11" text="TableAlignTest(select no list and combo no list, data and currency)" visibility="hidden" flowId="tableAlignTestFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link33" text="TableValidation(submit)" visibility="hidden" flowId="tableValidationFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_link50" text="TablePaginationRefactor(no mapping)" visibility="hidden" operationId="DisplayPageOp" extraParams="pageName=paginationRefactor/paginationRefactorIndex.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link30" text="TablePaginationSorting(only the first case is normal in Pagination 4 Scenarios)" visibility="hidden" flowId="pageSortProcFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link43" text="TablePageRetriever" visibility="hidden" operationId="DisplayPageOp" extraParams="pageName=PageRetriever.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link03" text="TablePaginationSortingSingleOp" visibility="gone" operationId="DisplayPageOp" extraParams="pageName=pageSort/paginationWithSingleOp.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link12" text="RichText" operationId="DisplayPageOp" extraParams="pageName=RichText.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link19" text="Group/Button/Label" operationId="DisplayPageOp" extraParams="pageName=group.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link13" text="Tree" operationId="DisplayPageOp" extraParams="pageName=TreeOption.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link14" text="Link" flowId="linkProcFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link15" text="FileUpload" flowId="fileUploadFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link39" text="TabPane" flowId="TabPaneFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link20" text="Message" flowId="msgManageDijitProcFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link21" text="Message2" flowId="MessageFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link22" text="Simple Transfer" visibility="hidden" flowId="simpleTransfer" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link16" text="CurrencySpanServerLocale" visibility="hidden" operationId="displayPageOp" extraParams="pageName=CurrencySpanServerLocale.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="index_Label03" text="Ajax" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link34" text="AjaxTest" operationId="DisplayPageOp" extraParams="pageName=AjaxTest.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link18" text="Ajax Form" visibility="hidden" operationId="hFormInitOp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link37" text="AjaxTimeout" operationId="DisplayPageOp" extraParams="pageName=ajaxTimeout.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link32" text="Validation Error Handling" visibility="hidden" operationId="displayPageOp" extraParams="pageName=valdErrHandle/valdErrHandleIndex.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link49" text="Ajax Channel Enhance" visibility="hidden" flowId="ajaxChnlEnhanceProcFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="index_Label04" text="ECA" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_link54" text="TextBoxECAByFlow" flowId="TextBoxECAFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link23" text="TextBox-ECA" operationId="DisplayPageOp" extraParams="pageName=eca/eca4.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link24" text="TextArea-ECA" operationId="DisplayPageOp" extraParams="pageName=eca/eca2.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link25" text="RichTextEditor-ECA" operationId="DisplayPageOp" extraParams="pageName=eca/eca3.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link26" text="TypedTextBox-ECA with Ajax" operationId="DisplayPageOp" extraParams="pageName=eca/eca5.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link40" text="Show Error Message" operationId="globeEcaOp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_link46" text="Form ECA" flowId="Form ECAFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_link53" text="Question ECA" flowId="QuestionFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="index_Label06" text="%nls.NlsSupportTestResourse/_0Contents" hint="%nls.NlsSupportTestResourse/_0Contents" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link27" text="%nls.NlsSupportTestResourse/_1Simple_NLS_Page" operationId="DisplayPageOp" extraParams="pageName=nls/SimpleWidgetNls.jsp" hint="%nls.NlsSupportTestResourse/_1Simple_NLS_Page" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link28" text="%nls.NlsSupportTestResourse/_1Simple_Table_NLS_Page" operationId="DisplayPageOp" extraParams="pageName=nls/SimpleWidgetNlsTable.jsp" hint="%nls.NlsSupportTestResourse/_1Simple_Table_NLS_Page" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link29" text="%nls.NlsSupportTestResourse/_1ECA_NLS_Page" operationId="DisplayPageOp" extraParams="pageName=nls/EcaWithNls.jsp" hint="%nls.NlsSupportTestResourse/_1ECA_NLS_Page" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link45" text="%nls.BTTResource/CLIENT_NLS_NEW_API" operationId="checkUserNlsOp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="index_Label05" text="Style" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link17" text="Change CSS" operationId="setStyleOp" extraParams="pageName=setStyle.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link41" text="Width and height" flowId="widthAndheightFlow" flowEvent="start" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="index_Label08" text="Others" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link42" text="AbnormalDataBinding" operationId="DisplayPageOp" extraParams="pageName=abnormalKcollSubmit.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link44" text="ShortCut" operationId="DisplayPageOp" extraParams="pageName=accessKey.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link47" text="MultiLine" operationId="DisplayPageOp" extraParams="pageName=multLine.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_Link48" text="Mapper" flowId="mapperFlow" flowEvent="start1" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="index_wetq" text="Keyboard support & ECA Enhancement" width="381px" textWrap="true"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_link58" text="Global function key " action="#" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_link52" text="001" operationId="DisplayPageOp" extraParams="pageName=001.jsp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="index_link56" text="X054 HiddenColumn" flowId="X054HiddenColumnsFlow" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:a id="index_link59" text="click this link href=top" target="_self" action="#top" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:a id="index_link31" text="1" flowId="TestTableViewsFlow" flowEvent="start" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="index_label" text="Keyboard support & ECA Enhancement" textWrap="false"/>
      </td>
    </tr>
  </table>

</body>
</html>