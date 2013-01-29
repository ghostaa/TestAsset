<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from textBoxSubmittedinFlow.xui by Administrator, on Tue Jan 29 10:57:29 CST 2013 -->
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
<script type="text/javascript" src="<%=JSPUtil.getWebContextRootUrl()%>jsp/textBoxSubmittedinFlow.js"> </script>
  <table id="textBoxSubmittedinFlow_panel">
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="textBoxSubmittedinFlow_label" text="Before Submitted, verify the data in the textBox at  page A transmitted to  the textBox at page  B correctly" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:form id="textBoxSubmittedinFlow_form01" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:group id="textBoxSubmittedinFlow_group" text="Basic Type Test- test whether the value can be submitted" width="547px" height="50px" textWrap="false">
                  <table style="width:547px;height:50px;">
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label01" text="Basic Field" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text" dataName="BasicField" type="String" width="557px" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label03" text="Returned by Server" textWrap="false"/>
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
                        <bttdojo:label id="textBoxSubmittedinFlow_label13" text="3" textWrap="false"/>
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
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label12" text="2" textWrap="false"/>
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
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label11" text="1" textWrap="false"/>
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
                        <bttdojo:label id="textBoxSubmittedinFlow_label02" text="Field with password,hint attribute" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text01" dataName="Fieldwithpassword" type="String" hint="It is a hint for basic type test" password="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label04" text="Returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form02" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:group id="textBoxSubmittedinFlow_group01" text="String Type;  MaxLength = 6, MinLength = 3" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label05" text="Length Test Field" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text02" dataName="LengthTestField" type="String" minimumLength="3" maximumLength="6" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label06" text="Returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button01" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form03" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:group id="textBoxSubmittedinFlow_group02" text="String Type, regular expression" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label07" text="mail address" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text03" dataName="mailaddress" type="String" regExp="\\w+([-+.\']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label08" text="Returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button02" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form04" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="textBoxSubmittedinFlow_group03" text="String Basic" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label09" text="String with Required, password, hint" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text04" dataName="StringwithRequired" type="String" required="true" hint="It is hint for string basic" password="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label10" text="Returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button03" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form05" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="textBoxSubmittedinFlow_group04" text="DateBox, maxDate and minDate=+-7" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label16" text="yyyy-MM-dd" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text05" dataName="DateBoxWithmaxmin(default)" type="Date" pattern="yyyy-MM-dd" minimumDate="today-7d" maximumDate="today+7d" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label18" text="returned by server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label17" text="MM-dd-yyyy" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text06" dataName="DateBoxWithmaxmin(MMddYYYY)" type="Date" pattern="MM-dd-yyyy" minimumDate="today-7d" maximumDate="today+7d" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label19" text="returned by server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button04" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form06" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="textBoxSubmittedinFlow_group05" text="Date, required = true, minDate,maxDate" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label22" text="Date, required = true, minDate=2009-10-11,maxDate=2009-10-21" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text07" dataName="DateWithRequiredminmax" type="Date" pattern="yyyy-MM-dd" minimumDate="2009-10-11" maximumDate="2009-10-21" required="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label24" text="returned by server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label23" text="Date, required = true, minDate=today-1y1m7d ,maxDate=today+1y1m7d" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text08" dataName="DateWithRequiredminmax(today)" type="Date" pattern="yyyy-MM-dd" minimumDate="today-1y1m7d" maximumDate="today+1y1m7d" required="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label25" text="returned by server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button05" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form07" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="textBoxSubmittedinFlow_group06" text="DateBox, pattern=null" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label28" text="Null Pattern" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text09" dataName="DateWithPatternNull" type="Date" pattern="yyyy-MM-dd" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label29" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button06" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form08" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="textBoxSubmittedinFlow_group07" text="Date Basic" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label31" text="Date with Required, hint" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text10" dataName="DateBasic" type="Date" pattern="yyyy-MM-dd" required="true" hint="It is tip for date basic" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label32" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button07" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="textBoxSubmittedinFlow_group09" text="NumberBox,minNum=10.111,maxNum=100.111" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label43" text="NumberBox" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text17" dataName="NumberMinMax" type="Number" minimumValue="10.111" maximumValue="100.111" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label32_copy" text="returned by Server" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label46" dataName="NumberMinMax" text="Label" width="100px" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button09" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form09" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="textBoxSubmittedinFlow_group08" text="NumberBox,requried = true" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label35" text="Html:bigdecimal, html:decimal places =4" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text12" dataName="Html:bigdecimalwithhtml:decimalplaces" type="Number" required="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label41" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label36" text="Html:default, html:decimal places=4" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text13" dataName="Html:defaultwithhtml:decimalplaces" type="Number" required="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label42" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label38" text="Default:bigdecimal, default:decimal places =4" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text15" dataName="Default:bigdecimalwithdefault:decimalplaces" type="Number" required="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label44" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label39" text="Default:default, default:decimal places=4" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text16" dataName="Default:defaultwithdefault:decimalplaces" type="Number" required="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label45" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button08" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form12" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="textBoxSubmittedinFlow_group11" text="NumberBox, pattern" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label76" text="Html:bigDecimal,html:pattern=###,###.###" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text25" dataName="Html:bigDecimal,html:pattern=#" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label80" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label77" text="Default:bigDecimal,html:pattern=###,###.###" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text26" dataName="Default:bigDecimal,html:pattern=#" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label81" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label78" text="Html:bigDecimal,html:pattern=###,###.000" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text27" dataName="Html:bigDecimal,html:pattern=0" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label82" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label79" text="Defaultl:bigDecimal,html:pattern=###,###.000" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text28" dataName="Defaultl:bigDecimal,html:pattern=0" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label83" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button11" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form13" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="textBoxSubmittedinFlow_group12" text="NumberBox, decimalplace" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label88" text="Html:decimalPlaces=2" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text29" dataName="Html:decimalPlaces" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label106" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label89" text="Html:bigDecimal,pattern=null, html:decimalPlaces=2" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text30" dataName="Html:bigDecimalwithpatternwithhtml:decimalPlaces" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label107" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label90" text="Html:bigDecimal,pattern=null, default:decimalPlaces=2" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text31" dataName="Html:bigDecimalwithpatternwithdefault:decimalPlaces" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label108" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label91" text="Default:bigDecimal,pattern=null, html:decimalPlaces=2" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text32" dataName="Default:bigDecimalwithpatternwithhtml:decimalPlaces" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label109" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label92" text="Default:bigDecimal,pattern=null, default:decimalPlaces=2" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text33" dataName="Default:bigDecimalwithpatternwithdefault:decimalPlaces" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label110" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label98" text="Html: bigDecimal,html:decimalPlaces=2,html:pattern=###,###.###" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text39" dataName="Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=#" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label116" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label99" text="Html: bigDecimal,html:decimalPlaces=2,html:pattern=###,###.000" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text42" dataName="Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=0" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label117" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label100" text="Default: bigDecimal,default:decimalPlaces,html:pattern=###,###.###" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text40" dataName="Default: bigDecimalwithdefault:decimalPlacesewithhtml:pattern=#" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label118" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label101" text="Default: bigDecimal,default:decimalPlaces,html:pattern=###,###.000" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text41" dataName="Default: bigDecimalwithdefault:decimalPlacesewithhtml:pattern=0" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label119" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label102" text="Html: bigDecimal,html:decimalPlaces=2,html:pattern=###,###.###,value=12.1111" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text43" dataName="Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=#withvalue" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label120" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label103" text="Html: bigDecimal,html:decimalPlaces=2,html:pattern=###,###.000,value=12.1111" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text45" dataName="Html: bigDecimalwithhtml:decimalPlaceswithhtml:pattern=0withvalue" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label121" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label104" text="Default: bigDecimal,default:decimalPlaces=2,html:pattern=###,###.###" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text44" dataName="Default: bigDecimalwithdefault:decimalPlaceswithhtml:pattern=#" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label122" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label105" text="Default: bigDecimal,default:decimalPlaces=2,html:pattern=###,###.000" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text46" dataName="Default: bigDecimalwithdefault:decimalPlaceswithhtml:pattern=0" type="Number" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label123" text="returned by Server" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button12" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form15" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="textBoxSubmittedinFlow_group14" text="CurrencyBox, basic" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label147" text="Currency with required, hint" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text49" dataName="Currencywithrequiredwithhint" type="Currency" currency="EUR" numberType="bigDecimal" required="true" hint="It is tip for basic currency" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171_copy14" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button14" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form16" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="textBoxSubmittedinFlow_group15" text="CurrencyBox with different country" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label150" text="required=true, currency=CNY" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text50" dataName="CurrencyBoxwithrequiredwithCNY" type="Currency" currency="CNY" numberType="bigDecimal" required="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171_copy13" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label151" text="required=true, currency=FRF" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text51" dataName="CurrencyBoxwithrequiredwithFRF" type="Currency" currency="FRF" numberType="bigDecimal" required="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171_copy12" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button15" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form17" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="textBoxSubmittedinFlow_group16" text="CurrencyBox,max,min" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label156" text="maxNumber=100,minNumber=10" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text62" dataName="CurrencyBoxwithmaxminInt" type="Currency" currency="EUR" numberType="bigDecimal" minimumValue="10" maximumValue="100" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171_copy11" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label175" text="maxNumber=100.99,minNumber=10.99" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text63" dataName="CurrencyBoxwithmaxminDecimal" type="Currency" currency="EUR" numberType="bigDecimal" minimumValue="10.99" maximumValue="100.99" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171_copy10" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button17" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form19" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="textBoxSubmittedinFlow_group17" text="CurrencyBox, numberType" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label163" text="byte" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text54" dataName="CurrencyBoxwithByte" type="Currency" currency="EUR" numberType="byte" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label164" text="short" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text55" dataName="CurrencyBoxwithShort" type="Currency" currency="EUR" numberType="short" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171_copy" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label165" text="integer" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text56" dataName="CurrencyBoxwithInteger" type="Currency" currency="EUR" numberType="integer" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171_copy01" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label166" text="long" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text57" dataName="CurrencyBoxwithLong" type="Currency" currency="EUR" numberType="long" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171_copy02" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label167" text="double" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text58" dataName="CurrencyBoxwithDouble" type="Currency" currency="EUR" numberType="double" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171_copy03" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label168" text="float, decimal places =1" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text59" dataName="CurrencyBoxwithFloat" type="Currency" currency="EUR" numberType="float" decimalPlaces="1" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171_copy04" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label169" text="bigdecimal,decimal places =4" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text60" dataName="CurrencyBoxwithBigdecimal" type="Currency" currency="EUR" numberType="bigDecimal" decimalPlaces="4" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171_copy05" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label170" text="default,decimal places=4" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text61" dataName="CurrencyBoxwithDefault" type="Currency" currency="EUR" numberType="bigDecimal" decimalPlaces="4" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171_copy06" text="returned by Server" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button19" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
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
        <bttdojo:form id="textBoxSubmittedinFlow_form18" errorPage="textBoxSubmittedinFlow.jsp">
          <table>
            <tr>
              <td>
                <bttdojo:group id="textBoxSubmittedinFlow_group18" text="CurrencyBox, decimalplace" textWrap="false">
                  <table>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label157" text="required=true,decimalPlaces=4" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text52" dataName="CurrencyBoxwithdecimalplacewithrequired=4" type="Currency" currency="EUR" numberType="bigDecimal" decimalPlaces="4" required="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171_copy07" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label158" text="required=true,decimalPlaces=1" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:textbox id="textBoxSubmittedinFlow_text53" dataName="CurrencyBoxwithdecimalplacewithrequired=1" type="Currency" currency="EUR" numberType="bigDecimal" decimalPlaces="1" required="true" textWrap="false"/>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:label id="textBoxSubmittedinFlow_label171_copy08" text="returned by Server" textWrap="false"/>
                      </td>
                      <td>
                      </td>
                      <td align="left" valign="middle">
                        <bttdojo:button id="textBoxSubmittedinFlow_button16" type="submit" text="Button" flowEvent="submit" textWrap="false"/>
                      </td>
                    </tr>
                  </table>
                </bttdojo:group>
              </td>
            </tr>
            <tr>
              <td align="left" valign="middle">
                <bttdojo:a id="textBoxSubmittedinFlow_link" text="link into Popup page" flowEvent="intoPopup" textWrap="false"/>
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