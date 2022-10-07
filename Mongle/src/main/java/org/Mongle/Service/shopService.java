package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.model.SAttachFileVO;
import org.Mongle.model.SCriteriaVO;
import org.Mongle.model.shopCategoryVO;
import org.Mongle.model.shopVO;
import org.Mongle.model.shopitemVO;

public interface shopService {
	// 상품 등록 설계 (shopVo : 게시판정보+파일업로드 정보)
	public void write(shopVO shop);

	// 상품등록(분류)
	public ArrayList<shopCategoryVO> c_type1();

	public ArrayList<shopCategoryVO> c_type2(String shop);

	// 상품 목록 리스트 설계
	public ArrayList<shopVO> shop(SCriteriaVO scri);

	// 상품 분류
	public ArrayList<shopVO> page(shopVO shop);

	// 상품 등록 리스트
	public ArrayList<shopVO> shop_list(shopVO shop);

	// 상품 상세 내용보기 메인 이미지 설계
	public shopVO main(shopVO shop);

	// 상품 상세 내용보기 서브 이미지 설계
	public ArrayList<shopVO> sub(shopVO shop);

	// 문의 등록 설계
	public void s_write(shopitemVO item);

	// 문의 리스트 설계
	public ArrayList<shopitemVO> s_item(shopVO shop);

	// 상품 수정 설계
	public void modify(shopVO shop);

	// 상품 삭제 설계
	public void remove(shopVO shop);

	// writing테이블 전체건수 설계
	public int total(SCriteriaVO scri);

	// 썸네일 첨부파일 조회 설계
	public ArrayList<SAttachFileVO> attachlist(int bno);

}
