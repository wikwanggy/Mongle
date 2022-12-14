package org.Mongle.Service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.Mongle.model.LoginDTO;
import org.Mongle.model.SignupDTO;
import org.Mongle.model.adminCriteriaDTO;

public interface LoginService {
	// 서비스부분
	// 로그인
	public boolean login(LoginDTO mdto, HttpSession session);

	// 회원가입
	public void signup(SignupDTO sd);
	// 멤버 리스트
	public ArrayList<SignupDTO> list(adminCriteriaDTO cri);
	// 회원정보 상세 
	public SignupDTO detail(SignupDTO sdto);
	// 회원정보 상세 
	public void modify(SignupDTO sdto);
	// 회원정보 상세 
	public void leave(SignupDTO sdto);
	// id 중복체크
	public LoginDTO idcheck(String id);
	// email 중복체크
	public LoginDTO emailcheck(String email);
	// memberlist테이블 전체건수 설계
	public int total(adminCriteriaDTO cri);
	// 로그인체크
	public int logincheck(LoginDTO ldto);
	// id찾기
	public LoginDTO searchidcheck(String name, String email, String number);
	// pw 찾기
	public LoginDTO searchpwcheck(String name,String id, String email, String number);
	//이메일발송
	//public void sendEmail(LoginDTO ldto, String div) throws Exception;

	//비밀번호찾기
	public void findPw(HttpServletResponse resp, LoginDTO ldto) throws Exception;

	void sendEmail(LoginDTO ldto, String div) throws Exception;

	

}