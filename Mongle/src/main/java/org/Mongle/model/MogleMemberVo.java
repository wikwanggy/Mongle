package org.Mongle.model;

public class MogleMemberVo {
	// 아이디(id)
	private String id;
	// 비밀번호(password)
	private String password;
	// 네임(name)
	private String name;
	// 닉네임(nickname)
	private String nickname;
	// 주소(addr)
	private String addr;
	// 폰번호(phone)
	private String phone;
	// 이메일(email)
	private String email;
	// 생년월일(btd)
	private int btd;
	
	// getter & setter 
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getBtd() {
		return btd;
	}
	public void setBtd(int btd) {
		this.btd = btd;
	}
	@Override
	public String toString() {
		return "MogleVo [id=" + id + ", password=" + password + ", name=" + name + ", nickname=" + nickname + ", addr="
				+ addr + ", phone=" + phone + ", email=" + email + ", btd=" + btd + "]";
	}
	
	
	
}
