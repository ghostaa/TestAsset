<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="utb" scope="page"
	class="com.ibm.btt.cs.html.DSEJspContextServices">
	<%
		utb.initialize(request);
	%>
</jsp:useBean>
<%
	String sessionId = request.getSession().getId();
	com.ibm.json.java.JSONObject json, conf;
	com.ibm.json.java.JSONArray aps, dps, cc;
	com.ibm.btt.base.Context sessionCtx = utb.getSessionContext();
	System.out.println(sessionCtx.getKeyedCollection().toString());
	com.ibm.btt.base.KeyedCollection kc = sessionCtx
			.getKeyedCollection();
	com.ibm.btt.base.KeyedCollection myPages = (com.ibm.btt.base.KeyedCollection) kc
			.tryGetElementAt("myPages");

	com.ibm.btt.base.IndexedCollection availablePortlets = (com.ibm.btt.base.IndexedCollection) myPages
			.tryGetElementAt("availablePortlets");
	com.ibm.btt.base.IndexedCollection defaultContainer = (com.ibm.btt.base.IndexedCollection) myPages
			.tryGetElementAt("defaultPortletsContainer");
	com.ibm.btt.base.IndexedCollection currentContainer = (com.ibm.btt.base.IndexedCollection) myPages
			.tryGetElementAt("currentPortletsContainer");
	com.ibm.btt.base.IndexedCollection deployedPortlets = (com.ibm.btt.base.IndexedCollection) myPages
			.tryGetElementAt("deployedPortlets");
			
	conf = new com.ibm.json.java.JSONObject();
	
	aps = new com.ibm.json.java.JSONArray();
	for(int i=0;i<availablePortlets.size();i++){
		com.ibm.btt.base.KeyedCollection portlet = (com.ibm.btt.base.KeyedCollection)availablePortlets.tryGetElementAt(i);
		json = new com.ibm.json.java.JSONObject();
		json.put("title", portlet.tryGetValueAt("title"));
		json.put("url", portlet.tryGetValueAt("url") == null ? "":portlet.tryGetValueAt("url").toString().replaceAll("dse_sessionId=.*?\\&", "dse_sessionId=" + sessionId + "\\&"));
		json.put("instanceClosable", portlet.tryGetValueAt("instanceClosable"));
		aps.add(json);
	}
	cc = new com.ibm.json.java.JSONArray();
	for(int i=0;i<currentContainer.size();i++){
		com.ibm.btt.base.KeyedCollection col = (com.ibm.btt.base.KeyedCollection)currentContainer.tryGetElementAt(i);
		json = new com.ibm.json.java.JSONObject();
		json.put("index", col.tryGetValueAt("index"));
		json.put("width", col.tryGetValueAt("width"));
		cc.add(json);
	}
	dps = new com.ibm.json.java.JSONArray();
	for(int i=0;i<deployedPortlets.size();i++){
		com.ibm.btt.base.KeyedCollection portlet = (com.ibm.btt.base.KeyedCollection)deployedPortlets.tryGetElementAt(i);
		json = new com.ibm.json.java.JSONObject();
		json.put("title", portlet.tryGetValueAt("title"));
		json.put("url", portlet.tryGetValueAt("url") == null ? "":portlet.tryGetValueAt("url").toString().replaceAll("dse_sessionId=.*?\\&", "dse_sessionId=" + sessionId + "\\&"));
		json.put("closable", portlet.tryGetValueAt("closable"));
		json.put("content", portlet.tryGetValueAt("content"));
		json.put("open", portlet.tryGetValueAt("open"));
		json.put("columnId", portlet.tryGetValueAt("columnId"));
		json.put("rowId", portlet.tryGetValueAt("rowId"));
		dps.add(json);
	}
	
	conf.put("availablePortlets", aps);
	conf.put("currentPortletsContainer", cc);
	conf.put("deployedPortlets", dps);
	
	System.out.println(conf.toString());
%>
<html lang="en">
<!-- Generated from index.xui by jeffrey, on Mon Feb 25 15:46:23 CST 2013 -->
<head>
<%@ taglib uri="/WEB-INF/bttdojo.tld" prefix="bttdojo"%>
<%@ page import="com.ibm.btt.cs.html.JSPUtil"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Pages</title>

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

@import "js/dojox/widget/Portlet/Portlet.css";

@import "js/dojox/layout/resources/GridContainer.css";

.dj_ie6 .dropIndicator,.dj_ie6 .dojoxPortlet {
	margin: 5px;
}

.gridContainerZone>* {
	margin: 5px !important;
}
</style>

<script>
	var djConfig =  {
		baseUrl:"js/dojo/",
		<bttdojo:locale/>,
		isDebug: true, 
		parseOnLoad: true
	};
</script>
<script type="text/javascript" src="js/dojo/dojo_BTT.js"></script>
<script type="text/javascript" src="js/com/ibm/btt/btt.js"></script>
<script type="text/javascript">
	window["dse_myPagesConfig"]=<%=conf.toString()%>;
</script>
<script type="text/javascript">
// fix missing define() in 1.6.1
define=function(d,b,c){function g(a){if(a.charAt(0)==="."){for(a=d.substring(0,d.lastIndexOf("/")+1)+a;b!==a;)var b=a,a=a.replace(/\/[^\/]*\/\.\.\//,"/");a=a.replace(/\/\.\//g,"/")}return a.replace(/\//g,".")}c||(b?(c=b,b=d):(c=d,b=typeof c=="function"?["require","exports","module"].slice(0,c.length):[]),d=currentModule?currentModule.replace(/\./g,"/"):"anon");var e=d.replace(/\//g,"."),h=dojo.provide(e);if(typeof c=="function"){for(var i=[],a,f=0;f<b.length;f++){a=g(b[f]);var j=a.indexOf("!");if(j> -1)a.substring(0,j)=="i18n"&&(a=a.match(/^i18n\!(.+)\.nls\.([^\.]+)$/),dojo.requireLocalization(a[1],a[2])),a=null;else switch(a){case "require":a=function(a){return dojo.require(g(a))};break;case "exports":a=h;break;case "module":var k=a={exports:h};break;case "dojox":a=dojo.getObject(a);break;case "dojo/lib/kernel":case "dojo/lib/backCompat":a=dojo;break;default:a=dojo.require(a)}i.push(a)}b=c.apply(null,i)}else b=c;b&&(dojo._loadedModules[e]=b,dojo.setObject(e,b));if(k)dojo._loadedModules[e]=k.exports; return b};define.vendor="dojotoolkit.org";define.version=dojo.version;define("dojo/lib/kernel",[],dojo);define("dojo/lib/backCompat",[],dojo);define("dojo",[],dojo);define("dijit",[],this.dijit||(this.dijit={}));

	
dojo.require("dojox.layout.GridContainer");
dojo.require("dojox.widget.Portlet");
dojo.addOnLoad(function(){
	dojo.style(document.body, "visibility", "");
	
	if(window.dse_myPagesConfig){
		try{
			// start portletsRepoBox
			var box = dojo.parser.instantiate([dojo.byId("portletsRepoBox")], {"dojoType":"dijit.TitlePane", "title":"Customize My Page","open":false, _started: false})[0];
			var repo = new dojox.layout.GridContainer({
				id:"portletsRepoContainer", 
				isAutoOrganized:true, 
				hasResizableColumns:false, 
				nbZones:3, 
				dragHandleClass:"dijitTitlePaneTitle", 
				style:"width: 90%; border: 1px",
				doLayout:false,
				acceptTypes: ["nothing"]
				});
				
			dojo.forEach(window.dse_myPagesConfig.availablePortlets, function(portlet, i){
				var p = new dojox.widget.Portlet({
					id:"template_portlet_" + i,
					title:portlet.title,
					open: false,
					toggleable: false,
					closable: false,
					content: "<iframe src='"+ portlet.url + "' seamless></iframe>"
				});
				p["instanceClosable"] = portlet["instanceClosable"];
				p["url"] = portlet.url;
				repo.addChild(p);
			});
			box.set("content", repo);
			
			// currentPortletsContainer
			var container = dojo.parser.instantiate([dojo.byId("portletsContainer")], {
				dojoType:"dojox.layout.GridContainer",
				isAutoOrganized:false, 
				hasResizableColumns:true, 
				nbZones:window.dse_myPagesConfig.currentPortletsContainer.length, 
				dragHandleClass:"dijitTitlePaneTitle", 
				style:"width: 90%; border: 1px",
				doLayout:false
				})[0];
			
			var cols = [];
			dojo.forEach(window.dse_myPagesConfig.currentPortletsContainer, function(col){
				cols.push(col.width);
			})
			container.set("ColWidths", cols);
			
			dojo.forEach(window.dse_myPagesConfig.deployedPortlets, function(portlet, i){
				var p = new dojox.widget.Portlet({
					title:portlet.title,
					open: portlet.open,
					toggleable: true,
					closable: portlet.closable,
					content: "<iframe src='"+ portlet.url + "' seamless></iframe>"
				});
				p["url"] = portlet.url;
				dojo.connect(p, "onClose", p, function(){
					container.removeChild(p);
					if(p && p.destroy()){
						p.destroy();
					}
					delete p;
				});
				container.addChild(p, portlet.columnId, portlet.rowId);
			});
			
			dojo.connect(container._dragManager, "onBeforeDrop",container._dragManager, function(node){
				this._currentIndexArea = this._sourceIndexArea;
			});
			
			dojo.connect(container._dragManager, "onDropCancel",container._dragManager, function(node, targetArea, indexChild){
			    if(node.id.indexOf("template_") === 0 && targetArea.node.id.indexOf("portletsContainer_") === 0){
			    	var col = targetArea.node.cellIndex;
			    	var row = indexChild;
			    	
			    	var template = dijit.byId(node.id);
			    	var portlet = new dojox.widget.Portlet({
			    		"title": template.get("title"),
			    		"content": template.get("content"),
			    		"toggleable": true,
			    		"closable": template["instanceClosable"]?true:false,
			    		"open": true
			    	});
			    	portlet["url"] = template.url;
				    var container = dijit.byId("portletsContainer");
				    container.addChild(portlet, col, row);
				    
				    portlet.toggle();
				    portlet.toggle();
			   }});
		} catch(e) {
			console.error(e);
		}
	}
});

var saveMyPages = function(){
	var container = dijit.byId("portletsContainer");
	var arr = container.get("colWidths");
	var cols = [];
	for(i=0;i<arr.length;i++){
		cols.push({index: ""+ i, width: arr[i]});
	}
	var portlets = container.getChildren();
	var dps = [];
	for(i=0;i<portlets.length;i++){
		dps.push({url: portlets[i].url, content:portlets[i].content, open: portlets[i].open, closable: portlets[i].closable, title: portlets[i].title, columnId: ""+portlets[i].column});
	}
	
	var data = {
		myPages: {currentPortletsContainer:cols, deployedPortlets:dps},
		dse_operationName:"SaveMyPagesOp",
		dse_applicationId:"-1",
		dse_pageId:"-1",
		dse_sessionId:"<%=sessionId%>"
	};
	
	AjaxUtil.xhrPost( {
		headers : {
			'requesttype':'ajax'
		},
		contentType: "application/json",
		url : "SaveMyPages",
		handleAs : "json",
		success : function(ok){ console.log("ok");},
		error : function(ok){ console.log("error");},
	}, data);
}
</script>
</head>
<body class="claro">
	<h1>My Pages</h1>
	<div>Hello customer !</div>
	<button id="saveMyPages" onclick="saveMyPages();">Save My Pages</button>
	<div id="portletsRepoBox">
		<div id="portletsRepoContainer">

		</div>
	</div>
	<div id="portletsContainer" style="width: 100%; border: 0px">
	</div>
</body>
</html>