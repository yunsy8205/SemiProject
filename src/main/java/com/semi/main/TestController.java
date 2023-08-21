package com.semi.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/")
public class TestController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() throws Exception{
		
		return "home";
	}
	



}
