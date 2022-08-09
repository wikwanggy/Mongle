package org.Mongle.controller;/**/

import org.Mongle.model.MogleMemberVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class signinController {
	@RequestMapping(value = "/signin/signin", method = RequestMethod.GET)
	// 로그인
	public String signin() {
		return "/signin/signin";
		
	}
	@RequestMapping(value = "/signup/signup", method = RequestMethod.GET)
		// 회원가입.
		public String signup() {
			return "/signup/signup";
	}
	
	@RequestMapping(value="/signin/signin", method=RequestMethod.POST)
	public void signinPost(MogleMemberVo mvo) {
		
		System.out.println(mvo);
		
	}
	@RequestMapping(value="/signtn/signup", method=RequestMethod.POST)
	public void signupPost(MogleMemberVo mvo) {
		
		System.out.println(mvo);
		
	}
	
	
}
