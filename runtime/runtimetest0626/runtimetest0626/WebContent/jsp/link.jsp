<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from link.xui by Administrator, on Tue Jan 29 10:56:50 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/link.js"> </script>
  <table id="link_null">
    <tr>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:form id="link_Form01" errorPage="link.jsp" style="width:684px;height:559px;">
          <table style="width:684px;height:559px;">
            <tr>
              <td>
                <bttdojo:group id="link_Group01" text="Link Group in Form - link with different actions" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_Link01" text="Link to trigger OP" operationId="DisplayPageOp" extraParams="pageName=image.jsp" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="link_Button01" type="button" text="Change Link to hidden" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_Link02" text="Link to trigger Proc" flowId="linkProcFlow" flowEvent="start" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="link_Button02" type="button" text="Change Link\'s Text" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_Link03" text="Link to trigger Event" flowEvent="Next1" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="link_Button03" type="button" text="Change Link\'s Disable" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_Link07" text="Link for no action" action="#" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="link_Button07" type="button" text="Button for no action" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_Link09" text="Link for opening an URL" action="http://www.baidu.com" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="link_Button09" type="submit" text="Button for trigger Event" flowEvent="Next3" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_Link10" text="Link for refreshing with an URL" action="#" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="link_Button10" type="button" text="Button for hidden anther button" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="customStyle">                        <bttdojo:label id="link_label03" text="Use btt file only way is target parent on ajax mode!!!" textWrap="false"/>
</div>                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_Link14" text="open _parent" operationId="ImageOp" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_link20" text="open_parent_popup " target="_top" flowEvent="viewEvt" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_Link15" text="open _blank" target="_blank" operationId="ImageOp" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_link22" text="open_blank_popup" target="_blank" flowEvent="viewEvt" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_Link16" text="open _top" target="_top" operationId="ImageOp" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_link23" text="open_top_popup" target="_top" flowEvent="viewEvt" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_Link17" text="open _self" target="_self" operationId="ImageOp" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_link24" text="open_self_popup" target="_self" flowEvent="viewEvt" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3" align="left" valign="middle">
                        <bttdojo:a id="link_link" text="open abs url:the proof is just a function point,but need to local absolute pate:" visibility="hidden" action="C:\\Documents and Settings\\Administrator\\Desktop\\runtime_cmc823\\runtimetest0626\\WebContent\\jsp\\image.jsp" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="3" align="left" valign="middle">
                        <bttdojo:label id="link_label" text="e.g.C:\\Documents and Settings\\Administrator\\Desktop\\runtime_cmc823\\runtimetest0626\\WebContent\\jsp\\image.jsp" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="link_button" type="button" text="click this button change target of life\'s link into _blank" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_link18" text="This link default target is _parent" operationId="ImageOp" textWrap="false"/>
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
                <bttdojo:group id="link_Group03" text="property and function - to test whether the property and function of link can work well" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_Link11" text="Link" action="http://www.w3school.com.cn/" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td colspan="6">
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" align="left" valign="middle">
                        <bttdojo:button id="link_fbtnIsFocusable" type="button" text="isFocusable" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="link_Label01" text="Label" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="link_Button11" type="button" text="Focus Link" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="link_fbtnHide" type="button" text="hide" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="link_fbtnVisable" type="button" text="visible" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="link_fbtnGone" type="button" text="gone" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="link_Link19" text="Link for hint test" action="#" hint="old hint for link" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="link_Button14" type="button" text="change hint" textWrap="false"/>
                      </td>
                      <td>
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
                  </table>
                </bttdojo:group>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="link_link13" text="Link extendWeb" action="http://www.baidu.com" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
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
        <bttdojo:group id="link_Group02" text="Link Group Not in Form" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="link_Link04" text="Link to trigger OP" operationId="DisplayPageOp" extraParams="pageName=image.jsp" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="link_Button04" type="button" text="Change Link to gone" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="link_Button05" type="button" text="Change Link\'s Text" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="link_Link05" text="Link to trigger Proc" flowEvent="Next3" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="link_Button06" type="reset" text="Change Link\'s Disable" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="link_Link06" text="Link to trigger Event" flowEvent="Next2" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="link_Button08" type="button" text="Button for no action" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="link_Link08" text="Link for no action" action="#" textWrap="false"/>
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
        <bttdojo:group id="link_Group04" text="Set Style" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="customStyle">                <bttdojo:a id="link_Link12" text="Hello Link" operationId="ImageOp" textWrap="false"/>
</div>              </td>
              <td align="left" valign="middle">
                <bttdojo:label id="link_Label02" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="link_Button12" type="button" text="change Style" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="link_Button13" type="button" text="default" textWrap="false"/>
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