package org.Mongle.Mapper;

public interface PlaceLikeMapper {
	public int findLike(int bno, String id);

	public void likeUp(int bno, String id);

	public void likeDown(int bno, String id);
	
	public void placeLikeUp(int bno);
	
	public void placeLikeDown(int bno);
}
