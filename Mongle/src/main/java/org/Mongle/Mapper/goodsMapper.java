package org.Mongle.Mapper;

import java.util.ArrayList;

import org.Mongle.model.goodsVO;

public interface goodsMapper {
	// 글쓰기할 당시에 첨부파일 DB작업 설계
	public void insert(goodsVO attach);

	// 첨부파일 조회 DP작업 설계
	public ArrayList<goodsVO> Detaillist(int product_id);
}
