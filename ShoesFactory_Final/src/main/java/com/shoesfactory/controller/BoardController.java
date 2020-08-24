package com.shoesfactory.controller;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.shoesfactory.DAOVO.board.BRepleVO;
import com.shoesfactory.DAOVO.board.BoardVO;
import com.shoesfactory.service.BoardService;


@Controller
public class BoardController {

	@Resource(name="boardService")
	private BoardService boardservice;
	
	@RequestMapping(value = "/GetBoardList.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String GetBoardListView(BoardVO vo1, BRepleVO vo2, Model model) {
			model.addAttribute("boardlist",boardservice.GetBoardListView(vo1));
			
		return "board/board_view";		
	}
	
	@RequestMapping(value = "/GetDeteilBoard.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String GetDeteilBoard(BoardVO vo1, BRepleVO vo2, Model model, @RequestParam("board_no")String param,@RequestParam Map map) {

		BoardVO vo3 = new BoardVO();
		vo3.setBOARD_NO(Integer.parseInt(param));
		
		BRepleVO vo4 = new BRepleVO();
		vo4.setBOARD_NO(Integer.parseInt(param));
			System.out.println(param);
			
				
		model.addAttribute("deteilboard",boardservice.GetDeteilBoard(vo3));
		model.addAttribute("breple", boardservice.GetBRepleList(vo4));
		model.addAttribute("deteilboard2",boardservice.GetDeteilBoard(vo3));
			
			/*else if(!param.isEmpty()) {
				vo1.setBOARD_NO(Integer.parseInt(param));
				model.addAttribute("deteilboard", boardservice.GetDeteilBoard(vo3));
			}else {
				vo2.setBOARD_NO((int)map.get("board_no"));
				vo2.setREPLE_WRITER((String)map.get("reple_writer"));
				vo2.setREPLE_CONTEXT((String)map.get("reple_context"));
				vo2.setREPLE_NO((int)map.get("reple_no"));
				List<BRepleVO> list2 = boardservice.GetBRepleList(vo4);
				System.out.println(list2.get(0).getREPLE_CONTEXT());
				model.addAttribute("breple", boardservice.GetBRepleList(vo4));
			}
			 */
		return "board/deteilboard";
	}
	
	
	
	@RequestMapping(value = "/GetDeteilBoard1.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String GetDeteilBoard1(BoardVO vo1, Model model) {
			model.addAttribute("deteilboard",boardservice.GetDeteilBoard(vo1));
		return "board/updateboard";
	}
	
	@RequestMapping(value = "/GetSelectBRepleList.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String GetSelectBRepleList(BRepleVO vo1, Model model,@RequestParam("REPLE_NO") String param) {
			vo1.setREPLE_NO(Integer.parseInt(param));
			model.addAttribute("reple",boardservice.GetSelectBRepleList(vo1));
		return "board/updatereple";
	}
	
	@RequestMapping(value="/GetCreateBoard.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String GetCreateBoard(BoardVO vo1) {	
		boardservice.GetCreateBoard(vo1);
		return "redirect:GetBoardList.do";
	}
	
	@RequestMapping(value="/GetUpdateBoard.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String GetUpdateBoard(BoardVO vo1) {	
		boardservice.GetUpdateBoard(vo1);
		return "redirect:GetBoardList.do";
	}
	
	@RequestMapping(value="/GetDeleteBoard.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String GetDeleteBoard(BoardVO vo1) {	
		
		boardservice.GetDeleteBoard(vo1);
		return "redirect:GetBoardList.do";
	}
	
	@RequestMapping(value="/GetUpdateViewCnt.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String GetUpdateViewCnt(BoardVO vo1, HttpSession session, HttpServletRequest req,RedirectAttributes red) {
		/*System.out.println(vo1.getBOARD_NO());
		redirect.addAttribute("returnvo",vo1.getBOARD_NO());*/
		int returnvalue = vo1.getBOARD_NO();
		red.addAttribute("board_no", returnvalue);
		boardservice.GetUpdateViewCnt(vo1);
		return "redirect:GetDeteilBoard.do";
	}
	
	@RequestMapping(value="/GetUpdateBReple.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String GetUpdateBReple(BRepleVO vo1,RedirectAttributes red) {	
		boardservice.GetUpdateBReple(vo1);
		red.addAttribute("board_no", vo1.getBOARD_NO());
		return "redirect:GetDeteilBoard.do";
	}
	
	@RequestMapping(value="/GetDeleteBReple.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String GetDeleteBReple(BRepleVO vo1,RedirectAttributes red) {	
		boardservice.GetDeleteBReple(vo1);
		red.addAttribute("board_no", vo1.getBOARD_NO());
		return "redirect:GetBoardList.do;";
	}
	
	@RequestMapping(value="/GetDeleteBReple1.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String GetDeleteBReple1(BRepleVO vo1,@RequestParam("REPLE_NO") String param,RedirectAttributes red) {	
		vo1.setBOARD_NO(Integer.parseInt(param));
		boardservice.GetDeleteBReple1(vo1);
		red.addAttribute("board_no", vo1.getBOARD_NO());
		return "redirect:GetDeleteBoard.do;";
	}
	
	
	
	@RequestMapping(value="/GetCreateBReple.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String GetCreateBoard(BRepleVO vo1, RedirectAttributes red) {
		/*System.out.println(vo1.getBOARD_NO());
		redirect.addAttribute("returnvo",vo1.getBOARD_NO());*/
		
		boardservice.GetCreateBReple(vo1);
		red.addAttribute("board_no", vo1.getBOARD_NO());
		return "redirect:GetDeteilBoard.do";
	}
	
	@RequestMapping("BoardpwCheck.do") 
	@ResponseBody
	public String BoardpwCheck(BoardVO vo1, @RequestParam("BOARD_NO") int BOARD_NO) {
		vo1.setBOARD_NO(BOARD_NO);
		
		return boardservice.BoardpwCheck(vo1);
}

	
}



