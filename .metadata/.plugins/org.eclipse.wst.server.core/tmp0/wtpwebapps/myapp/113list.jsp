<%@page	language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.sql.*"%>
<html>
<head><meta charset="UTF-8"><title>회원 조회</title></head>
<style>
	body, th, td {font-size: 24pt;}
	table, th, td {border: 1px solid black; text-align: center;}
</style>
<body>
<%	request.setCharacterEncoding("utf-8");
	int no;
	String id, pw, name;
	id = request.getParameter("id");
	pw = request.getParameter("pw");
	name = request.getParameter("name");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = null;
	Statement st = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String iQuery = "INSERT list (id, pw, name) VALUES (?, ?, ?)";
	try {	// PreparedStatement (CUD: 입력, 변경, 삭제)
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8", "root", "dbqls5077@");
		ps = conn.prepareStatement(iQuery);
		ps.setString(1, id);
		ps.setString(2, pw);
		ps.setString(3, name);
		ps.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	}

	try {	// Statement (R: 조회)
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC","root","dbqls5077@");
		st = conn.createStatement();
		rs = st.executeQuery("SELECT * FROM list");
	} catch (Exception e) { e.printStackTrace(); }
%>
<div align="center">
[회원 조회]
<table>
	<tr><th>#</th><th>아이디</th><th>비밀번호</th><th>이름</th></tr>
<%
	if (rs != null) {
		while (rs.next()) { no = rs.getInt("no"); id = rs.getString("id"); pw = rs.getString("pw"); name = rs.getString("name"); %>
			<tr><td><%=no%></td><td><%=id%></td><td><%=pw%></td><td><%=name%></td></tr>
<%		}
	}
	rs.close(); ps.close(); st.close(); conn.close();	%>
</table>
</div>
</body>
</html>