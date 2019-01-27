package com.vongether.volunteer.service;

import com.vongether.volunteer.model.VolunteerAppVo;
import com.vongether.volunteer.model.VolunteerVO;

public interface VolunteerService {
	int insert(VolunteerAppVo volunteerAppVo) throws Exception;
	int insertOneVolunteerSimpleVo(VolunteerVO volunteerVo) throws Exception;//봉사자가 참여한 봉사 기술 - 신청 받은 봉사 데이터 간단 저장
	int selectSimple(VolunteerVO volunteerVo)throws Exception;
	void updateSimple(VolunteerVO volunteerVo)throws Exception;
	Integer selectMaxSimple(VolunteerVO volunteerVo)throws Exception;
	void updateStateSimple (VolunteerVO volunteerVo)throws Exception;

}
