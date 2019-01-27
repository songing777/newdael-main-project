package com.vongether.intro.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vongether.board.model.BoardVO;
import com.vongether.intro.dao.IntroDAO;
import com.vongether.intro.model.VisitCountVO;

@Service
public class IntroServiceImpl implements IntroService {

  @Autowired
  private SqlSession sqlSession;
  
  @Override
  public int visitCount(VisitCountVO viCountVO) {
    return sqlSession.getMapper(IntroDAO.class).visitCount(viCountVO);
  }
  public List<BoardVO> getNoticeTop3(){
	  return sqlSession.getMapper(IntroDAO.class).getNoticeTop3();
  }
}
