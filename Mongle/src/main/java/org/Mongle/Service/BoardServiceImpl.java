package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.Mapper.BoardMapper;
import org.Mongle.Mapper.CommUMapper;
import org.Mongle.model.CommBoardVo;
import org.Mongle.model.CommCriterionVo;
import org.Mongle.model.CommUVo;
import org.Mongle.model.NoticeVo;
import org.Mongle.model.ReviewVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardMapper bm;
	@Autowired
	CommUMapper um;
	
	public ArrayList<CommBoardVo> list(CommCriterionVo cri) {
		return bm.list(cri);
	}
	public void write(CommBoardVo bvo) {
		bm.write(bvo);
		if(bvo.getAttach()==null||bvo.getAttach().size()<=0) {
			return;
		}
		bvo.getAttach().forEach(attach->{
			attach.setBno(bvo.getBno());
			um.upload(attach);
		});
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
	
	public ArrayList<ReviewVo> rvlist(CommCriterionVo cri){
		return bm.rvlist(cri);
	}
	public int countreview(CommCriterionVo cri) {
		return bm.countreview(cri);
	}
	public ArrayList<NoticeVo> notice(CommCriterionVo cri){
		return bm.notice(cri);
	}
	@Transactional
	public void noticewrt(NoticeVo nv) {
		System.out.println("noticesi..."+nv);
		bm.noticewrt(nv);
		if(nv.getAttach()==null||nv.getAttach().size()<=0) {
			return;
		}
		nv.getAttach().forEach(attach->{
			attach.setBno(nv.getBno());
			um.ntinsert(attach);
		});
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
	//첨부파일 조회
	public ArrayList<CommUVo> uplist(int bno){
		return um.uplist(bno);
	}
	public CommBoardVo movepage(int bno) {
		return bm.movepage(bno);
	}
	public void replycount(int bno) {
		bm.replycount(bno);
	}
	public int countBoard(CommCriterionVo cri) {
		return bm.countBoard(cri);
	}
	public ArrayList<CommUVo> ntlist(int bno){
		return um.ntlist(bno);
	}
}
