package org.Mongle.controller;

import java.util.ArrayList;

import org.Mongle.Service.PlaceService;
import org.Mongle.model.PlaceAttachFileVO;
import org.Mongle.model.PlaceCriteriaVO;
import org.Mongle.model.PlacePageVO;
import org.Mongle.model.PlaceVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class PlaceController {
	// 포함관계
	@Autowired
	PlaceService ps;

	// place메인
	@RequestMapping(value = "/place", method = RequestMethod.GET)
	public String place() {
		return "place/place";
	}

	// place-clinic
	@RequestMapping(value = "/place/clinic", method = RequestMethod.GET)
	public String clinic(Model model, PlaceCriteriaVO pcri) {
		model.addAttribute("list", ps.list(pcri));
		int total = ps.total(pcri);
		model.addAttribute("paging", new PlacePageVO(pcri, total));
		return "place/clinic";
	}

	// place-grooming
	@RequestMapping(value = "/place/grooming", method = RequestMethod.GET)
	public String grooming(Model model, PlaceCriteriaVO pcri) {
		model.addAttribute("list", ps.list(pcri));
		int total = ps.total(pcri);
		model.addAttribute("paging", new PlacePageVO(pcri, total));
		return "place/grooming";
	}

	// place-school
	@RequestMapping(value = "/place/school", method = RequestMethod.GET)
	public String school(Model model, PlaceCriteriaVO pcri) {
		model.addAttribute("list", ps.list(pcri));
		int total = ps.total(pcri);
		model.addAttribute("paging", new PlacePageVO(pcri, total));
		return "place/school";
	}

	// place-cafe
	@RequestMapping(value = "/place/cafe", method = RequestMethod.GET)
	public String cafe(Model model, PlaceCriteriaVO pcri) {
		model.addAttribute("list", ps.list(pcri));
		int total = ps.total(pcri);
		model.addAttribute("paging", new PlacePageVO(pcri, total));
		return "place/cafe";
	}

	// place-hotel
	@RequestMapping(value = "/place/hotel", method = RequestMethod.GET)
	public String hotel(Model model, PlaceCriteriaVO pcri) {
		model.addAttribute("list", ps.list(pcri));
		int total = ps.total(pcri);
		model.addAttribute("paging", new PlacePageVO(pcri, total));
		return "place/hotel";
	}

	// place-write
	@RequestMapping(value = "/place/write", method = RequestMethod.GET)
	public String writeget() {
		return "place/write";
	}

	@RequestMapping(value = "/place/write", method = RequestMethod.POST)
	public String writepost(PlaceVo pvo) {
		ps.write(pvo);
		return "redirect:/place/cafe";
	}

	// 해당게시물의 첨부파일의 데이터를 ajax로 전송
	@RequestMapping(value = "/placeattachlist", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<PlaceAttachFileVO>> uploadAjaxPost(int bno) {

		return new ResponseEntity<>(ps.attachlist(bno), HttpStatus.OK);
	}

	// place-content
	@RequestMapping(value = "/place/detail", method = RequestMethod.GET)
	public String content(PlaceVo pvo, Model model) {
		model.addAttribute("detail", ps.detail(pvo));
		return "place/detail";
	}

	@RequestMapping(value = "/place/modify", method = RequestMethod.GET)
	public String modify(PlaceVo pvo, RedirectAttributes rttr) {
		// 글 수정
		ps.modify(pvo);
		rttr.addAttribute("bno", pvo.getBno());
		return "redirect:/place/list";
	}

	@RequestMapping(value = "/place/remove", method = RequestMethod.GET)
	public String remove(PlaceVo pvo) {
		// 글 삭제
		ps.remove(pvo);
		return "redirect:/place/list";
	}

}