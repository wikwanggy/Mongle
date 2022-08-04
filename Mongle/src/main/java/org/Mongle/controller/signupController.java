package org.Mongle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class signupController {
	@RequestMapping(value = "/signup/signup", method = RequestMethod.GET)
	// 게시판 목록 리스트
	public String list() {
		return "signup/signup";
	}
}
