package org.Mongle.controller;

import java.util.ArrayList;

import org.Mongle.Service.shopService;
import org.Mongle.model.SCriteriaVO;
import org.Mongle.model.shopCategoryVO;
import org.Mongle.model.shopVO;
import org.Mongle.model.shopcartVO;
import org.Mongle.model.shopitemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class shopController {
	@Autowired
	shopService ss;

	// 상품 등록 페이지 실행
	// 상품 등록 대분류
	@RequestMapping(value = "/shoppage/shop_board", method = RequestMethod.GET)
	public String shop_board(String shop, Model model) {
		model.addAttribute("c_type1", ss.c_type1()); // shop_board.jsp가 실행하자마자 1분류 select
		return "shoppage/shop_board"; // url주소가 매핑이 되면, shoppage폴더 안에 있는 shop_board.jsp실행
	}

	// 상품 등록 소분류
	@RequestMapping(value = "/shop/{s}", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<shopCategoryVO>> getshop_board(@PathVariable String s) {
		System.out.println("shop=" + s);
		return new ResponseEntity<>(ss.c_type2(s), HttpStatus.OK);
	}

	// 상품 등록
	@RequestMapping(value = "/shoppage/shop_board", method = RequestMethod.POST)
	public String writepost(shopVO shop) {
		System.out.println("shop1=" + shop);
		// 비즈니스 영역 연결한 후 Service에 있는 write메소드를 호출
		ss.write(shop);
		return "redirect:/shoppage/shop";
	}

	// 상품 등록 리스트
	@RequestMapping(value = "/shoppage/shop_list", method = RequestMethod.GET)
	public String getlist(Model model, shopVO shop) {
		model.addAttribute("shop_list", ss.shop_list(shop));
		return "/shoppage/shop_list";
	}

	// 상품 리스트
	@RequestMapping(value = "/shoppage/shop", method = RequestMethod.GET)
	public String shop(Model model, shopVO shop) {
		model.addAttribute("shop", ss.shop(shop));		
		return "/shoppage/shop";
	}

	// 상품 탭 목록
	@RequestMapping(value = "/shoppage/page", method = RequestMethod.GET)
	public String Coner(shopVO shop, Model model) {
		System.out.println("controller="+shop);
		model.addAttribute("page",ss.page(shop));
		model.addAttribute("main",ss.main(shop));
		model.addAttribute("sub",ss.sub(shop));		
		return "shoppage/page";
	}

	// 상품 상세설명
	@RequestMapping(value = "/shoppage/Detail", method = RequestMethod.GET)
	public String detail(shopVO shop, Model model, SCriteriaVO scri) {
		System.out.println(shop);
		model.addAttribute("main", ss.main(shop));
		model.addAttribute("sub", ss.sub(shop));
		model.addAttribute("item", ss.s_item(shop));
		return "/shoppage/Detail";
	}

	// 문의하기
	@RequestMapping(value = "/shoppage/shop_item", method = RequestMethod.GET)
	public String s_writeget(shopVO shop, Model model) {
		model.addAttribute("item", ss.main(shop));
		return "/shoppage/shop_item";
	}
	@RequestMapping(value = "/shoppage/shop_item", method = RequestMethod.POST)
	public String s_writepost(shopitemVO item) {
		ss.s_write(item);
		return "redirect:/shoppage/shop";
	}

	// 상품 수정 페이지
	@RequestMapping(value = "/shoppage/shop_list_detail", method = RequestMethod.GET)
	public String list_detail(shopVO shop, Model model) {
		model.addAttribute("main", ss.main(shop));
		model.addAttribute("sub", ss.sub(shop));
		return "/shoppage/shop_list_detail";
	}

	// 상품 수정
	@RequestMapping(value = "/shoppage/modify", method = RequestMethod.POST)
	public String modify(shopVO shop, RedirectAttributes rttr) {
		ss.modify(shop);
		System.out.println(shop);
		rttr.addAttribute("bno", shop.getBno());
		return "redirect:/shoppage/shop_list";
	}

	// 상품 삭제
	@RequestMapping(value = "/shoppage/remove", method = RequestMethod.POST)
	public String remove(shopVO shop) {
		ss.remove(shop);
		return "redirect:/shoppage/shop";
	}
	
	// 장바구니 담기
	@RequestMapping(value = "/basket", method = RequestMethod.POST)
	public String basket(shopcartVO cart) {
		ss.cartinsert(cart);
		return "redirect:/shoppage/shop";
	}
	
	// 장바구니 리스트
	@RequestMapping(value = "/shoppage/cart", method = RequestMethod.GET)
	public String cartlist(Model model, shopcartVO cart, shopVO shop) {
		model.addAttribute("list",ss.cartlist(shop));
		model.addAttribute("list2",ss.cartlist2(cart));
		return "shoppage/cart";
	}
}
