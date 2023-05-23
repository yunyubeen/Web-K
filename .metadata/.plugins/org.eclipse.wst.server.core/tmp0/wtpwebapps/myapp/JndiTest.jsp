<%@page	language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
		import="java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>[JDBC/JNDI]</title></head>
<style>body {font-size: 24pt;}</style>
<body>
<%	// context.xml, web.xml 미설정: 500-error(서버 프로그램 오류)
	request.setCharacterEncoding("utf-8");
	Context ic = new InitialContext();
	Context ec = (Context) ic.lookup("java:/comp/env");
	DataSource ds = (DataSource) ec.lookup("jdbc/mysql");
	Connection conn = ds.getConnection();
	Statement st = conn.createStatement();
	PreparedStatement ps = null;
	ResultSet rs = null;
	int acc, bal;
	String name;
	String d0 = "DROP TABLE IF EXISTS bank1, bank2";
	String c1 = "CREATE TABLE bank1 (acc INT NOT NULL PRIMARY KEY, name VARCHAR(10), bal INT)";
	String i1 = "INSERT INTO bank1 VALUES (100, '흥부', 10000)";
	String c2 = "CREATE TABLE bank2 (acc INT NOT NULL PRIMARY KEY, name VARCHAR(10), bal INT)";
	String i2 = "INSERT INTO bank2 VALUES (200, '놀부', 20000)";
	ps = conn.prepareStatement(d0);
	ps.executeUpdate();
	ps = conn.prepareStatement(c1);
	ps.executeUpdate();
	ps = conn.prepareStatement(i1);
	ps.executeUpdate();
	ps = conn.prepareStatement(c2);
	ps.executeUpdate();
	ps = conn.prepareStatement(i2);
	ps.executeUpdate();
	rs = st.executeQuery("SELECT * FROM bank1");
	if (rs != null) {
		while (rs.next()) {
			acc = rs.getInt("acc");
			name = rs.getString("name");
			bal = rs.getInt("bal");
%>
[Bank1 계좌] 계좌번호:<%=acc%>, 예금주:<%=name%>, 잔액:<%=bal%><br />
<%
		}
	}
	rs = st.executeQuery("SELECT * FROM bank2");
	if (rs != null) {
		while (rs.next()) {
			acc = rs.getInt("acc");
			name = rs.getString("name");
			bal = rs.getInt("bal");
%>
[Bank2 계좌] 계좌번호:<%=acc%>, 예금주:<%=name%>, 잔액:<%=bal%>
<%
		}
	}
	rs.close();  ps.close();  st.close();  conn.close();
%>
</body>
</html>