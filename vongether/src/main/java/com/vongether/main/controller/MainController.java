package com.vongether.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vongether.board.model.BoardVO;
import com.vongether.intro.model.VisitCountVO;
import com.vongether.intro.service.IntroService;

@Controller
public class MainController {

	@Autowired
	private IntroService introService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpSession session, Model model) {
	  
	  if(session.getAttribute("visitIp") != request.getRemoteAddr()) {
        VisitCountVO visitCountVO = new VisitCountVO();
        visitCountVO.setVisitIp(request.getRemoteAddr());
        introService.visitCount(visitCountVO);
        session.setAttribute("visitIp", request.getRemoteAddr());
      }
	  List<BoardVO> list = introService.getNoticeTop3();
	  for(int i=0;i<list.size();i++) {
		  String content = list.get(i).getbContent().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		  String title = list.get(i).getbTitle().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		  list.get(i).setbContent(content);
		  list.get(i).setbTitle(title);
	  }
	  model.addAttribute("notice", list);
	  return "index.index";
	}
	
}
