package org.Mongle.controller;

import org.Mongle.model.BoardVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@RequestMapping(value = "/community/list", method = RequestMethod.GET)
	// 게시판 목록 리스트
	public String list() {
		return "/community/list";
	}
	// 게시판 상세 페이지
	@RequestMapping(value = "/community/detail", method = RequestMethod.GET)
	public String detail() {
		return "/community/detail";
	}
	// 게시판 수정 및 삭제 페이지
	@RequestMapping(value = "/community/update", method = RequestMethod.GET)
	public String update() {
		return "/community/update";
	}
	@RequestMapping(value = "/community/delete", method = RequestMethod.GET)
	public String delete() {
		return "/community/delete";
	}
	
	// 게시판 글쓰기 페이지(화면)
	@RequestMapping(value="/community/write", method=RequestMethod.GET)
	public String write() {
		return "/community/write";
	}
	// 게시판 글쓰기 페이지(insert가 이루어짐)
	/*@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public void writePost(String title,String content) {
		System.out.println(title);
		System.out.println(content);
		return content;//
	}*/
	@RequestMapping(value="/community/write", method=RequestMethod.POST)
	public String writePost(BoardVo bvo) {
		return "redirect:/community/list";
	}
	//상품후기 게시판
	@RequestMapping(value="/community/review", method=RequestMethod.GET)
	public String review() {
		return "/community/review";
	}
}
