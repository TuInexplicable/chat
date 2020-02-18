package domain;

import java.io.Serializable;

public class UserBean implements Serializable {
	private String account;
	private String username;
	private String password;
	private String email;
	private String mininame;
	private String date;
	private String sex;
	public UserBean() {
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMininame() {
		return mininame;
	}
	public void setMininame(String mininame) {
		this.mininame = mininame;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
}
