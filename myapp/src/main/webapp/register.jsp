<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
  String user = (String)session.getAttribute("user");
  if (user == null || !user.equals("adm")) {
    response.sendRedirect("login2.html");
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 DM발송내역 입력</title>
</head>
<body>

<h2>JSESSIONID(<%= session.getId() %>)에서 관리자(<%= user %>)로 로그인</h2>

<form method="post" action="retrieve.jsp">
<table>
	<tr><td>고객아이디:</td><td><input type="text" name="cid" placeholder="고객아이디" required></td></tr>   
	<tr><td>DM발송일:</td><td><input type="text" name="dmdate" placeholder="DM발송일" required></td></tr>
</table>
<input type="submit" value="등록">
</form>

</body>
</html>