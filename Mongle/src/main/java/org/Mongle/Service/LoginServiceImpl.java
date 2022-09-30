package org.Mongle.Service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.Mongle.Mapper.LoginDAO;
import org.Mongle.model.LoginDTO;
import org.Mongle.model.SignupDTO;
import org.Mongle.model.adminCriteriaDTO;
import org.apache.commons.mail.HtmlEmail;
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
				session.setAttribute("loginId", login.getId());
				System.out.println("세션값 ="+session.getAttribute("login"));
				result=true;
			}
			return result;
		}
		// 회원가입
		public void signup(SignupDTO sd) {
			 ldao.signup(sd);
			
		}
		// 회원 리스트
		public ArrayList<SignupDTO> list(adminCriteriaDTO cri) {

			return ldao.list(cri);
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
		}// id중복체크
		
		public LoginDTO idcheck(String id) {
			
			return ldao.idcheck(id);
		}
		// email 중복체크

		public LoginDTO emailcheck(String email) {

		return ldao.emailcheck(email);
		}

	// 페이징
		public int total(adminCriteriaDTO cri) {
			return ldao.total(cri);
		}
		// 로그인체크
		public int logincheck(LoginDTO ldto) {
			System.out.println("service="+ldto);
			return ldao.logincheck(ldto);
		}
		// id찾기
		public LoginDTO searchidcheck(String name, String email, String number) {
			System.out.println("service="+name);
			System.out.println("service="+email);
			System.out.println("service="+number);
			return ldao.searchidcheck(name,email,number);
		}
		// pw찾기
		public LoginDTO searchpwcheck(String name,String id, String email, String number) {
			System.out.println("service="+id);
			System.out.println("service="+name);
			System.out.println("service="+email);
			System.out.println("service="+number);
			return ldao.searchpwcheck(name,id,email,number);
		}
		//비밀번호 찾기 이메일발송
		
		@Override
		public void sendEmail(LoginDTO ldto, String div) throws Exception {
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";//"smtp.gmail.com"; //네이버 이용시 
			String hostSMTPid = "hyye0913@naver.com";
			String hostSMTPpwd = "8586439m!";

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "hyye0913@naver.com";
			String fromName = "mongle";
			String subject = "임시비밀번호";
			String msg = "임시 비밀번호입니다.";

			if(div.equals("findpw")) {
				subject = "mongle 임시 비밀번호 입니다.";
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg += "<h3 style='color: blue;'>";
				msg += ldto.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
				msg += "<p>임시 비밀번호 : ";
				msg += ldto.getPassword() + "</p></div>";
			}

			// 받는 사람 E-Mail 주소
			String mail = ldto.getEmail();
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587); //네이버 이용시 587

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
				System.out.println("메일발송 실패 : " + e);
			}
		}
		//비밀번호찾기
		@Override
		public void findPw(HttpServletResponse response, LoginDTO ldto) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			LoginDTO ck = ldao.idcheck(ldto.getId());
			PrintWriter out = response.getWriter();
			// 가입된 아이디가 없으면
			if(ldao.idcheck(ldto.getId()) == null) {
				out.print("등록되지 않은 아이디입니다.");
				out.close();
			}
			// 가입된 이메일이 아니면
			else if(!ldto.getEmail().equals(ck.getEmail())) {
				out.print("등록되지 않은 이메일입니다.");
				out.close();
			}else {
				// 임시 비밀번호 생성
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				ldto.setPassword(pw);
				// 비밀번호 변경
				ldao.updatePassword(ldto);
				// 비밀번호 변경 메일 발송
				sendEmail(ldto, "findpw");

				out.print("이메일로 임시 비밀번호를 발송하였습니다.");
				out.close();
			}
		}
	
}