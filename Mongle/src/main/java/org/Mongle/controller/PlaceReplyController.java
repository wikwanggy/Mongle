package org.Mongle.controller;

import java.util.ArrayList;

import org.Mongle.Service.PlaceReplyService;
import org.Mongle.model.PlaceReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PlaceReplyController {
	@Autowired
	PlaceReplyService prs;

	// 댓글쓰기
	@RequestMapping(value = "/replies/new", method = RequestMethod.POST)
	public ResponseEntity<String> replyWrite(@RequestBody PlaceReplyVO reply) {
		int result = prs.rewrite(reply);
		System.out.println(reply);
		// result=1 -> HttpStatus.OK
		// result=0 -> HttpStatus.INTERNAL_SERVER_ERROR
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 댓글목록리스트
	@RequestMapping(value = "/replies/{bno}", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<PlaceReplyVO>> replyList(@PathVariable int bno) {
		return new ResponseEntity<>(prs.list(bno), HttpStatus.OK);
	}

	// 댓글수정
	@RequestMapping(value = "/replies/modify", method = RequestMethod.PUT)
	public ResponseEntity<String> replyModify(@RequestBody PlaceReplyVO reply) {
		int result = prs.modify(reply);
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 댓글삭제
	@RequestMapping(value = "/replies/remove/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> replyRemove(@PathVariable int rno) {
		int result = prs.remove(rno);
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
