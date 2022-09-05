package org.Mongle.Mapper;

import java.util.ArrayList;
//댓글 관련 mapper

import org.Mongle.model.PlaceReplyVO;

public interface PlaceReplyMapper {
	// 댓글 쓰기를 구현
	// return타입이 int 일 때 1이면 insert 성공, 0이면 실패
	public int rewrite(PlaceReplyVO reply);

	// 댓글목록리스트를 구현
	public ArrayList<PlaceReplyVO> list(int bno);

	// 댓글 수정을 구현
	public int modify(PlaceReplyVO reply);
	
	// 댓글 삭제를 구현
	public int remove(int rno);
}
