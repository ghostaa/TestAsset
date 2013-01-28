<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from comboboxInFlowOld.xui by Administrator, on Mon Jan 28 14:33:42 CST 2013 -->
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



@import "css/main.css";

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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/comboboxInFlowOld.js"> </script>
  <table id="comboboxInFlowOld_null">
    <tr>
      <td>
        <bttdojo:form id="comboboxInFlowOld_form1" operationId="comboboxOp" errorPage="comboboxInFlowOld.jsp" style="width:348px;height:135px;">
          <table style="width:348px;height:135px;">
            <tr>
              <td>
                <bttdojo:group id="comboboxInFlowOld_group1" text="Combo group 1-set combo value by ECA" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label01" text="Combo:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="comboboxInFlowOld_Combo01" dataName="selectData01" dataNameForList="selectDataList" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="comboboxInFlowOld_Button01" type="submit" text="Submit" operationId="comboboxOp" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label02" text="Combo\' value:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label03" dataName="combobox" width="125px" height="21px" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3" align="left" valign="middle">
                        <bttdojo:button id="comboboxInFlowOld_Button04" type="button" text="ECA change Combo to other" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="comboboxInFlowOld_form2" operationId="comboboxOp" errorPage="comboboxInFlowOld.jsp" style="width:348px;height:124px;">
          <table style="width:348px;height:124px;">
            <tr>
              <td>
                <bttdojo:group id="comboboxInFlowOld_group2" text="Combo group 2-verify the submitted value" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label04" text="Combo:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="comboboxInFlowOld_Combo02" dataName="combobox2" dataNameForList="combokcoll" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="comboboxInFlowOld_Button02" type="submit" text="Submit" operationId="comboboxOp" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label05" text="Combo\' value:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label06" dataName="combobox2" width="125px" height="21px" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3">
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="comboboxInFlowOld_form3" operationId="comboboxOp" errorPage="comboboxInFlowOld.jsp" style="width:476px;height:271px;">
          <table style="width:476px;height:271px;">
            <tr>
              <td>
                <bttdojo:group id="comboboxInFlowOld_group3" text="Combo group 3-Load data from server" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label07" text="Combo:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="comboboxInFlowOld_Combo03" dataName="combobox3" dataNameForList="comboboxOption" accesskey="S" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="comboboxInFlowOld_Button03" type="submit" text="Submit" operationId="comboboxOp" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label08" text="Combo\' value:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label09" dataName="combobox3" width="125px" height="21px" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3">
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
            <tr>
              <td>
                <bttdojo:group id="comboboxInFlowOld_Group01" text="Binding to kColl and iColl" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label10" text="kColl:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="comboboxInFlowOld_Combo04" dataName="comboKCollValue" dataNameForList="comboKCollData" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label12" dataName="comboKCollValue" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label11" text="iColl:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="comboboxInFlowOld_Combo05" dataName="comboICollValue" dataNameForList="comboICollData" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label13" dataName="comboICollValue" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="comboboxInFlowOld_Button05" type="button" text="Submit" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
      <td rowspan="5">
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="comboboxInFlowOld_Group02" text="Combo Event Test(Click, focus, key up)" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:combo id="comboboxInFlowOld_eventCombo" dataName="comboKCollValue" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="comboboxInFlowOld_Label15" text="Event:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:label id="comboboxInFlowOld_eventLabel" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="comboboxInFlowOld_Group04" text="Combo properties test" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_setReadOnlyTrue" type="button" text="readonly=true" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_setReadOnlyFalse" type="button" text="readonly=false" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_setDisableTrue" type="button" text="disabled=true" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_setDisableFalse" type="button" text="disabled=false" textWrap="false"/>
              </td>
              <td colspan="2">
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_setVisibilityVisible" type="button" text="visibility=visible" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_setVisibilityHidden" type="button" text="visibility=hidden" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_setVisibleGone" type="button" text="visibility=gone" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_btnSetFocus" type="button" text="set focus" textWrap="false"/>
              </td>
              <td colspan="2">
              </td>
            </tr>
            <tr>
              <td colspan="6" align="left" valign="middle">
                <bttdojo:combo id="comboboxInFlowOld_comboTestProperties" dataName="comboKCollValue" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_btnIsFocusable" type="button" text="isFocusable?" textWrap="false"/>
              </td>
              <td colspan="4" align="left" valign="middle">
                <bttdojo:label id="comboboxInFlowOld_lblIsFocusable" text="display true if isFocusable, otherwise unchanged" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_setValueAt" type="button" text="set value=" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="comboboxInFlowOld_Text01" dataName="comboKCollValue" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td colspan="6" rowspan="2">
              </td>
            </tr>
            <tr>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="comboboxInFlowOld_Group07" text="API: showErrorMessage() - show messages tips(support nls)" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="comboboxInFlowOld_Label14" text="Sample Widget:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="comboboxInFlowOld_Combo06" dataName="combobox" hint="Only for testing api, no need to care the value of this widget!" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="center" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_btnShowErrMsg1" type="button" text="ShowNonNlsMsg" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_btnShowErrMsg4" type="button" text="ShowNonNlsParamedMsg" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_btnShowErrMsg5" type="button" text="ShowConstantMsgWithParams" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="center" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_btnShowErrMsg2" type="button" text="ShowNlsMsg" textWrap="false"/>
              </td>
              <td align="center" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_btnShowErrMsg3" type="button" text="ShowParamedNlsMsg" textWrap="false"/>
              </td>
              <td align="center" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_btnShowErrMsg6" type="button" text="ShowExtraParamedNlsMsg" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="comboboxInFlowOld_Group06" text="Test submitted value of combo when disabled=true and readonly" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="comboboxInFlowOld_Form01" operationId="comboboxOp" errorPage="comboboxInFlowOld.jsp" style="width:439px;height:108px;">
                  <table style="width:439px;height:108px;">
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="comboboxInFlowOld_setReadonly" type="button" text="toggleReadonly" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="comboboxInFlowOld_readonlyMe" dataName="submitReadonly" dataNameForList="combodata" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label19" dataName="submitReadonly" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="comboboxInFlowOld_setDisabled" type="button" text="toggleDisabled" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="comboboxInFlowOld_disableMe" dataName="submitDisabled" dataNameForList="combokcoll" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_Label20" dataName="submitDisabled" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="comboboxInFlowOld_Button06" type="submit" text="submit" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="comboboxInFlowOld_Form02" operationId="comboboxOp" errorPage="comboboxInFlowOld.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="comboboxInFlowOld_Group05" text="Static file loading test" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_lbl0001" text="Normal data" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="comboboxInFlowOld_cbNormalData" dataName="selectedValue" storeURL="listfiles/combo/normal.js" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="comboboxInFlowOld_btnSubmitStaticFile" type="button" text="submit" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_submitValue" dataName="submitValue" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_lbl0002" text="Both defined" hint="dataNameForList and storeURL both defined" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="comboboxInFlowOld_cbBothDefined" dataName="tempField" storeURL="normal" dataNameForList="combokcoll" textWrap="false"/>
                      </td>
                      <td colspan="2" align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_lbl0010" text="dataNameForList prior to storeURL" width="210px" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_lbl0004" text="ECA loading data" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="comboboxInFlowOld_cbECALoadingData" dataName="tempField" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="comboboxInFlowOld_btnLoadingData" type="button" text="load" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_lbl0005" text="i18n support" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="comboboxInFlowOld_cbI18N" dataName="tempField" storeURL="listfiles/combo/i18n.js" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_lbl0006" text="Mass data" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="comboboxInFlowOld_cbMassData" dataName="tempField" storeURL="listfiles/combo/massdata.js" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_lbl0007" text="Malformed data" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="comboboxInFlowOld_cbMalFormedData" dataName="tempField" storeURL="listfiles/combo/malformed.js" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="comboboxInFlowOld_lbl0008" text="File not found" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="comboboxInFlowOld_cbFileNotFound" dataName="tempField" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="comboboxInFlowOld_btnLoadingData2" type="button" text="load" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="comboboxInFlowOld_btnLoadingData3" type="button" text="load" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="comboboxInFlowOld_Group09" text="dataName and values" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="comboboxInFlowOld_Label18" text="dataName value in file" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="comboboxInFlowOld_Combo10" dataName="fileValue" storeURL="listfiles/combo/normal.js" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="comboboxInFlowOld_Label22" text="dataName value not in file" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="comboboxInFlowOld_Combo12" dataName="NotFileValue" storeURL="listfiles/combo/normal.js" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_Button08" type="button" text="submit" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="comboboxInFlowOld_Label23" text="dataName in list" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="comboboxInFlowOld_Combo13" dataName="listValue" dataNameForList="combokcoll" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="comboboxInFlowOld_Label25" text="dataName not in list" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="comboboxInFlowOld_Combo14" dataName="notListValue" dataNameForList="combokcoll" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="comboboxInFlowOld_Group03" text="Static file loading error handling - display  error code and error message" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="comboboxInFlowOld_Label16" text="success" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="comboboxInFlowOld_Combo07" dataName="basicField2" storeURL="listfiles/combo/normal.js" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:message id="comboboxInFlowOld_Message03" dataName="dse_errorMessages" level="INFO" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="comboboxInFlowOld_Label17" text="404" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="comboboxInFlowOld_Combo08" dataName="basicField2" storeURL="listfiles/combo/none.js" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:message id="comboboxInFlowOld_Message01" dataName="dse_errorMessages" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="comboboxInFlowOld_Label21" text="server stop" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:combo id="comboboxInFlowOld_Combo09" dataName="basicField2" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_Button07" type="button" text="stop server and load" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:message id="comboboxInFlowOld_Message02" dataName="dse_errorMessages" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:label id="comboboxInFlowOld_Label24" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="comboboxInFlowOld_Group08" text="Hint test-change hint by ECA" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:combo id="comboboxInFlowOld_Combo11" dataName="tempField" dataNameForList="comboICollData" hint="This is original hint" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="comboboxInFlowOld_Button10" type="button" text="change hint" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
      <td>
      </td>
    </tr>
  </table>

</body>
</html>