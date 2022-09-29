package org.Mongle.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.Mongle.Service.PlaceLikeService;
import org.Mongle.Service.PlaceService;
import org.Mongle.model.PlaceAttachFileVO;
import org.Mongle.model.PlaceCriteriaVO;
import org.Mongle.model.PlaceLikeVO;
import org.Mongle.model.PlacePageVO;
import org.Mongle.model.PlaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class PlaceController {
	// 포함관계
	@Autowired
	PlaceService ps;
	@Autowired
	PlaceLikeService pls;

	@RequestMapping(value = "/place/board", method = RequestMethod.GET)
	public String board(Model model, PlaceCriteriaVO pcri, PlaceVO pvo, HttpSession session) {

		ps.replycnt(pvo);

		model.addAttribute("list", ps.list(pcri));

		int total = ps.total(pcri);
		model.addAttribute("paging", new PlacePageVO(pcri, total));

		System.out.println("controller PlaceCriteriaVO = " + pcri);
		return "place/board";
	}

	// place-write
	@RequestMapping(value = "/place/write", method = RequestMethod.GET)
	public String writeget(HttpSession session) {
		return "place/write";
	}

	@RequestMapping(value = "/place/write", method = RequestMethod.POST)
	public String writepost(PlaceVO pvo, HttpSession session) {
		// boolean result= ls.login(ldto, session);
		ps.write(pvo);
		return "redirect:/place/board";
	}

	// 해당게시물의 첨부파일의 데이터를 ajax로 전송
	@RequestMapping(value = "/placeattachlist", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<PlaceAttachFileVO>> uploadAjaxPost(int bno) {

		return new ResponseEntity<>(ps.attachlist(bno), HttpStatus.OK);
	}

	// place-content
	@RequestMapping(value = "/place/detail", method = RequestMethod.GET)
	public String content(PlaceVO pvo,PlaceLikeVO plvo, Model model,HttpSession session) {
		model.addAttribute("detail", ps.detail(pvo));
		ps.cntup(pvo);
		int bno = (int)pvo.getBno();
		String id=(String) session.getAttribute("loginId");
		plvo.setBno(bno);
		plvo.setId(id);
		System.out.println(plvo);
		try {
			model.addAttribute("like", pls.findLike(plvo));
			System.out.println("like:"+pls.findLike(plvo));
			
		}catch(Exception e) {
			model.addAttribute("like", "0");
			System.out.println("null");
		}
		return "place/detail";
	}

	// 좋아요
	@ResponseBody
	@PostMapping("/likeUp")
	public void likeup(@RequestBody PlaceLikeVO plvo) {
		System.out.println("좋아요성공");
		pls.likeUp(plvo);
		pls.placeLikeUp(plvo);
	}

	// 좋아요취소
	@ResponseBody
	@PostMapping("/likeDown")
	public void likeDown(@RequestBody PlaceLikeVO plvo) {
		System.out.println("좋아요취소");
		pls.likeDown(plvo);
		pls.placeLikeDown(plvo);
	}

	@RequestMapping(value = "/place/modifyform", method = RequestMethod.GET)
	public String modifyform(PlaceVO pvo, Model model, HttpSession session) {
		model.addAttribute("detail", ps.detail(pvo));
		return "place/modifyform";
	}

	@RequestMapping(value = "/place/modify", method = RequestMethod.POST)
	public String modify(PlaceVO pvo, RedirectAttributes rttr, HttpSession session) {
		// 글 수정
		ps.modify(pvo);
		rttr.addAttribute("bno", pvo.getBno());
		return "redirect:/place/detail";
	}

	@RequestMapping(value = "/place/remove", method = RequestMethod.GET)
	public String remove(PlaceVO pvo, HttpSession session) {
		// 글 삭제
		ps.remove(pvo);
		return "redirect:/place/board";
	}

}