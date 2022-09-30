package org.Mongle.Mapper;

import java.util.ArrayList;

import org.Mongle.model.CommReplyupVo;

public interface CommReplyMapper {

	public int rewrite(CommReplyupVo rep);
	public ArrayList<CommReplyupVo> list(int bno);
	public int remove(int rno);
	public int modify(CommReplyupVo rep);
	//public List<CommReplyupVo> ReplyList(CommCriterionVo cri);
	//public int getReplyTotal(int bno);
	
}
