package org.Mongle.Mapper;

import java.util.ArrayList;

import org.Mongle.model.CommUVo;

public interface CommUMapper {
	public void upload(CommUVo uv);
	public ArrayList<CommUVo> uplist(int bno);
	//public void ntupload(NoticeUVo nuv);
}