<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page" class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);			  
	%>
</jsp:useBean>	
<html>
<!-- Generated from display.xui by Administrator, on Mon Jan 28 14:33:47 CST 2013 -->
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



@import "css/show.css";

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
<bttdojo:form id="display_Form01" flowEvent="ok" errorPage="mapper/display.jsp">
  <table>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label01" dataName="name" textWrap="false"/>
      </td>
      <td>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label46" text="+" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label47" dataName="testPlus" text="Label" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label02" dataName="absolute" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label12" text="abosolue(number):Number" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label46_copy" text="-" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label47_copy" dataName="testSubduction" text="Label" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label03" dataName="compare" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label13" text="compare(str1,str2):Boolean" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label46_copy01" text="*" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label47_copy01" dataName="multiplication" text="Label" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label04" dataName="CompareIgnoreCase" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label14" text="compareIgnoreCase(str1,str2):boolean" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label46_copy02" text="/" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label47_copy02" dataName="testDivision" text="Label" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label06" dataName="concat" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label15" text="concat(str1,str2):string" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label46_copy03" text="<" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label47_copy03" dataName="lessThan" text="Label" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label07" dataName="contains" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label16" text="contains(str,substr):boolean" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label46_copy04" text=">" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label47_copy04" dataName="moreThan" text="Label" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label08" dataName="date" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label17" text="date():string" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label46_copy05" text="==" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label47_copy05" dataName="equal" text="Label" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label09" dataName="day" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label18" text="day():string" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label46_copy06" text="!=" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label47_copy06" dataName="notEqual" text="Label" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label10" dataName="dayOfWeek" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label20" text="dayOfWeek():string" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label46_copy07" text="<=" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label47_copy07" dataName="lessAndEqualThan" text="Label" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label11" dataName="indexOf" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label19" text="indexOf(str,substr):Number" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label46_copy08" text=">=" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label47_copy08" dataName="moreAndEqualThan" text="Label" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label33" dataName="lastIndexOf" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label05" text="lastIndexOf(str,substr):Number" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label46_copy09" text="and" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label47_copy09" dataName="and" text="Label" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label34" dataName="length" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label21" text="length(str):Number" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label46_copy10" text="or" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label47_copy10" dataName="or" text="Label" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label35" dataName="lowerCase" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label22" text="lowerCase(Str):str" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label46_copy11" text="not" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label47_copy11" dataName="not" text="Label" textWrap="false"/>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label36" dataName="month" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label23" text="month();string" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label37" dataName="replace" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label24" text="replace(str,oldStr,newStr):string" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label38" dataName="round" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label25" text="round(number):number" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label39" dataName="sameValue" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label26" text="sameValue(str1,str2):boolean" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label40" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label27" text="subString(str,startString,endString):str" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label41" dataName="today" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label28" text="today():string" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label42" dataName="trim" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label29" text="trim(str):string" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label43" dataName="truncate" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label30" text="truncate(number):number" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label44" dataName="upperCase" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label31" text="upperCase(str):str" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label45" dataName="year" textWrap="false"/>
      </td>
      <td align="left" valign="middle">
        <bttdojo:label id="display_Label32" text="year():string" textWrap="false"/>
      </td>
      <td>
      </td>
      <td>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle">
        <bttdojo:button id="display_Button01" type="button" text="submit" textWrap="false"/>
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

</body>
</html>