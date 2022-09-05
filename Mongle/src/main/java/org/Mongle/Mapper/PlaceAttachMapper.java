package org.Mongle.Mapper;

import java.util.ArrayList;

import org.Mongle.model.PlaceAttachFileVO;


public interface PlaceAttachMapper {
	// 글쓰기할 당시에 첨부파일 DB작업 설계
	public void insert(PlaceAttachFileVO attach);

	// 해당게시물의 첨부파일 조회
	public ArrayList<PlaceAttachFileVO> attachlist(int bno);
}
