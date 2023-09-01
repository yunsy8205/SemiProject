package com.semi.main.helper;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WebHelper {
	
	/** 기본 인코딩 타입 설정 */
	private String encType;
	
	/** JSP의 request 내장 객체 */
	private HttpServletRequest request;
	
	/** JSP의 response 내장 객체 */
	private HttpServletResponse response;
	
	/** 업로드 된 결과물이 저장될 폴더 */
	private String uploadDir;
	
	/** 업로드 된 파일이 식별될 URL경로 */
	private String uploadPath;

	public String getEncType() {
		return encType;
	}

	public String getUploadDir() {
		return uploadDir;
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setEncType(String encType) {
		this.encType = encType;
	}

	public void setUploadDir(String uploadDir) {
		this.uploadDir = uploadDir;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	
	/**
	 * 싱글톤 객체가 생성될 때 호출되는 메서드로 JSP의 주요 내장객체를 멤버변수에 연결한다.
	 * 
	 * @param request
	 * @param response
	 */
	public void init(HttpServletRequest request, HttpServletResponse response) {
	
		// JSP 내장객체 참조하기
		this.request = request;
		this.response = response;
		
		String methodName = request.getMethod();  // GET방식인지, POST방식인지 조회한다.
		String url = request.getRequestURL().toString();  //현재 URL을 획득한다.
		String queryString = request.getQueryString();  // URL에서 "?"이후의 GET파라미터 문자열을 모두 가져온다.
		
		if(queryString != null) {
			url = url + "?" + queryString;
		}
		
		/** 내장객체 초기화 -> utf-8 설정 */
		try {
			this.request.setCharacterEncoding(this.encType);
			this.response.setCharacterEncoding(this.encType);
		}
		catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	}
	
	
	

}
