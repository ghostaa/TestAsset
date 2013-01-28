<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from acctPayAjax.xui by Administrator, on Mon Jan 28 14:33:40 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/ajaxChnlEnhance/acctPayAjax.js"> </script>
<bttdojo:form id="acctPayAjax_Form01" errorPage="ajaxChnlEnhance/acctPayAjax.jsp">
  <table>
    <tr>
      <td colspan="2" align="left" valign="top">
        <bttdojo:group id="acctPayAjax_Group01" text="Account Payment Area" width="663px" height="305px" textWrap="false">
          <table style="width:663px;height:305px;">
            <tr>
              <td colspan="3" align="right" valign="middle">
                <bttdojo:message id="acctPayAjax_msg" dataName="dse_errorMessages" visibility="gone" level="WARN" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="right" valign="middle">
                <bttdojo:label id="acctPayAjax_Label01" text="My Account:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="acctPayAjax_txtMyAcct" dataName="srcAcctNo" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="right" valign="middle">
                <bttdojo:label id="acctPayAjax_Label02" text="Remittee Account:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="acctPayAjax_txtRmtAcct" dataName="destAcctNo" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="right" valign="middle">
                <bttdojo:label id="acctPayAjax_Label03" text="Remittee Account Again:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="acctPayAjax_txtRmtAcctCfm" dataName="destAcctNoCfm" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="right" valign="middle">
                <bttdojo:label id="acctPayAjax_Label04" text="Pay Amount:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="acctPayAjax_txtPayAmount" dataName="payAmount" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="acctPayAjax_btnDefault" type="button" text="default" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="right" valign="middle">
                <bttdojo:label id="acctPayAjax_Label05" text="ATM Password:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="acctPayAjax_txtAtmPwd" dataName="atmPwd" password="true" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="right" valign="middle">
                <bttdojo:label id="acctPayAjax_Label07" text="Verify Code:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="acctPayAjax_txtVerifyCode" dataName="verifyCode" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="acctPayAjax_Image01" location="img/SampleVerifyCode.jpg" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="right" valign="middle">
                <bttdojo:label id="acctPayAjax_Label06" text="Any Comments:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textArea id="acctPayAjax_tareaComment" dataName="comments" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="acctPayAjax_btnPayMoney" type="button" text="Pay The Money" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td align="right" valign="middle">
        <bttdojo:label id="acctPayAjax_Label08" text="Payment Result:" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:textbox id="acctPayAjax_txtPayResult" dataName="respData.payResult" disabled="true" readOnly="true" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center" valign="middle">
        <bttdojo:label id="acctPayAjax_Label09" text="Payment history" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td colspan="2" align="left" valign="middle">
        <bttdojo:table id="acctPayAjax_payHistoryRecords" dataName="payRecord" dataNameForList="respData.payHistRecs" columnReordering="true" readOnly="true" selectionMode="single" textWrap="false" isPageable="false">
          <bttdojo:column align="center" dataName="index" width="60" text="Index"/>
          <bttdojo:column align="left" dataName="rmtAcct" width="160" text="RemitteeAccount"/>
          <bttdojo:column align="right" dataName="payAmount" width="120" text="Amount"/>
          <bttdojo:column align="left" dataName="payOccurTime" width="120" text="Occur Date"/>
          <bttdojo:column align="left" dataName="comments" width="180" text="Comment"/>
        </bttdojo:table>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>