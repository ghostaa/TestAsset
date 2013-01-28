<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from paginationWithSingleOp.xui by Administrator, on Mon Jan 28 14:33:52 CST 2013 -->
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
  <table id="paginationWithSingleOp_null">
    <tr>
      <td>
        <bttdojo:form id="paginationWithSingleOp_Form01" errorPage="pageSort/paginationWithSingleOp.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="paginationWithSingleOp_Label01" text="Case ID: SP08SINGLEOP" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="paginationWithSingleOp_Label02" text="Table pagination & sorting test by default data types" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="paginationWithSingleOp_Label03" text="Sort Columns:" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:table id="paginationWithSingleOp_Table01" dataNameForList="items" sortEnabled="true" columnReordering="true" readOnly="true" selectionRequired="true" textWrap="false" isPageable="false">
                  <bttdojo:column align="left" dataName="index" width="60" text="Index"/>
                  <bttdojo:column align="left" dataName="currencyField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column1"/>
                  <bttdojo:column align="left" dataName="dateField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column2"/>
                  <bttdojo:column align="left" dataName="numberField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column3"/>
                  <bttdojo:column align="left" dataName="stringField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column4"/>
                  <bttdojo:column align="left" dataName="plainField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column5"/>
                </bttdojo:table>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="paginationWithSingleOp_Button01" type="submit" text="submit" operationId="pageFormSelectSubmitOp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="paginationWithSingleOp_Button05" type="submit" text="submit the selected rows" operationId="multiSelectWithPaginationOp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="paginationWithSingleOp_Button02" type="reset" text="reset" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="paginationWithSingleOp_Form02" errorPage="pageSort/paginationWithSingleOp.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="paginationWithSingleOp_Label04" text="For Multi Selection" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:table id="paginationWithSingleOp_Table02_copy" dataNameForList="items" sortEnabled="true" columnReordering="true" readOnly="true" selectionRequired="true" textWrap="false" isPageable="false">
                  <bttdojo:column align="left" dataName="index" width="60" text="Index"/>
                  <bttdojo:column align="left" dataName="currencyField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column1"/>
                  <bttdojo:column align="left" dataName="dateField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column2"/>
                  <bttdojo:column align="left" dataName="numberField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column3"/>
                  <bttdojo:column align="left" dataName="stringField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column4"/>
                  <bttdojo:column align="left" dataName="plainField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column5"/>
                </bttdojo:table>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="paginationWithSingleOp_Button03" type="submit" text="submit" operationId="pageFormSelectSubmitOp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="paginationWithSingleOp_Button06" type="submit" text="submit the selected rows" operationId="multiSelectWithPaginationOp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="paginationWithSingleOp_Button04" type="reset" text="reset" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:table id="paginationWithSingleOp_Table02" dataName="item" dataNameForList="items" sortEnabled="true" columnReordering="true" readOnly="true" selectionMode="single" selectionRequired="true" textWrap="false" isPageable="false">
          <bttdojo:column align="left" dataName="index" width="60" text="Index"/>
          <bttdojo:column align="left" dataName="currencyField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column1"/>
          <bttdojo:column align="left" dataName="dateField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column2"/>
          <bttdojo:column align="left" dataName="numberField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column3"/>
          <bttdojo:column align="left" dataName="stringField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column4"/>
          <bttdojo:column align="left" dataName="plainField" width="122" text="%nls.NlsSupportTestResourse/_Table_Column5"/>
        </bttdojo:table>
      </td>
    </tr>
  </table>

</body>
</html>