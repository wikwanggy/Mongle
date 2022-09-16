package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.model.CommBoardVo;
import org.Mongle.model.CommCriterionVo;
import org.Mongle.model.NoticeVo;
import org.Mongle.model.ReviewVo;

public interface BoardService {
	public ArrayList<CommBoardVo> list(CommCriterionVo cri);
	public void write(CommBoardVo bvo);
	public CommBoardVo detail(CommBoardVo bvo);
	public void update(CommBoardVo bvo);
	public void boarddelete(CommBoardVo bvo);
	public int total(CommCriterionVo cri);
	
	public CommBoardVo detailmd(CommBoardVo bvo);
	
	public ArrayList<ReviewVo> rvlist(ReviewVo rev);
	
	//공지
	public ArrayList<NoticeVo> notice(NoticeVo nv);
	public void noticewrt(NoticeVo nv);
	public NoticeVo ntdetail(NoticeVo nv);
	public NoticeVo ntdetailmd(NoticeVo nv);
	public void ntupdate(NoticeVo nv);
	public void ntdelete(NoticeVo nv);
	
}
