<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from selectInFlow.xui by Administrator, on Tue Jan 29 10:57:01 CST 2013 -->
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



@import "css/dijit/main.css";

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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/selectInFlow.js"> </script>
  <table id="selectInFlow_panel">
    <tr>
      <td align="left" valign="middle">
        <bttdojo:tabbedpane id="selectInFlow_tabbedPane" width="1068px" height="1317px" textWrap="false">
          <bttdojo:contentpane id="selectInFlow_ContentPane01" title="submit the data in Flow">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:form id="selectInFlow_form" errorPage="selectInFlow.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="selectInFlow_group" text="Functional Scenario in Flow" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label01_copy" text="Select from dataName" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:select id="selectInFlow_selectList" dataName="selectData.selectName" storeURL="listFiles/select/normal.js" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                                </td>
                                <td colspan="2" align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label08" text="dataNameForList prior to storeURL" textWrap="false"/>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label" text="Select from dataName,no default" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:select id="selectInFlow_selectList01" dataName="selectData.selectName5" storeURL="listFiles/select/normal.js" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label42" text="dataNameForList prior to storeURL" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label01" text="Select from normal js" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:select id="selectInFlow_selectList02" dataName="selectData.selectName2" storeURL="listFiles/select/normal.js" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label02" text="Select from NLS js" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:select id="selectInFlow_wslst" dataName="selectData.selectName3" storeURL="listFiles/select/i18n.js" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label03" text="Select from abnormal JS" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:select id="selectInFlow_wslst_1" dataName="selectData.selectName4" storeURL="listFiles/select/gender.js" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="selectInFlow_button" type="submit" text="Submit" flowEvent="submit" textWrap="false"/>
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
              </tr>
              <tr>
                <td>
                  <bttdojo:form id="selectInFlow_form01" errorPage="selectInFlow.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="selectInFlow_group09" text="Static file loading test" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label43" text="ECA loading data" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:select id="selectInFlow_selectList36" dataName="selectData.selectName" accesskey="k" hint="kkkyousa" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="selectInFlow_button02" type="button" text="Load" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label50" text="display data" textWrap="false"/>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label44" text="ECA loading data" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:select id="selectInFlow_selectList37" dataName="selectData.selectName" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="selectInFlow_button03" type="button" text="Load" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="selectInFlow_button04" type="button" text="Reload" visibility="hidden" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label45" text="load no  existing data , then reload the other data" textWrap="false"/>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label46" text="Mass data" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:select id="selectInFlow_selectList38" dataName="selectData.selectName" storeURL="listFiles/select/massdata.js" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label49" text="display mass data" textWrap="false"/>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label47" text="Malformed" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:select id="selectInFlow_selectList39" dataName="selectData.selectName" storeURL="listFiles/select/malformed.js" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:combo id="selectInFlow_combo" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="selectInFlow_label48" text="no data display" textWrap="false"/>
                                </td>
                              </tr>
                            </table>
                          </bttdojo:group>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:form>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="selectInFlow_ContentPane02" title="propertyInView">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:group id="selectInFlow_group01" text="Disabled" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList03" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" disabled="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label04" text="True" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList04" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label05" text="False" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="selectInFlow_group02" text="ReadOnly" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList05" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" readOnly="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label06" text="True" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList06" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label07" text="False" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="selectInFlow_group03" text="Hint" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList07" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" hint="This is a simple hint" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="selectInFlow_button01" type="button" text="Change the hint" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="selectInFlow_group04" text="shortCut" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList08" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" accesskey="w" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label09" text="Alt+W or Shift+Alt+W" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="selectInFlow_group05" text="Visibility" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList09" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label12" text="visible" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label10" text="________________________" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList10" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" visibility="hidden" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label13" text="hidden" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label11" text="________________________" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList11" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" visibility="gone" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label14" text="gone" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="selectInFlow_group10" text="Set properties" textWrap="false">
                    <table>
                      <tr>
                        <td colspan="3" align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_propertiesList" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:button id="selectInFlow_btnToggleReadonly" type="button" text="toggle readonly" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="selectInFlow_btnToggleDisable" type="button" text="toggle disable" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="selectInFlow_btnSetFocus" type="button" text="set focus" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:button id="selectInFlow_btnVisible" type="button" text="visibility=visible" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="selectInFlow_btnHidden" type="button" text="visibility=hidden" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="selectInFlow_btnGone" type="button" text="visibility=gone" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="2" align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label51" text="Set the value for the propertiesList" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="selectInFlow_text" dataName="selectData.selectName" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="selectInFlow_button05" type="button" text="Set value" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label72" text="(the value from the selectList)" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="selectInFlow_group11" text="API: showErrorMessage() - display messages(support nls)" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label53" text="Sample Widget:" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList40" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
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
                          <bttdojo:button id="selectInFlow_button07" type="button" text="ShowNonNlsMsg" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="selectInFlow_button08" type="button" text="ShowNonNlsParamedMsg" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="selectInFlow_button09" type="button" text="ShowConstantMsgWithParams" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:button id="selectInFlow_button10" type="button" text="ShowNlsMsg" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="selectInFlow_button11" type="button" text="ShowParamedNlsMsg" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="selectInFlow_button12" type="button" text="ShowExtraParamedNlsMsg" textWrap="false"/>
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
              <tr>
                <td>
                  <bttdojo:group id="selectInFlow_group12" text="Static file loading error handlingon/AsyncOK,onAsyncError" textWrap="false">
                    <table>
                      <tr>
                        <td colspan="4" align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label54" text="Click the button and the error message will display error information" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList43" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:button id="selectInFlow_button13" type="button" text="stop server and then click" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:message id="selectInFlow_message02" dataName="dse_errorMessages" textWrap="false"/>
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
                  <bttdojo:group id="selectInFlow_group13" text="Appearance" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList44" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" width="205px" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label71" text="Set the width of selectList.Width is 205" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList24" dataName="selectData.selectName5" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" width="0px" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label27" text="Set the width of selectList.Width is 0" textWrap="false"/>
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
                </td>
              </tr>
              <tr>
                <td>
                </td>
              </tr>
              <tr>
                <td>
                </td>
              </tr>
              <tr>
                <td>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="selectInFlow_ContentPane03" title="selectListECA">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:group id="selectInFlow_group06" text="Event" textWrap="false">
                    <table>
                      <tr>
                        <td colspan="3" align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label29" text="%nls.bttsample/selectListMark01" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList12" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label15" text="onClick" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label52" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList13" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label16" text="onFocus" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label55" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList14" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label17" text="onBlur" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label56" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList15" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label18" text="onKeyDown" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label57" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList16" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label19" text="onKeyPress" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label58" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList17" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label20" text="onKeyUp" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label59" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList18" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label21" text="onMouseDown" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label60" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList19" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label22" text="onMouseUp" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label61" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList20" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label23" text="onMouseEnter" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label62" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList21" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label24" text="onMouseLeave" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label63" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList22" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label25" text="onMouseMove" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label64" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList23" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label26" text="onChange" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label65" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="selectInFlow_group07" text="Condition" textWrap="false">
                    <table>
                      <tr>
                        <td colspan="3" align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label35" text="%nls.bttsample/selectListMark03" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList26" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label31" text="isFocusable" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label68" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList27" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" disabled="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label32" text="disabled" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label69" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList28" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" readOnly="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label33" text="readOnly" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label70" text="Label" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="selectInFlow_group08" text="Action" textWrap="false">
                    <table>
                      <tr>
                        <td colspan="2" align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label34" text="%nls.bttsample/selectListMark02" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList29" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label30" text="styleClass" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList31" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label37" text="visibility(hidden)" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList32" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label38" text="disabled" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList33" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label39" text="readOnly" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList34" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label40" text="hint" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:select id="selectInFlow_selectList35" dataName="selectData.selectName" dataNameForList="selectDataList" labelField="labelselect" valueField="valueselect" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="selectInFlow_label41" text="showErrorMessage" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
        </bttdojo:tabbedpane>
      </td>
    </tr>
  </table>

</body>
</html>