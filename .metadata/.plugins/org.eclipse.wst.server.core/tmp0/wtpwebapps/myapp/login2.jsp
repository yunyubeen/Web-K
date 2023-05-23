<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증 성공</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String adm = "adm";
	String pwd = "1248";
	
	if (id.equals(adm) && pw.equals(pwd)) {
	
		session.setAttribute("user", adm);
		response.sendRedirect("register.jsp");
		
	} else {
		response.sendRedirect("login2.html");
	}
%>
</body>
</html>