package org.Mongle.Service;

import org.Mongle.model.PlaceLikeVO;

public interface PlaceLikeService {

	public int findLike(PlaceLikeVO plvo);

	public void likeUp(PlaceLikeVO plvo);

	public void likeDown(PlaceLikeVO plvo);

	public void placeLikeUp(PlaceLikeVO plvo);

	public void placeLikeDown(PlaceLikeVO plvo);
}
