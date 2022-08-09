package org.Mongle.controller;

import org.Mongle.model.PlaceVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PlaceController {
	// place메인
	@RequestMapping(value = "/place", method = RequestMethod.GET)
	public String place() {
		return "place/place";
	}

	// place-clinic
	@RequestMapping(value = "/place/clinic", method = RequestMethod.GET)
	public String clinic() {
		return "place/clinic";
	}

	// place-grooming
	@RequestMapping(value = "/place/grooming", method = RequestMethod.GET)
	public String grooming() {
		return "place/grooming";
	}

	// place-school
	@RequestMapping(value = "/place/school", method = RequestMethod.GET)
	public String school() {
		return "place/school";
	}

	// place-cafe
	@RequestMapping(value = "/place/cafe", method = RequestMethod.GET)
	public String cafe() {
		return "place/cafe";
	}

	// place-hotel
	@RequestMapping(value = "/place/hotel", method = RequestMethod.GET)
	public String hotel() {
		return "place/hotel";
	}

	// place-write
	@RequestMapping(value = "/place/write", method = RequestMethod.GET)
	public String write() {
		return "place/write";
	}
	// place-content
	@RequestMapping(value = "/place/content", method = RequestMethod.GET)
	public String content() {
		return "place/content";
	}
	@RequestMapping(value="/place/write", method=RequestMethod.POST)
	public void writePost(PlaceVo bvo) {
		System.out.println(bvo);
	}

}