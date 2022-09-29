package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.Mapper.PlaceReplyMapper;
import org.Mongle.model.PlaceReplyVO;
import org.Mongle.model.PlaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlaceReplyServiceImpl implements PlaceReplyService {
	@Autowired
	PlaceReplyMapper prm;

	// 댓글 쓰기를 위한 구현
	public int rewrite(PlaceReplyVO reply) {
		return prm.rewrite(reply);
	}

	// 댓글목록리스트를위한구현
	public ArrayList<PlaceReplyVO> list(int bno) {
		return prm.list(bno);
	}

	// 댓글 수정을 위한 구현
	public int modify(PlaceReplyVO reply) {
		return prm.modify(reply);
	}

	// 댓글 삭제을 위한 구현
	public int remove(int rno) {
		return prm.remove(rno);
	}
	

}
