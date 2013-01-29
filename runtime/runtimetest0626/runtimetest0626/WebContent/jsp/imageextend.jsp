<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from imageextend.xui by Administrator, on Tue Jan 29 10:56:49 CST 2013 -->
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
  <table id="imageextend_panel">
    <tr>
      <td align="left" valign="middle">
        <bttdojo:form id="imageextend_form" errorPage="imageextend.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label" text="Image Testing(HTTP/FTP/AP FOR LOCATION AND DATANAME ):" textWrap="false"/>
              </td>
              <td>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label01" text="Image path(AP) defined with location:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image" location="img/png1.png" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label04" text="Image path(AP) defined with dataname:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image01" dataName="imageLocationPath" textWrap="false"/>
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
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label05" text="Image path(HTTP) defined with location:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image05" location="http://localhost:9080/runtimetest0626/img/png3.png" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label06" text="Image path(HTTP) defined with dataname:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image04" dataName="imageHttpPath" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label07" text="Image path(FTP) defined with location:" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image06" location="ftp://bttuser:bttadmin@9.181.85.66/BTT_USER_FREE/lxq/imagetest/png1.png" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label08" text="The page will display all of the images exception for image path(AB)" textWrap="false"/>
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
                <bttdojo:label id="imageextend_label24" text="By Location" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label25" text="By DataName" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label26" text="Picture format is png" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image39" location="img/differentImage/Bomb1.PNG" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image40" dataName="png" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label02" text="Picture format is bmp" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image02" location="img/differentImage/Bomb3.bmp" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image22" dataName="bmp" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label03" text="Picture format is jpg" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image03" location="img/Bomb15.jpg" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image23" dataName="jpg" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label09" text="Picture format is tiff" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image07" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image24" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label11" text="Picture format is gif" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image08" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image25" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label10" text="Picture format is pcx" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image09" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image26" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label12" text="Picture format is tga" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image10" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image27" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label13" text="Picture format is exif" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image11" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image28" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label14" text="Picture format is fpx" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image12" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image29" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label15" text="Picture format is svg" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image13" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image30" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label16" text="Picture format is psd" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image14" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image31" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label17" text="Picture format is cdr" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image15" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image32" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label18" text="Picture format is pcd" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image16" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image33" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label19" text="Picture format is dxf" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image17" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image34" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label20" text="Picture format is ufo" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image18" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image35" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label21" text="Picture format is eps" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image19" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image36" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label22" text="Picture format is ai" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image20" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image37" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="imageextend_label23" text="Picture format is raw" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image21" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:image id="imageextend_image38" textWrap="false"/>
              </td>
            </tr>
          </table>
        </bttdojo:form>
      </td>
    </tr>
  </table>

</body>
</html>