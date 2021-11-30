package com.spring.reply.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.reply.service.ReplyService;
import com.spring.reply.vo.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value="/replies/*")
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService replyService;
	
	
	@GetMapping(value="/all/{q_num}", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("q_num")Integer b_num) {
	log.info("list 호출 성공");
	
	ResponseEntity<List<ReplyVO>> entity = null;
	entity = new ResponseEntity<>(replyService.replyList(b_num), HttpStatus.OK);
	return entity;
	}
	@PostMapping(value = "/replyInsert", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public String replyInsert(@RequestBody ReplyVO rvo) {
		log.info("replyInsert 호출 성공");
		log.info("ReplyVO:" +rvo);
		int result =0;
		
		result = replyService.replyInsert(rvo);
		return (result ==1) ? "SUCCESS" : "FAILURE" ;
	}
}