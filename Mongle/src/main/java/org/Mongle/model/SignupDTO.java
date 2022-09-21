package org.Mongle.model;

public class SignupDTO {
	private String id ;
	private String password  ;
	private String email ;
	private String name ;
	private String gender;
	private String bth;
	private String addr;
	private String number;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBth() {
		return bth;
	}
	public void setBth(String bth) {
		this.bth = bth;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	@Override
	public String toString() {
		return "LoginDTO [id=" + id + ", password=" + password + ", email=" + email + ", name=" + name + ", gender="
				+ gender + ", bth=" + bth + ", addr=" + addr + ", number=" + number + "]";
	}
	
	
}