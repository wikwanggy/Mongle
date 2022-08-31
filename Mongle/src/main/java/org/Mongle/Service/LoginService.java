package org.Mongle.Service;

import javax.servlet.http.HttpSession;

import org.Mongle.model.LoginDTO;
import org.Mongle.model.SignupDTO;

public interface LoginService {
	// 로그인
	public boolean login(LoginDTO mdto, HttpSession session);
	// 로그인체크
	public int logincheck(LoginDTO mdto);
	// 회원가입
	public void signup(SignupDTO sd);
	

}