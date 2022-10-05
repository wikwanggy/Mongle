package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.model.CommBoardVo;
import org.Mongle.model.CommCriterionVo;
import org.Mongle.model.CommUVo;
import org.Mongle.model.NoticeVo;
import org.Mongle.model.ReviewVo;

public interface BoardService {
	public ArrayList<CommBoardVo> list(CommCriterionVo cri);
	public void write(CommBoardVo bvo);
	public CommBoardVo detail(CommBoardVo bvo);
	public boolean update(CommBoardVo bvo);
	public boolean boarddelete(int bno);
	public int total(CommCriterionVo cri);
	
	public CommBoardVo detailmd(CommBoardVo bvo);
	
	public ArrayList<ReviewVo> rvlist(CommCriterionVo cri);
	
	//공지
	public ArrayList<NoticeVo> notice(CommCriterionVo cri);
	public void noticewrt(NoticeVo nv);
	public NoticeVo ntdetail(NoticeVo nv);
	public NoticeVo ntdetailmd(NoticeVo nv);
	public boolean ntupdate(NoticeVo nv);
	public boolean ntdelete(int bno);
	
	//파일 조회
	public ArrayList<CommUVo> uplist(int bno);
	
	public CommBoardVo movepage(int bno);
	
	public void replycount(int bno);
	
	public int countBoard(CommCriterionVo cri);
	public int countreview(CommCriterionVo cri);
	
	public ArrayList<CommUVo> ntlist(int bno);
}
