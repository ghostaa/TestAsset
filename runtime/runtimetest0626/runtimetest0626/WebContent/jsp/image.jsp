<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from image.xui by Administrator, on Mon Jan 28 14:33:46 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/image.js"> </script>
  <table id="image_null">
    <tr>
      <td align="left" valign="middle">
<div style="display:inline-block;" class="label">        <bttdojo:form id="image_Form02" operationId="imageOp" errorPage="image.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="image_Label01" text="Image path defined with location:" width="214px" height="21px" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="image_Image01" location="img/cry.jpg" hint="This is image located by location" width="22px" height="23px" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="image_Label02" text="Image path defined with dataName:" width="199px" height="21px" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="image_imagelocationpath" dataName="imagelocationpath" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="submitButton">                <bttdojo:label id="image_Label03" text="Image path defined with both:" width="196px" height="21px" textWrap="false"/>
</div>              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="image_image02" dataName="imagelocationpath" location="img/cry.jpg" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="submitButton">                <bttdojo:label id="image_label" text="dateName is priority" textWrap="false"/>
</div>              </td>
              <td>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="image_Label04" text="Image on button:" width="135px" height="21px" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="image_Button03" type="submit" text="ForSubmit" operationId="ImageOp" icon="img/cry.jpg" width="98px" height="73px" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="image_button01" type="button" text="ForSubmit" icon="img/differentImage/Bomb1.PNG" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:image id="image_VisibleImage" location="img/cry.jpg" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="image_image04" dataName="EmptyDataName" hint="this image use dataName,but this dataName is empty" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:image id="image_image" location="img/040518flashlee01.jpg" width="281px" height="246px" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="image_visibleButton" type="button" text="ForVisible" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="image_disVisibleButton" type="button" text="hidden" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="image_displayGone" type="button" text="Gone" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="image_Label05" text="Image path defined with location with hint" textWrap="false"/>
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
<div style="display:inline-block;" class="coeusImg">                <bttdojo:button id="image_Button02" type="button" text="Change Location(onMouseDown or onMouseDown)" textWrap="false"/>
</div>              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="image_Image06" location="img/smile.jpg" hint="This is the hint for image" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="image_button04" type="button" text="Change Location again by onKeyPress" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="image_image05" dataName="ErrorDataNameNotValue" hint="This is ErrorDataName.this value is empty" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:label id="image_label07" text="<--Left image exist error dataName" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="image_Button05" type="button" text="Change Hint" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="image_Image08" location="123.jpg" hint="old hint for image" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:label id="image_label06" text="<--Left image exist error location." textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="image_button" type="button" text="Change Hint by NLS" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="image_image03" dataName="ImageField" hint="%nls.htmlsample/Exception_in_main_" textWrap="false"/>
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
                <bttdojo:a id="image_link" text="Go to Link Page" flowId="linkProcFlow" flowEvent="start" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:form>
</div>      </td>
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

</body>
</html>