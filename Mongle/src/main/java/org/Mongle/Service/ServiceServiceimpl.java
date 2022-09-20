package org.Mongle.Service;

import java.util.ArrayList;

import org.Mongle.Mapper.ServiceFileMapper;
import org.Mongle.Mapper.ServiceMapper;
import org.Mongle.model.ServiceFileListVO;
import org.Mongle.model.ServicePageVO;
import org.Mongle.model.ServiceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ServiceServiceimpl implements ServiceService{
	
	@Autowired
	ServiceMapper sm;
	@Autowired
	ServiceFileMapper sam;
	
	//write 추상메서드 구현
	public void write(ServiceVO service) {
		sm.write(service);
		
		service.getSvfile().forEach(svfile->{
			
			//ServiceFileListVO의 bno에 Service VO 의 bno 저장
			svfile.setBno(service.getBno());
				
			sam.insert(svfile);
		});
	}
	
	//list 추상메서드 구현
	public ArrayList<ServiceVO> list(ServicePageVO spa){
		return sm.list(spa);
	}
	
	//detail 추상메서드 구현
	@Transactional
	public ServiceVO detail(ServiceVO service) {
		//1회 조회할 때마다 리스트 에서 조회수 +1 증가
		sm.cntup(service);
		return sm.detail(service);
	}
	
	
	//total 추상메서드 구현
	public int total(ServicePageVO spa) {
		return sm.total(spa);
	}
	
	//modify 추상메서드 구현
	public void modify(ServiceVO service) {
		sm.modify(service);
	}
	
	//remove 추상메서드 구현
	public void remove(ServiceVO service) {
		sm.remove(service);
	}
	
	//첨부파일 조회 부여
	public ArrayList<ServiceFileListVO>filelist(int bno){
		return sam.filelist(bno);
	}
}
