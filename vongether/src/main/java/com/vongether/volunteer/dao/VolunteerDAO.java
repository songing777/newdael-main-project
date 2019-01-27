package com.vongether.volunteer.dao;

import com.vongether.volunteer.model.VolunteerAppVo;
import com.vongether.volunteer.model.VolunteerVO;

public interface VolunteerDAO {

	int insert(VolunteerAppVo volunteerAppVo) throws Exception;
	
	int insertSimple(VolunteerVO volunteerVo)throws Exception;
	
	int selectSimple(VolunteerVO volunteerVo)throws Exception;
	
	void updateSimple(VolunteerVO volunteerVo)throws Exception;
	
	Integer selectMaxSimple(VolunteerVO volunteerVo)throws Exception;
	
	void updateStateSimple (VolunteerVO volunteerVo)throws Exception;

}