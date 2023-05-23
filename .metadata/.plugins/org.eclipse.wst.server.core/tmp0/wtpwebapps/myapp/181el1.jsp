<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--@page isELIgnored="true"--%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>[EL-1]</title></head>
<style>body {font-size: 24pt;}</style>
<body>
<%
	session.setAttribute("o1", Integer.valueOf(20));  
	session.setAttribute("o2", Integer.valueOf(10));
	String tArray[]={"표현언어", "연산"};
	request.setAttribute("title", tArray);
%>
<%-- <jsp:forward page="181el2.jsp"/>   이거 주석 없애보고 한 번 해보기 위에도 있음 확인하기  --%> 
${title[0]} ${title[1]}-1 (o1=${o1}, o2=${o2})<br/> 
1. &#36;{o1+o2} = ${o1+o2}<br/>
2. &#36;{o1-o2} = ${o1-o2}<br/>
3. &#36;{o1*o2} = ${o1*o2}<br/>
4. &#36;{o1/o2} = ${o1/o2}<br/>
</body>
</html>