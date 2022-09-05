package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.Mapper.goodsMapper;
import org.Mongle.Mapper.shopMapper;
import org.Mongle.model.goodsVO;
import org.Mongle.model.shopVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class shopAttachServiceimpl implements shopAttachService {
	@Autowired
	shopMapper sm; // writing 테이블 mapper
	@Autowired
	goodsMapper gm; // goods 테이블 mapper

	// 상품 등록 게시판 (shopVo : 게시판정보 + 파일 업로드 정보
	public void write(shopVO shop) {
		sm.write(shop);
		
		shop.getAttach().forEach(attach->{
			
			// goodsVO의 Product_id에 shopVO의 Product_id를 저장
			attach.setProduct_id(shop.getProduct_id());
			gm.insert(attach);
		});
	}

	// 첨부파일 조회 구현
	public ArrayList<goodsVO> Detaillist(int product_id) {
		return gm.Detaillist(product_id);
	}
}
