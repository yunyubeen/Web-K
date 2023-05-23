<%@page	language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>[세션: 설정]</title></head>
<body>
<%
	session.setAttribute("id", request.getParameter("id"));
	session.setAttribute("pw", request.getParameter("pw")); //54분 부터 
	response.sendRedirect("121sessionGet.jsp");
%>
</body>
</html>