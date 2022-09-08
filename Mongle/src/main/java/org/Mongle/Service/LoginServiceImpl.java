package org.Mongle.Service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.Mongle.Mapper.LoginDAO;
import org.Mongle.model.LoginDTO;
import org.Mongle.model.SignupDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	LoginDAO ldao;
	// 서비스부브
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
		// 로그인 
		public int logincheck(LoginDTO ldto) {
			
			return 0;
		}
		// 회원가입
		public void signup(SignupDTO sd) {
			 ldao.signup(sd);
			
		}
		// 회원 리스트
		public ArrayList<SignupDTO> list() {
		
			return ldao.list();
		}
		// 회원 정보 상세
		public SignupDTO detail(SignupDTO sdto) {
		
			return ldao.detail(sdto);
		}
		// 회원정보 수정
		public void modify(SignupDTO sdto) {
			ldao.modify(sdto);
		}
		// 회원 탈퇴
		public void leave(SignupDTO sdto) {
			ldao.leave(sdto);
		}// 중복체크
		
		public LoginDTO idcheck(String id) {

			return ldao.idcheck(id);
		}
		

}