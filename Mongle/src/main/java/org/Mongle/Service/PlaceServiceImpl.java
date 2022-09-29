package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.Mapper.PlaceAttachMapper;
import org.Mongle.Mapper.PlaceMapper;
import org.Mongle.model.PlaceAttachFileVO;
import org.Mongle.model.PlaceCriteriaVO;
import org.Mongle.model.PlaceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	PlaceMapper pm;
	@Autowired
	PlaceAttachMapper pam;


	public void write(PlaceVO pvo) {
		pm.write(pvo);
		pvo.getAttach().forEach(attach -> {
			attach.setBno(pvo.getBno());
			pam.insert(attach);
		});
	}
	public void cntup(PlaceVO pvo) {
		pm.cntup(pvo);
	}

	public ArrayList<PlaceVO> list(PlaceCriteriaVO pcri) {
		return pm.list(pcri);
	}


	@Transactional
	public PlaceVO detail(PlaceVO pvo) {
		// 상세페이지 조회할때 (조회수+1) update
		pm.cntup(pvo);
		return pm.detail(pvo);
	}

	public void modify(PlaceVO pvo) {
		pm.modify(pvo);
	}

	public void remove(PlaceVO pvo) {
		pm.remove(pvo);
	}

	public int total(PlaceCriteriaVO pcri) {
		return pm.total(pcri);
	}

	// 첨부파일 조회 구현
	public ArrayList<PlaceAttachFileVO> attachlist(int bno) {
		return pam.attachlist(bno);
	}
	// 댓글수
	public void replycnt(PlaceVO pvo) {
		pm.replycnt(pvo);
	}

}
