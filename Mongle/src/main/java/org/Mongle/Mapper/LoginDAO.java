package org.Mongle.Mapper;

import org.Mongle.model.LoginDTO;

public interface LoginDAO {
	// 로그인 select
	public LoginDTO login(LoginDTO ldto);

}
