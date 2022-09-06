package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.model.PlaceAttachFileVO;
import org.Mongle.model.PlaceCriteriaVO;
import org.Mongle.model.PlaceVo;


public interface PlaceService {
	public void write(PlaceVo pvo);

	public ArrayList<PlaceVo> list(PlaceCriteriaVO pcri);

	public PlaceVo detail(PlaceVo pvo);

	public void modify(PlaceVo pvo);

	public void remove(PlaceVo pvo);

	public int total(PlaceCriteriaVO pcri);
	// 첨부파일  조회 설계
	public ArrayList<PlaceAttachFileVO> attachlist(int bno);

}
