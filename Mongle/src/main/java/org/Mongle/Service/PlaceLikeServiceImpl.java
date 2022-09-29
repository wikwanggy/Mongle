package org.Mongle.Service;

import org.Mongle.Mapper.PlaceLikeMapper;
import org.Mongle.model.PlaceLikeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlaceLikeServiceImpl implements PlaceLikeService {

	@Autowired
	PlaceLikeMapper plm;

	public int findLike(PlaceLikeVO plvo) {
		return plm.findLike(plvo);
	}

	public void likeUp(PlaceLikeVO plvo) {
		plm.likeUp(plvo);
	}

	public void likeDown(PlaceLikeVO plvo) {
		plm.likeDown(plvo);
	}

	public void placeLikeUp(PlaceLikeVO plvo) {
		plm.placeLikeUp(plvo);
	}

	public void placeLikeDown(PlaceLikeVO plvo) {
		plm.placeLikeDown(plvo);
	}

}
