<%@page	language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
		import="java.util.*, java.text.*, java.lang.*" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>[JSP 예]</title></head>
<style>body {font-size: 24pt;}</style>
<body>
<%	Date date=new Date();
	SimpleDateFormat sdate=new SimpleDateFormat("yyyy-MM-dd");
	String strdate=sdate.format(date);	%>
[HTML 페이지]<br/>
고정 날짜: 2016-09-08<br/>
오늘 날짜: <%=strdate%>
</body>
</html>