<%@page	language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>[내부객체]</title></head>
<style>body {font-size: 24pt;}</style>
<body>
[request 예]<br/>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String number = request.getParameter("number");
	String gender = request.getParameter("gender");
	String major = request.getParameter("major");
	if (gender.equals("boy")) {gender = "남자";}
	else {gender = "여자";}
%>
성명: <%=name%><br/>
학번: <%=number%><br/>
성별: <%=gender%><br/>
전공: <%=major%>
</body>
</html>