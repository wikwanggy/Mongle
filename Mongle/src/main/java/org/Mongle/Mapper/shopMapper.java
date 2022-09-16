package org.Mongle.Mapper;

import java.util.ArrayList;


import org.Mongle.model.SCriteriaVO;
import org.Mongle.model.shopVO;

public interface shopMapper {
	// 상품 등록 설계 (shopVo : 게시판정보+파일업로드 정보)
	public void write(shopVO shop);

	// 상품 목록 리스트 설계
	public ArrayList<shopVO> shop(SCriteriaVO scrit);

	// 상품 상세 내용보기 설계
	public shopVO detail(shopVO shop);

	// 상품 수정 설계
	public void modify(shopVO shop);

	// 상품 삭제 설계
	public void remove(shopVO shop);

	// board테이블 전체건수 DB설계
	public int total(SCriteriaVO scri);
}
