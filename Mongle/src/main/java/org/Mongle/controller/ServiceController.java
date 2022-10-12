package org.Mongle.controller;


import java.awt.List;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ServiceController {
	
	@Autowired
	ServiceService ss;

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
			writepath="redirect:/service/bkind?bgno=2";// faq 첫번찌 탭
	}else if(service.getBgno()==4) {	// 만약에 bgno가 4이면
		writepath="redirect:/service/bkind?bgno=4";// faq 두번찌 탭
	}else if(service.getBgno()==5) {	// 만약에 bgno가 5이면
		writepath="redirect:/service/bkind?bgno=5";// faq 세번찌 탭
	}else if(service.getBgno()==6) {	// 만약에 bgno가 6이면 
		writepath="redirect:/service/bkind?bgno=6";// faq 네번찌 탭
	}else if(service.getBgno()==7) {	// 만약에 bgno가 7이면
		writepath="redirect:/service/bkind?bgno=7";// faq 다섯번찌 탭
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
	public String remove(int bno,ServiceVO service,RedirectAttributes rttr) {
		String removepath="";
		ArrayList<ServiceFileListVO> filelist = ss.filelist(bno);
		System.out.println(bno+"삭제");
		if(ss.remove(bno)) {
			deleteFiles(filelist);
			rttr.addFlashAttribute("result", "success");
			System.out.println("이게돼네");
		}
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
		String path="";
		if(spa.getBgno()==1) {// 만약에 bgno가 1이면
			// 공지사항(service/notice)
			model.addAttribute("list",ss.list(spa));
			path="service/notice";
		}else if(spa.getBgno()==2) {	// 만약에 bgno가 2이면
			model.addAttribute("list",ss.list(spa));
			path="service/faq";// faq
		}else if(spa.getBgno()==4) {	// 만약에 bgno가 4이면
			model.addAttribute("list",ss.list(spa));
			path="service/faq";// faq
		}else if(spa.getBgno()==5) {	// 만약에 bgno가 5이면
			model.addAttribute("list",ss.list(spa));
			path="service/faq";// faq
		}else if(spa.getBgno()==6) {	// 만약에 bgno가 6이면
			model.addAttribute("list",ss.list(spa));
			path="service/faq";// faq
		}else if(spa.getBgno()==7) {	// 만약에 bgno가 7이면
			model.addAttribute("list",ss.list(spa));
			path="service/faq";// faq
		}else {// 그렇지 않으면
			model.addAttribute("list",ss.list(spa));
			path="service/questions";// 1:1문즤
		}
		//model.addAttribute("list",ss.list(bgno,spa));
		int total=ss.total(spa);
		model.addAttribute("paging",new ServicePageSubVO(spa,total));
		return path;
	}
	
	@RequestMapping(value = "/service/servicemain", method = RequestMethod.GET)
	public String list() {
		return  "service/servicemain";
	}
	
	private void deleteFiles(ArrayList<ServiceFileListVO> filelist) {
		if(filelist == null || filelist.size() == 0) {return;}
		System.out.println("실행");	
		filelist.forEach(svfile -> {
			try {
				Path file = Paths.get("D:\\upload\\"+svfile.getUploadPath()+
						"\\"+svfile.getUuid()+"_"+svfile.getFileName());
				Files.deleteIfExists(file);
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("D:\\upload\\"+svfile.getUploadPath()+
							"\\s_"+svfile.getUuid()+"_"+svfile.getFileName());
					Files.delete(thumbNail);
				}	
			}catch(Exception e) {
				System.out.println("delete file error:"+e.getMessage());
			}
		});
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
		modipath="redirect:/service/bkind?bgno=2";// faq 첫번찌 탭
	}else if(service.getBgno()==4) {	// 만약에 bgno가 4이면
		modipath="redirect:/service/bkind?bgno=4";// faq 두번찌 탭
	}else if(service.getBgno()==5) {	// 만약에 bgno가 5이면
		modipath="redirect:/service/bkind?bgno=5";// faq 세번찌 탭
	}else if(service.getBgno()==6) {	// 만약에 bgno가 6이면 
		modipath="redirect:/service/bkind?bgno=6";// faq 네번찌 탭
	}else if(service.getBgno()==7) {	// 만약에 bgno가 7이면
		modipath="redirect:/service/bkind?bgno=7";// faq 다섯번찌 탭
	}else {// 그렇지 않으면
		modipath="redirect:/service/bkind?bgno=3";// 1:1문즤
	}
       ss.modify(service);
       rttr.addAttribute("detail",service.getBno());
       return modipath;
    }
}
