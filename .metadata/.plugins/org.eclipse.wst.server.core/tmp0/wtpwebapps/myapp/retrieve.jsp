<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
        import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DM발송내역 조회</title>
    <style>
        body, th, td {font-size: 24pt;}
        table, th, td {border: 1px solid black; text-align: center;}
    </style>
</head>
<body>
<%  
    request.setCharacterEncoding("utf-8");

    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("register.jsp");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8", "root", "dbqls5077@");
        
        // cl, dm table 생성 및 초기 데이터 등록
        Statement stmt = conn.createStatement();
        stmt.executeUpdate("DROP TABLE IF EXISTS cl");
        stmt.executeUpdate("DROP TABLE IF EXISTS dm");
        stmt.executeUpdate("CREATE TABLE cl (cid INT PRIMARY KEY, name VARCHAR(10), area VARCHAR(10))");
        stmt.executeUpdate("CREATE TABLE dm (dmno INT PRIMARY KEY, cid INT, dmdate VARCHAR(10), FOREIGN KEY(cid) REFERENCES cl(cid))");
        stmt.executeUpdate("INSERT INTO cl (cid, name, area) VALUES (1, '이순신', '대전'), (2, '안중근', '서울'), (3, '정약용', '서울')");
        stmt.executeUpdate("INSERT INTO dm (dmno, cid, dmdate) VALUES (1, 2, '0301'), (2, 3, '0401'), (3, 1, '0501'), (4, 2, '0601')");

        // dm 테이블과 cl 테이블을 natural join한 결과를 가져옴
        pstmt = conn.prepareStatement("SELECT * FROM dm NATURAL JOIN cl ORDER BY dmno");
        ResultSet rs = pstmt.executeQuery();

    
%>

<div align="center">
[DM발송내역 조회]
<table>
	<tr><th>DM발송번호</th><th>고객이름</th><th>고객거주지역</th><th>DM발송일</th></tr>
<%
	if (rs != null) {
		while (rs.next()) { dmno = rs.getInt("dmno"); name = rs.getString("name"); area = rs.getString("area"); dmdate = rs.getString("dmdate"); %>
			<tr><td><%=dmno%></td><td><%=name%></td><td><%=area%></td><td><%=dmdate%></td></tr> 
<%		}
		rs.close(); conn.close();
	}
%>
</table>
</div>
</body>
</html>
