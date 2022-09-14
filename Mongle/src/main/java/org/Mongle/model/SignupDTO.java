package org.Mongle.model;

public class SignupDTO {
	private String id;
	private String password;
	private String name;
	private String bth;
	private String gender;
	private String email;
//셋팅
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

	public String getBth() {
		return bth;
	}

	public void setBth(String bth) {
		this.bth = bth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "SignupDTO [id=" + id + ", password=" + password + ", name=" + name + ", bth=" + bth + ", gender="
				+ gender + ", email=" + email + "]";
	}

}