package com.spring.admin.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class PrFileUploadUtil {
	
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			return;
		}
		fileDir.mkdir();
	}
	
	//파일 업로드
	public static String fileUpload(MultipartFile file, String fileName) throws IOException{
		log.info("fileUpload 호출 성공");
		
		String real_name=null;
		String org_name=file.getOriginalFilename();
		log.info("org_name : "+org_name);
		
		if(org_name !=null &&(!org_name.equals(""))) {
			real_name=fileName+"_"+System.currentTimeMillis()+"_"+org_name;
			
			String docRoot = "C://uploadStorage//"+fileName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot+"/"+real_name);
			log.info("업로드할 파일 : "+fileAdd);
			
			file.transferTo(fileAdd);
		}
		return real_name;
	}
	
	//thumb 파일 생성
	public static String makeThumb(String fileName, int size) throws Exception{
		String dirName=fileName.substring(0,fileName.indexOf("_"));
		String imgPath="C://uploadStorage//"+dirName;
		
		File fileAdd= new File(imgPath, fileName);
		log.info("원본 이미지 파일 : "+fileAdd);
		
		BufferedImage sourceImg = ImageIO.read(fileAdd);
		BufferedImage destImg
		=Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_WIDTH,size);
		
		String thumbName="thumb_"+fileName;
		String docRoot=imgPath+"/thumb";
		makeDir(docRoot);
		
		File newFile = new File(docRoot, thumbName);
		log.info("업로드할 파일 : "+newFile);
		
		String formatName= fileName.substring(fileName.lastIndexOf(".")+1);
		log.info("확장자(formatName)"+formatName);
		
		ImageIO.write(destImg, formatName, newFile);
		return thumbName;
		
	}
}
