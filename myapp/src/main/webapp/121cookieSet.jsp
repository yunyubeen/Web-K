<%@page	language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>[쿠키: 설정]</title></head>
<body>
<%	// 쿠키 생성, id, pw 속성값 설정
	Cookie cid = new Cookie("id", request.getParameter("id"));
	Cookie cpw = new Cookie("pw", request.getParameter("pw"));
	cid.setMaxAge(60*60*24);	// 쿠키 수명(초) 설정: 60*60*24(1일)
	cpw.setMaxAge(60*60*24);	// 쿠키 수명(초) 설정: 60*60*24(1일)
	response.addCookie(cid);	// 응답 헤더에 쿠키 추가(client로 전달)
	response.addCookie(cpw);	// 응답 헤더에 쿠키 추가(client로 전달)
	response.sendRedirect("121cookieGet.jsp");   //sendRedirect 응답 객체 전달 , 재전송 
%>
</body>
</html>