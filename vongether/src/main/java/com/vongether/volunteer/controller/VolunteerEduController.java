package com.vongether.volunteer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/volunteeredu")
public class VolunteerEduController {
  
  @RequestMapping(value="/list.do", method=RequestMethod.GET)
  public String volunteerEduList() {
      return "volunteerEdu/volunteerEduList.page";
  }

}
