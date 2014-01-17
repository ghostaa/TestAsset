<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String sessionId = request.getSession().getId();
%>

<html>
<head>
<title>Welcome to Internet Bank !</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<style>
#three {
	background: #e3e3e3;
}
</style>
</head>

<body>
<a href="Request?dse_sessionId=<%=sessionId %>&dse_applicationId=-1&dse_pageId=1&dse_processorState=initial&dse_operationName=MyPagesOp">My Bank</a>
</body>
</html>