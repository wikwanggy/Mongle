package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.model.PlaceReplyVO;



public interface PlaceReplyService {
	// 댓글 쓰기를 위한 설계
	public int rewrite(PlaceReplyVO reply);

	// 댓글목록리스트를위한설계
	public ArrayList<PlaceReplyVO> list(int bno);

	// 댓글 수정을 위한 설계
	public int modify(PlaceReplyVO reply);

	// 댓글 삭제을 위한 설계
	public int remove(int rno);
}
