package org.Mongle.Mapper;

import java.util.ArrayList;

import org.Mongle.model.ServicePageVO;
import org.Mongle.model.ServiceVO;

public interface ServiceMapper {
	
	//글쓰기에 해당되는 DB설계
	public void write(ServiceVO service);
	
	//게시글 목록 리스트에 해당되는 DB 설계
	public ArrayList<ServiceVO> list(ServicePageVO spa);
	
	//service_list테이블 전체건수 DB설계
	public int total(ServicePageVO spa);
	
	//목록리스트 에서 제목클릭시 상세내용 조회 가능한 DB작업 설계
	public ServiceVO detail(ServiceVO service);
	
	//목록리스트 에서 제목클릭시 조회수 +1업 하게 하는 DB 작업 설계
	public void cntup(ServiceVO service);
	
	//상세내용 내용물 수정하는 DB작업 설계
	public void modify(ServiceVO service);
	
	//상세내용 내용물 삭제 하는 DB작업 설계
	public void remove(ServiceVO service);
}
