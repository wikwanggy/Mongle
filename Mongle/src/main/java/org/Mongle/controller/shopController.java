package org.Mongle.controller;

import java.util.ArrayList;

import org.Mongle.Service.shopService;
import org.Mongle.model.SAttachFileVO;
import org.Mongle.model.SCriteriaVO;
import org.Mongle.model.SPageVO;
import org.Mongle.model.shopVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class shopController {
	@Autowired
	shopService ss;

	// 상품 등록 페이지 실행
	@RequestMapping(value = "/shoppage/shop_board", method = RequestMethod.GET)
	public String writeget() {
		return "/shoppage/shop_board";
	}

	// 상품 등록
	@RequestMapping(value = "/shoppage/shop_board", method = RequestMethod.POST)
	public String writepost(shopVO shop) {
		System.out.println("shop1=" + shop);
		// 비즈니스 영역 연결한 후 Service에 있는 write메소드를 호출
		ss.write(shop);

		return "redirect:/shoppage/shop";
	}

	// 게시물의 첨부파일의 데이터를 ajax로 전송
	@RequestMapping(value = "/attachlist", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<SAttachFileVO>> uploadAjaxPost(int bno) {
		System.out.println("attachlist=" + ss.attachlist(bno));
		return new ResponseEntity<>(ss.attachlist(bno), HttpStatus.OK);
	}

	// 상품 리스트
	@RequestMapping(value = "/shoppage/shop", method = RequestMethod.GET)
	public String shop(Model model, SCriteriaVO scri) {
		model.addAttribute("shop", ss.shop(scri));
		int total = ss.total(scri);
		model.addAttribute("paging", new SPageVO(scri, total));
		return "/shoppage/shop";
	}

	// 상품 상세설명
	@RequestMapping(value = "/shoppage/Detail", method = RequestMethod.GET)
	public String detail(shopVO shop, Model model) {
		System.out.println(shop);
		model.addAttribute("main", ss.main(shop));
		model.addAttribute("sub", ss.sub(shop));
		return "/shoppage/Detail";
	}
	
	// 상품 수정
	@RequestMapping(value = "/shoppage/modify", method = RequestMethod.POST)
	public String modify(shopVO shop, RedirectAttributes rttr) {
		ss.modify(shop);
		rttr.addAttribute("bno", shop.getBno());
		return "redirect:/shoppage/shop";
	}

	// 상품 삭제
	@RequestMapping(value = "/shoppage/remove", method = RequestMethod.POST)
	public String remove(shopVO shop) {
		ss.remove(shop);
		return "redirect:/shoppage/shop";
	}

	// 상품 목록
	// 미용
	@RequestMapping(value = "/shoppage/beauty", method = RequestMethod.GET)
	public String beauty() {
		return "/shoppage/beauty";
	}

	// 기타
	@RequestMapping(value = "/shoppage/etc", method = RequestMethod.GET)
	public String etc() {
		return "/shoppage/etc";
	}

	// 패션
	@RequestMapping(value = "/shoppage/fashion", method = RequestMethod.GET)
	public String fashion() {
		return "/shoppage/fashion";
	}

	// 사료
	@RequestMapping(value = "/shoppage/feed", method = RequestMethod.GET)
	public String feed() {

		return "/shoppage/feed";
	}

	// 하우스
	@RequestMapping(value = "/shoppage/House", method = RequestMethod.GET)
	public String House() {

		return "/shoppage/House";

	}

	// 간식
	@RequestMapping(value = "/shoppage/Snack", method = RequestMethod.GET)
	public String Snack() {

		return "/shoppage/Snack";

	}

	// 장난감
	@RequestMapping(value = "/shoppage/toy", method = RequestMethod.GET)
	public String toy() {

		return "/shoppage/toy";

	}
}
