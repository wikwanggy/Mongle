package org.Mongle.Service;


import org.Mongle.Mapper.EventMapper;
import org.Mongle.model.EventVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EventServiceimpl implements EventService {
	@Autowired
	EventMapper em;
	
	//댓글 쓰기를 위한 구현
	public int rewrite(EventVO reply) {
		return em.rewrite(reply);
	}
}
