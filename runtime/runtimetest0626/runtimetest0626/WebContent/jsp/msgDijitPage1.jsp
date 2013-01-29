<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from msgDijitPage1.xui by Administrator, on Tue Jan 29 10:56:51 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/msgDijitPage1.js"> </script>
  <table id="msgDijitPage1_null">
    <tr>
      <td>
        <bttdojo:group id="msgDijitPage1_Group01" text="Message source" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="msgDijitPage1_Form01" errorPage="msgDijitPage1.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label01" text="MS01: Message from server" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label02" text="-->" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_ms01" dataName="msKColl.nonNlsMsgFromServer" level="WARN" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label03" text="MS02: Validation message" width="186px" height="19px" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="msgDijitPage1_Combo01" dataName="msKColl.comboValue" dataNameForList="msKColl.comboOptions" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_ms02" dataName="BranchId" level="WARN" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label05" text="MS03: Message set by ECA" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label06" text="-->" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_ms03" dataName="dse_errorMessages" level="INFO" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button01" type="button" text="ERROR MSG" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button02" type="button" text="WARN MSG" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button03" type="button" text="INFO MSG" textWrap="false"/>
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
    </tr>
    <tr>
      <td>
        <bttdojo:group id="msgDijitPage1_Group02" text="Message display approach" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="msgDijitPage1_Form02" errorPage="msgDijitPage1.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label04" text="DA01: Display NLS message from server in a normal way" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label10" text="-->" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_da01" dataName="daKColl.nlsMsgFromServer" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label07" text="DA02: Display NLS validation message in normal way" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label11" text="-->" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_da02" dataName="dse_errorMessages" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label08" text="DA03: Display NLS message set by ECA in popup way" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label12" text="-->" width="24px" height="19px" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_da03" dataName="dse_errorMessages" level="WARN" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button04" type="button" text="DA02" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button05" type="button" text="DA03" hint="%nls.NlsSupportTestResourse/_0First_Page_Button" textWrap="false"/>
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
    </tr>
    <tr>
      <td>
        <bttdojo:group id="msgDijitPage1_Group03" text="Message Level & API" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="msgDijitPage1_Form03" errorPage="msgDijitPage1.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label09" text="ML01: Display message from server in WARN level" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label13" text="-->" width="24px" height="19px" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_ml01" dataName="daKColl.nlsMsgFromServer" level="WARN" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label14" text="ML02/3: Display validation message in any level" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="msgDijitPage1_Combo02" dataName="mlKColl.combo2Value" dataNameForList="mlKColl.combo2Options" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_ml02" dataName="dse_errorMessages" level="INFO" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label15" text="ML04: Display message set by ECA in INFO level" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button06" type="button" text="INFO" textWrap="false"/>
                      </td>
                      <td rowspan="3" align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_ml0456" dataName="dse_errorMessages" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label16" text="ML05: Display message set by ECA in WARN level" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button07" type="button" text="WARN" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label17" text="ML06: Display message set by ECA in ERROR level" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button08" type="button" text="ERROR" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label18" text="ML07: Popup message set by ECA in INFO level!" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button09" type="button" text="Popup Info" textWrap="false"/>
                      </td>
                      <td rowspan="3" align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_ml0789" dataName="dse_errorMessages" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label19" text="ML08: Popup message set by ECA in WARN level!" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button10" type="button" text="Popup Warn" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label20" text="ML09: Popup message set by ECA in ERROR level!" textWrap="false"/>
                      </td>
                      <td align="center" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button11" type="button" text="Popup Error" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="msgDijitPage1_Group04" text="Message Properties" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="msgDijitPage1_Form04" errorPage="msgDijitPage1.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label21" text="MP01: Server returned message." width="370px" height="19px" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td colspan="4" align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_mp01" dataName="mpKColl.nlsMsgFromServer" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td>
                      </td>
                      <td colspan="4">
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label23" text="MP02: Change the properties of message dijit!" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button17" type="button" text="Hide" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button18" type="button" text="Gone" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button19" type="button" text="Visible" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button20" type="button" text="Close" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4">
                      </td>
                      <td>
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
    </tr>
    <tr>
      <td>
        <bttdojo:group id="msgDijitPage1_Group05" text="Message NLS" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="msgDijitPage1_Form05" errorPage="msgDijitPage1.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label24" text="MN01: NLS for message from server!" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label27" text="-->" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_mn01" dataName="mnKColl.nlsMsgFromServer" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label25" text="MN02: NLS for validation message!" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label28" text="-->" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button21" type="button" text="SetContents" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_mn02" dataName="dse_errorMessages" level="INFO" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label26" text="MN03: NLS for message set by ECA!" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label29" text="-->" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_mn03" dataName="dse_errorMessages" level="WARN" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label22" text="MN04: NLS for message template set by ECA!" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="msgDijitPage1_Label30" text="-->" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:message id="msgDijitPage1_mn04" dataName="dse_errorMessages" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="4" align="center" valign="middle">
                        <bttdojo:button id="msgDijitPage1_Button22" type="submit" text="Next" flowEvent="ok" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:form>
              </td>
            </tr>
          </table>
          <bttdojo:hidden id="msgDijitPage1_HiddenField01"/>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
  </table>

</body>
</html>