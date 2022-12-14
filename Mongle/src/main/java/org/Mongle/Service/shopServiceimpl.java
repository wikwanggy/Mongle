package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.Mapper.shopAttachMapper;
import org.Mongle.Mapper.shopMapper;
import org.Mongle.model.SCriteriaVO;
import org.Mongle.model.shopCategoryVO;
import org.Mongle.model.shopVO;
import org.Mongle.model.shopcartVO;
import org.Mongle.model.shopitemVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class shopServiceimpl implements shopService {
	@Autowired
	shopMapper sm; // shop(writing)테이블 mapper

	@Autowired
	shopAttachMapper sam; // Sattach테이블 mapper

	// 상품 등록 구현 (shopVo : 게시판정보+파일업로드 정보)
	public void write(shopVO shop) {
		// shopMapper에 있는 write메서드를 호출
		// 메서드의 매개변수를 통해 shopVO값을
		// shopMapper의 write메서드로 전달
		sm.write(shop);

		shop.getAttach().forEach(attach -> {

			// AttachFileVO의 bno에 BoardVO의 bno를 저장
			attach.setBno(shop.getBno());
			sam.insert(attach);
		});
	}

	// 상품 등록 리스트
	public ArrayList<shopVO> shop_list(shopVO shop) {
		return sm.shop_list(shop);
	}

	// 상품등록(분류)
	public ArrayList<shopCategoryVO> c_type1() {
		return sm.c_type1();
	}

	public ArrayList<shopCategoryVO> c_type2(String shop) {
		return sm.c_type2(shop);
	}

	// 상품 목록 리스트 구현
	public ArrayList<shopVO> shop(shopVO shop) {
		return sm.shop(shop);
	}

	// 상품 분류
	public ArrayList<shopVO> page(shopVO shop) {
		return sm.page(shop);
	}

	// 상품 상세 내용보기 메인 이미지 구현
	public shopVO main(shopVO shop) {

		return sm.main(shop);
	}

	// 상품 상세 내용보기 서브 이미지 구현
	public ArrayList<shopVO> sub(shopVO shop) {
		return sm.sub(shop);
	}

	// 문의 등록 구현
	public void s_write(shopitemVO item) {
		sm.s_write(item);
	}

	// 문의 목록리스트 구현
	public ArrayList<shopitemVO> s_item(shopVO shop) {
		return sm.s_item(shop);
	}

	// 상품 수정 구현
	public void modify(shopVO shop) {
		sm.modify(shop);
	}

	// 상품 삭제 구현
	public void remove(shopVO shop) {
		sm.remove(shop);
	}

	// 테이블 전체건수 조희 구현
	public int total(SCriteriaVO scri) {
		return sm.total(scri);
	}

	// 장바구니 담기 구현
	public void cartinsert(shopcartVO cart) {
		sm.cartinsert(cart);
	}

	// 장바구니 리스트 DB설계
	public ArrayList<shopcartVO> cartlist(shopVO shop){
		return sm.cartlist(shop);
	}
	public ArrayList<shopVO> cartlist2(shopcartVO cart){
		return sm.cartlist2(cart);
	}
}
