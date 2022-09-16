package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.Mapper.BoardMapper;
import org.Mongle.model.CommBoardVo;
import org.Mongle.model.CommCriterionVo;
import org.Mongle.model.NoticeVo;
import org.Mongle.model.ReviewVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardMapper bm;
	
	public ArrayList<CommBoardVo> list(CommCriterionVo cri) {
		return bm.list(cri);
	}
	public void write(CommBoardVo bvo) {
		bm.write(bvo);
	}
	//@Transactional
	public CommBoardVo detail(CommBoardVo bvo) {
		bm.cntup(bvo);
		return bm.detail(bvo);
	}
	public void update(CommBoardVo bvo) {
		bm.update(bvo);
	}
	public void boarddelete(CommBoardVo bvo) {
		bm.boarddelete(bvo);
	}
	public int total(CommCriterionVo cri) {
		return bm.total(cri);
	}
	
	@Transactional
	public CommBoardVo detailmd(CommBoardVo bvo) {
		return bm.detailmd(bvo);
	}
	
	public ArrayList<ReviewVo> rvlist(ReviewVo rev){
		return bm.rvlist(rev);
	}
	public ArrayList<NoticeVo> notice(NoticeVo nv){
		return bm.notice(nv);
	}
	public void noticewrt(NoticeVo nv) {
		bm.noticewrt(nv);
	}
	public NoticeVo ntdetail(NoticeVo nv) {
		return bm.ntdetail(nv);
	}
	@Transactional
	public NoticeVo ntdetailmd(NoticeVo nv) {
		return bm.ntdetailmd(nv);
	}
	public void ntupdate(NoticeVo nv) {
		bm.ntupdate(nv);
	}
	public void ntdelete(NoticeVo nv) {
		bm.ntdelete(nv);
	}
}
