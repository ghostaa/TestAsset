<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from ajaxChnl1.xui by Administrator, on Tue Jan 29 10:56:42 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/ajaxChnlEnhance/ajaxChnl1.js"> </script>
<bttdojo:form id="ajaxChnl1_Form01" operationId="ajaxEnhanceOp1" errorPage="ajaxChnlEnhance/ajaxChnl1.jsp">
  <table>
    <tr>
      <td colspan="2" align="left" valign="middle">
        <bttdojo:label id="ajaxChnl1_Label01" text="Ajax channel enhance test case: AJAXCHNL0(op)" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <bttdojo:group id="ajaxChnl1_Group01" text="Invoke operation in common pages" width="448px" height="290px" textWrap="false">
          <table style="width:448px;height:290px;">
            <tr>
              <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="sessionTitle">                <bttdojo:label id="ajaxChnl1_Label02" text="Current session id:" textWrap="false"/>
</div>              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="sessionInfo">                <bttdojo:label id="ajaxChnl1_Label06" dataName="ajaxChnlEnhanceData.seid" textWrap="false"/>
</div>              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="sessionTitle">                <bttdojo:label id="ajaxChnl1_Label05" text="Current session\'s expire time(ms):" textWrap="false"/>
</div>              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="sessionInfo">                <bttdojo:label id="ajaxChnl1_Label04" dataName="ajaxChnlEnhanceData.setime" textWrap="false"/>
</div>              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="sessionTitle">                <bttdojo:label id="ajaxChnl1_Label03" text="Direct sub context\'s names in my last action:" textWrap="false"/>
</div>              </td>
            </tr>
            <tr>
              <td colspan="2" align="left" valign="middle">
                <bttdojo:table id="ajaxChnl1_Table01" dataName="tableSubmitData" dataNameForList="ajaxChnlEnhanceData.subCtxtNameList" textWrap="false" isPageable="false">
                  <bttdojo:column align="left" dataName="index" width="40" text="Index"/>
                  <bttdojo:column align="left" dataName="ctxtName" width="280" text="Context Name"/>
                </bttdojo:table>
              </td>
            </tr>
            <tr>
              <td colspan="2" align="right" valign="middle">
                <bttdojo:button id="ajaxChnl1_Button02" type="button" text="1st: Call Ajax Operation" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="ajaxChnl1_Button01" type="submit" text="2nd: Check Effects" operationId="ajaxEnhanceOpInvokedBeforeOp" textWrap="false"/>
      </td>
      <td align="right" valign="middle">
        <bttdojo:button id="ajaxChnl1_Button03" type="submit" text="3rd: Next Test" textWrap="false"/>
      </td>
    </tr>
  </table>
</bttdojo:form>

</body>
</html>