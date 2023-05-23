<%@page	language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>[JSP 스크립트]</title></head>
<style>body {font-size: 24pt;}</style>
<body><h1>JSP Script Example</h1>
<%	String scriptlet="스크립트릿(Scriptlet)";
	String comment="주석(Comment)";
	out.print("①내부객체로 "+declaration+" 출력<br/>");	%>
②표현식으로 <%=declaration /* 표현식 */%> 출력<br/>
③표현식으로 <%=decMethod( ) /* (Expression) */%> 출력<br/>
④표현식으로 <%=scriptlet /* 표현식 */%> 출력<br/>
<%!String declaration="선언문(Declaration)";%>
<%!public String decMethod( ) {return declaration;}%>
<%-- ⑴JSP 주석(Comment): <%=comment%> --%>
<%/* ⑵Java 주석(여러 줄) */%><%// ⑵Java 주석(한 줄)
%>
<!-- ⑶HTML 주석(Comment): <%=comment%> --><br/>
</body>
</html>