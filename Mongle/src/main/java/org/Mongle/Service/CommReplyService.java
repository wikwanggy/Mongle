package org.Mongle.Service;

import java.util.ArrayList;
import org.Mongle.model.CommReplyupVo;

public interface CommReplyService {
	//public ArrayList<CommReplyupVo> list(int bno);
	public int rewrite(CommReplyupVo rep);
	public ArrayList<CommReplyupVo> list(int bno);
	public int remove(int rno);
	public int modify(CommReplyupVo rep);
	//댓글 페이징
	//public CommReplyPageVo ReplyList(CommCriterionVo cri);
}
