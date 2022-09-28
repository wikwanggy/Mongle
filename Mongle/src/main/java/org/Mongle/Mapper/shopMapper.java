package org.Mongle.Mapper;

import java.util.ArrayList;

import org.Mongle.model.SCriteriaVO;
import org.Mongle.model.shopCategoryVO;
import org.Mongle.model.shopVO;
import org.Mongle.model.shopitemVO;

public interface shopMapper {
	// 상품 등록 설계 (shopVo : 게시판정보+파일업로드 정보)
	public void write(shopVO shop);

	// 상품등록(분류)
	public ArrayList<shopCategoryVO> c_type1();

	public ArrayList<shopCategoryVO> c_type2(String shop);

	// 상품 목록 리스트 설계
	public ArrayList<shopVO> shop(SCriteriaVO scrit);

	// 상품 상세 내용보기 메인 이미지 설계
	public shopVO main(shopVO shop);

	// 상품 상세 내용보기 서브 이미지 설계
	public ArrayList<shopVO> sub(shopVO shop);

	// 문의 등록
	public void s_write(shopitemVO item);

	// 문의 목록 리스트 설계
	public ArrayList<shopitemVO> s_item(shopVO shop);
	
	// 상품 수정 설계
	public void modify(shopVO shop);

	// 상품 삭제 설계
	public void remove(shopVO shop);

	// board테이블 전체건수 DB설계
	public int total(SCriteriaVO scri);
}
