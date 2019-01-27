package com.vongether.volunteer.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vongether.volunteer.dao.VolunteerDAO;
import com.vongether.volunteer.model.VolunteerAppVo;
import com.vongether.volunteer.model.VolunteerVO;
@Service
public class VolunteerServiceImpl implements VolunteerService{
	@Autowired
	private SqlSession sqlsesssion;
	
	@Override
	public int insert(VolunteerAppVo volunteerAppVo) throws Exception{
		
		return sqlsesssion.getMapper(VolunteerDAO.class).insert(volunteerAppVo);
				
	}

	@Override
	public int insertOneVolunteerSimpleVo(VolunteerVO volunteerVo) throws Exception {
		return sqlsesssion.getMapper(VolunteerDAO.class).insertSimple(volunteerVo);
	}

	@Override
	public int selectSimple(VolunteerVO volunteerVo) throws Exception {

		return sqlsesssion.getMapper(VolunteerDAO.class).selectSimple(volunteerVo);
	}

	@Override
	public void updateSimple(VolunteerVO volunteerVo) throws Exception {
		sqlsesssion.getMapper(VolunteerDAO.class).updateSimple(volunteerVo);
	}

	@Override
	public Integer selectMaxSimple(VolunteerVO volunteerVo) throws Exception {
		return sqlsesssion.getMapper(VolunteerDAO.class).selectMaxSimple(volunteerVo);
	}

	@Override
	public void updateStateSimple(VolunteerVO volunteerVo) throws Exception {
		sqlsesssion.getMapper(VolunteerDAO.class).updateStateSimple(volunteerVo);
	}


}