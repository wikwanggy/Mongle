package org.Mongle.Mapper;

import java.util.ArrayList;

import org.Mongle.model.ServiceFileListVO;

public interface ServiceFileMapper {
	//글쓰기에 해당되는 DB작업 설계
	public void insert(ServiceFileListVO svfile);
	//해당게시물의 첨부파일 조회
	public ArrayList<ServiceFileListVO> filelist(int bno);
}