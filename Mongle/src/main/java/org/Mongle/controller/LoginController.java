package org.Mongle.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.Mongle.Service.LoginService;
import org.Mongle.model.LoginDTO;
import org.Mongle.model.SignupDTO;
import org.Mongle.model.adminCriteriaDTO;
import org.Mongle.model.adminPageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public ResponseEntity<String> logincheck(@RequestBody LoginDTO ldto) {
		System.out.println("controller="+ldto);
		int result = ls.logincheck(ldto);
		System.out.println("result 결과" + result);
		
		return result==1?new ResponseEntity<>("success", HttpStatus.OK)
						:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// id찾기
		@GetMapping("/Login/searchidcheck/{name}/{email}/{number}")
		public ResponseEntity<LoginDTO> searchidcheck(@PathVariable String name,@PathVariable String email,@PathVariable String number) {
			System.out.println("controller="+name);
			System.out.println("controller="+email);
			System.out.println("controller="+number);
			return new ResponseEntity<>(ls.searchidcheck(name,email,number), HttpStatus.OK);

	}
	// pw찾기
	@GetMapping("/Login/searchpwcheck/{name}/{id}/{email}/{number}")
	public ResponseEntity<LoginDTO> searchpwcheck(@PathVariable String name,@PathVariable String id,@PathVariable String email,@PathVariable String number) {
		System.out.println("controller="+id);
		System.out.println("controller="+name);
		System.out.println("controller="+email);
		System.out.println("controller="+number);
	return new ResponseEntity<>(ls.searchpwcheck(name,id,email,number), HttpStatus.OK);

	}
	// ID찾기 이동
	@GetMapping("/Login/searchID")
	public void getsearchID() {
		
	}
	// PW찾기 이동
	@GetMapping("/Login/searchPW")
	public void getsearchPW() {
			
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
	// 아이디 중복 체크
		
	@GetMapping("/Signup/Signup/idcheck/{id}")
	//                  @PathVariable
	public ResponseEntity<LoginDTO> idcheck(@PathVariable("id") String id) {
		System.out.println(id);
		return new ResponseEntity<>(ls.idcheck(id), HttpStatus.OK);

	}
	// email 중복체크
	
		@GetMapping("/Signup/Signup/emailcheck/{email}")
		//                  @PathVariable
		public ResponseEntity<LoginDTO> emailcheck(@PathVariable("email") String email) {
			System.out.println(email);
			return new ResponseEntity<>(ls.emailcheck(email), HttpStatus.OK);
		}

	// 회원 페이지 이동
	@GetMapping("/mypage/mypage")
	public void mypagemove(SignupDTO sdto,Model model) {
		model.addAttribute("mypage",ls.detail(sdto));
	}
	// 회원정보 수정페이지로 이동
	@GetMapping("/mypage/detail")
	public void detail(SignupDTO sdto,Model model) {
		
		model.addAttribute("mdetail", ls.detail(sdto));

	}
	// 회원정보 상세
	@PostMapping("/mypage/detail")
	public String detailpost(SignupDTO sdto,Model model) {
		
		
		return "/mypage/detail";
		
	}
	// 회원정보 수정
	@PostMapping("/mypage/modify")
	public String modify(SignupDTO sdto, RedirectAttributes rttr ,HttpSession session ) {
		System.out.println(sdto);
		ls.modify(sdto);
		rttr.addAttribute("id",sdto.getId());
		return "redirect:/mypage/mypage";
	}
	
	
	// 회원 탈퇴
	@GetMapping("/mypage/leave")
	public String leave(SignupDTO sdto,HttpSession session) {
		ls.leave(sdto);
		session.invalidate();
		return "redirect:/";
	}
	// 회원리스트
	@GetMapping("/Admin/Memberlist")
	public String list(Model model, adminCriteriaDTO cri) {
		model.addAttribute("list",ls.list(cri));
		int total = ls.total(cri);
		//model.addAttribute("paging",new PageVo(cri,190));
		model.addAttribute("paging",new adminPageDTO(cri,total));
		return "/Admin/Memberlist";
	}
	// 관리자로 로그인 후 멤버리스트에서 상세정보로 이동
	@GetMapping("/Admin/listdetail")
	public void listdetail(SignupDTO sdto,Model model) {
		model.addAttribute("mypage",ls.detail(sdto));
	}
	// 관리자로 로그인 후 멤버리스트 상세정보들어가서 회원삭제
	@GetMapping("/Admin/leave")
	public String adminleave(SignupDTO sdto,HttpSession session) {
		ls.leave(sdto);
		return "redirect:/Admin/Memberlist";
	}
	/* 비밀번호 찾기 */
	@RequestMapping(value = "/Login/findpw", method = RequestMethod.GET)
	public void findPwGET() throws Exception{
	}

	@RequestMapping(value = "/Login/findpw", method = RequestMethod.POST)
	public void findPwPOST(@ModelAttribute LoginDTO ldto, HttpServletResponse response) throws Exception{
		System.out.println("findPw");
		ls.findPw(response, ldto);
	}
}
