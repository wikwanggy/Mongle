package org.Mongle.controller;

import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.Mongle.Service.PlaceLikeService;
import org.Mongle.Service.PlaceService;
import org.Mongle.model.LoginDTO;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class PlaceController {
	// 포함관계
	@Autowired
	PlaceService ps;
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
	public String content(PlaceVO pvo, Model model, LoginDTO login,HttpSession session) {
		model.addAttribute("detail", ps.detail(pvo));
		ps.cntup(pvo);
		
		
		// 세션 id 가져와서 plvo.likecheck 호출해야함
		// ajax로 받거나 세션으로 바로 받아야하는데 세션으로 바로 받는게 더 효율적이므로 세션으로 받기
		// id만 받으면 likecheck 적용돼서 다 되는데 ㅠㅠㅠㅠㅠㅠㅠㅠㅠ
		
		String id=session.getId();
		int bno=pvo.getBno();
		//String id=(String)session.getAttribute(name);
		System.out.println("id="+id);
		PlaceLikeVO plvo=new PlaceLikeVO();
		plvo.setBno(bno);
		plvo.setId(id);

		try {
			int like=pls.findLike(bno,id);
			model.addAttribute("like",like);
			System.out.println("findLike:"+pls.findLike(bno,id));
		//model.addAttribute("getLike",pls.getLike(bno));
		}catch(NullPointerException e) {
			model.addAttribute("like","0");
		}
		return "place/detail";
	}
	//좋아요
	@ResponseBody 
	@PostMapping("/likeUp")
	public void likeup(@RequestBody PlaceLikeVO plvo,int bno,String id) {
		System.out.println("컨트롤러 연결 성공");
		System.out.println(plvo);
		pls.likeUp(bno, id);
		pls.placeLikeUp(plvo.getBno());
	}
	//좋아요취소
	@ResponseBody
	@PostMapping("/likeDown")
	public void likeDown(@RequestBody PlaceLikeVO plvo) {
		System.out.println("좋아요 싫어요!");
		pls.likeDown(plvo.getBno(), plvo.getId());
		pls.placeLikeDown(plvo.getBno());
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