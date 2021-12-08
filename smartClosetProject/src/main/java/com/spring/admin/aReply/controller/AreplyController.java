package com.spring.admin.aReply.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.admin.aReply.service.AreplyService;
import com.spring.admin.aReply.vo.AreplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value = "/aReply/*")
@Log4j
@AllArgsConstructor
public class AreplyController {

	private AreplyService replyService;
	
	@GetMapping(value = "/all/{q_num}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AreplyVO>> replyList(@PathVariable("q_num") Integer q_num){ 
		//@GetMapping(value = "/all/{q_num}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE) <<이걸로 URL을 주고, @PathVariable("q_num")<<이걸로 파라미터 꺼내오기
		
		log.info("list 호출 성공");
		
		ResponseEntity<List<AreplyVO>> entity = null;
		entity = new ResponseEntity<>(replyService.aReplyList(q_num), HttpStatus.OK);// HttpStatus.OK : 200번. 아무 문제 없다는 뜻.
		
		return entity;
	}
	

	@PostMapping(value = "/aReplyInsert", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE })
	public String replyInsert(@RequestBody AreplyVO rvo) {
		log.info("aReplyInsert 호출 성공");
		int result = 0;
		
		result = replyService.aReplyInsert(rvo);
		return (result==1) ? "SUCCESS" : "FAILURE";
	}


	@RequestMapping(value="/{r_num}",method= {RequestMethod.PUT, RequestMethod.PATCH},
			consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> aReplyUpdate(@PathVariable("r_num") Integer r_num,
			@RequestBody AreplyVO rvo){
		log.info("aReplyUpdate 호출 성공");
		
		rvo.setR_num(r_num);
		int result = replyService.aReplyUpdate(rvo);
		return result==1 ? new ResponseEntity<String>("SUCCESS",HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

	@DeleteMapping(value="/{r_num}",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> aReplyDelete(@PathVariable("r_num") Integer r_num){
		log.info("aReplyDelete 호출 성공");
		log.info("r_num = "+r_num);
		
		int result = replyService.aReplyDelete(r_num);
		return result==1 ? new ResponseEntity<String>("SUCCESS",HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}

