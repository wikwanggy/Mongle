package org.Mongle.Service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.Mongle.model.LoginDTO;
import org.Mongle.model.SignupDTO;

public interface LoginService {
	// 서비스부분
	// 로그인
	public boolean login(LoginDTO mdto, HttpSession session);
	// 로그인체크
	public int logincheck(LoginDTO mdto);
	// 회원가입
	public void signup(SignupDTO sd);
	// 멤버 리스트
	public ArrayList<SignupDTO> list();
	// 회원정보 상세 
	public SignupDTO detail(SignupDTO sdto);
	// 회원정보 상세 
	public void modify(SignupDTO sdto);
	// 회원정보 상세 
	public void leave(SignupDTO sdto);
	// 로그인체크
	public LoginDTO idcheck(String id);
	
}