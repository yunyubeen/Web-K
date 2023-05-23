package beans;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class BeanJndi {	// JNDI
	Connection conn = null;
	Statement st = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public void connect() {
		try {
			Context ic = new InitialContext();
			Context ec = (Context) ic.lookup("java:/comp/env");
			DataSource ds = (DataSource) ec.lookup("jdbc/mysql");
			conn = ds.getConnection();
			st = conn.createStatement();
		} catch (Exception e) { e.printStackTrace(); }
	}

	public void disconnect() {
		try {
			if (conn != null) {
				rs.close(); st.close(); ps.close(); conn.close();
			}
		} catch (SQLException e) { e.printStackTrace(); }
	}

	public void createTables() {
		try {
			String d0 = "DROP TABLE IF EXISTS dm, cl";
			String c1 = "CREATE TABLE cl (cid INT NOT NULL AUTO_INCREMENT PRIMARY KEY, name VARCHAR(10), area VARCHAR(10))";
			String c2 = "CREATE TABLE dm (dmno INT NOT NULL AUTO_INCREMENT PRIMARY KEY, cid INT, dmdate VARCHAR(10), CONSTRAINT cl_cid_fk FOREIGN KEY (cid) REFERENCES cl (cid))";
			String i1 = "INSERT INTO cl (name, area) VALUES ('안중근', '서울'), ('이순신', '대전'), ('정약용', '서울')";
			String i2 = "INSERT INTO dm (cid, dmdate) VALUES (2, '0301'), (3, '0401'), (1, '0501'), (2, '0601')";
			ps = conn.prepareStatement(d0);
			ps.executeUpdate();
			ps = conn.prepareStatement(c1);
			ps.executeUpdate();
			ps = conn.prepareStatement(c2);
			ps.executeUpdate();
			ps = conn.prepareStatement(i1);
			ps.executeUpdate();
			ps = conn.prepareStatement(i2);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public boolean insertDm(int cid, String dmdate) {	// transaction
		boolean ins = true;
		try {
			conn.setAutoCommit(false);		// default: conn.setAutoCommit(true)
			ps = conn.prepareStatement("INSERT INTO dm (cid, dmdate) VALUES (?, ?)");
			ps.setInt(1, cid);
			ps.setString(2, dmdate);
			ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return ins;
	}

	public ResultSet selectDm() {
		try {
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return rs;
	}

	public ResultSet selectDmName() {
		try {
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return rs;
	}

	public ResultSet selectDmArea() {
		try {
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return rs;
	}
}