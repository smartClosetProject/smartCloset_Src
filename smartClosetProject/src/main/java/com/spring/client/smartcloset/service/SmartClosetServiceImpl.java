package com.spring.client.smartcloset.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.order.vo.OrderVO;
import com.spring.client.smartcloset.dao.SmartClosetDAO;
import com.spring.client.smartcloset.vo.SmartClosetVO;
import com.spring.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class SmartClosetServiceImpl implements SmartClosetService {
	@Setter(onMethod_ = @Autowired)
	private SmartClosetDAO sClosetDao;

	@Override
	public void buyInsertSCloset(OrderVO ovo) {
		sClosetDao.buyInsertSCloset(ovo);
	}

	@Override
	public List<SmartClosetVO> smartCloset(SmartClosetVO svo) {
		List<SmartClosetVO> closetList = sClosetDao.smartCloset(svo);
		return closetList;
	}

	@Override
	public void regCloset(SmartClosetVO svo) throws Exception {
		if (svo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(svo.getFile(), "sCloset");
			svo.setSc_image(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			svo.setSc_thumb(thumbName);
		}
		sClosetDao.regCloset(svo);
	}
}
