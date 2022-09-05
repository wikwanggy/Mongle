package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.model.PlaceAttachFileVO;
import org.Mongle.model.PlaceCriteriaVO;
import org.Mongle.model.PlaceVO;


public interface PlaceService {
	public void write(PlaceVO pvo);

	public ArrayList<PlaceVO> list(PlaceCriteriaVO pcri);

	public PlaceVO detail(PlaceVO pvo);

	public void modify(PlaceVO pvo);

	public void remove(PlaceVO pvo);

	public int total(PlaceCriteriaVO pcri);
	// 첨부파일  조회 설계
	public ArrayList<PlaceAttachFileVO> attachlist(int bno);

}
