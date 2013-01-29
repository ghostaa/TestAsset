<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from sampleW021.xui by Administrator, on Tue Jan 29 10:57:00 CST 2013 -->
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
  <table id="sampleW021_panel">
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="sampleW021_label02" text="W021 鈥��������lti-line labels in XUI editor" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:group id="sampleW021_group" text="Create a single line auto size widget and the content from text" width="966px" height="215px" textWrap="false">
          <table style="width:966px;height:215px;">
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label01" text="Expected results:Text in the widget has the same size as the text and it is shown in one single line. " textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="sampleW021_button" type="button" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="sampleW021_link" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." action="#" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="sampleW021_checkBox" dataName="emptyW021" checkedValue="true" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="sampleW021_radio" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="sampleW021_group02" text="Create a single line auto size widget and the content from NLS" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label01_copy02" text="Expected results:Text in the widget has the same size as the text and it is shown in one single line. " textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label_copy02" text="%nls.bttsample/sampleW021mark01" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="sampleW021_button_copy02" type="button" text="%nls.bttsample/sampleW021mark01" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="sampleW021_link_copy02" text="%nls.bttsample/sampleW021mark01" action="#" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="sampleW021_checkBox_copy02" dataName="emptyW021" checkedValue="true" text="%nls.bttsample/sampleW021mark01" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="sampleW021_radio_copy02" text="%nls.bttsample/sampleW021mark01" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="sampleW021_group03" text="Create a single line auto size widget and the content from dataName" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label01_copy03" text="Expected results:Text in the widget has the same size as the text and it is shown in one single line. " textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
                <bttdojo:form id="sampleW021_form" errorPage="sampleW021.jsp">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:message id="sampleW021_message_copy03" dataName="sampleW021Data" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sampleW021_button01" type="submit" text="Submit" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:group id="sampleW021_group04" text="Create a single line fixed size widget and the content from text" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label01_copy" text="Expected results:Text in the widget has the same size as the text and it is shown in one single line. " textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label_copy" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." width="271px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="sampleW021_button_copy" type="button" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." width="228px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="sampleW021_link_copy" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." action="#" width="271px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="sampleW021_checkBox_copy" dataName="emptyW021" checkedValue="true" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." width="295px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="sampleW021_radio_copy" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." width="287px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="sampleW021_group05" text="Create a single line fixed size widget and the content from NLS" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label01_copy_copy01" text="Expected results:Text in the widget has the same size as the text and it is shown in one single line." textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label_copy_copy01" text="%nls.bttsample/sampleW021mark01" width="271px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="sampleW021_button_copy_copy01" type="button" text="%nls.bttsample/sampleW021mark01" width="228px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="sampleW021_link_copy_copy01" text="%nls.bttsample/sampleW021mark01" action="#" width="271px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="sampleW021_checkBox_copy_copy01" dataName="emptyW021" checkedValue="true" text="%nls.bttsample/sampleW021mark01" width="295px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="sampleW021_radio_copy_copy01" text="%nls.bttsample/sampleW021mark01" width="287px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="sampleW021_group07" text="Create a multi-line widget with auto size height and the content from text" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label01_copy_copy" text="Expected results:Text in the widget has the specified width. It is shown in as multiple lines as necessary." textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label_copy_copy" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." width="271px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="sampleW021_button_copy_copy" type="button" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." width="228px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="sampleW021_link_copy_copy" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." action="#" width="271px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="sampleW021_checkBox_copy_copy" dataName="emptyW021" checkedValue="true" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." width="295px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="sampleW021_radio_copy_copy" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." width="287px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="sampleW021_group08" text="Create a multi-line widget with auto size height and the content from NLS" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label01_copy_copy_copy" text="Expected results:Text in the widget has the specified width. It is shown in as multiple lines as necessary." textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label_copy_copy_copy" text="%nls.bttsample/sampleW021mark01" width="222px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="sampleW021_button_copy_copy_copy" type="button" text="%nls.bttsample/sampleW021mark01" width="228px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="sampleW021_link_copy_copy_copy" text="%nls.bttsample/sampleW021mark01" action="#" width="271px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="sampleW021_checkBox_copy_copy_copy" dataName="emptyW021" checkedValue="true" text="%nls.bttsample/sampleW021mark01" width="295px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="sampleW021_radio_copy_copy_copy" text="%nls.bttsample/sampleW021mark01" width="287px" textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="sampleW021_group10" text="Create a fixed multi-line widget and the content from text" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label01_copy01" text="Expected results:Text in the widget has the specified width. It is shown in as multiple lines as possible (based on height property) and it is truncated if necessary. " textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label_copy01" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." width="256px" height="32px" textWrap="true"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="sampleW021_button_copy01" type="button" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." width="354px" height="41px" textWrap="true"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="sampleW021_link_copy01" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." action="#" width="368px" height="25px" textWrap="true"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="sampleW021_checkBox_copy01" dataName="emptyW021" checkedValue="true" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." width="495px" height="24px" textWrap="true"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="sampleW021_radio_copy01" text="MTS is the IBM approved method for accessing the IBM internal network when working remotely." width="485px" height="29px" textWrap="true"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="sampleW021_group11" text="Create a fixed multi-line widget and the content from NLS" textWrap="false">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label01_copy01_copy" text="Expected results:Text in the widget has the specified width. It is shown in as multiple lines as possible (based on height property) and it is truncated if necessary." textWrap="false"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:label id="sampleW021_label_copy01_copy" text="%nls.bttsample/sampleW021mark01" width="266px" height="30px" textWrap="true"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:button id="sampleW021_button_copy01_copy" type="button" text="%nls.bttsample/sampleW021mark01" width="229px" height="27px" textWrap="true"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="sampleW021_link_copy01_copy" text="%nls.bttsample/sampleW021mark01" action="#" width="233px" height="20px" textWrap="true"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:checkbox id="sampleW021_checkBox_copy01_copy" dataName="emptyW021" checkedValue="true" text="%nls.bttsample/sampleW021mark01" width="347px" height="20px" textWrap="true"/>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:radio id="sampleW021_radio_copy01_copy" text="%nls.bttsample/sampleW021mark01" width="241px" height="30px" textWrap="true"/>
              </td>
            </tr>
            <tr>
              <td>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
        <bttdojo:group id="sampleW021_group01" text="Test \"\\n\" effect in the text of the label/button/link/check/radio/message from NLS" textWrap="false">
          <table>
            <tr>
              <td>
                <bttdojo:group id="sampleW021_group13" text="Create a single line auto size widget and the content" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="sampleW021_label03" text="%nls.bttsample/sampleW021mark02" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sampleW021_button02" type="button" text="%nls.bttsample/sampleW021mark02" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="sampleW021_link01" text="%nls.bttsample/sampleW021mark02" action="#" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="sampleW021_checkBox01" dataName="emptyW021" checkedValue="true" text="%nls.bttsample/sampleW021mark02" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="sampleW021_radio01" text="%nls.bttsample/sampleW021mark02" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:message id="sampleW021_message01" dataName="enterW021" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
              <td>
                <bttdojo:group id="sampleW021_group13_copy02" text="Create a single line auto size widget and the content" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="sampleW021_label03_copy02" text="%nls.bttsample/sampleW021mark03" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sampleW021_button02_copy02" type="button" text="%nls.bttsample/sampleW021mark03" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="sampleW021_link01_copy02" text="%nls.bttsample/sampleW021mark03" action="#" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="sampleW021_checkBox01_copy02" dataName="emptyW021" checkedValue="true" text="%nls.bttsample/sampleW021mark03" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="sampleW021_radio01_copy02" text="%nls.bttsample/sampleW021mark03" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:message id="sampleW021_message01_copy" dataName="enterW021" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
            <tr>
              <td>
                <bttdojo:group id="sampleW021_group13_copy" text="Create a single line fixed size widget " textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="sampleW021_label03_copy" text="%nls.bttsample/sampleW021mark02" width="282px" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sampleW021_button02_copy" type="button" text="%nls.bttsample/sampleW021mark02" width="270px" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="sampleW021_link01_copy" text="%nls.bttsample/sampleW021mark02" action="#" width="200px" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="sampleW021_checkBox01_copy" dataName="emptyW021" checkedValue="true" text="%nls.bttsample/sampleW021mark02" width="200px" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="sampleW021_radio01_copy" text="%nls.bttsample/sampleW021mark02" width="200px" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
              <td>
                <bttdojo:group id="sampleW021_group13_copy_copy" text="Create a single line fixed size widget " textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="sampleW021_label03_copy_copy" text="%nls.bttsample/sampleW021mark03" width="150px" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sampleW021_button02_copy_copy" type="button" text="%nls.bttsample/sampleW021mark03" width="150px" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="sampleW021_link01_copy_copy" text="%nls.bttsample/sampleW021mark03" action="#" width="150px" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="sampleW021_checkBox01_copy_copy" dataName="emptyW021" checkedValue="true" text="%nls.bttsample/sampleW021mark03" width="150px" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="sampleW021_radio01_copy_copy" text="%nls.bttsample/sampleW021mark03" width="150px" textWrap="false"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
            <tr>
              <td>
                <bttdojo:group id="sampleW021_group13_copy01" text="Create a multi-line widget with auto size height" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="sampleW021_label03_copy01" text="%nls.bttsample/sampleW021mark02" width="287px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sampleW021_button02_copy01" type="button" text="%nls.bttsample/sampleW021mark02" width="270px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="sampleW021_link01_copy01" text="%nls.bttsample/sampleW021mark02" action="#" width="287px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="sampleW021_checkBox01_copy01" dataName="emptyW021" checkedValue="true" text="%nls.bttsample/sampleW021mark02" width="311px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="sampleW021_radio01_copy01" text="%nls.bttsample/sampleW021mark02" width="303px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
              <td>
                <bttdojo:group id="sampleW021_group13_copy01_copy01" text="Create a multi-line widget with auto size height" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="sampleW021_label03_copy01_copy01" text="%nls.bttsample/sampleW021mark03" width="287px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sampleW021_button02_copy01_copy01" type="button" text="%nls.bttsample/sampleW021mark03" width="270px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="sampleW021_link01_copy01_copy01" text="%nls.bttsample/sampleW021mark03" action="#" width="246px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="sampleW021_checkBox01_copy01_copy01" dataName="emptyW021" checkedValue="true" text="%nls.bttsample/sampleW021mark03" width="311px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="sampleW021_radio01_copy01_copy01" text="%nls.bttsample/sampleW021mark02" width="303px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
            <tr>
              <td>
                <bttdojo:group id="sampleW021_group13_copy01_copy" text="Create a fixed multi-line widget " textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="sampleW021_label03_copy01_copy" text="%nls.bttsample/sampleW021mark02" width="287px" height="28px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sampleW021_button02_copy01_copy" type="button" text="%nls.bttsample/sampleW021mark02" width="270px" height="28px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="sampleW021_link01_copy01_copy" text="%nls.bttsample/sampleW021mark02" action="#" width="287px" height="28px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="sampleW021_checkBox01_copy01_copy" dataName="emptyW021" checkedValue="true" text="%nls.bttsample/sampleW021mark02" width="311px" height="28px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="sampleW021_radio01_copy01_copy" text="%nls.bttsample/sampleW021mark02" width="303px" height="28px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
              <td>
                <bttdojo:group id="sampleW021_group13_copy01_copy_copy" text="Create a fixed multi-line widget " textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="sampleW021_label03_copy01_copy_copy" text="%nls.bttsample/sampleW021mark03" width="287px" height="28px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:button id="sampleW021_button02_copy01_copy_copy" type="button" text="%nls.bttsample/sampleW021mark03" width="270px" height="28px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:a id="sampleW021_link01_copy01_copy_copy" text="%nls.bttsample/sampleW021mark03" action="#" width="287px" height="28px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:checkbox id="sampleW021_checkBox01_copy01_copy_copy" dataName="emptyW021" checkedValue="true" text="%nls.bttsample/sampleW021mark03" width="311px" height="28px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:radio id="sampleW021_radio01_copy01_copy_copy" text="%nls.bttsample/sampleW021mark03" width="303px" height="28px" textWrap="true"/>
                      </td>
                    </tr>
                    <tr>
                      <td>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
          </table>
        </bttdojo:group>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
    </tr>
    <tr>
      <td>
      </td>
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