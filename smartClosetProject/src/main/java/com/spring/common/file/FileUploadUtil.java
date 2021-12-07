package com.spring.common.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUploadUtil {
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if (fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}
	
	public static String fileUpload(MultipartFile file, String folderName) throws IOException {
		log.info("fileUpload 호출 성공");
		
		String real_name = null;
		String org_name = file.getOriginalFilename();
		log.info("org_name : " + org_name);
		
		if (org_name != null && (!org_name.equals(""))) {
			real_name = folderName + "_" + System.currentTimeMillis() + "_" + org_name;
			
			String docRoot = "C://uploadStorage//" + folderName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot + "/" + real_name);
			log.info("업로드할 파일(fileAdd) : " + fileAdd);
			
			file.transferTo(fileAdd);
		}
		return real_name;
	}
	
	public static void fileDelete(String fileName) throws IOException{
		log.info("fileDelete 호출 성공 ");
		boolean result = false; 
		String startDirName = "", docRoot = "";
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		
		if (dirName.equals("thumbnail")) {
			startDirName = fileName.substring(dirName.length() + 1, fileName.indexOf("_", dirName.length() + 1));
			docRoot = "C://uploadStorage//" + startDirName + "//" + dirName;
		} else {
			docRoot = "C://uploadStorage//" + dirName;
		}

		File fileDelete =new File(docRoot + "/" + fileName);
		log.info("삭제할 파일(fileDelete) : " + fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()){
			result = fileDelete.delete();
		}
		log.info("파일 삭제 여부(true/false) : " + result);
	}
	
	public static String makeThumbnail(String fileName) throws Exception {
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		String imgPath = "C://uploadStorage//" + dirName;
		
		File fileAdd = new File(imgPath, fileName);
		log.info("원본 이미지 파일(fileAdd) : " + fileAdd);
		
		BufferedImage sourceImg = ImageIO.read(fileAdd);
		BufferedImage destImg
		= Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 133);
		
		String thumbnailName = "thumbnail_" + fileName;
		String docRoot = imgPath + "/thumbnail";
		makeDir(docRoot);
		
		File newFile = new File(docRoot, thumbnailName);
		log.info("업로드할 파일(newFile) : " + newFile);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		log.info("확장자(formatName) : " + formatName);
		
		ImageIO.write(destImg, formatName, newFile);
		return thumbnailName;
	}
}
