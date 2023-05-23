<%@page	language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>[쿠키: 읽기]</title><style>body {font-size: 24pt;}</style></head>
<body>
<%	Cookie[] cookies = request.getCookies();// 쿠키 가져오기
	if (cookies != null) {
		for (int i=0; i<cookies.length; i++) {
			out.println(cookies[i].getName()+": "+cookies[i].getValue()+"<br/>");
			cookies[i].setMaxAge(0);		// 쿠키 삭제: 쿠키 수명을 0(만료)으로 설정 -> 쿠키 소멸 
			response.addCookie(cookies[i]);	// 응답 헤더에 쿠키 추가(client로 전달) -> 클라이언트는 소멸된 쿠키만 받는 
		}
	}
%>
</body>
</html>