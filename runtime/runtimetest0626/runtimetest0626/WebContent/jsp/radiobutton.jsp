<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from radiobutton.xui by Administrator, on Mon Jan 28 14:33:56 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/radiobutton.js"> </script>
  <table id="radiobutton_null">
    <tr>
      <td align="left" valign="middle">
        <bttdojo:form id="radiobutton_form1" operationId="RadionButtonOp" errorPage="radiobutton.jsp" style="width:1345px;height:80px;">
          <table style="width:1345px;height:80px;">
            <tr>
              <td align="left" valign="middle">
                <bttdojo:group id="radiobutton_group1" text="RadioButton 1- check the selected radio value in Flow,From include Action:operation" width="696px" height="62px" textWrap="false">
                  <table style="width:696px;height:62px;">
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="radiobutton_Label01" text="RadioButton:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="radiobutton_Radio01" dataName="radiobutton" value="male" text="male" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="radiobutton_Radio02" dataName="radiobutton" value="female" text="female" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="radiobutton_Label03" text="value:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="radiobutton_Label04" dataName="radiobutton" width="185px" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="radiobutton_Button01" type="submit" text="Submit" flowEvent="submit" textWrap="false"/>
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
      <td align="left" valign="middle">
        <bttdojo:form id="radiobutton_form" errorPage="radiobutton.jsp" style="width:1468px;height:81px;">
          <table style="width:1468px;height:81px;">
            <tr>
              <td align="left" valign="middle">
                <bttdojo:group id="radiobutton_group2" text="RadioButton 2- check when value is different with text in Flow1234567890000000000987654321" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="radiobutton_Label05" text="RadioButton:" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="radiobutton_Radio03" dataName="agespan" value="Childhood" text="<10" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="radiobutton_Radio04" dataName="agespan" value="Teenage" text="10-20" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="radiobutton_Radio05" dataName="agespan" value="Younth" text="20-30" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="radiobutton_Radio06" dataName="agespan" value="Middle Age" text="30-40" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="radiobutton_Label06" text="value:" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="radiobutton_Button02" type="submit" text="Submit" flowEvent="submit" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="radiobutton_Label07" dataName="agespan" width="80px" height="21px" textWrap="false"/>
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
      <td align="left" valign="middle">
        <bttdojo:group id="radiobutton_Group03" text="Hint Test" width="1461px" height="40px" textWrap="false">
          <table style="width:1461px;height:40px;">
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="radiobutton_Radio09" dataName="animal" text="dog" hint="Original hint for radioButton" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="radiobutton_Button06" type="button" text="change hint" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:form id="radiobutton_form01" errorPage="radiobutton.jsp" style="width:1089px;height:42px;">
          <table style="width:1089px;height:42px;">
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="radiobutton_button05" type="submit" text="submit" flowEvent="submit" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:label id="radiobutton_label02" dataName="submitAnimal" width="40px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="radiobutton_radio" dataName="submitAnimal" value="Same?!" text="ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        <bttdojo:form id="radiobutton_form03" errorPage="radiobutton.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="radiobutton_radio08" text="ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ" width="1348px" height="15px" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:form id="radiobutton_form02" errorPage="radiobutton.jsp" style="width:277px;height:85px;">
          <table style="width:277px;height:85px;">
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="radiobutton_label09" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:label id="radiobutton_label10" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="radiobutton_radio07" text="Radio" width="82px" height="15px" textWrap="true"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="radiobutton_button" type="button" text="Button" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:select id="radiobutton_selectList" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="radiobutton_button03" type="button" text="First" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="radiobutton_button04" type="button" text="Second" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
        <bttdojo:form id="radiobutton_form04" flowEvent="submit" errorPage="radiobutton.jsp">
          <table>
            <tr>
              <td align="left" valign="top">
                <bttdojo:group id="radiobutton_group" text="Button is Submit,not Action.From exist Action is Change Flow Event" width="703px" height="79px" textWrap="false">
                  <table style="width:703px;height:79px;">
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="radiobutton_radio10" dataName="animal" value="Dog" text="Radio" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="radiobutton_radio11" dataName="animal" value="Cat" text="Radio" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="radiobutton_button07" type="submit" text="Submit" textWrap="false"/>
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
      <td align="left" valign="top">
        <bttdojo:form id="radiobutton_form05" operationId="RadionButtonOp" errorPage="radiobutton.jsp">
          <table>
            <tr>
              <td align="left" valign="top">
                <bttdojo:group id="radiobutton_group01" text="From exist Action is Operation:setValueAt(HtmlConstants.REPLYPAGE,TheOtherPage.jsp)" width="704px" height="65px" textWrap="false">
                  <table style="width:704px;height:65px;">
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="radiobutton_radio12" dataName="submitAnimal" text="Radio" textWrap="false"/>
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
      <td align="left" valign="middle">
        <bttdojo:a id="radiobutton_link" text="Link Action is Change Flow Event" flowEvent="submit" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:a id="radiobutton_link01" text="Link Action is Launch New Flow:The Flow is same self Folw" flowId="radiobuttonFlow" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:a id="radiobutton_link02" text="Link Action is Launch Operation:RadioButtonOp" operationId="RadionButtonOp" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:a id="radiobutton_link03" text="Link Action is No Action" action="#" textWrap="false"/>
      </td>
    </tr>
  </table>

</body>
</html>