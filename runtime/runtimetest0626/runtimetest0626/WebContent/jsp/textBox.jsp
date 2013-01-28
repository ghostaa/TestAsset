<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from textBox.xui by Administrator, on Mon Jan 28 14:34:17 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/textBox.js"> </script>
  <table id="textBox_panel">
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="textBox_label" text="TextBox Test Page" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:tabbedpane id="textBox_tabbedPane" width="929px" height="2519px" textWrap="false">
          <bttdojo:contentpane id="textBox_ContentPane01" title="textBoxBasic">
            <table style="table-layout:fixed">
              <tr>
                <td align="left" valign="middle">
                  <bttdojo:label id="textBox_label192" text="Verify the label is assigned value successfully by the textBox" textWrap="false"/>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:form id="textBox_form01" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group" text="Basic Type Test- test whether the value can be submitted" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label01" text="Basic Field" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text" dataName="BasicField" type="String" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label03" text="Returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label11" dataName="BasicField" text="Label" textWrap="false"/>
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
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label02" text="Field with password,hint attribute" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text01" dataName="Fieldwithpassword" type="String" hint="It is a hint for basic type test" password="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label04" text="Returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label12" dataName="Fieldwithpassword" text="Label" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form02" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group01" text="String Type;  MaxLength = 6, MinLength = 3" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label05" text="Length Test Field" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text02" dataName="LengthTestField" type="String" minimumLength="3" maximumLength="6" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label06" text="Returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label13" dataName="LengthTestField" text="Label" width="100px" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button01" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form03" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group02" text="String Type, regular expression" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label07" text="mail address" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text03" dataName="mailaddress" type="String" regExp="\\w+([-+.\']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label08" text="Returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label14" dataName="mailaddress" text="Label" width="100px" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button02" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form04" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group03" text="String Basic" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label09" text="String with Required, password, hint" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text04" dataName="StringwithRequired" type="String" required="true" hint="It is hint for string basic" password="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label10" text="Returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label15" dataName="StringwithRequired" text="Label" width="100px" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button03" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form05" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group04" text="DateBox, maxDate and minDate=+-7" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label16" text="yyyy-MM-dd" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text05" dataName="DateBoxWithmaxmin(default)" type="Date" pattern="yyyy-MM-dd" minimumDate="today-7d" maximumDate="today+7d" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label18" text="returned by server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label20" dataName="DateBoxWithmaxmin(default)" text="Label" width="100px" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label17" text="MM-dd-yyyy" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text06" dataName="DateBoxWithmaxmin(MMddYYYY)" type="Date" pattern="MM-dd-yyyy" minimumDate="today-7d" maximumDate="today+7d" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label19" text="returned by server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label21" dataName="DateBoxWithmaxmin(MMddYYYY)" text="Label" width="100px" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button04" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form06" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group05" text="Date, required = true, minDate,maxDate" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label22" text="Date, required = true, minDate=2009-10-11,maxDate=2009-10-21" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text07" dataName="DateWithRequiredminmax" type="Date" pattern="yyyy-MM-dd" minimumDate="2009-10-11" maximumDate="2009-10-21" required="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label24" text="returned by server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label26" dataName="DateWithRequiredminmax" text="Label" width="100px" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label23" text="Date, required = true, minDate=today-1y1m7d ,maxDate=today+1y1m7d" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text08" dataName="DateWithRequiredminmax(today)" type="Date" pattern="yyyy-MM-dd" minimumDate="today-1y1m7d" maximumDate="today+1y1m7d" required="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label25" text="returned by server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label27" dataName="DateWithRequiredminmax(today)" text="Label" width="100px" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button05" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form07" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group06" text="DateBox, pattern=null" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label28" text="Null Pattern" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text09" dataName="DateWithPatternNull" type="Date" pattern="yyyy-MM-dd" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label29" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label30" dataName="DateWithPatternNull" text="Label" width="100px" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button06" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form08" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group07" text="Date Basic" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label31" text="Date with Required, hint" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text10" dataName="DateBasic" type="Date" pattern="yyyy-MM-dd" required="true" hint="It is tip for date basic" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label32" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label33" dataName="DateBasic" text="Label" width="100px" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button07" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group09" text="NumberBox,minNum=10.111,maxNum=100.111" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label43" text="NumberBox" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text17" dataName="NumberMinMax" type="Number" minimumValue="10.111" maximumValue="100.111" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label32_copy" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label46" dataName="NumberMinMax" text="Label" width="100px" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button09" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form09" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group08" text="NumberBox,requried = true" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label35" text="Html:bigdecimal, html:decimal places =4" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text12" dataName="Html:bigdecimalwithhtml:decimalplaces" type="Number" required="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label41" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label47" dataName="Html:bigdecimalwithhtml:decimalplaces" text="Label" width="100px" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label36" text="Html:default, html:decimal places=4" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text13" dataName="Html:defaultwithhtml:decimalplaces" type="Number" required="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label42" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label48" dataName="Html:defaultwithhtml:decimalplaces" text="Label" width="100px" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label38" text="Default:bigdecimal, default:decimal places=4" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text15" dataName="Default:bigdecimalwithdefault:decimalplaces" type="Number" required="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label44" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label50" dataName="Default:bigdecimalwithdefault:decimalplaces" text="Label" width="100px" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label39" text="Default:default, default:decimal places=4" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text16" dataName="Default:defaultwithdefault:decimalplaces" type="Number" required="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label45" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label51" dataName="Default:defaultwithdefault:decimalplaces" text="Label" width="100px" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button08" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form12" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group11" text="NumberBox, pattern" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label76" text="Html:bigDecimal,html:pattern=###,###.###" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text25" dataName="Html:bigDecimal,html:pattern=#" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label80" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label84" dataName="Html:bigDecimal,html:pattern=#" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label77" text="Default:bigDecimal,html:pattern=###,###.###" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text26" dataName="Default:bigDecimal,html:pattern=#" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label81" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label85" dataName="Default:bigDecimal,html:pattern=#" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label78" text="Html:bigDecimal,html:pattern=###,###.000" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text27" dataName="Html:bigDecimal,html:pattern=0" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label82" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label86" dataName="Html:bigDecimal,html:pattern=0" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label79" text="Defaultl:bigDecimal,html:pattern=###,###.000" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text28" dataName="Defaultl:bigDecimal,html:pattern=0" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label83" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label87" dataName="Defaultl:bigDecimal,html:pattern=0" text="Label" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button11" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form13" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group12" text="NumberBox, decimalplace" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label88" text="Html:decimalPlaces=2" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text29" dataName="Html:decimalPlaces" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label106" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label124" dataName="Html:decimalPlaces" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label89" text="Html:bigDecimal,pattern=null, html:decimalPlaces=2" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text30" dataName="Html:bigDecimalwithpatternwithhtml:decimalPlaces" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label107" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label125" dataName="Html:bigDecimalwithpatternwithhtml:decimalPlaces" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label90" text="Html:bigDecimal,pattern=null, default:decimalPlaces=2" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text31" dataName="Html:bigDecimalwithpatternwithdefault:decimalPlaces" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label108" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label126" dataName="Html:bigDecimalwithpatternwithdefault:decimalPlaces" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label91" text="Default:bigDecimal,pattern=null, html:decimalPlaces=2" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text32" dataName="Default:bigDecimalwithpatternwithhtml:decimalPlaces" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label109" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label127" dataName="Default:bigDecimalwithpatternwithhtml:decimalPlaces" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label92" text="Default:bigDecimal,pattern=null, default:decimalPlaces=2" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text33" dataName="Default:bigDecimalwithpatternwithdefault:decimalPlaces" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label110" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label128" dataName="Default:bigDecimalwithpatternwithdefault:decimalPlaces" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label34" text="Default:bigDecimal,pattern=null, html:decimalPlaces=2, value=12.1111" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text11" dataName="Default:bigDecimalwithpatternwithhtml:decimalPlaceswithvalue" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label110_copy" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label128_copy" dataName="Default:bigDecimalwithpatternwithhtml:decimalPlaceswithvalue" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label37" text="Default:bigDecimal,pattern=null, default:decimalPlaces=2, value=12.1111" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text14" dataName="Default:bigDecimalwithpatternwithdefault:decimalPlaceswithvalue" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label110_copy01" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label128_copy01" dataName="Default:bigDecimalwithpatternwithdefault:decimalPlaceswithvalue" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label98" text="Html: bigDecimal,html:decimalPlaces=2,html:pattern=###,###.###" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text39" dataName="Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=#" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label116" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label134" dataName="Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=#" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label99" text="Html: bigDecimal,html:decimalPlaces=2,html:pattern=###,###.000" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text42" dataName="Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=0" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label117" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label135" dataName="Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=0" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label100" text="Default: bigDecimal,default:decimalPlaces,html:pattern=###,###.###" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text40" dataName="Default: bigDecimalwithdefault:decimalPlacesewithhtml:pattern=#" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label118" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label136" dataName="Default: bigDecimalwithdefault:decimalPlacesewithhtml:pattern=#" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label101" text="Default: bigDecimal,default:decimalPlaces,html:pattern=###,###.000" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text41" dataName="Default: bigDecimalwithdefault:decimalPlacesewithhtml:pattern=0" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label119" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label137" dataName="Default: bigDecimalwithdefault:decimalPlacesewithhtml:pattern=0" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label102" text="Html: bigDecimal,html:decimalPlaces=2,html:pattern=###,###.###,value=12.1111" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text43" dataName="Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=#withvalue" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label120" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label138" dataName="Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=#withvalue" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label103" text="Html: bigDecimal,html:decimalPlaces=2,html:pattern=###,###.000,value=12.1111" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text45" dataName="Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=0withvalue" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label121" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label139" dataName="Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=0withvalue" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label104" text="Default: bigDecimal,default:decimalPlaces=2,html:pattern=###,###.###" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text44" dataName="Default: bigDecimalwithdefault:decimalPlaceswithhtml:pattern=#" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label122" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label140" dataName="Default: bigDecimalwithdefault:decimalPlaceswithhtml:pattern=#" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label105" text="Default: bigDecimal,default:decimalPlaces=2,html:pattern=###,###.000" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text46" dataName="Default: bigDecimalwithdefault:decimalPlaceswithhtml:pattern=0" type="Number" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label123" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label141" dataName="Default: bigDecimalwithdefault:decimalPlaceswithhtml:pattern=0" text="Label" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button12" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form15" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group14" text="CurrencyBox, basic" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label147" text="Currency with required, hint" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text49" dataName="Currencywithrequiredwithhint" type="Currency" currency="EUR" numberType="bigDecimal" required="true" hint="It is tip for basic currency" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy14" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label149" dataName="Currencywithrequiredwithhint" text="Label" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button14" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form16" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group15" text="CurrencyBox with different country" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label150" text="required=true, currency=CNY" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text50" dataName="CurrencyBoxwithrequiredwithCNY" type="Currency" currency="CNY" numberType="bigDecimal" required="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy13" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label154" dataName="CurrencyBoxwithrequiredwithCNY" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label151" text="required=true, currency=FRF" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text51" dataName="CurrencyBoxwithrequiredwithFRF" type="Currency" currency="FRF" numberType="bigDecimal" required="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy12" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label155" dataName="CurrencyBoxwithrequiredwithFRF" text="Label" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button15" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form17" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group16" text="CurrencyBox,max,min" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label156" text="maxNumber=100,minNumber=10" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text62" dataName="CurrencyBoxwithmaxminInt" type="Currency" currency="EUR" numberType="bigDecimal" minimumValue="10" maximumValue="100" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy11" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label174" dataName="CurrencyBoxwithmaxminInt" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label175" text="maxNumber=100.99,minNumber=10.99" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text63" dataName="CurrencyBoxwithmaxminDecimal" type="Currency" currency="EUR" numberType="bigDecimal" minimumValue="10.99" maximumValue="100.99" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy10" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label177" dataName="CurrencyBoxwithmaxminDecimal" text="Label" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button17" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form20" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group19" text="CurrencyBox, format with locale" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label178" text="required=true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text64" dataName="CurrencyBoxwithformatwithlocale" type="Currency" currency="EUR" numberType="bigDecimal" required="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy09" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label180" dataName="CurrencyBoxwithformatwithlocale" text="Label" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button18" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form19" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group17" text="CurrencyBox, numberType" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label163" text="byte" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text54" dataName="CurrencyBoxwithByte" type="Currency" currency="EUR" numberType="byte" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label172" dataName="CurrencyBoxwithByte" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label164" text="short" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text55" dataName="CurrencyBoxwithShort" type="Currency" currency="EUR" numberType="short" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label172_copy" dataName="CurrencyBoxwithShort" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label165" text="integer" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text56" dataName="CurrencyBoxwithInteger" type="Currency" currency="EUR" numberType="integer" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy01" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label172_copy01" dataName="CurrencyBoxwithInteger" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label166" text="long" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text57" dataName="CurrencyBoxwithLong" type="Currency" currency="EUR" numberType="long" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy02" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label172_copy02" dataName="CurrencyBoxwithLong" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label167" text="double" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text58" dataName="CurrencyBoxwithDouble" type="Currency" currency="EUR" numberType="double" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy03" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label172_copy03" dataName="CurrencyBoxwithDouble" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label168" text="float, decimal places =1" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text59" dataName="CurrencyBoxwithFloat" type="Currency" currency="EUR" numberType="float" decimalPlaces="1" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy04" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label172_copy04" dataName="CurrencyBoxwithFloat" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label169" text="bigdecimal,decimal places =4" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text60" dataName="CurrencyBoxwithBigdecimal" type="Currency" currency="EUR" numberType="bigDecimal" decimalPlaces="4" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy05" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label172_copy05" dataName="CurrencyBoxwithBigdecimal" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label170" text="default,decimal places=4" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text61" dataName="CurrencyBoxwithDefault" type="Currency" currency="EUR" numberType="bigDecimal" decimalPlaces="4" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy06" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label172_copy06" dataName="CurrencyBoxwithDefault" text="Label" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button19" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form18" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group18" text="CurrencyBox, decimalplace" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label157" text="required=true,decimalPlaces=4" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text52" dataName="CurrencyBoxwithdecimalplacewithrequired=4" type="Currency" currency="EUR" numberType="bigDecimal" decimalPlaces="4" required="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy07" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label160" dataName="CurrencyBoxwithdecimalplacewithrequired=4" text="Label" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label158" text="required=true,decimalPlaces=1" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text53" dataName="CurrencyBoxwithdecimalplacewithrequired=1" type="Currency" currency="EUR" numberType="bigDecimal" decimalPlaces="1" required="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label171_copy08" text="returned by Server" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label162" dataName="CurrencyBoxwithdecimalplacewithrequired=1" text="Label" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button16" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form21" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group20" text="Set Style-test style of different type textbox" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label145" text="String" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text65" dataName="StringData" type="String" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label148" text="Integer" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text66" dataName="IntegerData" type="Number" numberType="integer" minimumValue="-2147483648" maximumValue="2147483647" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label152" text="Long" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text67" dataName="LongData" type="Number" numberType="long" minimumValue="-9223372036854775808" maximumValue="9223372036854775807" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label153" text="Double" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text68" dataName="DoubleData" type="Number" numberType="double" decimalPlaces="3" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label159" text="Date" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text69" dataName="DateData" type="Date" pattern="yyyy-MM-dd" textWrap="false"/>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                              </tr>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label161" text="Currency" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text70" dataName="CurrencyData" type="Currency" currency="EUR" numberType="bigDecimal" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button20" type="button" text="Change style" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button21" type="button" text="Default" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form22" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group21" text="Change hint- change hint by ECA" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text71" dataName="lengthofStringTestField" hint="Maxlenth:6,Minlength:3" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button22" type="button" text="Change hint" flowEvent="submit" textWrap="false"/>
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
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="textBox_ContentPane02" title="propertyInView">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:group id="textBox_group22" text="IsMandatory" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text72" dataName="d1" type="String" required="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label173" text="True    Server=true client=" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text73" dataName="d2" type="String" required="false" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label176" text="False   Server=false client=" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text74" dataName="d3" type="String" required="false" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label179" text="True    Server=true client=false" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label40" text="the system will display a warning" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text75" dataName="d5" type="String" required="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label181" text="True    Server=false client=true" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text76" dataName="d5" type="String" required="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label182" text="True    Server=    client=true" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text77" dataName="d6" type="String" required="false" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label184" text="False   Server=      client=false" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text78" dataName="d7" type="String" required="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label183" text="True    Server=true client=true" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text79" dataName="d8" type="String" required="false" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label185" text="False   Server=false client=false" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text80" dataName="d9" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label186" text="False   Server=    client=" textWrap="false"/>
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
                  <bttdojo:group id="textBox_group23" text="Disabled" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text81" dataName="textBoxData" type="String" disabled="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label187" text="True" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text82" dataName="textBoxData" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label188" text="False" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="textBox_group24" text="Visibility and ReadOnly" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text83" dataName="textBoxData" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label189" text="Visible" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label221" text="_________________________" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text84" dataName="textBoxData" type="String" visibility="hidden" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label190" text="Hidden" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label222" text="_________________________" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text85" dataName="textBoxData" type="String" visibility="gone" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label191" text="Gone" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label241" text="_________________________" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text87" dataName="textBoxData" type="String" readOnly="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label193" text="ReadOnly(true)" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="textBox_group25" text="ShortCut" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text18" dataName="textBoxData" type="String" accesskey="w" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label223" text="Alt+W or Shift+Alt+W" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="textBox_group36" text="Appearance" textWrap="false">
                    <table>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_Text02" dataName="String" type="String" width="150px" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_Label02" text="width=150 String" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_Text04" dataName="Date" type="Date" pattern="yyyy-MM-dd" width="150px" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_Label04" text="width=150 Date" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_Text16" dataName="Number(default)" type="Number" width="150px" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_Label14" text="width=150 NumberBox(default)" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_Text06_copy" dataName="Number(BigDecimal)" type="Number" numberType="bigDecimal" decimalPlaces="3" width="150px" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_Label14_copy" text="width=150 NumberBox(bigdecimal)" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text120" dataName="Currency" type="Currency" currency="EUR" numberType="bigDecimal" width="150px" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label245" text="width=150 Currency" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text121" dataName="Double" type="Number" numberType="double" decimalPlaces="3" width="150px" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label246" text="width=150 Double" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text122" dataName="Integer" type="Number" numberType="integer" minimumValue="-2147483648" maximumValue="2147483647" width="150px" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label242" text="width=150 Integer" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text123" dataName="BigDecimal" type="Number" numberType="bigDecimal" decimalPlaces="3" width="150px" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label243" text="width=150 BigDecimal" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text124" dataName="BigInteger" type="Number" numberType="bigInteger" minimumValue="-9999999999999" maximumValue="9999999999999" width="150px" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label244" text="width=150 BigInteger" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="textBox_ContentPane03" title="textBoxECA">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:group id="textBox_group26" text="Event" textWrap="false">
                    <table>
                      <tr>
                        <td colspan="2" align="left" valign="middle">
                          <bttdojo:label id="textBox_label211" text="%nls.bttsample/textBoxMark01" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text88" dataName="textBoxData_onClick" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label194" text="onClick" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text89" dataName="textBoxData_onFocus" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label195" text="onFocus" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text90" dataName="textBoxData_onBlur" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label196" text="onBlur" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text91" dataName="textBoxData_onKeyDown" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label197" text="onKeyDown" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text92" dataName="textBoxData_onKeyPress" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label198" text="onKeyPress" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text93" dataName="textBoxData_onKeyUp" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label199" text="onKeyUp" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text94" dataName="textBoxData_onMouseDown" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label200" text="onMouseDown" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text95" dataName="textBoxData_onMouseUp" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label201" text="onMouseUp" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text96" dataName="textBoxData_onMouseEnter" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label202" text="onMouseEnter" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text97" dataName="textBoxData_onMouseLeave" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label203" text="onMouseLeave" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text98" dataName="textBoxData_onMouseMove" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label204" text="onMouseMove" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text99" dataName="textBoxData_onChange" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label205" text="onChange" textWrap="false"/>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
              <tr>
                <td>
                  <bttdojo:group id="textBox_group27" text="Condition" textWrap="false">
                    <table>
                      <tr>
                        <td colspan="2" align="left" valign="middle">
                          <bttdojo:label id="textBox_label206" text="%nls.bttsample/textBoxMark02" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text100" dataName="textBoxData" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label207" text="isFocusable" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text101" dataName="textBoxData" type="String" required="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label208" text="isMandatory" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text103" dataName="textBoxData" type="String" disabled="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label209" text="disabled" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text104" dataName="textBoxData" type="String" readOnly="true" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label210" text="readOnly" textWrap="false"/>
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
                  <bttdojo:group id="textBox_group28" text="Action" textWrap="false">
                    <table>
                      <tr>
                        <td colspan="3" align="left" valign="middle">
                          <bttdojo:label id="textBox_label212" text="%nls.bttsample/textBoxMark02" textWrap="false"/>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text102" dataName="textBoxData" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label213" text="styleClass" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text105" dataName="textBoxData" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label214" text="value" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text106" dataName="textBoxData" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label215" text="isMandatory" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text107" dataName="textBoxData" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label216" text="visiblity(hidden)" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text108" dataName="textBoxData" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label217" text="disabled" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text109" dataName="textBoxData" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label218" text="readOnly" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text110" dataName="textBoxData" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label219" text="hint" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                      <tr>
                        <td align="left" valign="middle">
                          <bttdojo:textbox id="textBox_text111" dataName="textBoxData" type="String" textWrap="false"/>
                        </td>
                        <td align="left" valign="middle">
                          <bttdojo:label id="textBox_label220" text="ShowErrorMessage" textWrap="false"/>
                        </td>
                        <td>
                        </td>
                      </tr>
                    </table>
                  </bttdojo:group>
                </td>
              </tr>
            </table>
          </bttdojo:contentpane>
          <bttdojo:contentpane id="textBox_ContentPane05" title="textBoxButtonStyle">
            <table style="table-layout:fixed">
              <tr>
                <td>
                  <bttdojo:form id="textBox_form26" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group33" text="Reset" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label238" text="String" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text117" dataName="textBoxButtonStyleString" type="String" minimumLength="5" maximumLength="7" required="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button27" type="reset" text="Button" flowEvent="change" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form27" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group34" text="Submit with no data" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label239" text="String" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text118" dataName="textBoxButtonStyleString" type="String" minimumLength="5" maximumLength="7" required="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button28" type="cancel" text="Button" flowEvent="change" textWrap="false"/>
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
                  <bttdojo:form id="textBox_form28" errorPage="textBox.jsp">
                    <table>
                      <tr>
                        <td>
                          <bttdojo:group id="textBox_group35" text="Submit without validation" textWrap="false">
                            <table>
                              <tr>
                                <td align="left" valign="middle">
                                  <bttdojo:label id="textBox_label240" text="String" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:textbox id="textBox_text119" dataName="textBoxButtonStyleString" type="String" minimumLength="5" maximumLength="7" required="true" textWrap="false"/>
                                </td>
                                <td align="left" valign="middle">
                                  <bttdojo:button id="textBox_button29" type="save" text="Button" flowEvent="change" textWrap="false"/>
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
            </table>
          </bttdojo:contentpane>
        </bttdojo:tabbedpane>
      </td>
    </tr>
  </table>

</body>
</html>