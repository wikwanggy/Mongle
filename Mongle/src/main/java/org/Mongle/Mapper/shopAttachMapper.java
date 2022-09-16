package org.Mongle.Mapper;

import java.util.ArrayList;

import org.Mongle.model.SAttachFileVO;

public interface shopAttachMapper {
	// 글쓰기할 당시에 첨부파일 DB작업 설계
	public void insert(SAttachFileVO attach);

	// 해당게시물의 첨부파일 조회
	public ArrayList<SAttachFileVO> attachlist(int bno);
}
