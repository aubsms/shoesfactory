package com.shoesfactory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeContorller {

	
	@RequestMapping(value="/shoesfactory_home.do")
	public String home(){
		return "shoesfactory_home";	
	}
}
