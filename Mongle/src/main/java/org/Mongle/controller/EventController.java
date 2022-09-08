package org.Mongle.controller;

import org.Mongle.Service.EventService;
import org.Mongle.model.EventVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EventController {
	
	@Autowired
	EventService es;
	//댓글쓰끼
	@RequestMapping(value = "/replys/new",method= RequestMethod.POST)
	public ResponseEntity<String> replywrite(@RequestBody EventVO reply){
		//insert가 성공했으면 result변수에 1저장
		//insert가 실패했으면 result변수에 0저장
		int result=es.rewrite(reply);
		
		System.out.println(reply);
		//result가 1이면 HttpStatus.OK
		//result가 0이면 HttpStatus.INTERNAL_SERVER_ERROR
		return result==1?new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
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
