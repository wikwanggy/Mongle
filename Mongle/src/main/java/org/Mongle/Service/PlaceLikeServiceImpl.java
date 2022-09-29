package org.Mongle.Service;

import org.Mongle.Mapper.PlaceLikeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlaceLikeServiceImpl implements PlaceLikeService {

	@Autowired
	PlaceLikeMapper plm;

	public int findLike(int bno, String id) {
		return plm.findLike(bno, id);
	}

	public void likeUp(int bno, String id) {
		plm.likeUp(bno, id);
	}

	public void likeDown(int bno, String id) {
		plm.likeDown(bno, id);
	}

	public void placeLikeUp(int bno) {
		plm.placeLikeUp(bno);
	}

	public void placeLikeDown(int bno) {
		plm.placeLikeDown(bno);
	}

}
