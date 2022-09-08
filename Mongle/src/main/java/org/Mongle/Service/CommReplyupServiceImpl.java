package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.Mapper.CommReplyMapper;
import org.Mongle.model.CommReplyupVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommReplyupServiceImpl implements CommReplyService {
	@Autowired
	CommReplyMapper crm;
	
	public int rewrite(CommReplyupVo rep) {
		return crm.rewrite(rep);
	}
	public ArrayList<CommReplyupVo> list(int bno){
		return crm.list(bno);
	}
	public int remove(int rno) {
		return crm.remove(rno);
	}
}
