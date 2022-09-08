package org.Mongle.Mapper;

import java.util.ArrayList;

import org.Mongle.model.LoginDTO;
import org.Mongle.model.SignupDTO;
//
public interface LoginDAO {
	// 로그인 select
	public LoginDTO login(LoginDTO ldto);
	// 회원가입
	public void signup(SignupDTO sd);
	// 회원 멤버리스트
	public ArrayList<SignupDTO> list();
	// 회원정보 상세
	public SignupDTO detail(SignupDTO sdto);
	// 회원정보 수정
	public void modify(SignupDTO sdto);
	// 회원탈퇴
	public void leave(SignupDTO sdto);
	
	public LoginDTO idcheck(String id);
	

}