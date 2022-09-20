package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.model.ServicePageVO;
import org.Mongle.model.ServiceVO;
import org.Mongle.model.ServiceFileListVO;

public interface ServiceService {
	//글쓰기 설계
	public void write(ServiceVO service);
	//글 목록 리스트 설계
	public ArrayList<ServiceVO> list(ServicePageVO spa);
	//글 상세 내용 보기 설계
	public ServiceVO detail(ServiceVO service);
	//questions 테이블 전체 건수 설계
	public int total(ServicePageVO spa);
	//글 수정 
	public void modify(ServiceVO service);
	//글 삭제
	public void remove(ServiceVO service);
	//첨부파일 조회 설계
	public ArrayList<ServiceFileListVO>filelist(int bno);
}
