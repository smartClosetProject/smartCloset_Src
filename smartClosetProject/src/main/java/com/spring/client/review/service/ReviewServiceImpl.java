package com.spring.client.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.spring.client.review.dao.ReviewDAO;
import com.spring.client.review.vo.ReviewVO;
import com.spring.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewDAO  reviewDao;
	
	
	//게시판 리스트 구현
	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo) {
		List<ReviewVO> list = reviewDao.reviewList(rvo);
		return list;
	}

	//전체 레코드 수 구현
	@Override
	public int reviewListCnt(ReviewVO rvo) {
		return reviewDao.reviewListCnt(rvo);
	}
	
	//글쓰기 구현
	@Override
	public int reviewInsert(ReviewVO rvo) throws Exception {
		
		if(rvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(rvo.getFile(), "review");
			rvo.setR_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			rvo.setR_thumb(thumbName);
		}
		int result = 0;
		result = reviewDao.reviewInsert(rvo);
		return result;
	}

	//상세페이지
	@Override
	public ReviewVO reviewDetail(ReviewVO rvo) {
		ReviewVO detail = null;
		detail = reviewDao.reviewDetail(rvo);
		if(detail != null) {
			detail.setR_content(detail.getR_content().toString().replaceAll("\n", "<br>"));
		}
		return detail;
	}
	//글 수정 구현
	@Override
	public ReviewVO updateForm(ReviewVO rvo) {
		ReviewVO update = reviewDao.reviewDetail(rvo);
		return update;
	}
	//글 수정 처리
	@Override
	public int reviewUpdate(ReviewVO rvo) throws Exception{
		if(!rvo.getFile().isEmpty()) {// 새로운 첨부된 파일 유무
			if(!rvo.getR_file().isEmpty()){
				FileUploadUtil.fileDelete(rvo.getR_file());
				FileUploadUtil.fileDelete(rvo.getR_thumb());
			}
		
		
			String fileName = FileUploadUtil.fileUpload(rvo.getFile(), "review");
			rvo.setR_file(fileName);
		
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			rvo.setR_thumb(thumbName);
		}
		
		int result = reviewDao.reviewUpdate(rvo);
		return result;
	}
	//글삭제 처리
	@Override
	public int reviewDelete(ReviewVO rvo) throws Exception {
		if(!rvo.getR_file().isEmpty()) {
			FileUploadUtil.fileDelete(rvo.getR_file());
			FileUploadUtil.fileDelete(rvo.getR_thumb());
		}
		int result = reviewDao.reviewDelete(rvo);
		return result;
	}
	
	

}
