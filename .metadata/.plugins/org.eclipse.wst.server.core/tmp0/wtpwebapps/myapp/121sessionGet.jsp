<%@page	language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>[세션: 읽기]</title><style>body {font-size: 24pt;}</style></head>
<body>
<%
	out.println("id: "+session.getAttribute("id")+"<br/>");
	out.println("pw: "+session.getAttribute("pw")+"<br/>");
	String sid = session.getId(); out.println("SESSION-ID: "+sid);
	session.invalidate(); //로그아웃 할 때는 세션 invalidate() 해서 소멸  이 코드 없애고 다시 실행해볼 때 서버 클린 해줘야한다.없애고 하면 세션 아이디가 같다. 이 코드를 넣으면 세션 아이디가 달라진다.즉 새로운 세션이 만들어지는 것이다.
%>
</body>
</html>