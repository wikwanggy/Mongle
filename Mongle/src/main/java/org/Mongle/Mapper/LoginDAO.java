package org.Mongle.Mapper;

import org.Mongle.model.LoginDTO;
import org.Mongle.model.SignupDTO;

public interface LoginDAO {
	// 로그인 select
	public LoginDTO login(LoginDTO ldto);
	// 회원가입
	public void signup(SignupDTO sd);


}