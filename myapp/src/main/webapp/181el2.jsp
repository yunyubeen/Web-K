<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>[EL-2]</title></head>
<style>body {font-size: 24pt;}</style>
<body>
${requestScope.title[0]} ${requestScope.title[1]}-2 (o1=<%=session.getAttribute("o1")%>, o2=${sessionScope.o2})<br/>
1. &#36;{o1+o2} = ${sessionScope.o1+sessionScope.o2}<br/>
2. &#36;{o1-o2} = ${sessionScope.o1-sessionScope.o2}<br/>
3. &#36;{o1*o2} = ${sessionScope.o1*sessionScope.o2}<br/>
4. &#36;{o1/o2} = ${sessionScope.o1/sessionScope.o2}<br/>
</body>
</html>