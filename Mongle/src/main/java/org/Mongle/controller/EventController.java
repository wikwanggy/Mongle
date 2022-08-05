package org.Mongle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EventController {
	@RequestMapping(value = "/event/eventmain", method = RequestMethod.GET)
	public String list() {
		return  "event/eventmain";
	}
	
	@RequestMapping(value = "/event/event1", method = RequestMethod.GET)
	public String ev1() {
		return  "event/event1";
	}
	
	@RequestMapping(value = "/event/event2", method = RequestMethod.GET)
	public String ev2() {
		return  "event/event2";
	}
	
	@RequestMapping(value = "/event/event3", method = RequestMethod.GET)
	public String ev3() {
		return  "event/event3";
	}
	
	@RequestMapping(value = "/event/event4", method = RequestMethod.GET)
	public String ev4() {
		return  "event/event4";
	}
	
	@RequestMapping(value = "/event/event5", method = RequestMethod.GET)
	public String ev5() {
		return  "event/event5";
	}
	
	@RequestMapping(value = "/event/event6", method = RequestMethod.GET)
	public String ev6() {
		return  "event/event6";
	}
	
	@RequestMapping(value = "/event/event7", method = RequestMethod.GET)
	public String ev7() {
		return  "event/event7";
	}
}
