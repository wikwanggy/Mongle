package org.Mongle.controller;

import javax.servlet.http.HttpSession;

import org.Mongle.Service.LoginService;
import org.Mongle.model.LoginDTO;
import org.Mongle.model.SignupDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {
	@Autowired
	LoginService ls;
	
	// 로그인 이동
	@GetMapping("/Login/login")
	public void getLogin(){}
	@PostMapping("/Login/loginpost")
	public String postLogin(LoginDTO ldto, HttpSession session, RedirectAttributes rttr){
		boolean result=ls.login(ldto,session);
		if(result) { // 로그인 성공
			System.out.println("로그인 성공");
			rttr.addFlashAttribute("msg","success");
			
			return "redirect:/";
		}else {
			System.out.println("로그인 실패");
			rttr.addFlashAttribute("msg","fail");
			return "redirect:/Login/login";
		}		
	}
	// 로그아웃 
	@GetMapping("/Login/logout")
	public String getLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	// 로그인 체크
	@PostMapping("/Login/logincheck")
	public ResponseEntity<String> logincheck(@RequestBody LoginDTO mdto) {
		int result = ls.logincheck(mdto);
		System.out.println("result 결과" + result);
		
		return result==1?new ResponseEntity<>("success", HttpStatus.OK)
						:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// 회원가입 이동
	@GetMapping("/Signup/Signup")
	public void getsignup() {
		
	}
	// 회원가입
	@PostMapping("/Signup/Signup")
	public String signup(SignupDTO sd) {
		ls.signup(sd);
		return "redirect:/Login/login";
	}
	
}