package org.Mongle.Mapper;

import java.util.ArrayList;

import org.Mongle.model.PlaceCriteriaVO;
import org.Mongle.model.PlaceVo;

public interface PlaceMapper {
	public void write(PlaceVo pvo);

	public ArrayList<PlaceVo> list(PlaceCriteriaVO pcri);

	public PlaceVo detail(PlaceVo pvo);

	public void cntup(PlaceVo pvo);

	public void modify(PlaceVo pvo);

	public void remove(PlaceVo pvo);

	public int total(PlaceCriteriaVO pcri);
}
