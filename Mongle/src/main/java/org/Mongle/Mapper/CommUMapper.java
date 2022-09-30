package org.Mongle.Mapper;

import java.util.ArrayList;

import org.Mongle.model.CommUVo;

public interface CommUMapper {
	public void upload(CommUVo uv);
	public ArrayList<CommUVo> uplist(int bno);
	
	//공지
	public void ntinsert(CommUVo uv);
	public void deleteAll(int bno);
	public ArrayList<CommUVo> ntlist(int bno);
	
}