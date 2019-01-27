package com.vongether.volunteer.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.google.gson.Gson;
import com.vongether.common.util.IsAdult;
import com.vongether.common.util.Pagination;
import com.vongether.common.util.RestCode;
import com.vongether.common.util.RestDetail;
import com.vongether.common.util.RestTest;
import com.vongether.member.model.MemberVO;
import com.vongether.member.service.MemberService;
import com.vongether.volunteer.model.VolunteerAppVo;
import com.vongether.volunteer.model.VolunteerVO;
import com.vongether.volunteer.service.VolunteerService;

@Controller
@RequestMapping("/volunteer")
public class VolunteerController {

	@Autowired
	private MemberService memberService;


	@Autowired
	private VolunteerService volunteerService;

	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String volunteerList(Model model) {
		//model.addAttribute("result", "0");
		return "volunteer/volunteerList.page";
	}


	@RequestMapping(value="/ajaxlist.do", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> volunteerListAjax(@RequestParam Map<String, String> param) {
		RestTest rt = null;
		Map<String, Object> map = null;
		try {
			rt = new RestTest(param);

			Gson gson = new Gson();
			VolunteerVO[] array = gson.fromJson(rt.ja, VolunteerVO[].class); 
			List<VolunteerVO> volunteerList = Arrays.asList(array);

			Pagination pagination = new Pagination(volunteerList.get(0).getTotalCount() ,Integer.parseInt(param.get("pageNo")), 9);

			map = new HashMap<String, Object>();
			map.put("volunteerList", volunteerList);
			map.put("pagination", pagination);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@RequestMapping(value="/ajaxGugun.do", method=RequestMethod.GET)
	public @ResponseBody String gugunListAjax(@RequestParam String param) {

		RestCode rc = null;
		try {
			rc = new RestCode(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (new Gson()).toJson(rc.ja);
	}

	@RequestMapping(value="/detail.do", method=RequestMethod.GET)
	public String volunteerDetail(@RequestParam String num, Model model) {
		RestDetail rd=null;
		try {
			rd = new RestDetail(num);
		} catch (IOException e) {
			e.printStackTrace();
		}
		VolunteerVO vo = new VolunteerVO();

		Gson gson =  new Gson();
		vo = gson.fromJson(rd.jo, VolunteerVO.class);
		if(vo.getMnnstNm().length()==0) {
			vo.setMnnstNm("정보없음");
		}      
		model.addAttribute("vo",vo);
		model.addAttribute("json", rd.jo);
		//System.out.println("volunteerDetail :: "+vo.toString());


		return "volunteer/volunteerDetail.page";
	}
	@Transactional
	@RequestMapping(value="/appl.do", method=RequestMethod.POST)
	public String volunteerAppl(@RequestParam String programInfo, HttpSession session, Model model, RedirectAttributes rttr) throws Exception {
		VolunteerVO vo = new VolunteerVO();
		Gson gson =  new Gson();
		vo = gson.fromJson(programInfo, VolunteerVO.class);
		VolunteerAppVo volunteerAppVo = new VolunteerAppVo();

		MemberVO memberVo = (MemberVO) session.getAttribute("userInfo");
		String id = memberVo.getmId();		
		memberVo = memberService.selectOneSearch(id);

		String result = "0";

		if(vo.getAdultPosblAt().equals("N")) {
			if(IsAdult.gap(memberVo.getmBirth())) {
				System.out.println("성인 안됨");
				result = "성인은 참여할 수 없습니다.";
			}
		}
		if(vo.getYngbgsPosblAt().equals("N")){
			if(!(IsAdult.gap(memberVo.getmBirth()))) {
				System.out.println("청소년 안됨");
				result = "청소년은 참여할 수 없습니다.";
			}
		}
		if(vo.getProgrmSttusSe()!=2) {
			//			System.out.println("모집중");
			result = "모집중이 아닙니다.";			
		}
		if(result.equals("0")){
			result = "1";
			int selectSimpleResult = volunteerService.selectSimple(vo);
			System.out.println(selectSimpleResult);
			if(selectSimpleResult > 0) {
				System.out.println("volunteerController :: 이미 존재하는 봉사프로그램");
				if(volunteerService.selectMaxSimple(vo) == 0) {
					result = "모집완료 상태입니다.";
				}else {
					volunteerService.updateSimple(vo);	
					int simpleMax = volunteerService.selectMaxSimple(vo);
					if(simpleMax==0) {
						volunteerService.updateStateSimple(vo);
						System.out.println("참가인원이 가득 참");
					}
				}
			}else {
				System.out.println("처음 등록하는 봉사 프로그램");
				volunteerService.insertOneVolunteerSimpleVo(vo);
				int simpleMax = volunteerService.selectMaxSimple(vo);
				if(simpleMax==0) {
					volunteerService.updateStateSimple(vo);
					System.out.println("참가인원이 가득 참");
				}
			}
			
				String b = Integer.toString(vo.getNoticeBgnde());
				String e = Integer.toString(vo.getNoticeEndde());
				b = new StringBuilder(b).insert(4, "-").toString();
				b = new StringBuilder(b).insert(7, "-").toString();
				e = new StringBuilder(e).insert(4, "-").toString();
				e = new StringBuilder(e).insert(7, "-").toString();


				volunteerAppVo.setAppBegintm(b);
				volunteerAppVo.setAppEndtm(e);
				volunteerAppVo.setAppName(vo.getProgrmSj());
				volunteerAppVo.setAppNo(vo.getProgrmRegistNo());
				volunteerAppVo.setAppPlace(vo.getPostAdres());
				volunteerAppVo.setmId(id);
				volunteerService.insert(volunteerAppVo);

			}


			//model.addAttribute("result", result);
			rttr.addFlashAttribute("result", result);
		return "redirect:/volunteer/list.do";

	}
}