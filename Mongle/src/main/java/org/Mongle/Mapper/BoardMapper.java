package org.Mongle.Mapper;

import java.util.ArrayList;

import org.Mongle.model.CommBoardVo;
import org.Mongle.model.CommCriterionVo;
import org.Mongle.model.NoticeVo;
import org.Mongle.model.ReviewVo;

public interface BoardMapper {
	public ArrayList<CommBoardVo> list(CommCriterionVo cri);
	public void write(CommBoardVo bvo);
	public CommBoardVo detail(CommBoardVo bvo);
	public void update(CommBoardVo bvo);
	public void delete(CommBoardVo bvo);
	public void cntup(CommBoardVo bvo);
	public int total(CommCriterionVo cri);
	
	public CommBoardVo detailmd(CommBoardVo bvo);
	
	public ArrayList<ReviewVo> rvlist(ReviewVo rev);
	
	public ArrayList<NoticeVo> notice(NoticeVo nv);
	public void noticewrt(NoticeVo nv);
	public NoticeVo ntdetail(NoticeVo nv);
}
