package com.shoesfactory.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoesfactory.DAOVO.review.ReviewDAO;
import com.shoesfactory.DAOVO.review.ReviewVO;
import com.shoesfactory.service.ReviewService;

@Controller
public class ReviewController {

	@Resource(name="ReviewService")
	private ReviewService reviewservice;
	
	@RequestMapping(value="/GetSelectReview.do", method={RequestMethod.GET,RequestMethod.POST})
	public String GetSelectReview(ReviewVO vo1, Model model,@RequestParam("rev_name")String param) {
		model.addAttribute("review",reviewservice.GetSelectReview(vo1));
		return "board/review";
	}
	
	@RequestMapping(value="/GetSelectUpdate.do", method={RequestMethod.GET,RequestMethod.POST})
	public String GetSelectUpdate(ReviewVO vo1, Model model,RedirectAttributes red) {
		red.addAttribute("rev_name", vo1.getREV_NAME());
		model.addAttribute("review",reviewservice.GetSelectUpdate(vo1));
		return "board/review2";
	}
	
	@RequestMapping(value="GetInsertReview.do", method={RequestMethod.GET,RequestMethod.POST})
	public String GetInsertReview(ReviewVO vo1, Model model,RedirectAttributes red) {
		red.addAttribute("rev_name", vo1.getREV_NAME());
		reviewservice.GetInsertReview(vo1);
		return "redirect:GetSelectReview.do";
	}
	
	@RequestMapping(value="GetUpdateReview.do", method={RequestMethod.GET,RequestMethod.POST})
	public String GetUpdateReview(ReviewVO vo1, Model model,RedirectAttributes red) {
		red.addAttribute("rev_name", vo1.getREV_NAME());
		reviewservice.GetUpdateReview(vo1);
		System.out.println(vo1.getREV_CONTEXT());
		return "redirect:GetSelectReview.do";
	}
	
	@RequestMapping(value="GetDeleteReview.do", method={RequestMethod.GET,RequestMethod.POST})
	public String GetDeleteReview(ReviewVO vo1, Model model,RedirectAttributes red) {
		red.addAttribute("rev_name", vo1.getREV_NAME());
		reviewservice.GetDeleteReview(vo1);
		return "redirect:GetSelectReview.do";
	}
}
