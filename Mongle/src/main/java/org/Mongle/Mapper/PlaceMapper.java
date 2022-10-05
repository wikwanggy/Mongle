package org.Mongle.Mapper;

import java.util.ArrayList;

import org.Mongle.model.PlaceCriteriaVO;
import org.Mongle.model.PlaceVO;

public interface PlaceMapper {
	public void write(PlaceVO pvo);

	public ArrayList<PlaceVO> list(PlaceCriteriaVO pcri);

	public PlaceVO detail(PlaceVO pvo);

	public void cntup(PlaceVO pvo);

	public void modify(PlaceVO pvo);

	public void remove(PlaceVO pvo);

	public int total(PlaceCriteriaVO pcri);
	// 댓글수
	public void replycnt(PlaceVO pvo);
	
	public ArrayList<PlaceVO> notice();
}
