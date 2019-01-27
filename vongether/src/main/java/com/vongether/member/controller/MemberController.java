package com.vongether.member.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.vongether.board.model.BoardVO;
import com.vongether.common.util.Aria;
import com.vongether.common.util.Pagination;
import com.vongether.member.model.MemberVO;
import com.vongether.member.model.PostVO;
import com.vongether.member.service.MemberService;
import com.vongether.volunteer.model.VolunteerAppVo;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    // 페이지 화면 이동(GET)
    @RequestMapping(value = "/join.do", method = RequestMethod.GET)
    public String join() {
        return "member/join.page";
    }

    // DB 보내기 전 유효성 체크, 체크후 매퍼 실행
    // Map 으로 성공 여부 전달
    @ResponseBody
    @RequestMapping(value = "/join.do", method = RequestMethod.POST)
    public Map<String, String> join(@Valid@RequestBody MemberVO memberVO, BindingResult br, RedirectAttributes rttr, HttpSession session) throws Exception {

        memberService.insert(memberVO);
        Map<String, String> param = new HashMap<String, String>();
        
        // valid의 어긋나는 BindingResult 문제 발생한 경우 
        if(br.hasErrors()) {
            param.put("isSuccess", "false");
            return param;
        }
        
        // 가입 성공한 경우
        param.put("isSuccess", "true");
        return param;
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public String login() {
        return "member/login.page";
    }

    // 세션에 로그인 유저 정보를 담는다
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(String mId, String mPwd, HttpSession session, Model model) throws Exception {
    
      // 입력된 패스워드를 Aria 암호화해서 실행 
      String key = "AriaTestKey";
      Aria aria = new Aria(key);
      Map<String, Object> param = new HashMap<String, Object>();
      param.put("mId", mId);
      param.put("mPwd", aria.Encrypt(mPwd));
      int result = memberService.checkPwd(param);
      
      // 로그인이 성공했을 경우
      if(result == 1) {
        MemberVO memberVO = memberService.selectOne(param);
        
        if (memberVO.getmRole().equals("ROLE_USER") || memberVO.getmRole().equals("ROLE_ADMIN")) {
          model.addAttribute("memberVO", memberVO);
          session.setAttribute("userInfo", memberVO);
          return "redirect:/";
          
        } else if (memberVO.getmRole().equals("ROLE_GUEST")) {
          session.invalidate();
          return "member/limitLogin.page";
        }
        
      } else {
        // 로그인 실패했을 경우 세션 초기화
        session.invalidate();
        return "redirect:/member/login.do";
      }
      return "redirect:/member/login.do";
    }

    // 로그아웃 시 세션 초기화
    @RequestMapping(value = "/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value = "/emailConfirm.do")
    public String emailConfirm(String mId, Model model) throws Exception{
        memberService.userAuth(mId);
        model.addAttribute("mId", mId);
        return "member/emailConfirm.page";
    }

    @ResponseBody
    @RequestMapping(value = "/idCheck")
    public int checkId(@RequestParam("mId") String mId) throws Exception{
        return memberService.checkId(mId);
    }

    @RequestMapping(value = "/editCheck.do", method= RequestMethod.GET)
    public String editCheck() throws Exception{
        return "member/editCheck.page";
    }

    @RequestMapping(value = "/editCheck.do", method= RequestMethod.POST)
    public String editCheck(RedirectAttributes rttr, String mId, String mPwd, HttpSession session) throws Exception{

      String key = "AriaTestKey";
      Aria aria = new Aria(key);
      Map<String, Object> param = new HashMap<String, Object>();
      param.put("mId", mId);
      param.put("mPwd", aria.Encrypt(mPwd));
      int result = memberService.checkPwd(param);
      
      if(result == 1 ) {
        return "redirect:/member/edit.do";
        
      }
      
      return "redirect:/member/editCheck.do";
      
    }

    @RequestMapping(value = "/view.do")
    public String view() throws Exception{
        return "member/view.page";
    }

    @RequestMapping(value = "/edit.do", method= RequestMethod.GET)
    public String edit() throws Exception{
        return "member/edit.page";
    }

    @ResponseBody
    @RequestMapping(value = "/edit.do", method= RequestMethod.POST)
    public Map<String, String> edit(RedirectAttributes rttr, @RequestBody MemberVO memberVO, HttpSession session) throws Exception{
        Map<String, String> map = new HashMap<String, String>();
        // 유효성 체크후 실행
        Boolean result = memberService.update(memberVO);

        if(result) {
            session.setAttribute("userInfo", memberVO);
            map.put("isSuccess", "true");
            return map;
        }
        map.put("isSuccess", "false");
        return map;
    }

    @RequestMapping(value = "/findId.do", method= RequestMethod.GET)
    public String findId() throws Exception {
        return "member/findId.page";
    }

    // RedirectAttributes 일회성으로 데이터를 넘길 수 있다
    @RequestMapping(value = "/findId.do", method= RequestMethod.POST)
    public String findId(RedirectAttributes rttr, String mName, String mBirth) throws Exception{
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("mName", mName);
        param.put("mBirth", mBirth);
        String result = memberService.findId(param);
        rttr.addFlashAttribute("mId", result);

        if(result !=null) {
            return "redirect:/member/findOKId.do";
        }
        return "redirect:member/findId.do";
    }

    @RequestMapping(value = "/findOKId.do")
    public String findOKId() {
        return "member/findOKId.page";
    }

    @RequestMapping(value = "/findPwd.do", method= RequestMethod.GET)
    public String findPwd() {
        return "member/findPwd.page";
    }

    @RequestMapping(value = "/findPwd.do", method= RequestMethod.POST)
    public String findPwd(String mId, String mName, String mBirth, RedirectAttributes rttr) throws Exception{
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("mId", mId);
        param.put("mName", mName);
        param.put("mBirth", mBirth);

        // 비밀번호 재생성에 필요한 아이디값 히든으로 전달
        rttr.addFlashAttribute("mId", mId);
        String result = memberService.findPwd(param);

        if(result != null) {
            return "redirect:/member/newPwd.do";
        }
        return "redirect:/";
    }

    @RequestMapping(value = "/newPwd.do", method= RequestMethod.GET)
    public String newPwd() {
        return "member/newPwd.page";
    }

    @RequestMapping(value = "/newPwd.do", method= RequestMethod.POST)
    public String newPwd(String mId, String mPwd) throws Exception{
    
      String key = "AriaTestKey";
      Aria aria = new Aria(key);
      Map<String, Object> param = new HashMap<String, Object>();
      param.put("mId", mId);
      param.put("mPwd", aria.Encrypt(mPwd));
      Boolean result = memberService.newPwd(param);

      if(result) {
        return "redirect:/member/login.do";
        
      }

      return "redirect:/member/findPwd.do";
      
    }

    @RequestMapping(value = "/signOut.do", method= RequestMethod.GET)
    public String signOut() throws Exception{
        return "member/signOut.page";
    }

    @RequestMapping(value = "/signOut.do", method= RequestMethod.POST)
    public String signOut(RedirectAttributes rttr, String mId, String mPwd, HttpSession session) throws Exception{
      String key = "AriaTestKey";
      Aria aria = new Aria(key);
      Map<String, Object> param = new HashMap<String, Object>();
      param.put("mId", mId);
      param.put("mPwd", aria.Encrypt(mPwd));
      int result = memberService.checkPwd(param);
      
      if(result == 1) {
        System.out.println("성공시:"+ result);
        memberService.singOut(param);
        session.invalidate();
        return "redirect:/";
        
      }

      return "redirect:/member/signOut.do";
      
    }

    public static final String ZIPCODE_API_KEY = "3a167b364799b7ff01545215585606";
    public static final String ZIPCODE_API_URL = "https://biz.epost.go.kr/KpostPortal/openapi";

    @RequestMapping(value = "postcodelist", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public @ResponseBody String postCodeList(@RequestParam Map<String, String> param) throws Exception {

        Map<String, Object> paramMap = new HashMap<String, Object>();
        StringBuilder queryUrl = new StringBuilder();
        String query = param.get("query");
        int currentPage = Integer.parseInt(param.get("currentPage"));

        queryUrl.append(ZIPCODE_API_URL);
        queryUrl.append("?regkey=");
        queryUrl.append(ZIPCODE_API_KEY);
        queryUrl.append("&target=");
        queryUrl.append("postNew");
        queryUrl.append("&query=");
        queryUrl.append(URLEncoder.encode(query.replaceAll(" ", ""), "EUC-KR"));
        queryUrl.append("&countPerPage=");
        queryUrl.append("10");
        queryUrl.append("&currentPage=");
        queryUrl.append(currentPage);

        Document document = Jsoup.connect(queryUrl.toString()).get();
        String errorCode = document.select("error_code").text();

        int totalCount;
        int totalPage;
        int countPerPage;

        if(null == errorCode || "".equals(errorCode)) {
            Elements pageInfoElement = document.select("pageinfo");

            totalCount = Integer.parseInt(pageInfoElement.select("totalCount"). text());
            totalPage = Integer.parseInt(pageInfoElement.select("totalPage").text())-1;
            countPerPage = Integer.parseInt(pageInfoElement.select("countPerPage").text());

            if (totalCount % countPerPage > 0) {
                totalPage++;
            }

            if (totalPage < currentPage) {
                currentPage = totalPage;
            }

            int startPage = ((currentPage - 1) / countPerPage) * countPerPage + 1;
            int endPage = startPage + countPerPage - 1;

            if (endPage > totalPage) {
                endPage = totalPage;
            }

            Elements itemElements = document.select("item");
            List<PostVO> list = new ArrayList<PostVO>();
            PostVO postVO = null;

            for(Element element : itemElements){
                postVO = new PostVO();
                postVO.setZipcode(element.select("postcd").text());
                postVO.setAddress(element.select("address").text());
                list.add(postVO);
            }
            paramMap.put("postlist", list);
            paramMap.put("totalCount", totalCount);
            paramMap.put("totalPage", totalPage);
            paramMap.put("countPerPage", countPerPage);
            paramMap.put("currentPage", currentPage);
            paramMap.put("startPage", startPage);
            paramMap.put("endPage", endPage);
        }else{
            String errorMessage = document.select("message").text();
            paramMap.put("errorCode", errorCode);
            paramMap.put("errorMessage", errorMessage);
        }
        // Gson형태로 paramMap 리턴
        return (new Gson()).toJson(paramMap);

    }
    //내정보 - 봉사참여목록
    @RequestMapping(value = "/myAppList.do", method = RequestMethod.GET)
    public String applist(HttpSession session, Model model) throws Exception {
        MemberVO memberVo = (MemberVO) session.getAttribute("userInfo");
        String id = memberVo.getmId();
        List<VolunteerAppVo> list = memberService.selectOneVList(id);
        model.addAttribute("list",list);
        
        return "member/myAppList.page";
    }


    @RequestMapping(value = "/myBoardList.do")
    public String myBoardList(HttpSession session, Model model, @RequestParam(defaultValue="1") int pageNo) throws Exception{
      MemberVO memberVO = (MemberVO) session.getAttribute("userInfo");
      String mId =  memberVO.getmId();
      Pagination pagination = new Pagination(100 , pageNo, 10);
      model.addAttribute("pagination", pagination);
      List<BoardVO> myList = memberService.myBoardList(mId);
      model.addAttribute("myList", myList);
      
      return "member/myBoardList.page";
    }
}