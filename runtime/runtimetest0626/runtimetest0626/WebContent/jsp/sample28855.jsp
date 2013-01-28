<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from sample28855.xui by Administrator, on Mon Jan 28 14:33:57 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/sample28855.js"> </script>
  <table id="sample28855_panel">
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="sample28855_label" text="%nls.bttsample/28855note" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="sample28855_group" text="A plus B equal to C" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:form id="sample28855_form" errorPage="sample28855.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="sample28855_label01" text="InputNumber1" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="sample28855_InputText01" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="sample28855_label02" text="InputNumber2" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="sample28855_InputText02" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="sample28855_label03" text="Result" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="sample28855_resultText" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sample28855_button" type="button" text="Add" textWrap="false"/>
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
        <bttdojo:group id="sample28855_group_copy" text="A plus B equal to C in hidden field then submit C" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sample28855_label04" text="InputNumber1" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="sample28855_InputText01_copy" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sample28855_label05" text="InputNumber2" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:textbox id="sample28855_InputText02_copy" textWrap="false"/>
              </td>
              <td>
                <bttdojo:form id="sample28855_formSubmitC" errorPage="sample28855.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sample28855_button_copy" type="button" text="Add" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sample28855_button01" type="submit" text="Submit in Flow" flowEvent="submit" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                  <bttdojo:hidden id="sample28855_HiddenField01" dataName="28855Data"/>
                </bttdojo:form>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="sample28855_label06" text="No dataName or dataNameForList Submitted with Ajax below" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="sample28855_form01" errorPage="sample28855.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="sample28855_group01" text="Text " textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="sample28855_text" dataName="temporaryData" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sample28855_button02" type="button" text="AjaxButton" textWrap="false"/>
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
        <bttdojo:form id="sample28855_form02" errorPage="sample28855.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="sample28855_group02" text="Combo" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:combo id="sample28855_combo" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sample28855_button03" type="button" text="AjaxButton" textWrap="false"/>
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
        <bttdojo:form id="sample28855_form03" errorPage="sample28855.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="sample28855_group03" text="Radio" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="sample28855_radio" text="Radio" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sample28855_button04" type="button" text="AjaxButton" textWrap="false"/>
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
        <bttdojo:form id="sample28855_form04" errorPage="sample28855.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="sample28855_group04" text="CheckBox" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="sample28855_checkBox" checkedValue="true" text="CheckBox" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sample28855_button05" type="button" text="AjaxButton" textWrap="false"/>
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
        <bttdojo:form id="sample28855_form05" errorPage="sample28855.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="sample28855_group05" text="SelectList" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:select id="sample28855_selectList" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sample28855_button06" type="button" text="AjaxButton" textWrap="false"/>
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
        <bttdojo:form id="sample28855_form06" errorPage="sample28855.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="sample28855_group06" text="RichText" textWrap="false">
                  <table>
                    <tr>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sample28855_button07" type="button" text="AjaxButton" operationId="Sample28855Op" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
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
    </tr>
    <tr>
      <td>
        <bttdojo:form id="sample28855_form07" errorPage="sample28855.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="sample28855_group07" text="TextArea" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:textArea id="sample28855_textArea" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sample28855_button08" type="button" text="AjaxButton" operationId="Sample28855Op" textWrap="false"/>
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
        <bttdojo:form id="sample28855_form08" errorPage="sample28855.jsp">
          <table>
            <tr>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="sample28855_form09" errorPage="sample28855.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="sample28855_group09" text="Image" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:image id="sample28855_image" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sample28855_button10" type="button" text="AjaxButton" textWrap="false"/>
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
        <bttdojo:form id="sample28855_form10" errorPage="sample28855.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="sample28855_group10" text="Message" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:message id="sample28855_message" dataName="dse_errorMessages" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sample28855_button11" type="button" text="AjaxButton" textWrap="false"/>
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
        <bttdojo:form id="sample28855_form11" errorPage="sample28855.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="sample28855_group11" text="Tree" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:tree id="sample28855_tree" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sample28855_button12" type="button" text="AjaxButton" textWrap="false"/>
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
      </td>
    </tr>
  </table>

</body>
</html>