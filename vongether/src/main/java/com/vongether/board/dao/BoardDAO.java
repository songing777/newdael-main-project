package com.vongether.board.dao;

import java.util.List;
import java.util.Map;

import com.vongether.board.model.BoardVO;

public interface BoardDAO {
	
	List<BoardVO> selectNoticeTop3();
	List<BoardVO> selectBoardList(Map<String, Object> param);
	BoardVO selectBoardArticle(int bNo);
	int selectNextArticleNo(BoardVO boardVO);
	int insertBoardArticle(BoardVO boardVO);
	void updateBoardArticle(BoardVO boardVO);
	void deleteBoardArticle(int bNo);
	void increaseHitcount(int bNo);
	int totalBoardArticleCount(Map<String, Object> sparam);
}
