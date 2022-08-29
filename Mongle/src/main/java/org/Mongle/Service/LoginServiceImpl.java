package org.Mongle.Service;

import javax.servlet.http.HttpSession;

import org.Mongle.Mapper.LoginDAO;
import org.Mongle.model.LoginDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	LoginDAO ldao;
	
	// 로그인 select
		public boolean login(LoginDTO ldto, HttpSession session) {
			LoginDTO login=ldao.login(ldto);
			boolean result=false;
			// login가 null이 아니면
			if(login!=null) {
				System.out.println("세션값");
				session.setAttribute("login", login);
				System.out.println("세션값 ="+session.getAttribute("login"));
				result=true;
			}
			return result;
		}

		public int logincheck(LoginDTO mdto) {
			
			return 0;
		}
}
