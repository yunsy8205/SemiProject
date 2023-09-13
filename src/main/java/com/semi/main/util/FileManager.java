package com.semi.main.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.semi.main.file.FileDTO;

@Component
public class FileManager {
	
	
	//파일삭
	public boolean fileDelete(FileDTO fileDTO, String path, HttpSession session) {
	    // 1. 삭제할 폴더의 실제 경로
	    path = session.getServletContext().getRealPath(path);

	    File file = new File(path, fileDTO.getOriginalName());

	    // 로그 추가
	    System.out.println("Deleting file: " + file.getAbsolutePath());

	    return file.delete();
	}

	
	
	//fileSave
	public String fileSave(String path, HttpSession session, MultipartFile multipartFile)throws Exception{
		//파일의 정보를 이용해서 HDD에 파일을 저장
		
		//1. 어디에 저장??
		
		
		//2. 실제 경로 알아오기
		//jsp : application
		//java : ServletContext
		String realPath = session.getServletContext().getRealPath(path);
		System.out.println(realPath);
		
		File file = new File(realPath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		//3. 어떤이름으로 저장??
		//1. 시간을 이용
//		Calendar ca = Calendar.getInstance();
//		long result = ca.getTimeInMillis();
//		file = new File(file, result+"_"+multipartFile.getOriginalFilename());
		//2. API 사용 
		String uId =UUID.randomUUID().toString();
		uId = uId+"_"+multipartFile.getOriginalFilename();
		System.out.println(uId);
		file = new File(file, uId);
		
		
		
		//4. 파일을 저장
		//A. Spring에서 제공하는 API FileCopyUtils copy메서드
		//FileCopyUtils.copy(multipartFile.getBytes(), file);
		
		//B. MultipartFile의 transferTo메서드
		multipartFile.transferTo(file);
		
		return uId;
		
	}

}