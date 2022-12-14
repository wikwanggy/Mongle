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
		
		String title = service.getTitle();
		String content = service.getContent();
		// replace(a,b) a를 b로 변환
		title=title.replace("<", "&lt;");
		title=title.replace(">","&gt;");
		//공백 문자 처리
		title=title.replace("  ",  "&nbsp;&nbsp;");
		content=content.replace("  ",  "&nbsp;&nbsp;");
		//줄바꿈 처리
		content = content.replace("\n", "<br>");
		service.setTitle(title);
		service.setContent(content);
		
		
		service.getSvfile().forEach(svfile->{
			
			//ServiceFileListVO의 bno에 Service VO 의 bno 저장
			svfile.setBno(service.getBno());
				
			sam.insert(svfile);
		});
	}
	
	//list 추상메서드 구현
	public ArrayList<ServiceVO> list(ServicePageVO spa){
		System.out.println("service="+spa);
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
	@Transactional
	@Override
	public boolean modify(ServiceVO service) {
		sam.deleteAll(service.getBno());
		
		if(sm.modify(service) && service.getSvfile() != null
						&& service.getSvfile().size() > 0) {
		service.getSvfile().forEach(svfile->{
			svfile.setBno(service.getBno());
			sam.insert(svfile);
		});
		}
		return sm.modify(service);
	}
	
	//remove 첨부파일 삭제용 추상메서드 구현
	public boolean remove(int bno) {
		System.out.println("첨부 파일 삭제 게시글 번호:"+ bno);
		
		sam.deleteAll(bno);
		
		return sm.remove(bno);
	}
	
	//첨부파일 조회 부여
	public ArrayList<ServiceFileListVO>filelist(int bno){
		return sam.filelist(bno);
	}
}
