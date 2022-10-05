package org.Mongle.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.Mongle.Service.BoardService;
import org.Mongle.model.CommBoardVo;
import org.Mongle.model.CommCriterionVo;
import org.Mongle.model.CommPageVo;
import org.Mongle.model.CommUVo;
import org.Mongle.model.NoticeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class BoardController {
	@Autowired
	BoardService bs;
	
	@RequestMapping(value = "/community/list", method = RequestMethod.GET)
	// 게시판 목록 리스트
	public String list(Model model,CommCriterionVo cri) {
		model.addAttribute("list", bs.list(cri));
		int total=bs.total(cri);
		model.addAttribute("paging", new CommPageVo(cri,total));
		return "/community/list";
	}
	
	// 게시판 상세 페이지
	@RequestMapping(value = "/community/detail", method = RequestMethod.GET)
	public String detail(CommBoardVo bvo, Model model) {
		System.out.println(bvo);
		model.addAttribute("detail", bs.detail(bvo));
		model.addAttribute("move", bs.movepage(bvo.getBno()));
		bs.replycount(bvo.getBno());
		return "/community/detail";
	}
	@RequestMapping(value="/community/detailmd", method=RequestMethod.POST)
	public String detailmd(CommBoardVo bvo, Model model) {
		System.out.println(bvo);
		model.addAttribute("detailmd",bs.detail(bvo));
		return "/community/detailmd";
	}
	/*@RequestMapping(value = "/community/detailview", method = RequestMethod.GET)
	public String move(CommBoardVo bvo,Model model) {
		System.out.println("move");
		model.addAttribute("move", bs.movepage(bvo.getBno()));
		return "/community/detailview";
	}*/
	// 게시판 수정 및 삭제 페이지
	@RequestMapping(value = "/community/update", method = RequestMethod.POST)
	public String update(CommBoardVo bvo,RedirectAttributes rttr) {
		bs.update(bvo);
		rttr.addAttribute("bno", bvo.getBno());
		return "redirect:/community/detail";
	}
	@RequestMapping(value = "/community/boarddelete", method = RequestMethod.POST)
	public String boarddelete(int bno, CommBoardVo bvo,RedirectAttributes rttr) {
		System.out.println("게시글 삭제..."+bno);
		ArrayList<CommUVo> uplist=bs.uplist(bno);
		if(bs.boarddelete(bno)) {
			deleteFiles(uplist);
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/community/list";
	}
	
	// 게시판 글쓰기 페이지(화면)
	@RequestMapping(value="/community/write", method=RequestMethod.GET)
	public String write() {
		return "/community/write";
	}
	// 게시판 글쓰기 페이지(insert가 이루어짐)
	/*@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public void writePost(String title,String content) {
		System.out.println(title);
		System.out.println(content);
		return content;////
	}*/
	@RequestMapping(value="/community/write", method=RequestMethod.POST)
	public String writePost(CommBoardVo bvo,RedirectAttributes rttr) {
		if(bvo.getAttach()!=null) {
			bvo.getAttach().forEach(attach->System.out.println(attach));
			bs.write(bvo);
		}else {
			bs.write(bvo);
		}
		return "redirect:/community/list";
	}
	//상품후기 게시판
	@RequestMapping(value="/community/review", method=RequestMethod.GET)
	public String rvlist(CommCriterionVo cri, Model model) {
		model.addAttribute("rvlist",bs.rvlist(cri));
		int total=bs.countreview(cri);
		model.addAttribute("reviewpaging", new CommPageVo(cri,total));
		return "/community/review";
	}
	//공지목록
	@RequestMapping(value="/community/notice", method=RequestMethod.GET)
	public String notice(Model model, CommCriterionVo cri) {
		model.addAttribute("notice", bs.notice(cri));
		int total=bs.countBoard(cri);
		model.addAttribute("noticepaging", new CommPageVo(cri,total));
		return "/community/notice";
	}
	@RequestMapping(value="/community/noticewrt", method=RequestMethod.GET)
	public String ntwrt() {
		return "/community/noticewrt";
	}
	@RequestMapping(value="/community/noticewrt", method=RequestMethod.POST)
	public String noticepo(NoticeVo nv, RedirectAttributes rttr) {
		//bs.noticewrt(nv);
		System.out.println("notice="+nv);
		if(nv.getAttach()!=null) {
			nv.getAttach().forEach(attach->System.out.println(attach));
			bs.noticewrt(nv);
		}else {
			bs.noticewrt(nv);
		}
		return "redirect:/community/notice";
	}
	@RequestMapping(value = "/community/ntdetail", method = RequestMethod.GET)
	public String ntdetail(NoticeVo nv, Model model) {
		System.out.println(nv);
		model.addAttribute("ntdetail", bs.ntdetail(nv));
		return "/community/ntdetail";
	}
	@RequestMapping(value="/community/ntdetailmd", method=RequestMethod.POST)
	public String ntdetailmd(NoticeVo nv, Model model) {
		System.out.println(nv);
		model.addAttribute("ntdetailmd",bs.ntdetailmd(nv));
		return "/community/ntdetailmd";
	}
	@RequestMapping(value = "/community/ntupdate", method = RequestMethod.POST)
	public String ntupdate(NoticeVo nv,RedirectAttributes rttr) {
		System.out.println("수정 완료");
		if(bs.ntupdate(nv)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/community/notice";
	}
	@RequestMapping(value = "/community/ntdelete", method = RequestMethod.POST)
	public String ntdelete(int bno, NoticeVo nv,RedirectAttributes rttr) {
		ArrayList<CommUVo> ntlist=bs.ntlist(bno);
		System.out.println(bno+" 삭제");
		if(bs.ntdelete(bno)) {
			deleteFiles(ntlist);
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/community/notice";
	}
	private void deleteFiles(ArrayList<CommUVo> ntlist) {
		if(ntlist==null||ntlist.size()==0) {return;}
		System.out.println(ntlist);
		ntlist.forEach(attach->{
			try {
				Path file=Paths.get("D:\\upload\\"+attach.getUploadPath()+
						"\\"+attach.getUuid()+"_"+attach.getFilename());
				Files.deleteIfExists(file);
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbnail=Paths.get("D:\\upload\\"+attach.getUploadPath()+
							"\\s_"+attach.getUuid()+"_"+attach.getFilename());
					Files.delete(thumbnail);
				}
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		});
	}
	@RequestMapping(value = "/community/uplist", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<CommUVo>> CommuploadAjaxPost(int bno) {
	    return new ResponseEntity<ArrayList<CommUVo>>(bs.uplist(bno),HttpStatus.OK); //통신상태가 원활하면
	}
	@RequestMapping(value = "/community/ntlist", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<CommUVo>> ntuploadAjaxPost(int bno) {
	    return new ResponseEntity<ArrayList<CommUVo>>(bs.ntlist(bno),HttpStatus.OK); //통신상태가 원활하면
	}
}
