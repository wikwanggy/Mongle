package org.Mongle.Service;

import javax.servlet.http.HttpSession;

import org.Mongle.model.LoginDTO;

public interface LoginService {
	public boolean login(LoginDTO mdto, HttpSession session);

	public int logincheck(LoginDTO mdto);

}
