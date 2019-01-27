package com.vongether.admin.member.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vongether.admin.member.dao.MemberAdminDAO;
import com.vongether.member.model.MemberVO;

@Service
public class MemberAdminServiceImpl implements MemberAdminService{
  
  @Autowired
  SqlSession sqlSession;

  @Override
  public MemberVO loginAdmin(MemberVO memberVO) {
    return sqlSession.getMapper(MemberAdminDAO.class).loginAdmin(memberVO);
  }

}
