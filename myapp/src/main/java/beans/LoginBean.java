package beans;

public class LoginBean {
	private String id, pw;		
	final String aid="adm", pwd="1248";	

	public boolean checkUser() {		
		if(id.equals(aid) && pw.equals(pwd)) return true;
		else return false;
	}

	public String getId() {return id;}		// getter
	public void setId(String id) {this.id=id;}		// setter
	public String getPw() {return pw;}		// getter
	public void setPw(String pw) {this.pw=pw;}	// setter
}