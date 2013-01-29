<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from TabbedPane09.xui by Administrator, on Tue Jan 29 10:57:03 CST 2013 -->
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
<bttdojo:group id="TabbedPane09_Group01" textWrap="false">
  <table>
    <tr>
      <td>
        <bttdojo:tabbedpane id="TabbedPane09_TabbedPane01" tabPosition="bottom" textWrap="false">
          <bttdojo:contentpane id="TabbedPane09_ContentPane01" title="Tab0">
            <table style="table-layout:fixed">
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane09_ContentPane02" title="Tab1">
            <table style="table-layout:fixed">
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="TabbedPane09_ContentPane03" title="Tab2">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:tabbedpane id="TabbedPane09_TabbedPane02" tabPosition="right" textWrap="false">
                    <bttdojo:contentpane id="TabbedPane09_ContentPane04" title="Tab0">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                    <bttdojo:contentpane id="TabbedPane09_ContentPane05" title="Tab1">
                      <table style="table-layout:fixed">
                      </table>
                    </bttdojo:contentpane>
                    <bttdojo:contentpane id="TabbedPane09_ContentPane06" title="Tab2">
                      <table style="table-layout:fixed">
                        <tr>
                          <td>
                            <bttdojo:tabbedpane id="TabbedPane09_TabbedPane03" tabPosition="left" textWrap="false">
                              <bttdojo:contentpane id="TabbedPane09_ContentPane07" title="Tab0">
                                <table style="table-layout:fixed">
                                </table>
                              </bttdojo:contentpane>
                              <bttdojo:contentpane id="TabbedPane09_ContentPane08" title="Tab1">
                                <table style="table-layout:fixed">
                                </table>
                              </bttdojo:contentpane>
                              <bttdojo:contentpane id="TabbedPane09_ContentPane09" title="Tab2">
                                <table style="table-layout:fixed">
                                </table>
                              </bttdojo:contentpane>
                              <bttdojo:contentpane id="TabbedPane09_ContentPane10" title="Tab3">
                                <table style="table-layout:fixed">
                                </table>
                              </bttdojo:contentpane>
                              <bttdojo:contentpane id="TabbedPane09_ContentPane11" title="Tab4">
                                <table style="table-layout:fixed">
                                </table>
                              </bttdojo:contentpane>
                              <bttdojo:contentpane id="TabbedPane09_ContentPane12" title="Tab5">
                                <table style="table-layout:fixed">
                                </table>
                              </bttdojo:contentpane>
                            </bttdojo:tabbedpane>
                          </td>
                        </tr>
                      </table>
                    </bttdojo:contentpane>
                  </bttdojo:tabbedpane>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
        </bttdojo:tabbedpane>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:a id="TabbedPane09_link" text="Return" operationId="DisplayPageOp" extraParams="pageName=tabbedPane/TabbedPane10.jsp" textWrap="false"/>
      </td>
    </tr>
  </table>
</bttdojo:group>

</body>
</html>