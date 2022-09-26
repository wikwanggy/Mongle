package org.Mongle.controller;


import java.util.ArrayList;


import org.Mongle.Service.ServiceService;
import org.Mongle.model.ServiceFileListVO;
import org.Mongle.model.ServicePageSubVO;
import org.Mongle.model.ServicePageVO;
import org.Mongle.model.ServiceVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ServiceController {
	
	@Autowired
	ServiceService ss;
	
	//테스트용 페이지
	@RequestMapping(value = "/service/test", method = RequestMethod.GET)
	public String test() {
		return "service/test";
	}
	
	//게시판 글쓰기 페이지(화면)
	@RequestMapping(value = "/service/write", method = RequestMethod.GET)
	public String write(int bgno,Model model) {
		System.out.println(bgno);
		model.addAttribute("bgno", bgno);
		return "service/write";
	}
	
	//게시판 글쓰기 페이지(insert이루어짐.)
	@RequestMapping(value = "/service/write", method = RequestMethod.POST)
	public String writePost(ServiceVO service) {
		String writepath="";
		System.out.println(service);
		//비즈니스 영역 연결한 후 ServiceService 에 있는 write메소드
		if(service.getBgno()==1) {// 만약에 bgno가 1이면
			// 공지사항(service/notice)
			writepath="redirect:/service/bkind?bgno=1";
	}else if(service.getBgno()==2) {	// 만약에 bgno가 2이면
			writepath="redirect:/service/bkind?bgno=2";// faq
	}else {// 그렇지 않으면
			writepath="redirect:/service/bkind?bgno=3";// 1:1문즤
	}
		ss.write(service);
		
		return writepath;
	}
	
	//1:1게시물의 첨부파일 데이터 ajax로 전송
	@RequestMapping(value="/filelist",method=RequestMethod.GET)
	public ResponseEntity<ArrayList<ServiceFileListVO>>uploadAjaxPost(int bno){
		
		return new ResponseEntity<>(ss.filelist(bno),HttpStatus.OK);
	}
	

	
	@RequestMapping(value="/service/detail", method = RequestMethod.GET)
	public String detail(ServiceVO service,Model model) {
		System.out.println(service);
		model.addAttribute("detail",ss.detail(service));
		return "service/servicedetail";
	}
	/* 게시글 삭제 */
	@RequestMapping(value="/service/remove",method = RequestMethod.POST)
	public String remove(ServiceVO service) {
		ss.remove(service);
		String removepath="";
		System.out.println(service);
		//비즈니스 영역 연결한 후 ServiceService 에 있는 write메소드
		if(service.getBgno()==1) {// 만약에 bgno가 1이면
					// 공지사항(service/notice)
					removepath="redirect:/service/bkind?bgno=1";
			}else if(service.getBgno()==2) {	// 만약에 bgno가 2이면
					removepath="redirect:/service/bkind?bgno=2";// faq
			}else {// 그렇지 않으면
					removepath="redirect:/service/bkind?bgno=3";// 1:1문즤
			}
		return removepath;
	}
	
	@RequestMapping(value = "/service/bkind", method = RequestMethod.GET)
	public String notice(Model model,ServicePageVO spa) {
		System.out.println("controller="+spa);
		String path="";
		if(spa.getBgno()==1) {// 만약에 bgno가 1이면
			// 공지사항(service/notice)
			model.addAttribute("list",ss.list(spa));
			path="service/notice";
		}else if(spa.getBgno()==2) {	// 만약에 bgno가 2이면
			model.addAttribute("list",ss.list(spa));
			path="service/faq";// faq
		}else {// 그렇지 않으면
			model.addAttribute("list",ss.list(spa));
			path="service/questions";// 1:1문즤
		}
		//model.addAttribute("list",ss.list(bgno,spa));
		int total=ss.total(spa);
		model.addAttribute("paging",new ServicePageSubVO(spa,total));
		System.out.println("path="+path);
		return path;
	}
	
	@RequestMapping(value = "/service/servicemain", method = RequestMethod.GET)
	public String list() {
		return  "service/servicemain";
	}
	
	@RequestMapping(value = "/service/modify", method = RequestMethod.GET)
	public String getmodify(ServiceVO service,Model model) {
		model.addAttribute("detail",ss.detail(service));
		return "service/modify";
	}
	
	/* 게시글 수정 */
    @RequestMapping(value = "/service/modify", method =  RequestMethod.POST )
    public String postmodify(ServiceVO service,RedirectAttributes rttr) {		
    System.out.println(service);
   	String path="";
	String modipath="";
    if(service.getBgno()==1) {// 만약에 bgno가 1이면
		// 공지사항(service/notice)
    	modipath="redirect:/service/bkind?bgno=1";
	}else if(service.getBgno()==2) {	// 만약에 bgno가 2이면
		modipath="redirect:/service/bkind?bgno=2";// faq
	}else {// 그렇지 않으면
		modipath="redirect:/service/bkind?bgno=3";// 1:1문즤
	}
       ss.modify(service);
       rttr.addAttribute("detail",service.getBno());
       return modipath;
    }
}
