package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.model.goodsVO;
import org.Mongle.model.shopVO;

public interface shopAttachService {
	// 상품 등록 게시판     (shopVo : 게시판정보 + 파일 업로드 정보
	public void write(shopVO shop);
	
	// 첨부파일 조회 설계
	public ArrayList<goodsVO> Detaillist(int product_id);
}
