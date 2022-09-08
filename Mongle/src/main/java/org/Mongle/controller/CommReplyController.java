package org.Mongle.controller;

import java.util.ArrayList;

import org.Mongle.model.CommReplyupVo;
import org.Mongle.Service.CommReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommReplyController {
	@Autowired
	CommReplyService crs;
	
	@RequestMapping(value="/commreply/new", method=RequestMethod.POST)
	public ResponseEntity<String> replycomwrt(@RequestBody CommReplyupVo crv){
		int result=crs.rewrite(crv);
		System.out.println(crv);
		return result==1?new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@RequestMapping (value = "/commreplies/{bno}", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<CommReplyupVo>> commreplylist(@PathVariable int bno) { //비동기식으로 처리해야 할 경우 @PathVariable
		System.out.println(bno);
		return new ResponseEntity<>(crs.list(bno),HttpStatus.OK);
	}
	@RequestMapping (value = "/commreplies/remove/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> commreplyremove(@PathVariable int rno){
		System.out.println(rno+"번 삭제");
	    int result=crs.remove(rno);
		return result==1?new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}