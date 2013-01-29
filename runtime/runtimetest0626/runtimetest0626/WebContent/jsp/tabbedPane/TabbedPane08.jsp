<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from TabbedPane08.xui by Administrator, on Tue Jan 29 10:57:03 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/tabbedPane/TabbedPane08.js"> </script>
  <table id="TabbedPane08_null">
    <tr>
      <td>
        <bttdojo:tabbedpane id="TabbedPane08_TabbedPane01" width="800px" height="300px" textWrap="false">
          <bttdojo:contentpane id="TabbedPane08_ContentPane01" title="Tab0">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:tabbedpane id="TabbedPane08_TabbedPane02" tabPosition="bottom" width="300px" height="240px" textWrap="false">
                    <bttdojo:contentpane id="TabbedPane08_ContentPane07" title="Tab0">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                    <bttdojo:contentpane id="TabbedPane08_ContentPane08" title="Tab1">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                    <bttdojo:contentpane id="TabbedPane08_ContentPane09" title="Tab2">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                  </bttdojo:tabbedpane>
                </td>
                <td>
                </td>
                <td align="left" valign="middle">
                  <bttdojo:label id="TabbedPane08_label04" textWrap="false"/>
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
              <tr>
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
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane08_ContentPane02" title="Tab1">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:tabbedpane id="TabbedPane08_TabbedPane03" tabPosition="left" width="300px" height="240px" textWrap="false">
                    <bttdojo:contentpane id="TabbedPane08_ContentPane10" title="Tab0">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                    <bttdojo:contentpane id="TabbedPane08_ContentPane11" title="Tab1">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                    <bttdojo:contentpane id="TabbedPane08_ContentPane12" title="Tab2">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                    <bttdojo:contentpane id="TabbedPane08_ContentPane13" title="Tab3">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                  </bttdojo:tabbedpane>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane08_ContentPane03" title="Tab2">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:tabbedpane id="TabbedPane08_TabbedPane04" tabPosition="right" width="300px" height="240px" textWrap="false">
                    <bttdojo:contentpane id="TabbedPane08_ContentPane14" title="Tab0">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                    <bttdojo:contentpane id="TabbedPane08_ContentPane15" title="Tab1">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                    <bttdojo:contentpane id="TabbedPane08_ContentPane16" title="Tab2">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                    <bttdojo:contentpane id="TabbedPane08_ContentPane17" title="Tab3">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                    <bttdojo:contentpane id="TabbedPane08_ContentPane18" title="Tab4">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                    <bttdojo:contentpane id="TabbedPane08_ContentPane19" title="Tab5">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                  </bttdojo:tabbedpane>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane08_ContentPane04" title="Tab3">
            <table style="table-layout:fixed">
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane08_ContentPane05" title="Tab4">
            <table style="table-layout:fixed">
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane08_ContentPane06" title="Tab5">
            <table style="table-layout:fixed">
            </table>
          </bttdojo:contentpane>
        </bttdojo:tabbedpane>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="label">        <bttdojo:label id="TabbedPane08_Label02" text="Message:" textWrap="false"/>
</div>      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
<div style="display:inline-block;width:auto;height:auto;" class="label">        <bttdojo:label id="TabbedPane08_Label01" text="Show Messge" textWrap="false"/>
</div>      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="TabbedPane08_Button01" type="button" text="to Tab1 use selectchildbyID" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="TabbedPane08_Button02" type="button" text="to Tab2 use selectchildbyIndex" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
<div style="display:inline-block;" class="label">        <bttdojo:button id="TabbedPane08_Button05" type="button" text="to Tab3 use selectchildbyID" textWrap="false"/>
</div>      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="TabbedPane08_Button06" type="button" text="to Tab0 use selectchildbyIndex" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="TabbedPane08_Group01" text="Properties" width="727px" textWrap="false">
          <table style="width:727px;">
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TabbedPane08_Button18" type="button" text="TabbedPane01.visibility=gone" textWrap="false"/>
              </td>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="TabbedPane08_Button08" type="button" text="TabbedPane01.visibility=visible" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="TabbedPane08_Button10" type="button" text="Tabbedpane01.hint" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="TabbedPane08_Button12" type="button" text="set contentPane01.title" textWrap="false"/>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TabbedPane08_Button16" type="button" text="ContentPane01.closable is true" textWrap="false"/>
              </td>
              <td>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="TabbedPane08_Button15" type="button" text="ContentPane01.closable is false" textWrap="false"/>
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
      <td>
        <bttdojo:group id="TabbedPane08_Group03" text="Condition" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="TabbedPane08_Button19" type="button" text="ContentPane01.closable" textWrap="false"/>
              </td>
              <td align="left" valign="middle">
                <bttdojo:button id="TabbedPane08_Button09" type="button" text="TabbedPane01_visibility" textWrap="false"/>
              </td>
              <td>
              </td>
              <td align="left" valign="middle">
<div style="display:inline-block;" class="label">                <bttdojo:button id="TabbedPane08_Button21" type="button" text="TabbedPane01_styleClass" textWrap="false"/>
</div>              </td>
              <td align="left" valign="middle">
<div style="display:inline-block;" class="customStyle">                <bttdojo:button id="TabbedPane08_Button07" type="button" text="TabbedPane01_styleClass" textWrap="false"/>
</div>              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="TabbedPane08_Button04" type="button" text="Close the Tab4 by Index" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="TabbedPane08_Button03" type="button" text="Close the Tab0 by Id" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:a id="TabbedPane08_link" text="Return" operationId="DisplayPageOp" extraParams="pageName=tabbedPane/TabbedPane10.jsp" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
  </table>

</body>
</html>