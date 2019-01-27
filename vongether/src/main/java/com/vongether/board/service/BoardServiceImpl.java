package com.vongether.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vongether.board.dao.BoardDAO;
import com.vongether.board.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<BoardVO> selectNoticeTop3() {
		List<BoardVO> list = sqlSession.getMapper(BoardDAO.class).selectNoticeTop3(); 
		return list;
	}
	@Override
	public List<BoardVO> selectBoardList(Map<String, Object> param, int pageNo) {
		int pagePerList = ((pageNo-1)*10);
		param.put("pagePerList", pagePerList);
		List<BoardVO> list = sqlSession.getMapper(BoardDAO.class).selectBoardList(param);
		
		return list; 
	}
	@Override
	public int totalBoardArticleCount(Map<String, Object> param) {
		return sqlSession.getMapper(BoardDAO.class).totalBoardArticleCount(param);
	}
	@Override
	public BoardVO selectBoardArticle(int bNo) {
		BoardVO board = sqlSession.getMapper(BoardDAO.class).selectBoardArticle(bNo);
		String title = board.getbTitle().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		board.setbTitle(title);
		return board;
	}

	@Override
	public int writeBoardArticle(BoardVO boardVO) {
		//int bNo = sqlSession.getMapper(BoardDAO.class).selectNextArticleNo(boardVO);
		sqlSession.getMapper(BoardDAO.class).insertBoardArticle(boardVO);
		return 1;
	}
	@Override
	public void updateBoardArticle(BoardVO boardVO) {
		sqlSession.getMapper(BoardDAO.class).updateBoardArticle(boardVO);
	}
	@Override
	public void deleteBoardArticle(int bNo) {
		sqlSession.getMapper(BoardDAO.class).deleteBoardArticle(bNo);
	}
	@Override
	public void increaseHitcount(int bNo) {
		sqlSession.getMapper(BoardDAO.class).increaseHitcount(bNo);
	}
}
