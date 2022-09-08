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
	
	//게시판 글쓰기 페이지(화면)
	@RequestMapping(value = "/service/write", method = RequestMethod.GET)
	public String write() {
		return "service/write";
	}
	
	//게시판 글쓰기 페이지(insert이루어짐.)
	@RequestMapping(value = "/service/write", method = RequestMethod.POST)
	public String writePost(ServiceVO service) {
		System.out.println(service);
		//비즈니스 영역 연결한 후 ServiceService 에 있는 write메소드
		ss.write(service);
		
		return "redirect:/service/questions";
	}
	
	//1:1게시물의 첨부파일 데이터 ajax로 전송
	@RequestMapping(value="/filelist",method=RequestMethod.GET)
	public ResponseEntity<ArrayList<ServiceFileListVO>>uploadAjaxPost(int bno){
		
		return new ResponseEntity<>(ss.filelist(bno),HttpStatus.OK);
	}
	
	@RequestMapping(value = "/service/questions", method = RequestMethod.GET)
	public String list(Model model,ServicePageVO spa) {
		//list.jsp 실행 할 때 select 된 결과를 가져와라
		model.addAttribute("list",ss.list(spa));
		//list.jsp 실행 할 때 pageVO에 저장되어 있는 데이터를 가져와라.
		//                             생성자 호출(매개변수가 2개인 생성자)
		//service_list테이블(게시판테이블)에 전체 건수(select해서)를 아래에 숫자 대신해서 입력
		int total=ss.total(spa);
		//model.addAttribute("paging",new PageVO(spa,190));
		model.addAttribute("paging",new ServicePageSubVO(spa,total));
		return "service/questions";
	}
	
	@RequestMapping(value="/service/questions/detail", method = RequestMethod.GET)
	public String detail(ServiceVO service,Model model) {
		System.out.println(service);
		model.addAttribute("detail",ss.detail(service));
		return "service/servicedetail";
	}
	
    @RequestMapping(value = "/service/modify", method =  RequestMethod.POST )
    public String modify(ServiceVO service,RedirectAttributes rttr) {
       ss.modify(service);
       rttr.addAttribute("bno",service.getBno());
       // boarddetail.jsp에서 수정된 결과를 확인하기 위한 화면이동
       return "redirect:/service/questions/detail";
    }
	
	@RequestMapping(value="/service/remove",method = RequestMethod.POST)
	public String remove(ServiceVO service) {
		ss.remove(service);
		return "redirect:/service/questions";
	}
	
	@RequestMapping(value = "/service/servicemain", method = RequestMethod.GET)
	public String list() {
		return  "service/servicemain";
	}
	
	@RequestMapping(value = "/service/faq", method = RequestMethod.GET)
	public String faq() {
		return  "service/faq";
	}
	
	@RequestMapping(value = "/service/order", method = RequestMethod.GET)
	public String order() {
		return  "service/order";
	}
	
	@RequestMapping(value = "/service/shipping", method = RequestMethod.GET)
	public String shipping() {
		return  "service/shipping";
	}
}
