package com.vongether.main.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.vongether.admin.member.service.MemberAdminService;
import com.vongether.common.util.interceptor.Auth;
import com.vongether.common.util.interceptor.Auth.Role;
import com.vongether.member.model.MemberVO;

@Controller
@Auth(role=Role.ADMIN)
@RequestMapping("/admin")
public class AdminController {
  
  @Autowired
  private MemberAdminService memberAdminService;

  @Auth
  @RequestMapping(value = {"/", ""}, method = RequestMethod.GET)
  public String adminIndex(HttpSession session) {
    return "index.admin";
  }
  
  @RequestMapping(value = "/login.do", method = RequestMethod.GET)
  public String adminLoginForm() {
    return "login.adminAuth";
  }
  
  @RequestMapping(value = "/login.do", method = RequestMethod.POST)
  public String adminLogin(MemberVO memberVO, HttpSession session, Model model) {
    MemberVO member = memberAdminService.loginAdmin(memberVO);
    if (member != null) {
      session.setAttribute("userInfo", member);
      return "redirect: /admin";
    } else {
      session.invalidate();
      return "redirect: /admin/login.do";
    }
  }
  
  @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
  public String adminLogout(HttpSession session) {
      session.invalidate();
      return "redirect: /admin/login.do";
  }


}
