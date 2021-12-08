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
	// FileUploadUtil 클래스의 모든 메서드는 정적 메서드로 정의한다.
	
	/* 파일 업로드할 폴더 생성 */
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if (fileDir.exists()) {
			return;
		}
		fileDir.mkdirs(); // mkdirs(): docRoot 경로에 폴더가 없을 경우 모두 생성함.
	}
	
	/* 파일 업로드 메서드
	 * 파일명 중복 시 해결 방법
	 * System.currentTimeMillis()를 파일명으로 사용하거나 UUID를 사용한다. UUID는 128비트의 수이다.
	 * 표준 형식에서 UUID는 32개의 16진수로 표현되며 총 36개 문자(32개 문자와 4개의 하이픈)로 된
	 * 8-4-4-4-12 라는 5개의 그룹을 하이픈으로 구분한다.
	 * UUID.randomUUID().toString()을 이용해서 얻는다.
	 * 예시) 50e8400-e28b-41d4-a716-446655440000
	 *  */
	/* 클라이언트가 업로드한 파일을 서버에 저장하는 메서드 */
	public static String fileUpload(MultipartFile file, String folderName) throws IOException {
		log.info("fileUpload 호출 성공");
		
		String real_name = null;
		// MultipartFile 클래스의 getFile() 메서드로 클라이언트가 업로드한 파일 정보를 얻는다.
		String org_name = file.getOriginalFilename(); // getOriginalFilename() 클라이언트가 올린 원본 파일명
		log.info("org_name : " + org_name);
		
		// 파일명 변경(중복되지 않게)
		if (org_name != null && (!org_name.equals(""))) {
			real_name = folderName + "_" + System.currentTimeMillis() + "_" + org_name; // 저장할 파일 이름. fileName = board, member 등
			
			String docRoot = "C://uploadStorage//" + folderName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot + "/" + real_name); // 파일 생성 후
			log.info("업로드할 파일(fileAdd) : " + fileAdd);
			
			file.transferTo(fileAdd); // 업로드 파일(file)을 fileAdd에 저장한다.
		}
		return real_name;
	}
	
	/* 파일 삭제 메서드 */
	public static void fileDelete(String fileName) throws IOException{
		log.info("fileDelete 호출 성공 ");
		boolean result = false; 
		String startDirName = "", docRoot = "";
		// fileName = board, member 등, real_name = 전체파일명
		String folderName = fileName.substring(0, fileName.indexOf("_"));
		
		if (folderName.equals("thumbnail")) {
			startDirName = fileName.substring(folderName.length() + 1, fileName.indexOf("_", folderName.length() + 1));
			docRoot = "C://uploadStorage//" + startDirName + "//" + folderName;
		} else {
			docRoot = "C://uploadStorage//" + folderName;
		}

		File fileDelete =new File(docRoot + "/" + fileName); // 파일 생성 후 
		log.info("삭제할 파일(fileDelete) : " + fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()){
			result = fileDelete.delete();
		}
		log.info("파일 삭제 여부(true/false) : " + result);
	}
	
	/* 파일 Thumbnail 생성 메서드 */
	public static String makeThumbnail(String fileName) throws Exception {
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		// 이미지가 존재하는 폴더 추출
		String imgPath = "C://uploadStorage//" + dirName; // C://uploadStorage//board
		// 추출된 폴더의 실제 경로(물리적 위치: C:\...)
		File fileAdd = new File(imgPath, fileName); // C://uploadStorage//board//board_000000_a.gif
		log.info("원본 이미지 파일(fileAdd) : " + fileAdd);
		
		BufferedImage sourceImg = ImageIO.read(fileAdd);
		BufferedImage destImg
		= Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 133);
		// 		resize(대상[BufferedImage 타입], 원본비율, 높이 또는 너비, 크기)
		
		String thumbnailName = "thumbnail_" + fileName; // thumbnail_board_000000_a.gif
		String docRoot = imgPath + "/thumbnail"; // C://uploadStorage//board//thumbnail
		makeDir(docRoot);
		
		File newFile = new File(docRoot, thumbnailName); // C://uploadStorage//board//thumbnail//thumbnail_board_000000_a.gif
		log.info("업로드할 파일(newFile) : " + newFile);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		log.info("확장자(formatName) : " + formatName);
		
		ImageIO.write(destImg, formatName, newFile);
		return thumbnailName;
	}
}
